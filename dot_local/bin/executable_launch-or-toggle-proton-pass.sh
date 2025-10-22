#!/bin/bash
if ! ps aux | grep -q "[P]roton Pass"; then  # Check process name with space
    uwsm app -- proton-pass &
    sleep 0.5
    hyprctl dispatch workspace special:passwords
    hyprctl dispatch focuswindow class:"Proton Pass"
else
    hyprctl dispatch togglespecialworkspace passwords
fi
