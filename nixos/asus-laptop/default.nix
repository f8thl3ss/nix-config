{ inputs, ... }:
{
  # You can import other NixOS modules here
  imports = [
    inputs.home-manager.nixosModules.home-manager

    # Common
    ./asus-hardware-config.nix

    # Hardware specific
    ./hardware-configuration.nix
  ];
}
