{
  description = "Konataware NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";

      unstableOverlay = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config = prev.config;
        };
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hardware-configuration.nix
          ./conf.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [ unstableOverlay ];
            home-manager.backupFileExtension = "backup";
            home-manager.overwriteBackup = true;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
    };
}
