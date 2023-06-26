#!/bin/sh

choices="Wallpaper\nScreenshot\nShortcuts\nManuals"

chosen=$(echo -e "$choices" | dmenu -fn "JetBrainsMono Nerd Font:size=12" -l 20 -p " ")

case "$chosen" in
        Screenshot) 
                scrot '/home/matt/Pictures/screenshots/%Y-%m-%d.png' 
                ;;
        Wallpaper) ~/scripts/dmenu/tools/wallpaper ;;
        Shortcuts) ~/scripts/dmenu/tools/shortcuts ;;
        Manuals) ~/scripts/dmenu/tools/manuals
esac
