default:
  just --list

nixos-zephyrus:
  sudo nixos-rebuild switch --flake .#zephyrus $@

nixos-job-laptop:
  sudo nixos-rebuild switch --flake .#job-laptop $@

home-zephyrus:
  home-manager switch --flake .#chris@zephyrus -b backup "$@"

home-job-laptop:
  home-manager switch --flake .#chris@nixos -b backup "$@"
