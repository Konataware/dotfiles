{
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    # Desktop / GUI applications
    alacritty
    dunst
    flameshot
    libreoffice-still
    nwg-displays
    pavucontrol
    (pkgs.unstable.postman.overrideAttrs (old: {
      nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ makeWrapper ];
      postInstall = (old.postInstall or "") + ''
         wrapProgram $out/bin/postman \
        --set POSTMAN_DISABLE_GPU true
      '';
    }))
    rofi
    qbittorrent
    telegram-desktop

    # CLI / TUI system utilities
    asciiquarium
    bluetui
    fastfetch
    fd
    grim
    htop
    jq
    keepassxc
    pkgs.unstable.pomo
    slurp
    tldr
    tree
    unzip
    wl-clipboard
    yazi

    # Development / tools
    bash-language-server
    gcc
    gnumake
    lazygit
    python3
    ripgrep
    shellcheck
    tree-sitter

    # Web browsers
    librewolf

    # Sway
    swayidle
    swaylock
  ];
}
