# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: { };
  # modifications = final: prev: { 
  #   asusctl = prev.asusctl.overrideAttrs (drv: rec {
  #     pname = "asusctl";
  #     version = "5.0.6";
  #     src = prev.fetchFromGitLab {
  #       owner = "asus-linux";
  #       repo = "asusctl";
  #       rev = version;
  #       hash = "sha256-nZGGD2TArYxh5ILSk7ZAfl4dkz8sOGCKS91PtrlpP4U=";
  #     };
  #     cargoDeps = prev.rustPlatform.importCargoLock {
  #       lockFile = ./asusctl/Cargo.lock;
  #       outputHashes = {
  #         "ecolor-0.21.0" = "sha256-m7eHX6flwO21umtx3dnIuVUnNsEs3ZCyOk5Vvp/lVfI=";
  #         "notify-rust-4.6.0" = "sha256-jhCgisA9f6AI9e9JQUYRtEt47gQnDv5WsdRKFoKvHJs=";
  #         "supergfxctl-5.1.2" = "sha256-HJGyjFeN3bq+ArCGfFHAMnjW76wSnNyxPWR0ELcyjLg=";
  #       };
  #     };
  #     cargoHash = "";
  #   });
  # };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  # unstable-packages = final: _prev: {
  #   unstable = import inputs.nixpkgs-unstable {
  #     system = final.system;
  #     config.allowUnfree = true;
  #   };
  # };
}
