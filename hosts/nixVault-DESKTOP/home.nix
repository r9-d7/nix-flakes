{ config, lib, pkgs, inputs, ... }:
{

  home.username = "rossf";
  home.homeDirectory = "/home/rossf";
  home.stateVersion = "24.11";

  imports = [
    ./../../modules/homeManagerModules
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  hypr-desktop.enable = true;

}





