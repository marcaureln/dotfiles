# dotfiles

```bash
brew install stow
git clone git@github.com:marcaureln/dotfiles.git ~/dotfiles
cd ~/dotfiles && stow zsh git tmux vim claude claude-pro codex config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Trust is inherited from any ancestor, so `"projects": { "/": { "hasTrustDialogAccepted": true } }` in the unstowed `~/.claude.json` skips Claude Code's per-folder trust prompt everywhere.

## References

- [tpm](https://github.com/tmux-plugins/tpm)
