{ config, pkgs, lib, ... }:
let
  cfg = config.nvidia-prime;
in 
{
  # Laptop specific configurations
  options = {
    nvidia-prime.enable = lib.mkEnableOption "enables nvidia prime";
  };

  config = lib.mkIf cfg.enable {
    hardware.nvidia.prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };  
}
