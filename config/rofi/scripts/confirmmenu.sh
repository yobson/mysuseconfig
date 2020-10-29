#!/bin/bash

rofi_command="rofi -theme themes/confirmmenu.rasi"

### Options ###
yes="Confirm"
no="Cancel"
query="Are you sure?"
# Parse the args
if [[ $# -eq 0 ]]; then
    echo -e "Usage: \e[100m \e[32mconfirmmenu\e[39;100m -y txt \e[0m"
    echo -e "All the options:\n" \
        "\e[34mOPTIONNAL \e[39;100m [ -o | --txt-yes ] txt \e[0m\n" \
        "\e[34mOPTIONNAL \e[39;100m [ -c | --txt-no ] txt \e[0m\n" \
        "\e[35mREQUIRED  \e[39;100m [ -y | --yes ] txt \e[0m\n" \
        "\e[34mOPTIONNAL \e[39;100m [ -n | --no ] txt \e[0m\n" \
        "\e[34mOPTIONNAL \e[39;100m [ -q | --query ] txt \e[0m"
    exit 1
else
    while [ $# -ne 0 ]; do
        case "$1" in
            -o | --txt-yes) # Optionnal
                [ -n "$2" ] && yes="$2" || yes=""
                shift
                ;;
            -c | --txt-no) # Optionnal
                [ -n "$2" ] && no="$2" || no=""
                shift
                ;;
            -y | --yes) # Required
                [ -n "$2" ] && yes_cmd="$2"
                shift
                ;;
            -n | --no) # Optionnal
                [ -n "$2" ] && no_cmd="$2"
                shift
                ;;
            -q | --query) # Optionnal
                [ -n "$2" ] && query="$2"
                shift
                ;;
        esac
        shift
    done
fi
# Variable passed to rofi
options="$yes\n$no"

chosen="$(echo -e "$options" | $rofi_command -p "$query" -dmenu -a 0 -u 1 -selected-row 1)"
case $chosen in
    $yes)
        eval "$yes_cmd"
        ;;
    $no)
        eval "$no_cmd"
        ;;
esac

