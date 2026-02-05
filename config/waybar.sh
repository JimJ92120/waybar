#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

killall waybar

waybar -c ~/.config/waybar/config.json & -s ~/.config/waybar/style.css
