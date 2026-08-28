{
  services.xserver.enable = false;
  programs.sway.enable = true;

  hardware.graphics.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
