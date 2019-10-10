#
# ████████         ██     
#░░░░░░██         ░██     
#     ██    ██████░██     
#    ██    ██░░░░ ░██████ 
#   ██    ░░█████ ░██░░░██
#  ██      ░░░░░██░██  ░██
# ████████ ██████ ░██  ░██
#░░░░░░░░ ░░░░░░  ░░   ░░ 
#
zle -N autosuggest-accept

# Auto Add {{{
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# }}}

# Plugins {{{
# Auto Add {{{
### Added by Zplugin's installer
source '/home/ruwey/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk
# }}}

# Prompt
zplugin light romkatv/powerlevel10k

# For the selection menu when looking at autocomplete
#zplugin ice wait'!1'
#zplugin snippet OMZ::lib/completion.zsh

# Crasis menu
zplugin ice wait'!1'
zplugin light zdharma/zui
zplugin ice wait'[[ -n ${ZLAST_COMMANDS[(r)cras*]} ]]'
zplugin load zdharma/zplugin-crasis

# Fish like syntax highlighting
zplugin ice wait'!0'
zplugin light zdharma/fast-syntax-highlighting 

# Fish like autosuggestions
zplugin ice wait'!1' atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions
# }}}

# Configuration {{{ 
# Set color scheme from wpgtk
(cat $HOME/.config/wpg/sequences &)

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Vim bindings for completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# }}}

# Aliases {{{

# Bind ctrl + f to autosuggestions
bindkey '^f' autosuggest-accept

# Dot Files Git
alias cfg='git --work-tree=$HOME/.dot --git-dir=$HOME/.dot/.git'

# Make vim go to neovim
alias -g vim='nvim'

# Ranger
alias r='ranger'

# Long list
alias ll='ls -la'

# Dotdrop
alias dotdrop="DOTDROP_CONFIG=~/.dotdrop/config.yaml ~/.dotdrop/dotdrop.sh"

# Alias c for clear
alias c=clear

# }}}

# vim:foldmethod=marker
