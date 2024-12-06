{ config, pkgs, lib, ...}:
{
  imports = [ 
    ./dotfiles.nix
    ./gtk.nix
    ./mako.nix
  ];
}
