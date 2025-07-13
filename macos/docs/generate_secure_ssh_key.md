# Generate secure ssh key

```bash
SSH_KEY_COMMENT="$USER@$HOST (security)"
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519.sec -C "$SSH_KEY_COMMENT"
```
