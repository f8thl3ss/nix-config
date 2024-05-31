{ ... }:
{
  programs.waybar.style = ''
    * {
      border: none;
      font-size: 16px;
      font-family: "FiraCode Nerd Font", "Font Awesome 6 Free";
      min-height: 30px;
    }

    window#waybar {
      background: transparent;
      margin: 7px;
      color: #ffffff;
     }

    .modules-right {
      padding-left: 5px;
      border-radius: 15px 0 0 15px;
      margin-top: 2px;
      background: #000000;
    }

    .modules-center {
      padding: 0 15px;
      margin-top: 2px;
      border-radius: 15px 15px 15px 15px;
      background: #000000;
    }

    .modules-left {
      border-radius: 0 15px 15px 0;
      margin-top: 2px;
      background: #000000;
    }

    #custom-clipboard,
    #custom-colorpicker,
    #custom-powerDraw,
    #bluetooth,
    #pulseaudio,
    #network,
    #disk,
    #memory,
    #backlight,
    #cpu,
    #temperature,
    #custom-weather,
    #idle_inhibitor,
    #jack,
    #tray,
    #window,
    #workspaces,
    #clock {
      padding: 0 5px;
      margin: 0 2px;
    }
    #pulseaudio {
      padding-top: 3px;
    }

    #temperature.critical,
    #pulseaudio.muted {
      color: #FF0000;
      padding-top: 0;
    }

    #clock {
      color: #5fd1fa;
    }

    #battery {
      padding: 0 5px;
    }

    #battery.charging {
      color: #ffffff;
      background-color: #26A65B;
    }

    #battery.warning:not(.charging) {
      background-color: #ffbe61;
      color: black;
    }

    #battery.critical:not(.charging) {
      background-color: #f53c3c;
      color: #ffffff;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    @keyframes blink {
        to {
            background-color: #ffffff;
            color: #000000;
        }
    }
  '';
}
