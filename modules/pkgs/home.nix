{ config, lib, pkgs, ... }:

{
	home.packages = with pkgs; [
		# Desktop / GUI applications
		alacritty
		arandr
		dunst
		flameshot
		lxappearance
		pavucontrol
		rofi

		# CLI / TUI system utilities
		bluetui
		fastfetch
		fd
		htop
		keepassxc
		tldr
		tree
		wallust
		xclip
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


