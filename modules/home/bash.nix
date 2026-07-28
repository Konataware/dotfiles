{ config, lib, pkgs, ... }:

{
	programs.bash = {
			enable = true;
			bashrcExtra = ''
				export PATH="$HOME/.local/bin:$PATH"
				export GTK_THEME=Adwaita:dark
				
				alias lsa="ls -a"
				alias lsla="ls -la"

				fastfetch
			'';
		};
	}

