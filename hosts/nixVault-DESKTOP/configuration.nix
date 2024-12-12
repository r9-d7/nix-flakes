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
  networking.hostName = "nixvault-101";

  # disable nvidia prime
  nvidia-prime.enable = false;
}

