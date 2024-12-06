{ config, pkgs, lib, ... }:
{
  imports = [ 
      ./git.nix
      ./vscode.nix
      ./zsh.nix
      ./neovim.nix
  ];
}
