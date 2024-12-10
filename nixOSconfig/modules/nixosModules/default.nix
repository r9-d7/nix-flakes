{ config, pkgs, lib, ... }:
{
  imports = [ 
      ./packages.nix
      ./nvidia.nix
      ./main-user.nix
      ./nvidia-prime.nix
      ./sddm
  ];
}
