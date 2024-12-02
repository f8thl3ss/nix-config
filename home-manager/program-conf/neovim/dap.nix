{ pkgs, ... }: {
  programs.nixvim = {
    # Plugins
    plugins = {
      # DAP (Debug Adapter Protocol)
      dap = {
        enable = true;
        # configurations = {
        #   rust = [
        #     {
        #       # Rust debugging config can be more complex, you might want to customize this
        #       type = "lldb";
        #       request = "launch";
        #       name = "Debug executable";
        #       program = "\${file}";
        #     }
        #   ];
        # };
      };
    };
  };
}
