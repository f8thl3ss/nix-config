{ config, pkgs, lib, inputs, ... }:
with lib;
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      ms-python.python
      ms-python.vscode-pylance
      ms-vsliveshare.vsliveshare
      naumovs.color-highlight
      redhat.vscode-xml
      redhat.vscode-yaml
      rust-lang.rust-analyzer
      vadimcn.vscode-lldb
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
  };
}
