#!/usr/bin/env bash

echo ">>> Installing MongoDB"

# Add to sources
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

sudo apt-get update

sudo apt-get install -qq mongodb-org

# Bind to 0.0.0.0 to allow remote access
sed -i "s/bind_ip = */bind_ip = 0.0.0.0/" /etc/mongod.conf
