{ username, ... }: {
  # You can import other NixOS modules here
  imports = [
    # Common
    ./common/default.nix
    # Hardware specific
    ./framework-laptop/default.nix
  ];
  services.fwupd.enable = true;
  networking.enableIPv6 = false;

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        zen 
        Zen Browser
      '';
      mode = "0755";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "${username}" ];
  };

  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11"; # Did you read the comment?
}
