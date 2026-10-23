{
  pkgs,
  ...
}:
let
  unstable = import <unstable> {
    config = pkgs.config;
  };
in
{

  nixpkgs.config.allowUnfreePackages = [
    "postman"
  ];
  home.packages = with pkgs; [
    # Desktop / GUI applications
    alacritty
    arandr
    dunst
    flameshot
    libreoffice-still
    lxappearance
    pavucontrol
    (unstable.postman.overrideAttrs (old: {
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
    unstable.pomo
    slurp
    tldr
    tree
    unzip
    wallust
    wl-clipboard
    yazi

    # Development / tools
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
