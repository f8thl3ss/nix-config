{ ... }:
{
  programs.waybar.settings.mainBar = {
    "layer" = "top";
    "position" = "top";
    "modules-left" = [ "clock" "disk" "memory" "cpu" "temperature" "hyprland/window" ];
    "modules-center" = [ "hyprland/workspaces" ];
    "modules-right" = [ "tray" "bluetooth" "pulseaudio" "power-profiles-daemon" "battery" ];
    "reload_style_on_change" = true;

    "hyprland/workspaces" = {
      "format" = "{icon}";
      "format-icons" = {
        "1" = "";
        "2" = "";
        "3" = "";
        "4" = "";
        "5" = "";
        "6" = "";
        "active" = "";
        "default" = "";
      };
      "persistent-workspaces" = {
        "*" = [ 2 3 4 5 6 ];
      };
    };

    "clock" = {
      "format" = "{:%I:%M:%S %p}";
      "interval" = 1;
      "tooltip-format" = "\n<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      "calendar-weeks-pos" = "right";
      "today-format" = "<span color='#7645AD'><b><u>{}</u></b></span>";
      "format-calendar" = "<span color='#aeaeae'><b>{}</b></span>";
      "format-calendar-weeks" = "<span color='#aeaeae'><b>W{:%V}</b></span>";
      "format-calendar-weekdays" = "<span color='#aeaeae'><b>{}</b></span>";
    };

    "bluetooth" = {
      "format-on" = "";
      "format-off" = "";
      "format-disabled" = "󰂲";
      "format-connected" = "󰂴";
      "format-connected-battery" = "{device_battery_percentage}% 󰂴";
      "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
      "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
      "on-click" = "rofi-bluetooth";
    };

    "network" = {
      "format-wifi" = " ";
      "format-ethernet" = " ";
      "format-disconnected" = "";
      "tooltip-format" = "{ipaddr}";
      "tooltip-format-wifi" = "{essid} ({signalStrength}%)  | {ipaddr}";
      "tooltip-format-ethernet" = "{ifname} 🖧 | {ipaddr}";
      "on-click" = "networkmanager_dmenu";
    };

    "battery" = {
      "interval" = 1;
      "states" = {
        "good" = 95;
        "warning" = 30;
        "critical" = 20;
      };
      "format" = "{capacity}%  {icon} ";
      "format-charging" = "{capacity}% 󰂄 ";
      "format-plugged" = "{capacity}% 󰂄 ";
      "format-alt" = "{time} {icon}";
      "format-icons" = [
        "󰁻"
        "󰁼"
        "󰁾"
        "󰂀"
        "󰂂"
        "󰁹"
      ];
    };

    "power-profiles-daemon" = {
      "format" = "{icon}";
      "tooltip-format" = "Power profile: {profile}\nDriver: {driver}";
      "tooltip" = true;
      "format-icons" = {
        "default" = "";
        "performance" = "";
        "balanced" = "";
        "power-saver" = "";
      };
    };


    "disk" = {
      "interval" = 30;
      "format" = "  {percentage_used}%";
      "path" = "/";
    };

    "cpu" = {
      "interval" = 1;
      "format" = " {usage}%";
      "min-length" = 6;
      "max-length" = 6;
      "format-icons" = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
    };

    "memory" = {
      "format" = " {percentage}%";
    };

    "hyprland/window" = {
      "format" = "( {class} )";
      "rewrite" = {
        "(.*) - Mozilla Firefox" = "🌎 $1";
        "(.*) - zsh" = "> [$1]";
      };
    };

    "temperature" = {
      "format" = " {temperatureC}°C";
      "format-critical" = " {temperatureC}°C";
      "interval" = 1;
      "critical-threshold" = 80;
      "on-click" = "foot btop";
    };

    "pulseaudio" = {
      "format" = "{volume}% {icon}";
      "format-bluetooth" = "󰂰";
      "format-muted" = "<span font='12'></span>";
      "format-icons" = {
        "headphones" = "";
        "bluetooth" = "󰥰";
        "handsfree" = "";
        "headset" = "󱡬";
        "phone" = "";
        "portable" = "";
        "car" = "";
        "default" = [ "🔈" "🔉" "🔊" ];
      };
      "justify" = "center";
      "on-click" = "pavucontrol";
      "tooltip-format" = "{icon}  {volume}%";
    };

    "jack" = {
      "format" = "{} 󱎔";
      "format-xrun" = "{xruns} xruns";
      "format-disconnected" = "DSP off";
      "realtime" = true;
    };

    "tray" = {
      "icon-size" = 20;
      "spacing" = 15;
    };

    "upower" = {
      "show-icon" = false;
      "hide-if-empty" = true;
      "tooltip" = true;
      "tooltip-spacing" = 20;
    };
  };
}
