{ config, pkgs, lib, ... }:
{
  
  imports = [
    ./hypr-desktop.nix
    ./hypr-laptop.nix
  ];
  
  # hyprland config
  xdg.configFile."hypr/hyprland.conf".source = ./../../../../dotfiles/hyprland/.config/hypr/hyprland.conf;
  xdg.configFile."hypr/mocha.conf".source = ./../../../../dotfiles/hyprland/.config/hypr/mocha.conf;
  xdg.configFile."hypr/workspaces.conf".source = ./../../../../dotfiles/hyprland/.config/hypr/workspaces.conf;

  # hypridle
  xdg.configFile."hypr/hypridle.conf".source = ./../../../../dotfiles/hypridle/.config/hypr/hypridle.conf;

  # hyprlock
  xdg.configFile."hypr/profilePics/photos/Shuttle.png".source = ./../../../../dotfiles/hyprlock/.config/hypr/profilePics/photos/Shuttle.png;
  
  # hyprpaper
  xdg.configFile."hypr/hyprpaper.conf".source = ./../../../../dotfiles/hyprpaper/.config/hypr/hyprpaper.conf;
  xdg.configFile."hypr/wallpapers/foggybridge.png".source = ./../../../../dotfiles/hyprpaper/.config/hypr/wallpapers/foggybridge.png;
  xdg.configFile."hypr/wallpapers/blobs.jpg".source = ./../../../../dotfiles/hyprpaper/.config/hypr/wallpapers/blobs.jpg;

  #kitty
  xdg.configFile."kitty/kitty.conf".source = ./../../../../dotfiles/kitty/.config/kitty/kitty.conf;
  xdg.configFile."kitty/current-theme.conf".source = ./../../../../dotfiles/kitty/.config/kitty/current-theme.conf;

  #waybar
  xdg.configFile."waybar/mocha.css".source = ./../../../../dotfiles/waybar/.config/waybar/mocha.css;
  xdg.configFile."waybar/custom.css".source = ./../../../../dotfiles/waybar/.config/waybar/custom.css;

  # starship
  xdg.configFile."starship.toml".source = ./../../../../dotfiles/starship/.config/starship.toml;
  
  # wofi
  xdg.configFile."wofi/style.css".source = ./../../../../dotfiles/wofi/.config/wofi/style.css;

  # cava
  xdg.configFile."cava/config".source = ./../../../../dotfiles/cava/.config/cava/config;


  # user scripts
  xdg.configFile."userscripts/mountonedrive.sh".source = ./../../../../dotfiles/scripts/.config/userscripts/mountonedrive.sh;
  
  # fastfetch
  xdg.configFile."fastfetch/nixlogo1.png".source = ./../../../../dotfiles/fastfetch/.config/fastfetch/nixlogo1.png;
  xdg.configFile."fastfetch/nixlogo2.png".source = ./../../../../dotfiles/fastfetch/.config/fastfetch/nixlogo2.png;
  xdg.configFile."fastfetch/config.jsonc".source = ./../../../../dotfiles/fastfetch/.config/fastfetch/config.jsonc;
}
