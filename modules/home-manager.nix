{
  home-manager.users.paz = _: {
    home.stateVersion = "26.05";

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    # user pkgs and program configs
    imports = [
      ./pkgs/home.nix
      ./home/alacritty.nix
      ./home/bash.nix
      ./home/neovim.nix
      ./home/flameshot.nix
      ./home/sway.nix
    ];
  };
}
