{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  systemd.services.jellyfin.wantedBy = lib.mkForce [ ];

  systemd.services.jellyfin-acl = {
    description = "jellyfin acl perms for ~/Media";
    wantedBy = [ "jellyfin.service" ];
    before = [ "jellyfin.service" ];
    partOf = [ "jellyfin.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      ${pkgs.acl}/bin/setfacl -m u:jellyfin:--x /home/anzu
      ${pkgs.acl}/bin/setfacl -R -m u:jellyfin:rX /home/anzu/Media
      ${pkgs.findutils}/bin/find /home/anzu/Media -type d \
        -exec ${pkgs.acl}/bin/setfacl -d -m u:jellyfin:rX {} \;
    '';
  };

  virtualisation.containers.storage.settings = {
    storage = {
      driver = "overlay";
      graphroot = "/home/anzu/.local/share/containers/storage";
    };
  };
  systemd.tmpfiles.rules = [
    "d /home/anzu/.containers-rootful 0711 root root -"
    "d /home/anzu/.containers-rootful/storage 0711 root root -"
    "d /home/anzu/.shoko 0755 anzu users -"
  ];

  virtualisation.oci-containers = {
    backend = "podman";
    containers.shoko = {
      image = "ghcr.io/shokoanime/server:latest";
      ports = [ "8111:8111" ];
      volumes = [
        "/home/anzu/.shoko:/home/shoko/.shoko"
        "/home/anzu/Media:/mnt/anime"
      ];
      environment = {
        PUID = toString config.users.users.anzu.uid;
        PGID = toString config.users.groups.users.gid;
        TZ = "America/Sao_Paulo";
      };
    };
  };

  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";
    LidSwitchIgnoreInhibited = "no";
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    podman
    acl
    findutils
  ];
}
