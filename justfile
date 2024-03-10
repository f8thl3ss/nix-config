default:
  just --list

nixos-zephyrus:
  sudo nixos-rebuild switch --flake .#zephyrus $@

home-zephyrus:
  home-manager switch --flake .#chris@zephyrus -b backup "$@"

home-mac-job-laptop:
  home-manager switch --flake .#christopherguay@Christophers-MacBook-Pro.local -b backup
