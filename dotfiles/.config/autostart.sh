# Autostart
# Composite Manager
#{%@@ if profile == "terminator" @@%}#
picom --experimental-backend &
#{%@@ elif profile == "bigbrother" @@%}#
picom &
#{%@@ endif @@%}#

# Notification Manager
dunst &

# Set Background
#{%@@ if colorscheme == "Nord" @@%}#
xwallpaper --zoom $HOME/Pictures/ColdSpace.jpg &
#{%@@ elif colorscheme == "Mntns" @@%}#
xwallpaper --zoom $HOME/Pictures/Mntns.png &
#{%@@ endif @@%}#

# Polybar (bar)
#{%@@ if colorscheme == "Nord" @@%}#
$HOME/.config/polybar/launch.sh &
#{%@@ endif @@%}#

# Auto Mount Drives When They Are Plugged In
udiskie &
