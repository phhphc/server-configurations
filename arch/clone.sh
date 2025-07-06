#!/bin/bash

echo 'Run with priviled user'

# install git
pacman -Sy --noconfirm git openssh

# clone config repository
git clone --depth=1 https://github.com/phhphc/server-configurations.git
