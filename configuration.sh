#!/bin/bash

# Includes
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/scrtips/common/utility.sh"

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