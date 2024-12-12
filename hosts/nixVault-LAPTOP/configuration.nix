{ config, lib, pkgs, inputs, ... }:
{
  system.stateVersion = "24.11";

  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixosModules
    inputs.home-manager.nixosModules.default
  ];

  # user account
  main-user.enable = true;
  main-user.userName = "rossf";

  # Define system hostname
  networking.hostName = "nixvault-102";
  
  # enable nvidia prime
  nvidia-prime.enable = true;
}  

  


