{ pkgs, lib, ... }:
with lib;
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [ rustup zlib openssl.dev pkg-config ]);
  };
}
