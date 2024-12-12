{ pkgs, ... }:
{
  imports = [
    ./nvidia.nix
    ./nvidia-prime.nix
  ];
}
