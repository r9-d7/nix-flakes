{ config, pkgs, lib, ...}:
{
  imports = [ 
    ./dotfiles
    ./gtk.nix
    ./mako.nix
  ];
}
