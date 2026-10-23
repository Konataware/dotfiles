{ pkgs, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    ensureDatabases = [ "aula_so" ];
    ensureUsers = [
      {
        name = "paz";
        ensurePermissions = {
          "aula_so.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };

  environment.systemPackages = with pkgs; [
    mariadb
  ];
}
