{ pkgs, ... }:
let
  theme = import ./theme { inherit pkgs; };
  sources = import ./npins;
in
{
  imports = [
    (sources.catppuccin + "/modules/home-manager")
  ];

  services.mako = {
    enable = true;
    anchor = "top-center";
    borderRadius = 8;
    defaultTimeout = 10000;
    font = "Cascadia Code 12";
    catppuccin.enable = true;
    catppuccin.flavor = "mocha";
    catppuccin.accent = "mauve";
    iconPath = "${theme.iconTheme.iconPath}";
    maxVisible = 3;
    borderSize = 2;
    actions = true;
    width = 300;
    layer = "overlay";
  };
}

