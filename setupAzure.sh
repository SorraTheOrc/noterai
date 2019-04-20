#!/bin/bash

# Includes
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/scripts/common/utility.sh"
source "$DIR/configuration.sh"

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