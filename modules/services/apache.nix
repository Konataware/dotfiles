{ config, pkgs, ... }:

{
  users.users.httpd = {
    isSystemUser = true;
    group = "httpd";
    home = "/var/www";
    createHome = true;
    shell = pkgs.bash;
  };

  users.groups.httpd = {};

  services.httpd = {
    enable = true;
    adminAddr = "admin@example.org";
    user = "httpd";
    group = "httpd";
 	 extraModules = [ "proxy" "proxy_fcgi" ];
    virtualHosts."localhost" = {
      documentRoot = "/var/www/example.org";
      extraConfig = ''
        <Directory /var/www/example.org>
          Options Indexes FollowSymLinks
          AllowOverride All
          Require all granted
        </Directory>
        <FilesMatch \.php$>
          SetHandler "proxy:unix:${config.services.phpfpm.pools."example.org".socket}|fcgi://localhost"
        </FilesMatch>
      '';
    };
  };

  services.phpfpm = {
    pools."example.org" = {
      user = "httpd";
      group = "httpd";
      settings = {
        "listen.owner" = "httpd";
        "listen.group" = "httpd";
        "listen.mode" = "0660";
        "pm" = "dynamic";
        "pm.max_children" = 50;
        "pm.start_servers" = 5;
        "pm.min_spare_servers" = 5;
        "pm.max_spare_servers" = 35;
      };
      phpOptions = ''
        memory_limit = 2G
        upload_max_filesize = 128M
        post_max_size = 128M
        max_execution_time = 300
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];

  system.activationScripts.createWwwDir = {
    text = ''
      mkdir -p /var/www/example.org
      chown httpd:httpd /var/www/example.org
      chmod 755 /var/www/example.org
      chmod 755 /var/www
    '';
    deps = [];
  };

  systemd.tmpfiles.rules = [
    "d /run/phpfpm 0755 httpd httpd - -"
  ];
}
