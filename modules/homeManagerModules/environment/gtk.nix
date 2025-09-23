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
    #catppuccin = {
    #  enable = true;
    #  flavor = "mocha";
    #  accent = "mauve";
    #  size = "standard";
    #  tweaks = [ "normal" ];
    #};
    #theme = {
    # package = pkgs.tokyonight-gtk-theme.override {
    #   colorVariants = [ "dark" ];
    #   themeVariants = [ "default" ];
    # };
    # name = "Tokyonight-Night";
    #};

  };

  #stylix = {
  #  enable = true;
  #  polarity = "dark";
  #  image = "/home/rdfagerli/.config/hypr/wallpapers/blobs-l.svg";
  #  base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  #};


  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 32;
  };

}
