#!/bin/bash

# Function to handle a clean exit on Ctrl+C
trap "echo -e '\nExiting...'; exit" SIGINT

history=()
index=-1

while true; do
    clear
    
    if [[ $index -eq -1 ]] || [[ $index -eq ${#history[@]} ]]; then
        # Use 'tee' to send output to stderr (the screen) and stdout (the variable)
        # This ensures the terminal escape sequences actually change your colors
        output=$(wallust cs -T -u random | tee /dev/stderr)
        theme=$(echo "$output" | grep -oP 'selected \K\S+')
        
        history+=("$theme")
        index=$((${#history[@]} - 1))
    else
        # Apply the specific theme from history
        wallust cs -T -u "${history[$index]}"
    fi

    echo -e "\n--- Current Theme: ${history[$index]} ---"
    ls -l --color=auto ~
    ls -l --color=auto ~/downloads
    ufetch

    # -n 3 captures arrow escape sequences
    # -p provides a prompt to the user
    read -rsn3 -p "<- Prev | Next -> " key
    
    case "$key" in
        $'\e[D') # Left Arrow
            if [[ $index -gt 0 ]]; then
                ((index--))
            fi
            ;;
        $'\e[C'|*) # Right Arrow or any other key (Enter/Space)
            ((index++))
            ;;
    esac
done
