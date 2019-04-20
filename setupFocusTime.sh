#!/bin/bash

function heading() 
{
    echo
    echo
    echo =========================================================================
    echo $1
    echo =========================================================================
    echo
}

GITHUB_REPO=rgardler

NAME_PREFIX=DELETEME
APPLICATION_NAME=focusTime
LOCATION=westus

RESOURCE_GROUP_NAME=${NAME_PREFIX}RG_${APPLICATION_NAME}
SPEECH_SERVICE_NAME=${NAME_PREFIX}SPEECH_${APPLICATION_NAME}
SIGNALR_NAME=${NAME_PREFIX}${APPLICATION_NAME}

heading Configuration

echo GitHub Repo is $GITHUB_REPO

echo Location is $LOCATION
echo Resource group name is $RESOURCE_GROUP_NAME
echo Speech Service Name is $SPEECH_SERVICE_NAME
echo SignalR service name is $SIGNALR_NAME

heading "Create resource group"

az group create --location $LOCATION --name $RESOURCE_GROUP_NAME

heading "Create cognitive services account"
az cognitiveservices account create -n $SPEECH_SERVICE_NAME -g $RESOURCE_GROUP_NAME --kind SpeechServices --sku F0 -l $LOCATION --yes
az cognitiveservices account keys list -n $SPEECH_SERVICE_NAME -g $RESOURCE_GROUP_NAME

heading "Create SignalR service"
az signalr create -n $SIGNALR_NAME -g $RESOURCE_GROUP_NAME --sku Free_DS2 -l $LOCATION
az signalr key list -n $SIGNALR_NAME -g $RESOURCE_GROUP_NAME
SIGNALR_CONNECTION_STRING="Endpoint=https://deletemefocustime.service.signalr.net;AccessKey=0ECcxVvc62BEaNrVgchj2tmuNOPMCwVVOpfzJQURweU=;Version=1.0;"
echo SignalR connection string is $SIGNALR_CONNECTION_STRING

heading "Checkout project code"
git clone git@github.com:$GITHUB_REPO/captionr.git

heading "Install requirements"
pushd captionr/src/vueapp
npm install

heading "Setup the function"
popd
pushd captionr/src/functions-javascript
cp local.settings.sample.json local.settings.json
sed -i 's,REPLACEME_WITH_SIGNALR_CONNECTION_STRING,'"$SIGNALR_CONNECTION_STRING"',g' "local.settings.json"

subheading "Install .NET Core for Linux"

subheading "Install Azure Funcations Core Tools"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo apt-get update
sudo apt-get install azure-functions-core-tools

heading "Start vue.js server"
popd
pushd captionr/src/vueapp
npm run serve &