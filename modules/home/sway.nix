{ config, lib, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;

    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "rofi";
      bars = [ ];
		
	input = {
		"type:keyboard" = {
			xkb_layout = "br";
			xkb_variant = "abnt2";
			xkb_model = "abnt2";
		};
	};

      startup = [
        { command = "dunst"; always = true; }
        { command = "dex --autostart --environment i3"; }
        { command = "xss-lock --transfer-sleep-lock -- i3lock --nofork"; always = true; }
		  { command = "swaymsg workspace 1"; always = true; }
      ];

      keybindings = {
        # Volume
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";

        # Terminal
        "Mod4+Return" = "exec alacritty";

        # Screenshot
        "Mod4+Print" = "exec flameshot gui -p ~/Pictures/";

        # Kill focused window
        "Mod4+Shift+q" = "kill";

        # Launcher
        "Mod4+Control+Return" = "exec rofi -show drun";
		  "Mod4+Control+m" = "exec rofi -show window";

        # Focus
        "Mod4+j" = "focus left";
        "Mod4+k" = "focus down";
        "Mod4+l" = "focus up";
        "Mod4+ccedilla" = "focus right";
        "Mod4+Left" = "focus left";
        "Mod4+Down" = "focus down";
        "Mod4+Up" = "focus up";
        "Mod4+Right" = "focus right";

        # Move windows
        "Mod4+Shift+j" = "move left";
        "Mod4+Shift+k" = "move down";
        "Mod4+Shift+l" = "move up";
        "Mod4+Shift+ccedilla" = "move right";
        "Mod4+Shift+Left" = "move left";
        "Mod4+Shift+Down" = "move down";
        "Mod4+Shift+Up" = "move up";
        "Mod4+Shift+Right" = "move right";

        # Splits
        "Mod4+h" = "split h";
        "Mod4+v" = "split v";

        # Fullscreen
        "Mod4+f" = "fullscreen toggle";

        # Layouts
        "Mod4+s" = "layout stacking";
        "Mod4+w" = "layout tabbed";
        "Mod4+e" = "layout toggle split";

        # Floating
        "Mod4+Shift+space" = "floating toggle";
        "Mod4+space" = "focus mode_toggle";

        # Focus parent
        "Mod4+a" = "focus parent";

        # Sway control
        "Mod4+Shift+c" = "reload";
        "Mod4+Shift+r" = "restart";
        "Mod4+Shift+e" = "exec swaymsg exit";

        # Enter resize mode
        "Mod4+r" = "mode resize";

        # Workspaces
        "Mod4+1" = "workspace 1";
        "Mod4+2" = "workspace 2";
        "Mod4+3" = "workspace 3";
        "Mod4+4" = "workspace 4";
        "Mod4+5" = "workspace 5";
        "Mod4+6" = "workspace 6";
        "Mod4+7" = "workspace 7";
        "Mod4+8" = "workspace 8";
        "Mod4+9" = "workspace 9";
        "Mod4+0" = "workspace 10";

        "Mod4+Shift+1" = "move container to workspace 1";
        "Mod4+Shift+2" = "move container to workspace 2";
        "Mod4+Shift+3" = "move container to workspace 3";
        "Mod4+Shift+4" = "move container to workspace 4";
        "Mod4+Shift+5" = "move container to workspace 5";
        "Mod4+Shift+6" = "move container to workspace 6";
        "Mod4+Shift+7" = "move container to workspace 7";
        "Mod4+Shift+8" = "move container to workspace 8";
        "Mod4+Shift+9" = "move container to workspace 9";
        "Mod4+Shift+0" = "move container to workspace 10";
      };

      modes = {
        resize = {
          "j" = "resize shrink width 10 px or 10 ppt";
          "k" = "resize grow height 10 px or 10 ppt";
          "l" = "resize shrink height 10 px or 10 ppt";
          "ccedilla" = "resize grow width 10 px or 10 ppt";

          "Left" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";

          "Return" = "mode default";
          "Escape" = "mode default";
          "Mod4+r" = "mode default";
        };
      };
    };

    extraConfig = ''
      font pango:JetBrains Mono 8

      for_window [class=".*"] border pixel 1
      floating_modifier Mod4
    '';
  };
}
