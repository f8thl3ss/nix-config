default:
  just --list

nixos-zephyrus:
  sudo nixos-rebuild switch --flake .#zephyrus $@

nixos-framework:
  sudo nixos-rebuild switch --flake .#framework-laptop -v

home-linux-laptop:
  home-manager switch --flake .#chris -b backup "$@"

home-mac-job-laptop:
  home-manager switch --flake .#christopherguay@Christophers-MacBook-Pro.local -b backup
