{ config, pkgs, lib, ... }:
let
  cfg = config.hypr-desktop;
in
{

  options = {
    hypr-desktop.enable = lib.mkEnableOption "enables desktop hyprland configuration";
  };

  config = lib.mkIf cfg.enable {
    # Desktop specific config
    xdg.configFile."hypr/monitors.conf".source = ./../../../dotfiles/hyprland/.config/hypr/desktop_monitors.conf;
    xdg.configFile."hypr/hyprlock.conf".source = ./../../../dotfiles/hyprlock/.config/hypr/desktop_hyprlock.conf;
    xdg.configFile."waybar/config.jsonc".source = ./../../../dotfiles/waybar/.config/waybar/desktop_config.jsonc;
    xdg.configFile."waybar/style.css".source = ./../../../dotfiles/waybar/.config/waybar/desktop_style.css;
  };
}