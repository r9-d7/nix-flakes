#!/bin/bash

preload_wallpaper() {
	monitor=" "
	wallpaper_dir="$HOME/.config/hypr/wallpapers"
	echo "wallpapers directory: $wallpaper_dir"
	wallpapers=$(find "$wallpaper_dir" \( -type f -o \( -type l -not -type d \) \) | sort -R )
	for wallpaper in $wallpapers; do 
		preload_string+="preload = "$wallpaper"\n"
		wallpaper_string+="wallpaper = $monitor, $wallpaper\n"
	done
	echo -en "$preload_string$wallpaper_string" > ~/.config/hypr/hyprpaper.conf
	cat ~/.config/hypr/hyprpaper.conf
}
preload_wallpaper
