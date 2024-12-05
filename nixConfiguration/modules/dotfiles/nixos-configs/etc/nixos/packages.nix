{ config, lib, pkgs, ... }:
let
  sources = import ./npins;
in
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
  
  # Catppuccin Theme
  imports = [
    (sources.catppuccin + "/modules/nixos")
    <home-manager/nixos>
  ]; 
}
    
