#!/bin/bash

if [[ "$EUID" -eq 0 ]]; then
  echo "This script must be run as normal user." >&2
  exit 1
fi

# update package
sudo sudo pacman -Sy

# setup ssh client
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  sudo pacman -S --noconfirm openssh
  ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -C "$USER@$HOSTNAME"
fi

# Setup work directory
mkdir -p ~/Workspaces/Personal/
