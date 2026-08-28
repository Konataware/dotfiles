{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];

  environment.systemPackages = with pkgs; [
    ntfs3g
    git
    wget
    heroic
    wineWow64Packages.stable

    # wine compatibility things. I was having audio issues with Persona 4 Golden
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly # this contains ASF demuxer bs
    pkgsi686Linux.gst_all_1.gst-plugins-ugly # 32‑bit version
    pkgsi686Linux.gst_all_1.gst-plugins-base
    pkgsi686Linux.gst_all_1.gst-plugins-good

    gamescope
    mangohud
  ];
  programs.steam.enable = true;
}
