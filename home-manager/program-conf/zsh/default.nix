{
  programs.zsh = {
    enable = true;
    autocd = true;
    initExtra = "eval \"$(direnv hook zsh)\"";
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "lambda";
    };
  };
}
