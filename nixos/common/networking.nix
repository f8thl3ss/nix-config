{ ... }:
{
  networking = {
    firewall = {
      allowedUDPPorts = [ 53 53317 ];
      allowedTCPPorts = [ 53317 ];
    };
  };
}
