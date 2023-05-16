files=( "/home/matt/Pictures/wallpaper"/* )

choices="RANDOM\n"

for i in "${files[@]}"
do
   : 
   tmp=$(echo ${i:30}) # cuts off first 30 characters from each file path
   choices+="$tmp\n" # then add new line to each element for the dmenu interface 
done

chosen=$(echo -e "${choices[@]::-2}" | dmenu -fn "JetBrainsMono Nerd Font:size=12" -l "20")

case "$chosen" in
        RANDOM) # random wallpaper
          ls /home/matt/Pictures/wallpaper/ | sort -R | tail -1 | while read file; do
                  st -e xwallpaper --zoom /home/matt/Pictures/wallpaper/$file
          done 
          ;;
        *) # if a specific wallpaper is chosen
          st -e xwallpaper --zoom /home/matt/Pictures/wallpaper/$chosen 
          ;;
esac
