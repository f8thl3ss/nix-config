{ ... }:
{
  networking = {
    hostName = "zephyrus";
    networkmanager.enable = true;
    firewall = {
      allowedUDPPorts = [ 53 53317 ];
      allowedTCPPorts = [ 53317 ];
    };
    wireless = {
      driver = "nl80211";
    };
  };

}
