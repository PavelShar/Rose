#!/bin/bash


# nvm environment variables
NVM_DIR=/usr/local/nvm
NODE_VERSION=4.4.7


apt-get install -y build-essential libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash