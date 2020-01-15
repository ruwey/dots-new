# Set path
export PATH=$HOME/.scripts:$PATH:$HOME/.local/bin
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Set editor
export EDITOR=nvim

# Set terminal
export TERM=termite

# Add scripts to path
export PATH=$HOME/.scripts:$PATH

# Add dotfile shortcut
export d=$HOME/.dotdrop/dotfiles

# Set dircolors
eval $(dircolors ~/.dir_colors)

# Start ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi
