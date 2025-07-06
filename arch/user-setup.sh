#!/bin/bash

# update package
sudo sudo pacman -Sy

# setup ssh client
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  sudo pacman -S --noconfirm openssh
  ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -C "$USER@$HOSTNAME"
fi
