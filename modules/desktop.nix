{ config, lib, pkgs, ... }:

{
	services.xserver = {
		enable = true;

		xkb = {
			layout = "br";
			variant = "abnt2";
		};
		
		windowManager.i3.enable = true;
		
		displayManager = {
			defaultSession = "none+i3";
			lightdm.greeters.gtk.extraConfig = "
				background=#000000
				user-background = false
			";
		};
	};
}
