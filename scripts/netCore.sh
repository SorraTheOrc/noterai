#!/bin/sh
# Utility functions for setting up .Net Core on Linux

# Includes
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/common/utility.sh"

function installDotNETCore() {
    heading "Install .NET Core for Linux"
    subheading "Register Microsoft key and feed"
    wget -O /tmp/dotnet_runtime_2.2.3.tar.gz https://download.visualstudio.microsoft.com/download/pr/28271651-a8f6-41d6-9144-2d53f6c4aac4/bb29124818f370cd08c5c8cc8f8816bf/dotnet-runtime-2.2.3-linux-x64.tar.gz
    mkdir /usr/share/dotnet/
    sudo tar zxf /tmp/dotnet_runtime_2.2.3.tar.gz -C /usr/share/dotnet/
    sudo ln --symbolic /usr/share/dotnet/dotnet /usr/bin/dotnet
    dotnet --info
}