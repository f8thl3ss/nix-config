{ pkgs, username, ... }:
{
  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
  };
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix = {
    settings = {
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "macos-builder.cachix.org-1:HPWcq59/iyqQz6HEtlO/kjD/a7ril0+/XJc+SZ2LgpI=" ];
      substituters = [ "https://cache.nixos.org" "https://macos-builder.cachix.org" ];
      builders-use-substitutes = true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      # upgrade-nix-store-path-url = "https://install.determinate.systems/nix-upgrade/stable/universal";
      extra-nix-path = "nixpkgs=flake:nixpkgs";
      extra-trusted-users = [ "@admin" ];
      trusted-users = [ "@admin" ];
      # Not strictly necessary, but this will reduce your disk utilization
    };
    package = pkgs.nixUnstable;
    distributedBuilds = true;
    # linux-builder = {
    #   enable = true;
    #   ephemeral = true;
    #   systems = [
    #     "x86_64-linux"
    #     "aarch64-linux"
    #   ];
    #   supportedFeatures = [ "kvm" "big-parallel" ];
    #   maxJobs = 4;
    #   config = {
    #     boot.binfmt.emulatedSystems = [ "x86_64-linux" "i686-linux" ];
    #     virtualisation = {
    #       darwin-builder = {
    #         diskSize = 40 * 1024;
    #         memorySize = 8 * 1024;
    #       };
    #       cores = 6;
    #     };
    #   };
    # };
    buildMachines = [{
      hostName = "lima-nixos";
      system = "x86_64-linux";
      sshUser = "christopherguay";
      supportedFeatures = [ "kvm" "big-parallel" ];
      maxJobs = 4;
      protocol = "ssh-ng";
    }];
  };
  programs.zsh.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
  environment.variables = {
    EDITOR = "vim";
  };
}
