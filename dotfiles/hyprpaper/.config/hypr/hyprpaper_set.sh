set_wallpaper() {
	monitor=" "
	wallpaper_dir="$HOME/.config/hypr/wallpapers"
	echo "$wallpaper_dir"
	files=($wallpaper_dir/*)
	echo "$files"
	random_file=("${files[RANDOM % ${#files[@]}]}")
	echo "$random_file"
	hyprctl hyprpaper wallpaper "$monitor,$random_file"
}
set_wallpaper
