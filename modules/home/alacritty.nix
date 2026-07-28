{ config, lib, pkgs, ... }:

{
	programs.alacritty = {
		enable = true;
		settings = {
			general = {
				["ergonomic.toml"];
				live_config_reload = true;
			};
			font = {
				normal = {
					family = "JetBrainsMono Nerd Font";
					style = "Regular";
				};
				bold = {
					family = "JetBrainsMono Nerd Font";
					style = "Bold";
				};
				italic = {
						family = "JetBrainsMono Nerd Font";
						style = "Italic";
				};
				size = 8;
			};
		};
	};
}
