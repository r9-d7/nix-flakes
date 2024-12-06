{ config, pkgs, lib, ... }:
let
  cfg = config.hypr-laptop;
in
{

  options = {
    hypr-laptop.enable = lib.mkEnableOption "enables laptop hyprland configuration";
  };

  config = lib.mkIf cfg.enable {
    # Laptop specific config
    xdg.configFile."hypr/monitors.conf".source = ./../../../dotfiles/hyprland/.config/hypr/laptop_monitors.conf;
    xdg.configFile."hypr/hyprlock.conf".source = ./../../../dotfiles/hyprlock/.config/hypr/laptop_hyprlock.conf;
    xdg.configFile."waybar/config.jsonc".source = ./../../../dotfiles/waybar/.config/waybar/laptop_config.jsonc;
    xdg.configFile."waybar/style.css".source = ./../../../dotfiles/waybar/.config/waybar/laptop_style.css;
  };
}