{ pkgs, lib, ... }:

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
      ${pkgs.acl}/bin/setfacl -m u:jellyfin:--x /home/paz
      ${pkgs.acl}/bin/setfacl -R -m u:jellyfin:rX /home/paz/Media
      ${pkgs.findutils}/bin/find /home/paz/Media -type d \
        -exec ${pkgs.acl}/bin/setfacl -d -m u:jellyfin:rX {} \;
    '';
  };

  virtualisation.containers.storage.settings = {
    storage = {
      driver = "overlay";
      graphroot = "/home/paz/.local/share/containers/storage";
      runroot = "/run/containers/storage";
    };
  };

  virtualisation.oci-containers = {
    backend = "podman";
    containers.shoko = {
      image = "ghcr.io/shokoanime/server:latest";
      ports = [ "8111:8111" ];
      volumes = [
        "/home/paz/.shoko:/home/shoko/.shoko"
        "/home/paz/Media:/mnt/anime:ro"
      ];
      environment = {
        PUID = "1000";
        PGID = "100";
        TZ = "America/Sao_Paulo";
      };
      extraOptions = [ "--restart=unless-stopped" ];
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
