{ config, lib, pkgs, ... }:
{

  stylix = {
    enable = true;
    polarity = "dark";
    #image = "/home/rdfagerli/nix-flakes/modules/nixosModules/system/blobs.jpg";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  };

}
