{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
    
  # Nix Packages
  environment.systemPackages = with pkgs; [
    vim
    home-manager
    wget
    kitty
    nautilus
    hyprpaper
    hypridle
    hyprshot
    libnotify
    mako
    wofi
    stow
    nwg-look
    lshw
    discord
    spotify
    networkmanagerapplet
    brightnessctl
    pavucontrol
    python313
    nitch
    papirus-icon-theme
    bibata-cursors
  ];

  # Programs
  programs = {
    steam.enable = true;
    firefox.enable = true;
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
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];
  
}
    
