# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ "kvm-amd" ];
  # boot.extraModulePackages = with config.boot.kernelPackages; [ framework-laptop-kmod ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/a0d47549-7762-45c5-aa3b-348f205af865";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-b8e0dd5c-b496-4dd0-974d-fe474bb5f600".device = "/dev/disk/by-uuid/b8e0dd5c-b496-4dd0-974d-fe474bb5f600";

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/E11C-5976";
      fsType = "vfat";
    };

  swapDevices = [{
    device = "/swapfile";
    size = 32 * 1024; # 32GB
  }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
