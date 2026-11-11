{ lib, pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    port = 5433;
    dataDir = "/var/lib/postgresql/16";
    enableTCPIP = true;

    # Local + localhost only, trust auth — fine for a dev box.
    authentication = pkgs.lib.mkOverride 10 ''
      local   all   all                 trust
      host    all   all   127.0.0.1/32  trust
      host    all   all   ::1/128       trust
    '';

    # Runs once at initdb: creates your OS user as superuser for convenience.
    initialScript = pkgs.writeText "pg-init.sql" ''
      CREATE ROLE anzu WITH LOGIN SUPERUSER;
    '';

    ensureDatabases = [ "hexploit" ];
    ensureUsers = [
      {
        name = "hexploit";
        ensureDBOwnership = true;
      }
    ];
  };

  # Do not start on boot — activate manually:
  #   sudo systemctl start postgresql
  #   sudo systemctl stop postgresql
  systemd.services.postgresql.wantedBy = lib.mkForce [ ];
}
