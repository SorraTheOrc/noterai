#!/bin/bash

# Includes
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPTS_DIR=$DIR/../../scripts
source "$SCRIPTS_DIR/common/utility.sh"
source "$SCRIPTS_DIR/configuration.sh"

heading "Speech to Text: Run Webapp"

subheading "Start vue.js server"
npm run serve
