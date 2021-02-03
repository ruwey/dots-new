# Set path
export PATH=$HOME/.scripts:$PATH:$HOME/.local/bin
export PATH="$PATH:$HOME/.cargo/bin"

# Set editor
export EDITOR=nvim

# Set terminal
export TERMINAL=termite

# Add scripts to path
export PATH=$HOME/.scripts:$PATH

# FZF default command
export FZF_DEFAULT_COMMAND="find ."

# Set dircolors
eval $(dircolors ~/.dir_colors)

# Start DBus session and record address
eval $(dbus-launch --sh-syntax)

# Start Pulseaudio
#pulseaudio --start &

# Prepare logout script
trap '. $HOME/.zlogout; exit' 0
