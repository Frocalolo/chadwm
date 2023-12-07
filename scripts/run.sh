#!/bin/sh

xrdb merge ~/.Xresources 
xbacklight -set 10 &

#  Polkit agent
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &

# Restore wallpaper
nitrogen --restore &

xset r rate 200 50 &

# Launch notification daemon
dunst &

# Launch compositor
picom &

# copyq
exec copyq &

# Fix Java problems
wmname "LG3D"
export _JAVA_AWT_WM_NONREPARENTING=1

dash ~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
