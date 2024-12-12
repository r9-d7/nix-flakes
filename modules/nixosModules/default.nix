{ pkgs, ... }:
{
  imports = [ 
      ./system
      ./nvidia
      ./sddm
  ];
}
