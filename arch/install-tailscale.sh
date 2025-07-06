#!/bin/bash

echo 'Run with priviled user'

pacman -Sy --noconfirm tailscale

systemctl enable --now tailscaled.service

read -rp "Enter tailscale auth key: " authkey
tailscale up --authkey="$authkey"

tailscale set --ssh=true
