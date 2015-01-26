#!/usr/bin/env bash

echo ">>> Installing RVM and latest Ruby"

# Check if RVM is installed
RVM -v > /dev/null 2>&1
RVM_IS_INSTALLED=$?
RUBY_VERSION=$1
RAILS_VERSION=$2

if [[ $RVM_IS_INSTALLED -eq 0 ]]; then
    echo ">>> Updating Ruby Version Manager"
    rvm get stable --ignore-dotfiles
else
    echo ">>> Importing rvm public key"
    gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3

    # Install RVM and install Ruby
    if [[ $RUBY_VERSION =~ "latest" ]]; then
        echo ">>> Installing Ruby Version Manager and installing latest stable Ruby version"

        # Install RVM and install latest stable Ruby version
        \curl -sSL https://get.rvm.io | bash -s stable --ruby
    else
        echo ">>> Installing Ruby Version Manager and installing Ruby version: $1"

        # Install RVM and install selected Ruby version
        \curl -sSL https://get.rvm.io | bash -s stable --ruby=$RUBY_VERSION
    fi

    # Re-source RVM
    . /home/vagrant/.rvm/scripts/rvm

    # Re-source .profile if exists
    if [[ -f "/home/vagrant/.profile" ]]; then
        . /home/vagrant/.profile
    fi
fi

echo ">>> Installing Rails"

    if [[ $RAILS_VERSION =~ "latest" ]]; then
        echo ">>> Installing latest version Ruby on Rails"

        gem install rails --no-ri --no-rdoc
    else
        echo ">>> Installing specified version of Ruby on Rails: $RAILS_VERSION"

        gem install rails -v $RAILS_VERSION --no-ri --no-rdoc
    fi

 echo ">>> Adding alias 'ras' to run rails server on 0.0.0.0 "

    echo "alias ras='rails s -b 0.0.0.0'" >> /home/vagrant/.bashrc

    . /home/vagrant/.bashrc
