# Utility functions for setting up Node

# Includes
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/common/utility.sh"

function installNode() 
{
    VERSION=10
    heading "Install Node Version $VERSION"
    curl -sL https://deb.nodesource.com/setup_$VERSION.x | sudo bash -
    sudo apt-get install -y nodejs
}