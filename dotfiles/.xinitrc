#!/bin/bash
# Nvidia Hybrid Setup
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96
arrangeMonitors

#exec bspwm

# DWM:
#while type dwm >/dev/null ; do dwm && continue || break ; done

exec awesome
