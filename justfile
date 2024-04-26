default:
  just --list

nixos-zephyrus:
  sudo nixos-rebuild switch --flake .#zephyrus $@

nixos-framework:
  sudo nixos-rebuild switch --flake .#framework-laptop -v

nix-darwin:
  #!/usr/bin/env bash
  set -xe
  if ! [ -x "$(command -v darwin-rebuild)" ]; then
    nix run --extra-experimental-features nix-command --extra-experimental-features flakes nix-darwin -- switch --flake . 
  else 
    darwin-rebuild switch --flake .
  fi;
  

home-linux-laptop:
  home-manager switch --flake .#chris -b backup "$@"

home-mac-job-laptop:
  home-manager switch --flake .#christopherguay@Christophers-MacBook-Pro.local -b backup
