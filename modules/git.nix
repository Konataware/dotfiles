{ config, lib, pkgs, ... }:

{
	programs.git = {
		enable = true;
		config = {
				user.name = "Konataware";
				user.email = "luansilie404@gmail.com";
		};
	};
}
