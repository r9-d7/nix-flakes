{ config, pkgs, lib, ... }:
{
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      font = "CaskaydiaCove Nerd Font";
      fontSize = "12";
      background = "${./foggybridge.png}";
      loginBackground = true;
    }
  )];
  
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
  };
}
