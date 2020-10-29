#!/bin/bash
# Dependencies: xdotool xorg-xwininfo i3 xorg-xrandr sed grep

x=0
y=0
# As in bar's height
bar=30
bar_position="bottom"
# Necessary in i3, adjust depending on your border_size setting
border_fix=4
resolution="$(xrandr --query | grep ' connected' | grep -m 1 -o '[0-9][0-9]*x[0-9][0-9]*')"
screen_width=$(echo "$resolution" | cut -d "x" -f 1)
screen_height=$(echo "$resolution" | cut -d "x" -f 2)
eval $(xwininfo -id $(xdotool getactivewindow) |
    sed -n -e "s/^ \+Width: \+\([0-9]\+\).*/window_width=\1/p" \
        -e "s/^ \+Height: \+\([0-9]\+\).*/window_height=\1/p")

get_bar_fix() {
    if [ "$bar_position" == "top" ]; then
        case "$1" in
            "top")
                echo $bar
                ;;
            "center")
                echo $bar
                ;;
            "bottom")
                echo 0
                ;;
        esac
    elif [ "$bar_position" == "bottom" ]; then
        case "$1" in
            "top")
                echo 0
                ;;
            "center")
                echo -$bar
                ;;
            "bottom")
                echo -$bar
                ;;
        esac
    else
        echo 0
    fi
}

while [ $# -ne 0 ]; do
    case "$1" in
        -c | --class)
            class="$2"
            shift
            ;;
        "center")
            x=$(($screen_width / 2 - $window_width / 2))
            y=$(($screen_height / 2 - $window_height / 2 + $(get_bar_fix "center")))
            ;;
        "top")
            y=$(get_bar_fix "top")
            ;;
        "bottom")
            y=$(($screen_height - $window_height - $border_fix + $(get_bar_fix "bottom")))
            ;;
        "left")
            x=0
            ;;
        "right")
            x=$(($screen_width - $window_width - $border_fix))
            ;;
    esac
    shift
done

[ -n "$class" ] && i3-msg --quiet "[class='$class'] move position $x $y" || i3-msg --quiet "move position $x $y"

