{ pkgs, ... }: {
  home.packages = [
    pkgs.gnome-tweaks
  ];

  dconf.settings = {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/shell" = {
      disable-user-extensions = false; # enables user extensions
      enabled-extensions = [
        # Put UUIDs of extensions that you want to enable here.
        # If the extension you want to enable is packaged in nixpkgs,
        # you can easily get its UUID by accessing its extensionUuid
        # field (look at the following example).
        pkgs.gnomeExtensions.gsconnect.extensionUuid

        # Alternatively, you can manually pass UUID as a string.  
        pkgs.gnomeExtensions.pop-shell.extensionUuid
        pkgs.gnomeExtensions.blur-my-shell.extensionUuid
        # pkgs.gnomeExtensions.gesture-improvements.extensionUuid
        # ...
      ];
    };
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
      mic-mute = [ "AudioMicMute" ];
      next = [ "AudioNext" ];
      play = [ "AudioPlay" ];
      previous = [ "AudioPrev" ];
      stop = [ "AudioStop" ];
      volume-down = [ "AudioLowerVolume" ];
      volume-up = [ "AudioRaiseVolume" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Ctrl><Alt>t";
      command = "kitty";
      name = "Kitty terminal";
    };
  };
}
