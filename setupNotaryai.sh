#!/bin/bash

# Includes
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/scripts/common/utility.sh"
source "$DIR/configuration.sh"

heading "Checkout project code"
git clone git@github.com:$GITHUB_REPO/captionr.git

heading "Webapp setup"
pushd captionr/src/vueapp
subheading "Install requirements"
npm install

heading "Start vue.js server"
popd
pushd captionr/src/vueapp
npm run serve