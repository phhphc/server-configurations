#!/bin/bash

# update package
sudo pacman -Sy

# setup sudo
pacman -Sy --noconfirm sudo
echo "%wheel ALL=(ALL:ALL) /usr/bin/pacman" >/etc/sudoers.d/wheel

# setup ssh client
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  sudo pacman -S openssh
  ssh-keygen -t ed25519 -C "$USER@$HOSTNAME"
fi
