# ---------------------------------------------------------------------
# ⚡ ZAP PLUGIN MANAGER (Fast & Minimal)
# ---------------------------------------------------------------------
# Automatically install Zap if it's missing
if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ]; then
  echo "Installing Zap plugin manager..."
  curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh | zsh -s -- --keep
fi
source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Load essential plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/supercharge" # Adds sensible defaults & completion
plug "zap-zsh/sudo"        # Press Esc twice to add 'sudo' to your last command
plug "zap-zsh/fzf"

# ---------------------------------------------------------------------
# 🎨 PROMPT (Starship)
# ---------------------------------------------------------------------
eval "$(starship init zsh)"

# ---------------------------------------------------------------------
# ⚙️ HISTORY & OPTIONS
# ---------------------------------------------------------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_ALL_DUPS  # Don't record duplications
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks
setopt SHARE_HISTORY         # Share history across all sessions
setopt AUTO_CD               # Type a directory name to CD into it

# ---------------------------------------------------------------------
# 🏷️ PRACTICAL ALIASES
# ---------------------------------------------------------------------
# Modern replacements for classic commands
alias ls="eza --icons --git --color=always --group-directories-first"
alias ll="eza -lah --icons --git --color=always --group-directories-first"
alias cat="bat" # If you have 'bat' installed, otherwise leave as cat
alias grep="grep --color=auto"

alias cls="clear"

# Navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git Quality of Life
alias gst="git status"
alias gco="git checkout"
alias gcm="git commit -m"
alias glog="git log --oneline --graph --decorate"

# ---------------------------------------------------------------------
# 🔍 COMPLETION STYLING
# ---------------------------------------------------------------------
# Make the Tab-completion menu look modern and navigable with arrow keys
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Custom fzf layout and colors
export FZF_DEFAULT_OPTS=" \
--height 40% \
--layout=reverse \
--border \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"


# ---------------------------------------------------------------------
# ⌨️ WORD-BY-WORD NAVIGATION & DELETION
# ---------------------------------------------------------------------

# Make Zsh recognize standard word boundaries (like Bash/standard editors)
autoload -U select-word-style
select-word-style bash

# Ctrl + Left Arrow: Move back one word
bindkey '^[[1;5D' backward-word
# Ctrl + Right Arrow: Move forward one word
bindkey '^[[1;5C' forward-word

# Ctrl + Backspace: Delete back one word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' backward-kill-word

# Ctrl + Delete: Delete forward one word
bindkey '^[[3;5^' kill-word

# ---------------------------------------------------------------------
# 💡 ZSH-AUTOSUGGESTIONS WORD-BY-WORD ACCEPT
# ---------------------------------------------------------------------

# Ctrl + Shift + Right Arrow: Accept the next word of the suggestion
bindkey '^[[1;6C' forward-word

# Alternative: Alt + F (Classic terminal standard to accept next word)
bindkey '^[f' forward-word

# DELETE OR REMOVE THESE LINES FROM YOUR .zshrc:
# precmd() {
#   echo ""
# }
