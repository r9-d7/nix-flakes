{ config, lib, pkgs, ... }:
{
  # Use the grub EFI boot loader.
  boot.loader.grub = { 
    enable = true;
    efiSupport = true;
    device = "nodev";
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
    };
  };

  services.fail2ban.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "America/New_York";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  
  # Graphics settings  
  services.xserver = {
    enable = true;
    desktopManager = {
      gnome.enable = true;
    };
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    simple-scan
    totem
    yelp
    evince
    geary
    gnome-contacts
    gnome-maps
    gnome-weather
  ];

  # Bluetooth Settings
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Audio Service
  services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
  };
  
  nix.gc ={
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
