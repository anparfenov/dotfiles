#!/usr/bin/env zsh

today=$(date "+%a %F %H:%M")

battery=$(cat /sys/class/power_supply/BAT0/capacity)

wifi_name=$(nmcli -f general.connection device show wlp1s0 | awk '{print $2}')

echo '' $wifi_name "|" "" $battery "|" "" $today
