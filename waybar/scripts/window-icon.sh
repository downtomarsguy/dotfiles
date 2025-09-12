#!/bin/sh

# Get the ID of the focused window using `hyprctl`
focused_window=$(hyprctl clients | grep "FOCUS" | awk '{print $1}')

# Get the class of the focused window
window_class=$(hyprctl clients | grep -A 4 "$focused_window" | grep "class" | awk '{print $2}')

# Define your icon mapping
case "$window_class" in
  "firefox")
    echo ""  # Firefox icon
    ;;
  "chromium")
    echo ""  # Chromium icon
    ;;
  "code")
    echo "󰨞"  # VSCode icon
    ;;
  *)
    echo ""  # Default icon for unknown classes
    ;;
esac

