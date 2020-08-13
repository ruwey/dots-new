# Autostart
# Composite Manager
picom &

# Notification Manager
dunst &

# Set Background
#{%@@ if colorscheme == "Nord" @@%}#
xwallpaper --zoom $HOME/Pictures/ColdSpace.jpg &
#{%@@ elif colorscheme == "Mntns" @@%}#
xwallpaper --zoom $HOME/Pictures/Mntns.png &
#{%@@ endif @@%}#

# Auto Mount Drives When They Are Plugged In
udiskie &
