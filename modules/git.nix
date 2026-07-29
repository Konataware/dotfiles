{ config, lib, pkgs, ... }:

{
	programs.git = {
		enable = true;
		config = {
				user.name = "Konataware";
				user.email = "luansiloe404@gmail.com";
		};
	};
}
