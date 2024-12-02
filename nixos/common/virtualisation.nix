{ ... }:
{
  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };
  virtualisation.waydroid.enable = true;
}
