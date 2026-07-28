{ config, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		i3
		i3blocks
		ntfs-3g
		git
		wget
	];
}

