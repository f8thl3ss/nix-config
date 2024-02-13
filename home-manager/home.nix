# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, username, ... }:
let
  homeDirectory = "/home/${username}";
in
{
  # You can import other home-manager modules here
  programs.home-manager.enable = true;
  # Imports other configs
  imports = [
    ./program-conf/atuin
    ./program-conf/git
    # "${./programs/browsers/firefox.nix}"
    ./program-conf/kitty
    ./program-conf/neovim
    ./program-conf/zsh
    ./packages.nix
    ./dconf.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      inputs.neovim-nightly-overlay.overlay
      # outputs.overlays.unstable-packages
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    inherit username homeDirectory;

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };
  };


  # Or any other shell you're using.

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
