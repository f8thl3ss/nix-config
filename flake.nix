{
  description = "My nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hardware.url = "github:nixos/nixos-hardware/master";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    mac-app-util.url = "github:hraban/mac-app-util";
    flake-utils.url = "github:numtide/flake-utils";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      name = "Christopher Guay";
      username = "chris";
      homeDirectoryBase = "/home/";
    in
    rec {
      # Your custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
      );
      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./modules/nixos;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/home-manager;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#zephyrus'
      nixosConfigurations = {
        zephyrus = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs username outputs; };
          modules = [
            # > Our main nixos configuration file <
            ./nixos/asus-laptop/configuration.nix
            inputs.hardware.nixosModules.asus-zephyrus-ga401
          ];
        };
        job-laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs username outputs; };
          modules = [
            # > Our main nixos configuration file <
            ./nixos/job-laptop/configuration.nix
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "chris@zephyrus" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs name username homeDirectoryBase; };
          # > Our main home-manager configuration file <
          modules = [
            ./home-manager/home.nix
            ./home-manager/default-packages.nix
            ./home-manager/linux-packages.nix
            ./home-manager/dconf.nix
          ];
        };
        "christopherguay@Christophers-MacBook-Pro.local" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs name; username = "christopherguay"; homeDirectoryBase = "/Users/"; };
          # > Our main home-manager configuration file <
          modules = [
            ./home-manager/home.nix
            ./home-manager/default-packages.nix
            ./home-manager/job-programs.nix
            inputs.mac-app-util.homeManagerModules.default
          ];
        };
      };
    };
}
