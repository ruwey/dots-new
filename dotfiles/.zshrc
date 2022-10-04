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
zi_home="${HOME}/.zi"
source "$zi_home/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
### End of Zplugin's installer chunk
# }}}

# Prompt
zi ice depth=1; zi light romkatv/powerlevel10k

# For the selection menu when looking at autocomplete
#zi ice wait'!1'
#zi snippet OMZ::lib/completion.zsh

# Crasis menu
zi ice wait'!1'
zi light z-shell/zui
zi ice wait'[[ -n ${ZLAST_COMMANDS[(r)cras*]} ]]'
zi light z-shell/zi-crasis

# Fish like syntax highlighting
zi ice wait'!0'
zi light z-shell/fast-syntax-highlighting 

# Fish like autosuggestions
zi ice wait'!1' atload"_zsh_autosuggest_start"
zi light zsh-users/zsh-autosuggestions

# Dynamic term title
zi light trystan2k/zsh-tab-title
# }}}

# Configuration {{{ 
# Set color scheme from wpgtk
#(cat $HOME/.config/wpg/sequences &)

# Basic auto/tab complete:
fpath=($HOME/.scripts/Completion $fpath)
autoload -U compinit
zstyle ':completion:*' menu select
{%@@ if colorscheme == "Nord" @@%}
eval $(dircolors ~/.dir_colors)
{%@@ endif @@%}
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Vim bindings for completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

bindkey '^R' history-incremental-pattern-search-backward

# Bind ctrl + f to autosuggestions
bindkey '^f' autosuggest-accept

# key chord jk is escape like in vim
bindkey -s jk '\e'

# PowerLine 10K (Prompt) {{{
# Config
# Don't give me annoying config dialog
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Choose elements
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)

## Vi Mode
POWERLEVEL9K_VI_INSERT_MODE_STRING='I'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='N'

# Vcs
# Icons
POWERLEVEL9K_VCS_BRANCH_ICON=' '
POWERLEVEL9K_VCS_COMMIT_ICON=' '
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=' '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=' '
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=' '
POWERLEVEL9K_VCS_GIT_ICON=' '
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=' '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=' '
POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=' '
POWERLEVEL9K_VCS_STAGED_ICON=' '
POWERLEVEL9K_VCS_STASH_ICON=' '
POWERLEVEL9K_VCS_UNSTAGED_ICON=' '
POWERLEVEL9K_VCS_UNTRACKED_ICON=' '

# Dir
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

## OS Icon
POWERLEVEL9K_LINUX_ARCH_ICON=' '

# Style
{%@@ if colorscheme == "Mntns" @@%}
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=' '
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=' '

# Vi Mode
POWERLEVEL9K_VI_MODE_BACKGROUND='red'
POWERLEVEL9K_VI_MODE_FOREGROUND='black'
#
## Status
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='yellow'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'
#
## Dir
POWERLEVEL9K_DIR_BACKGROUND='black'
POWERLEVEL9K_DIR_FOREGROUND='green'

# OS Icon
POWERLEVEL9K_OS_ICON_BACKGROUND='red'
POWERLEVEL9K_OS_ICON_FOREGROUND='black'
{%@@ endif @@%}
#}}}

# Make SSH Use gpg-agent {{{
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
# }}}
#}}}

# Aliases {{{
# Dot Files Git
alias cfg='git --work-tree=$HOME/.dot --git-dir=$HOME/.dot/.git'

# Make vim go to neovim
alias -g vim='nvim'

# Ranger
alias r='ranger'

# Long list
alias ll='ls -la'

# LS with color
alias ls='ls --color'

# Dotdrop
alias dotdrop="DOTDROP_CONFIG=~/.dotdrop/config.yaml ~/.dotdrop/dotdrop.sh"

# Alias c for clear
alias c=clear

alias scdl="youtube-dl --embed-thumbnail -f mp3 -i --add-metadata"

# Link to Qmk Firmware from git
alias qmk="~/Programs/qmk_firmware/bin/qmk"

# XBPS stuff
alias xbi="sudo xbps-install"	# Install
alias xbq="xbps-query"		# Query
alias xbs="xbps-query -Rs"	# Search
alias xbr="sudo xbps-remove"	# Remove

# Free Space
alias space="lsblk --output NAME,MOUNTPOINT,FSSIZE,FSUSED,FSUSE%"

# Bluetoothctl
alias btc="bluetoothctl"

# HerbstluftWM shortcut
alias hc="herbstclient"

# 66 Commands w/ color
alias 66-all="66-all -z"
alias 66-dbctl="66-dbctl -z"
alias 66-disable="66-disable -z"
alias 66-enable="66-enable -z"
alias 66-env="66-env -z"
alias 66-init="66-init -z"
alias 66-inresolve="66-inresolve -z"
alias 66-inservice="66-inservice -z"
alias 66-instate="66-instate -z"
alias 66-intree="66-intree -z"
alias 66-ns="66-ns -z"
alias 66-
# }}}

# Directory Shortcuts {{{
# Add school shortcut
hash -d -- s=$HOME/Documents/School

# Add dotfile shortcut
hash -d -- d=$HOME/.dotdrop/dotfiles

# Add automound shortcut
hash -d -- atmt=/run/media/ruwey
#}}}

# vim:foldmethod=marker

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
