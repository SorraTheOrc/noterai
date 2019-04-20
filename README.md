# Environment Setup

```
source ./scripts/azure.sh
installAzureCLI
azure login

source ./scritps/netCore.sh
installDotNETCore

source ./scripts/node.sh
installNode

source ./scripts/functions.sh
installFunctionsCoreTools
```

# Setup the application

```
./configuration.sh
./setupAzure.sh
./setupFunction.sh
./setupNoraryai.sh
```