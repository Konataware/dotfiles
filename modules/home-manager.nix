{ config, lib, pkgs, ... }:

{
	home-manager.users.paz = _: {
		home.stateVersion = "26.05";
		
		# user pkgs
		imports = [./pkgs/home.nix];

		home.sessionVariables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
		};
	};
} 
