#!/bin/bash

choices="Wallpaper\nScreenshot\nShortcuts\nManuals\nPasswords"

chosen=$(echo -e "$choices" | dmenu -fn "JetBrainsMono Nerd Font:size=12" -l 20 -p " ")

case "$chosen" in
        Screenshot) ~/scripts/dmenu/tools/screenshot ;;
        Wallpaper) ~/scripts/dmenu/tools/wallpaper ;;
        Shortcuts) ~/scripts/dmenu/tools/shortcuts ;;
        Manuals) ~/scripts/dmenu/tools/manuals ;;
        Passwords) ~/scripts/dmenu/tools/passwords
esac
