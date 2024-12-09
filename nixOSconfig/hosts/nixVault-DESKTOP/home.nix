{ config, lib, pkgs, inputs, ... }:
{

  home.username = "rossf";
  home.homeDirectory = "/home/rossf";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    git
    cmatrix
    starship
    cava
    discord
    prismlauncher
    rclone
    eza
    lolcat
  ];

  imports = [
    ./../../modules/homeManagerModules/code
    ./../../modules/homeManagerModules/environment
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  hypr-desktop.enable = true;

}





