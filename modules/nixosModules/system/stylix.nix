{ config, lib, pkgs, ... }:
{

  stylix = {
    enable = true;
    polarity = "dark";
    image = "/home/rdfagerli/.config/hypr/wallpapers/blobs.jpg";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  };

}
