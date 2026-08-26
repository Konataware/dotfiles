{ config, lib, pkgs, ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        useGrimAdapter = true;
        disabledGrimWarning = true;
		  showStartupLaunchMessage = false;
		  showDesktopNotification = true;
      };
    };
  };
}
