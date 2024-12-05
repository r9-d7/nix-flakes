{config, pkgs, ...}: 
let
  sources = import ./npins;
in
{
  imports = [
    (sources.catppuccin + "/modules/nixos")
  ];
  
  home-manager.users.rossf = {
    imports = [
      (sources.catppuccin + "/modules/home-manager")
    ];
  };
}
