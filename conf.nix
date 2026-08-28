{
  pkgs,
  ...
}:

{
  imports = [
    ./modules/grub.nix
    ./modules/desktop.nix
    ./modules/git.nix
    ./modules/gnupg.nix
    ./modules/home-manager.nix
    ./modules/services/openssh.nix
    ./modules/pkgs/system.nix
    ./modules/pkgs/fonts.nix
    ./modules/home/user.nix
    #./modules/services/apache.nix
  ];

  # latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # bluetooth
  hardware.bluetooth.enable = true;

  # network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # time & locale
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  security.polkit.enable = true;

  # pipewire
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  # touchpad
  services.libinput.enable = true;

  system.stateVersion = "26.05";
}
