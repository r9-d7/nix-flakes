{ config, pkgs, lib, inputs, ... }:
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
    lshw
    networkmanagerapplet
    brightnessctl
    pavucontrol
    python313
    fastfetch
    nitch
    sxiv
    bibata-cursors
    papirus-icon-theme
    gamescope
    inputs.mediaplayer.packages.${pkgs.system}.default
    playerctl
    heroic
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
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

  #nixpkgs.config.packageOverrides = pkgs: {
  #  steam = pkgs.steam.override {
  #    extraPkgs = pkgs: with pkgs; [
  #      xorg.libXcursor
  #      xorg.libXi
  #      xorg.libXinerama
  #      xorg.libXScrnSaver
  #      libpng
  #      libpulseaudio
  #      libvorbis
  #      stdenv.cc.cc.lib
  #      libkrb5
  #      keyutils
  #    ];
  #  };
  #};

  # Font Packages
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];
  
}
    