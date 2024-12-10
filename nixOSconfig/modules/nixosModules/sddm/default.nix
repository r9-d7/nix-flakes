{ config, pkgs, lib, ... }:
let
  tokyo-night-sddm = pkgs.libsForQt5.callPackage ./theme.nix { };
in 
{
  services.displayManager.sddm = {
    enable = true;
    theme = "tokyo-night-sddm";
  };
  
  environment.systemPackages = with pkgs; [ tokyo-night-sddm ];
}
  
  
