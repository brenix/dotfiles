#!/bin/bash

# Function to handle a clean exit on Ctrl+C
trap "echo -e '\nExiting...'; exit" SIGINT

while true; do
    clear
    wallust cs -T -u random
    ls -l --color=auto ~
    ls -l --color=auto ~/downloads
    ufetch
    read -r
done
