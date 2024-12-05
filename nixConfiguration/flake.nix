{
  description = "Nixos config flake";

  inputs = {
    # 1
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
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
      home-manager = import inputs.home-manager;
      catppuccin = import inputs.catppuccin;
  in 
  {
    nixosConfigurations.nixvault = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.default
        {
          inputs.home-manager = {
            extraSpecialArgs = { inherit inputs; };
            users.rossf = {
              imports = [
                ./hosts/default/home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          };
        }
      ];
    };
  };
}
