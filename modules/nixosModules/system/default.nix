{ pkgs, ... }:
{
  imports = [
    ./main-user.nix
    ./system-packages.nix
    ./system-services.nix
    ./stylix.nix
  ];
}
