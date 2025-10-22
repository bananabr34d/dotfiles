#!/bin/bash
if ! hyprctl clients | grep -q "class: Spotify"; then
    spotify &
    sleep 1  # Increased delay for XWayland
    hyprctl dispatch workspace special:music  # Show workspace, don’t toggle
    hyprctl dispatch focuswindow class:Spotify  # Ensure focus
else
    hyprctl dispatch togglespecialworkspace music
fi
