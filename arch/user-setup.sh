#!/bin/bash

RUN_DIR=~

GIT_USER_EMAIL="phhphc@gmail.com"
GIT_USER_NAME="Pham Phuoc"
SSH_PRIVATE_KEY_PATH="$HOME/.ssh/id_ed25519"

SSH_PUBLIC_KEY_PATH="$SSH_PRIVATE_KEY_PATH.pub"

if [[ "$EUID" -eq 0 ]]; then
  echo "This script must be run as normal user." >&2
  exit 1
fi

## Move to home directory
cd "$RUN_DIR" || exit

## Update package
sudo pacman -Sy

## Install Yay AUR helper
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin || exit
makepkg -si
cd ..

## Setup ssh client
sudo pacman -S --noconfirm openssh
if [ ! -f "$SSH_PRIVATE_KEY_PATH" ]; then
  ssh-keygen -t ed25519 -f "$SSH_PRIVATE_KEY_PATH" -C "$USER@$HOSTNAME"
fi

# Install language
sudo pacman -S --noconfirm go

## Install rust language
# also install gcc to prevent: error: linker `cc` not found
sudo pacman -S --noconfirm rustup gcc
rustup default stable

## Install utils
sudo pacman -S --noconfirm yazi

## Install common tools
sudo pacman -S --noconfirm less which

# Setup work directory
mkdir -p ~/Workspaces/Personal/
mkdir -p ~/Workspaces/Playground/

## Config git
git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"
git config --global gpg.format ssh
git config --global user.signingkey "$SSH_PUBLIC_KEY_PATH"
git config --global commit.gpgsign true
