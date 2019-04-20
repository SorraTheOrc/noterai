#!/bin/bash

# Includes
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/scripts/common/utility.sh"
source "$DIR/configuration.sh"

heading "Function setup"
pushd captionr/src/functions-javascript
cp local.settings.sample.json local.settings.json
sed -i 's,REPLACEME_WITH_SIGNALR_CONNECTION_STRING,'"$SIGNALR_CONNECTION_STRING"',g' "local.settings.json"
func extensions install

subheading "Start the function"
func start