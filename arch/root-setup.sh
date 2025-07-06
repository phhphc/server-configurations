#!/bin/bash

# update package
pacman -Sy

# setup sudo
pacman -S --noconfirm sudo
echo "%wheel ALL=(ALL:ALL) /usr/bin/pacman" >/etc/sudoers.d/wheel
