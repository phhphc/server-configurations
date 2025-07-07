#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# update package
pacman -Sy

# setup sudo
pacman -S --needed --noconfirm sudo
echo "%wheel ALL=(ALL:ALL) /usr/bin/pacman" >/etc/sudoers.d/wheel
