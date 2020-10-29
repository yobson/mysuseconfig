#!/bin/bash

rofi_command="rofi -theme themes/powermenu.rasi"
#screenshot="/tmp/screenshot.png"

### Options ###
power_off=""
reboot=""
lock=""
suspend="鈴"
log_out=""
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

#chosen="$(maim -uq "$screenshot" && echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        confirmmenu --yes "xfce4-session-logout --halt" --query "Shutdown?"
        ;;
    $reboot)
        confirmmenu --yes "xfce4-session-logout --reboot" --query "Reboot?"
        ;;
    $lock)
        lockscreen --lock --clock-bottom
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        lockscreen --suspend --clock-bottom
        ;;
    $log_out)
        i3-msg exit
        ;;
esac


