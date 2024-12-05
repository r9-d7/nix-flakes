{ config, pkgs, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    systemd-run --user --scope --slice-inherit \
      --setenv=__NV_PRIME_RENDER_OFFLOAD=1 \
      --setenv=__NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0 \
      --setenv=__GLX_VENDOR_LIBRARY_NAME=nvidia \
      --setenv=__VK_LAYER_NV_optimus=NVIDIA_only \
      "$@"
  '';
in {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [ nvidia-offload ];
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  hardware.nvidia.nvidiaPersistenced = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime = {
    offload.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
  hardware.nvidia.nvidiaSettings = true;  
}
