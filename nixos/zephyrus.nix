{ inputs, ... }:
{
  # You can import other NixOS modules here
  imports = [
    inputs.home-manager.nixosModules.home-manager

    # Common
    ./common/default.nix

    # Hardware specific
    ./asus-laptop/default.nix
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
