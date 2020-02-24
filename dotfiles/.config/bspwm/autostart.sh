# Autostart
# Composite Manager
#{%@@ if profile == "terminator" @@%}#
picom --experimental-backend &
#{%@@ elif profile == "BigBrother" @@%}#
picom &
#{%@@ endif @@%}#

# Notification Manager
dunst &

# KDE Connect
/usr/lib/kdeconnectd &
indicator-kdeconnect &

# Set Background
#{%@@ if colorscheme == "Nord" @@%}#
feh --bg-fill $HOME/Pictures/ColdSpace.jpg &
#{%@@ elif colorscheme == "Mntns" @@%}#
feh --bg-fill $HOME/Pictures/Mntns.png &
#{%@@ endif @@%}#

# Polybar (bar)
#{%@@ if colorscheme == "Nord" @@%}#
$HOME/.config/polybar/launch.sh &
#{%@@ endif @@%}#

# Auto Mount Drives When They Are Plugged In
udiskie &
