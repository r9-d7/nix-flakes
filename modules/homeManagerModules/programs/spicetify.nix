{config, lib, pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];
  programs.spicetify =
  {
    enable = true;
    #theme = spicePkgs.themes.dracula;
      #colorScheme = "mocha";
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle
    ];
  };
}
