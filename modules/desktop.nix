{ config, lib, pkgs, ... }:

{
	services.displayManager.defaultSession = "none+i3";
	services.xserver = {
		enable = true;

		xkb = {
			layout = "br";
			variant = "abnt2";
		};
		
		windowManager.i3.enable = true;
		
		displayManager = {
			lightdm.enable = false;
			startx.enable = true;
		};
		
		# xterm is shit
		excludePackages = with pkgs; [
			xterm
		];
	};
}
