# Autostart
# Composite Manager
{%@@ if profile == "terminator" @@%}
picom --experimental-backend &
{%@@ elif profile == "BigBrother" @@%}
picom &
{%@@ endif @@%}

# Notification Manager
dunst &

# KDE Connect
/usr/lib/kdeconnectd &
indicator-kdeconnect &

# Set Background
{%@@ if colorscheme == "Nord" @@%}
feh --bg-fill $HOME/Pictures/wp.jpg
{%@@ elif colorscheme == "Mntns" @@%}
feh --bg-fill $HOME/Pictures/wallhaven-0wg61x_1920x1080.png
{%@@ endif @@%}

# Polybar (bar)
{%@@ if colorscheme == "Nord" @@%}
$HOME/.config/polybar/launch.sh
{%@@ endif @@%}
