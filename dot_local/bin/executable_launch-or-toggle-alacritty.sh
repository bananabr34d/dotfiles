#!/bin/bash
if ! hyprctl clients | grep -q "class: Alacritty"; then
    killall -q -9 alacritty 2>/dev/null  # Clean up lingering processes
    sleep 0.1
    uwsm app -- alacritty &  # Use uwsm for consistency with Omarchy
    sleep 0.7  # Adjusted for reliable window creation
    for i in {1..3}; do
        hyprctl dispatch focuswindow class:Alacritty && break
        sleep 0.2
    done
    hyprctl dispatch workspace special:scratchpad
else
    hyprctl dispatch togglespecialworkspace scratchpad
fi
