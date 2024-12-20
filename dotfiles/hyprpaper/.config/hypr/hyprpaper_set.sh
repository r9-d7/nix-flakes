set_wallpaper() {
	monitor=""
	wallpaper_dir="$HOME/.config/hypr/wallpapers"
	files=($wallpaper_dir/*)
	random_file=("${files[RANDOM % ${#files[@]}]}")
	hyprctl hyprpaper wallpaper "$monitor,$random_file"

	echo -en "wallpaper =$monitor,$random_file" > ~/.config/hypr/sethyprpaper.conf
}
set_wallpaper
