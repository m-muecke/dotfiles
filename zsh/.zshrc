#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# plugins
plug "hlissner/zsh-autopair"
plug "zap-zsh/fnm"
plug "zap-zsh/fzf"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/vim"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# keybinds
bindkey "^ " autosuggest-accept

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
