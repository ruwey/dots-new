# Autostart
# Composite Manager
compton &

# Notification Manager
dunst &

# KDE Connect
/usr/lib/kdeconnectd &
indicator-kdeconnect &

# Set Background
feh --bg-fill $HOME/Pictures/wp.jpg

# Pywal (Colorscheme)
wal -R &

# Polybar (bar)
$HOME/.config/polybar/launch.sh
