# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  zen-browser = pkgs.callPackage ./zen-browser { };
  # cargo-shuttle = pkgs.callPackage ./cargo-shuttle { };
  # example = pkgs.callPackage ./example { };
  # asusctl = pkgs.callPackage ./asusctl { };
  caido43 = pkgs.callPackage ./caido { };
  # miseLatest = pkgs.callPackage ./mise { };
}
