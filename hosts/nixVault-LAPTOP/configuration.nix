{ config, lib, pkgs, inputs, ... }:
{
  system.stateVersion = "25.05";

  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixosModules
    inputs.home-manager.nixosModules.default
  ];

  # user account
  main-user.enable = true;
  main-user.userName = "rdfagerli";

  # Define system hostname
  networking.hostName = "nixvault-102";
  
  # enable nvidia prime
  nvidia-prime.enable = true;

  # allow non free packages
  nixpkgs.config.allowUnfree = true;

  # Allow package for broadcom wireless card
  nixpkgs.config.allowInsecurePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "broadcom-sta"
    ];

}  

  


