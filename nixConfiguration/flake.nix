{
  description = "Nixos config flake";

  inputs = {
    # 1
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # 2
    catppuccin.url = "github:catppuccin/nix";
    # 3
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
    pgks = import nixpkgs.legacyPackages.${system};
  in 
  {
    nixosConfigurations.nixvault = nixpkgs.lib.nixosSystem {
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix
        inputs.catppuccin.nixosModules.catppuccin
        inputs.home-manager.nixosModules.default
        {
          inputs.home-manager = {
            extraSpecialArgs = { inherit inputs; };
            users.rossf = {
              imports = [
                ./hosts/default/home.nix
                inputs.catppuccin.homeManagerModules.catppuccin
              ];
            };
          };
        }
      ];
    };
  };
}
