# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ outputs, username, homeDirectoryBase, ... }:
let
  homeDirectory = "${homeDirectoryBase}/${username}";
in
{
  # You can import other home-manager modules here
  programs.home-manager.enable = true;
  imports = [
    ./program-conf/atuin
    ./program-conf/git
    ./program-conf/kitty
    ./program-conf/hyprland
    ./program-conf/waybar
    ./program-conf/neovim
    ./program-conf/rio
    ./program-conf/zsh
    ./default-packages.nix
    ./linux-packages.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      # inputs.neovim-nightly-overlay.overlays
      # outputs.overlays.unstable-packages
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
      allowUnsupportedSystem = true;
    };
  };

  home = {
    inherit username homeDirectory;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.htop = {
    enable = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "eza";
      cd = "z";
      lsusb = "cyme";
      du = "ncdu";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
