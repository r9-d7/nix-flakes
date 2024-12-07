{ config, pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;
    
  # Nix Packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty
    hyprpaper
    hypridle
    hyprshot
    libnotify
    wofi
    nwg-look
    lshw
    networkmanagerapplet
    brightnessctl
    pavucontrol
    python313
    fastfetch
    nitch
    feh
    bibata-cursors
  ];

  # Programs
  programs = {
    steam.enable = true;
    firefox.enable = true;
    thunar.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar.enable = true;
    hyprlock.enable = true;
    zsh.enable = true;
  };

  # Font Packages
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];
  
}
    
