{ config, lib, pkgs, ... }:

{
	programs.alacritty = {
		enable = true;
		settings = {
			general = {
				import = ["ergonomic.toml"];
				live_config_reload = true;
			};
			font = {
				normal = {
					family = "JetBrains Mono Nerd Font";
					style = "Regular";
				};
				bold = {
					family = "JetBrains Mono Nerd Font";
					style = "Bold";
				};
				italic = {
						family = "JetBrains Mono Nerd Font";
						style = "Italic";
				};
				size = 8;
			};
		};
	};
}
