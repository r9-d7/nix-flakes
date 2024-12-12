{ pkgs, ... }:
{
  imports = [
    ./home-packages.nix
    ./spicetify.nix
    ./vscode.nix
  ];
}
