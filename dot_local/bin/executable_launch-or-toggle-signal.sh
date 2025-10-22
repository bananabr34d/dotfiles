#!/bin/bash
if ! hyprctl clients | grep -q "class: signal"; then
    uwsm app -- signal-desktop &
    sleep 1
    for i in {1..3}; do
        hyprctl dispatch focuswindow class:signal && break
        sleep 0.2
    done
    hyprctl dispatch workspace special:signal
else
    hyprctl dispatch togglespecialworkspace signal
fi
