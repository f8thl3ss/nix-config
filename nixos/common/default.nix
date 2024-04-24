# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, username, ... }:
{
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
    config = {
      allowUnfree = true;
    };
  };

  imports = [
    ./audio.nix
    ./backup.nix
    ./boot.nix
    ./fonts.nix
    ./gnome.nix
    ./libvirt.nix
    ./networking.nix
    ./virtualisation.nix
  ];

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      sandbox = true; # TODO: remove after test
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-users = [ "root" "${username}" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
  };

  # Locale
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # Services 
  # services.printing.enable = true;
  services.tailscale.enable = true;
  services.fwupd = {
    enable = true;
  };

  # default editor
  environment.variables.EDITOR = "nvim";
  environment.variables.MOZ_ENABLE_WAYLAND = "1";

  environment.systemPackages = with pkgs; [
    gcc
    cmake
    gnumake
    restic
    gnome.gnome-tweaks
  ];

  users.users = {
    "${username}" = {
      isNormalUser = true;
      description = "chris";
      extraGroups = [
        "adbusers"
        "audio"
        "dialout"
        "disk"
        "docker"
        "libvirtd"
        "networkmanager"
        "qemu-libvirtd"
        "video"
        "wheel"
      ];
      shell = pkgs.zsh;
    };
  };

  programs.adb.enable = true;
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;
  networking.networkmanager.wifi.powersave = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
