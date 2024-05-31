{ pkgs, ... }:
{
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedUDPPorts = [ 53 53317 ];
      allowedTCPPorts = [ 53317 ];
    };
  };
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
