{ config, lib, pkgs, ...}:
{
  imports = [ 
    ./dotfiles
    ./gtk.nix
    ./mako.nix
  ];
}
