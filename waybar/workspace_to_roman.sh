#!/bin/sh

# Workspace to Roman numeral mapping
declare -A roman_numerals
roman_numerals[1]="I"
roman_numerals[2]="II"
roman_numerals[3]="III"
roman_numerals[4]="IV"
roman_numerals[5]="V"
roman_numerals[6]="VI"
roman_numerals[7]="VII"
roman_numerals[8]="VIII"
roman_numerals[9]="IX"
roman_numerals[10]="X"

# Get active workspaces
active_workspaces=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true) | .name')

# Convert workspace number to Roman numeral
for workspace in $active_workspaces; do
    # Check if workspace is a number
    if [[ $workspace =~ ^[0-9]+$ ]]; then
        echo "${roman_numerals[$workspace]}"
    else
        echo "$workspace"
    fi
done

