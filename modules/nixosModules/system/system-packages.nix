{ pkgs, inputs, ... }:
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
    inputs.mediaplayer.packages.${pkgs.system}.default
    playerctl
    heroic
    libgcc
    gcc
  ];

  # Programs
  programs = {
    firefox.enable = true;
    thunar.enable = true;
    zsh.enable = true;

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar.enable = true;
    hyprlock.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      package = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
          libkrb5
          keyutils
          gamescope
        ];
      };
    };
  };

  # Font Packages
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];
  
}
    
