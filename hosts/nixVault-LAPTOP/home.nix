{ config, lib, pkgs, inputs, ... }:
{
  
  home.username = "rdfagerli";
  home.homeDirectory = "/home/rdfagerli";
  home.stateVersion = "25.05";

  imports = [
    ./../../modules/homeManagerModules
  ];

  #nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  hypr-laptop.enable = true;

}





