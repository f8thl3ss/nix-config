{
  description = "My nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, mac-app-util, ... }@inputs:
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
      email = "christo1771@gmail.com";
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
          specialArgs = { inherit inputs username outputs email; };
          modules = [
            # > Our main nixos configuration file <
            ./nixos/zephyrus.nix
            inputs.nixos-hardware.nixosModules.asus-zephyrus-ga401
          ];
        };
        framework-laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs username outputs email; };
          modules = [
            # > Our main nixos configuration file <
            ./nixos/common/default.nix
            ./nixos/framework-13.nix
            inputs.nixos-hardware.nixosModules.framework-13-7040-amd
          ];
        };
      };
      darwinConfigurations = {
        Christophers-MacBook-Pro = nix-darwin.lib.darwinSystem {
          specialArgs = { inherit inputs outputs name; username = "christopherguay"; };
          system = "aarch64-darwin";

          modules = [
            ./nix-darwin/configuration.nix
            mac-app-util.darwinModules.default
            home-manager.darwinModules.home-manager
            (
              { config, inputs, ... }:
              {
                home-manager.users."christopherguay".imports = [
                  ./home-manager/home.nix
                  ./home-manager/default-packages.nix
                  ./home-manager/job-programs.nix
                  inputs.mac-app-util.homeManagerModules.default
                ];
                home-manager.extraSpecialArgs = {
                  inherit inputs outputs;
                  username = "christopherguay";
                  email = "cguay@dimonoff.com";
                  system = "aarch64-darwin";
                  homeDirectoryBase = "/Users";
                };
              }
            )

          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "chris" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs name username homeDirectoryBase email; };
          # > Our main home-manager configuration file <
          modules = [
            ./home-manager/home.nix
            ./home-manager/default-packages.nix
            ./home-manager/linux-packages.nix
            ./home-manager/dconf.nix
          ];
        };
      };
    };
}
