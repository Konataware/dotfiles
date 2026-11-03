{ pkgs, ... }:

{
  programs.spotify-player = {
    enable = true;
    package = pkgs.unstable.spotify-player;

    settings = {
      theme = "default";
      border_type = "Rounded";
      progress_bar_type = "Rectangle";
      playback_window_position = "Bottom";

      device = {
        name = "nixos-sway";
        volume = 70;
        bitrate = 320;
        audio_cache = true;
        normalization = true;
      };

      enable_cover_image_cache = true;
      cover_img_length = 18;
      cover_img_width = 9;
      cover_img_scale = 1.0;

      enable_media_control = true;
      enable_notify = true;
      notify_timeout_in_secs = 5;
    };

    themes = [
      {
        name = "default";
        component_style = {
          block_title = {
            fg = "Magenta";
          };
          current_playing = {
            fg = "Green";
            modifiers = [ "Bold" ];
          };
          playback_progress_bar = {
            fg = "Green";
            bg = "BrightBlack";
          };
        };
      }
    ];
  };

  services.playerctld.enable = true;
}
