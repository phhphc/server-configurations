# 1. Config sshd

> Note: this config must be load before Macos default config, or else `UsePAM yes` will set `PasswordAuthentication yes`

```bash
FILE_PATH="/etc/ssh/sshd_config.d/090-authentication.user.conf"
sudo tee "$FILE_PATH" > /dev/null <<EOF
# Only allow public key authentication
PasswordAuthentication no
ChallengeResponseAuthentication no
KbdInteractiveAuthentication no
PubkeyAuthentication yes

# Only allow root user to manage public key
AuthorizedKeysFile /etc/ssh/authorized_keys/%u
EOF
```

# 2. Load config to sshd

```bash
sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist
sudo launchctl load /System/Library/LaunchDaemons/ssh.plist
```

# 3. Config authorized_keys

> Config file `username` with content same as `~/.ssh/authorized_keys`
