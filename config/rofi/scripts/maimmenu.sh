#!/bin/bash

rofi_command="rofi -theme themes/maimmenu.rasi"
save_location="$HOME/Pictures/Screenshots"
screenshot_path="$save_location/$(date +'%Y-%m-%d-%H%M%S').png"

notify() {
    send_notification "maim" "Screenshot taken and saved to <i>$save_location</i>"
}
copy_to_clipboard() {
    xclip -selection clipboard -t image/png -i "$screenshot_path"
}

### Options ###
screen=""
area=""
window=""
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        maim -uqm 3 -f png -d 1 "$screenshot_path" && notify && copy_to_clipboard
        ;;
    $area)
        maim -uqslm 3 -f png -c 0.45,0.55,0.73,0.4 -p -1 "$screenshot_path" && notify && copy_to_clipboard
        ;;
    $window)
        maim -uqm 3 -f png -d 1 -i $(xdotool getactivewindow) "$screenshot_path" && notify && copy_to_clipboard
        ;;
esac

