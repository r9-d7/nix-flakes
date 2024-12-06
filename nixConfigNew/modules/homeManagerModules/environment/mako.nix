{ config, pkgs, lib, ... }:
{
  # Mako Configuration
  services.mako = 
  let
      package = pkgs.papirus-icon-theme;
      pathToIcons = "${package}/share/icons/Papirus-Dark";
  in 
  {
    enable = true;
    anchor = "top-center";
    borderRadius = 8;
    defaultTimeout = 10000;
    font = "Cascadia Code 12";
    catppuccin.enable = true;
    catppuccin.flavor = "mocha";
    catppuccin.accent = "mauve";
    iconPath = "${pathToIcons}";
    maxVisible = 3;
    borderSize = 2;
    actions = true;
    width = 300;
    layer = "overlay";
  };
}