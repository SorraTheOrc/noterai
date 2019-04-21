#!/bin/bash

# Includes
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPTS_DIR=$DIR/../../scripts
source "$SCRIPTS_DIR/common/utility.sh"
source "$SCRIPTS_DIR/azure.sh"
source "$SCRIPTS_DIR/configuration.sh"

heading "Create Azure resource group"
installAzureCLI
az group create --location $LOCATION --name $RESOURCE_GROUP_NAME

heading "Create Azure Cognitive Services account"
az cognitiveservices account create -n $SPEECH_SERVICE_NAME -g $RESOURCE_GROUP_NAME --kind SpeechServices --sku F0 -l $LOCATION --yes
az cognitiveservices account keys list -n $SPEECH_SERVICE_NAME -g $RESOURCE_GROUP_NAME

heading "Setup Speech to Text webapp"

subheading "Install requirements"
npm install
