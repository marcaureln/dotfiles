# ------------------------------------------------------------
# Standard locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ------------------------------------------------------------
# Environment
export VOLTA_HOME="$HOME/.volta"
export VOLTA_FEATURE_PNPM=1       # pnpm support in Volta
export BUN_INSTALL="$HOME/.bun"
export RULEKIT_PATH="$HOME/vue-rulekit"
export CLAUDE_CODE_NO_FLICKER=1
export GPG_TTY=$(tty)

# Pager: -R keep colors, --mouse enable wheel scrolling, --wheel-lines smoother
export LESS='-R --mouse --wheel-lines=3'

# ------------------------------------------------------------
# PATH
export PATH="/opt/homebrew/lib/ruby/gems/4.0.0/bin:$HOME/.gem/ruby/4.0.0/bin:$HOME/fvm/default/bin:$VOLTA_HOME/bin:$BUN_INSTALL/bin:$HOME/.rvm/bin:/opt/homebrew/opt/ruby/bin:/usr/local/opt/libpq/bin:$PATH"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools:$HOME/.cargo/bin"

# ------------------------------------------------------------
# Prompt
command -v starship >/dev/null && eval "$(starship init zsh)"

# ------------------------------------------------------------
# History (set here — Ubuntu's /etc/zshrc doesn't, unlike macOS)
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE

# ------------------------------------------------------------
# Completions
fpath=($HOME/.zsh $HOME/.docker/completions $fpath)
zstyle ':completion:*:*:git:*' script $HOME/.zsh/git-completion.bash
autoload -Uz compinit bashcompinit
compinit -C  # Use cached completions for speed
bashcompinit

# Interactive menu: Tab opens a highlighted menu, arrow keys move the selection,
# Enter picks. (Default zsh — does not intercept or auto-run your commands.)
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # case-insensitive matching
zstyle ':completion:*' list-colors ''                       # colorize the menu

[[ -s "$BUN_INSTALL/_bun"            ]] && source "$BUN_INSTALL/_bun"
[[ -f "$HOME/.dbt-completion.bash"   ]] && source "$HOME/.dbt-completion.bash"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f ~/.dart-cli-completion/zsh-config.zsh ]] && . ~/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# History-based auto-complete (brew on macOS, apt on Linux)
for f in /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
         /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh; do
  [[ -f $f ]] && source "$f" && break
done

# ------------------------------------------------------------
# Aliases
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias ll="ls -lah"
alias dc="docker compose"
alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"
alias tf="terraform"
alias dbt_env="source $HOME/venv/dbt/bin/activate"
alias cc="claude --dangerously-skip-permissions -c"
alias ccpro="CLAUDE_CONFIG_DIR=~/.claude-pro claude --dangerously-skip-permissions -c"
alias cx="codex resume --last"
alias tml="tmux list-sessions"
alias tma="tmux attach"
alias tk='tmux kill-session -t'

# ------------------------------------------------------------
# Functions
t() {
  local name="$(basename "${1:-$PWD}" | tr -d .)"
  tmux has-session -t "=$name" 2>/dev/null || tmux new-session -d -s "$name"
  if [ -n "$TMUX" ]; then
    tmux switch-client -t "=$name"
  else
    tmux attach -t "=$name"
  fi
}

# Lazy-load SDKMAN
sdk() {
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  unset -f sdk
  command sdk "$@"
}

# AWS helpers (ssm, etc.) — see ~/.zsh/aws.zsh
[ -f ~/.zsh/aws.zsh ] && source ~/.zsh/aws.zsh

# ------------------------------------------------------------
# Machine-specific overrides, last so they win
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
