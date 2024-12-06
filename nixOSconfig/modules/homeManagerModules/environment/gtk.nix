{ config, lib, pkgs, ... }:
{
    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Amber";
        size = 32;
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      catppuccin = {
        enable = true;
        flavor = "mocha";
        accent = "mauve";
        size = "standard";
        tweaks = [ "normal" ];
      };
    };
}