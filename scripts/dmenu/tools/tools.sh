#!/bin/sh

choices="Wallpaper\nScreenshot"

chosen=$(echo -e "$choices" | dmenu -fn "JetBrainsMono Nerd Font:size=12" -l 20 -p " ")

case "$chosen" in
        Screenshot) 
                scrot '/home/matt/Pictures/screenshots/%Y-%m-%d.png' 
                ;;
        Wallpaper) ~/scripts/dmenu/wallpaper
esac
