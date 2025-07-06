#!/bin/bash

# install git
sudo pacman -Sy --noconfirm git openssh

# clone config repository
git clone --depth=1 https://github.com/phhphc/server-configurations.git
