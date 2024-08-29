#!/bin/bash

# Array of choices
choices=("Up Comments Hearts" "Up Views" "Up Shares" "Up Favorites")

# Function to display choices and read user's choice
choose_option() {
    echo "Please choose one of the following options:"
    select choice in "${choices[@]}"; do
        case $choice in
            "Up Comments Hearts"|"Up Views"|"Up Shares"|"Up Favorites")
                echo "You have selected: $choice"
                selected_choice=$choice
                break
                ;;
            *)
                echo "Invalid option. Please try again."
                ;;
        esac
    done
}

# Get the user's choice
choose_option

# Get the link from the user
read -p "Enter the link: " link

# Get the number for -x from the user
read -p "Enter the value for -x (e.g., 2000): " x_value

# Add quotes around selected choice
selected_choice="'$selected_choice'"

# Execute the node command with the selected choice, link, and x_value
cd bottok
node bottok.js -t "$selected_choice" -x "$x_value" -l "$link"
