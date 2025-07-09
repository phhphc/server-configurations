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

# Move to home directory
cd "$RUN_DIR" || exit

# Setup ssh client
if [ ! -f "$SSH_PRIVATE_KEY_PATH" ]; then
  ssh-keygen -t ed25519 -f "$SSH_PRIVATE_KEY_PATH" -C "$USER@$HOSTNAME"
fi

# Config git
git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"
git config --global gpg.format ssh
git config --global user.signingkey "$SSH_PUBLIC_KEY_PATH"
git config --global commit.gpgsign true
