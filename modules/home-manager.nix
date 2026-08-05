{ config, lib, pkgs, ... }:

{
	home-manager.users.paz = _: {
		home.stateVersion = "26.05";
		
		home.sessionVariables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
		};

		home.file.".xinitrc" = {
			text = ''
				#!/bin/sh
				if [-f /etc/profile ]; then
					./etc/profile
				fi

				if [-f ~/.profile ]; then
					.~/.profile
				fi

				exec i3
			'';
			executable = true;
		};
		
		# user pkgs and program configs
		imports = [ 
			./pkgs/home.nix
			./home/alacritty.nix
			./home/bash.nix
			./home/neovim.nix
		];
	};
} 
