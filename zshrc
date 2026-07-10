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

# --- 1. NORMAL PRESSES (Strictly Letter-by-Letter) ---
bindkey '^?' backward-delete-char   # Backspace removes 1 letter backward
bindkey '^[[3~' delete-char         # Delete removes 1 letter forward

# --- 2. CTRL PRESSES (Wipes Entire Words) ---
# Ctrl + Backspace
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' backward-kill-word

# Ctrl + Delete
bindkey '^[[3;5~' kill-word

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
