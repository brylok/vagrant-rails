#!/usr/bin/env bash

echo "Setting Timezone & Locale to $3 & C.UTF-8"

sudo ln -sf /usr/share/zoneinfo/$3 /etc/localtime
sudo locale-gen C.UTF-8
export LANG=C.UTF-8

echo "export LANG=C.UTF-8" >> /home/vagrant/.bashrc

echo ">>> Installing Base Packages"

# Update
sudo apt-get update

# Install base packages
sudo apt-get install -qq curl unzip git-core ack-grep software-properties-common build-essential

# Common fixes for git
git config --global http.postBuffer 65536000

# Cache http credentials for one day while pull/push
git config --global credential.helper 'cache --timeout=86400'
