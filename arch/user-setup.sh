#!/bin/bash

if [[ "$EUID" -eq 0 ]]; then
  echo "This script must be run as normal user." >&2
  exit 1
fi

# update package
sudo pacman -Sy

SSH_PRIVATE_KEY_PATH="$HOME/.ssh/id_ed25519"
SSH_PUBLIC_KEY_PATH="$SSH_PRIVATE_KEY_PATH.pub"
# setup ssh client
if [ ! -f "$SSH_PRIVATE_KEY_PATH" ]; then
  sudo pacman -S --noconfirm openssh
  ssh-keygen -t ed25519 -f "$SSH_PRIVATE_KEY_PATH" -C "$USER@$HOSTNAME"
fi

# install language
sudo pacman -S --noconfirm go

# install utils
sudo pacman -S --noconfirm yazi

# install common tools
sudo pacman -S --noconfirm less

# Setup work directory
mkdir -p ~/Workspaces/Personal/

# config git
git config --global user.email "phhphc@gmail.com"
git config --global user.name "Pham Phuoc"
git config --global gpg.format ssh
git config --global user.signingkey "$SSH_PUBLIC_KEY_PATH"
