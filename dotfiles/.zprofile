# Set path
export PATH=$HOME/.scripts:$PATH:$HOME/.local/bin
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# Set editor
export EDITOR=nvim

# Set terminal
export TERMINAL=termite

# Add scripts to path
export PATH=$HOME/.scripts:$PATH

# Add dotfile shortcut
export d=$HOME/.dotdrop/dotfiles

# Add automound shortcut
export atmt=/run/media/ruwey

# Add school shortcut
export s=$HOME/Documents/School

# FZF default command
export FZF_DEFAULT_COMMAND="find ."

# Set dircolors
eval $(dircolors ~/.dir_colors)
