{ config, lib, pkgs, ... }:

{
	services.xserver.enable = false;
	programs.sway.enable = true;

	hardware.opengl.enable = true;
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
