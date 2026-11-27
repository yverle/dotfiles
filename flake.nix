{
  description = "NixOS-WSL config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pi = {
      url = "github:earendil-works/pi/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixos-wsl, nix-index-database, home-manager, pi, ... }:
    let
      username = "nixos";
      hostname = "nixos";
    in {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username hostname; };

        modules = [
          nixos-wsl.nixosModules.default
          home-manager.nixosModules.home-manager
          ./wsl.nix
          {
            nixpkgs.hostPlatform = "x86_64-linux";
            nixpkgs.overlays = [
              inputs.pi.overlays.default

              (final: prev: {
                unstable = import inputs.nixpkgs-unstable {
                  system = prev.stdenv.hostPlatform.system;
                  config = prev.config;
                };
              })
            ];

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-backup";
            home-manager.extraSpecialArgs = { inherit inputs username; };
          }
        ];
      };
    };
}
