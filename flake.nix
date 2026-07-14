{
  description = "Hyprland";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nur, home-manager, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        nur.overlays.default
      ];
    };
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager

        {
          nixpkgs.overlays = [
            nur.overlays.default
          ];

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";

            users.tjetj = import ./home.nix;
          };
        }
      ];
    };

    homeConfigurations.tjetj = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home.nix
      ];
    };
  };
}
