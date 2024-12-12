{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    cmatrix
    starship
    cava
    discord
    prismlauncher
    rclone
    eza
    lolcat
    pipes
    fastfetch
    nitch
    sxiv
    bibata-cursors
    papirus-icon-theme
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
  ];
}

