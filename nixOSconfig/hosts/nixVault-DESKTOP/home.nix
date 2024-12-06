{ config, lib, pkgs, inputs, ... }:
{

  home.username = "rossf";
  home.homeDirectory = "/home/rossf";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    git
    nitch
    cmatrix
    starship
    cava
    papirus-icon-theme
    bibata-cursors
    discord
    spotify
    prismlauncher
    rclone
    eza
  ];

  imports = [
    ./../../modules/homeManagerModules/code
    ./../../modules/homeManagerModules/environment
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  hypr-desktop.enable = true;

}





