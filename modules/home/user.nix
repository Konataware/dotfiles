{ config, lib, pkgs, ... }:

{
	users.users.paz = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ];
	};
}

