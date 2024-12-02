{ pkgs, ... }: {
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [
    qemu_full
    spice
    spice-gtk
    spice-protocol
    virtio-win
    virt-viewer
    win-spice
  ];
  programs.virt-manager.enable = true;
}
