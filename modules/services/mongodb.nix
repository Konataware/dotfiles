{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "mongodb-ce"
    ];

  services.mongodb = {
    enable = true;
    package = pkgs.mongodb-ce;
    bind_ip = "127.0.0.1";
    dbpath = "/var/db/mongodb";
  };

  systemd.services.mongodb.wantedBy = lib.mkForce [ ];
}
