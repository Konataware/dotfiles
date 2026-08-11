{ config, lib, pkgs, ... }:

{
	home.packages = with pkgs; [
		# Desktop / GUI applications
		alacritty
		arandr
		dunst
		flameshot
		libreoffice-still
		lxappearance
		pavucontrol
		rofi

		# CLI / TUI system utilities
		bluetui
		fastfetch
		fd
		grim
		htop
		keepassxc
		slurp
		tldr
		tree
		wallust
		wl-clipboard
		yazi

		# Development / programming tools
		bash-language-server
		gcc
		gnumake
		lazygit
		shellcheck
		tree-sitter

		# Web browsers
		librewolf
	];
}


