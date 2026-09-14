{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "anytype"
      "anytype-heart"
    ];

  home.packages = with pkgs; [
    # Desktop / GUI applications
    alacritty
    #anytype
    arandr
    dunst
    flameshot
    libreoffice-still
    lxappearance
    pavucontrol
    rofi
    qbittorrent

    # CLI / TUI system utilities
    bluetui
    fastfetch
    fd
    grim
    htop
    keepassxc
    slurp
    tldr
    tree
    unzip
    wallust
    wl-clipboard
    yazi

    # Development / programming tools
    bash-language-server
    gcc
    gnumake
    lazygit
    python3
    shellcheck
    tree-sitter

    # Web browsers
    librewolf
  ];
}
