#!/bin/sh
grim -l 0 -g "$(slurp)" - | tee ~/screenshot_$(date +%Y%m%d_%H%M%S).png | wl-copy
