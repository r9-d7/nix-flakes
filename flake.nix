{
  description = "Nixos config flake";

  inputs = {
    # 1
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # 2
    catppuccin.url = "github:catppuccin/nix";
    # 3
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # 4
    mediaplayer = {
      url = "github:nomisreual/mediaplayer";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #5
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #6
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, stylix, catppuccin, home-manager, ... }@inputs: 
  let
      system = "x86_64-linux";
      pgks = import nixpkgs.legacyPackages.${system};
      defaulthost = "./hosts/default";
  in 
  {
    nixosConfigurations.nixvault-102 = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixVault-LAPTOP/configuration.nix
        stylix.nixosModules.stylix
        catppuccin.nixosModules.catppuccin          
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.rdfagerli = {
              imports = [
                ./hosts/nixVault-LAPTOP/home.nix
                #stylix.homeModules.stylix
                catppuccin.homeModules.catppuccin
                inputs.spicetify-nix.homeManagerModules.default
              ];
            };
          };
        }
      ];
    };

    nixosConfigurations.nixvault-101 = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixVault-DESKTOP/configuration.nix
        catppuccin.nixosModules.catppuccin
          
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.rossf = {
              imports = [
                ./hosts/nixVault-DESKTOP/home.nix
                  catppuccin.homeManagerModules.catppuccin
                  inputs.spicetify-nix.homeManagerModules.default
              ];
            };
          };
        }
      ];
    };
  };
}
