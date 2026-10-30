{
  config,
  pkgs,
  lib,
  ...
}:

let
  homeDir = "/home/anzu";
  mediaDir = "${homeDir}/Media";
  aclStateDir = "/var/lib/jellyfin-acl";
  aclStamp = "${aclStateDir}/initialized";
in
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  # I do not want a Jellyfin service starting at boot. On demand services.
  systemd.services.jellyfin = {
    wantedBy = lib.mkForce [ ];
    requires = [ "jellyfin-acl.service" ];
    after = [ "jellyfin-acl.service" ];
  };
  # This fails if ~/Media isnt present. However, for simplicity sake it's an overcomplication to add a guard for a non-harmful error.
  systemd.services.jellyfin-acl = {
    description = "Jellyfin ACL setup for ${mediaDir}";
    wantedBy = lib.mkForce [ ];
    before = [ "jellyfin.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      set -euo pipefail

      ${pkgs.acl}/bin/setfacl -m u:jellyfin:--x ${homeDir}

      if [ -e "${aclStamp}" ]; then
        exit 0
      fi

      ${pkgs.acl}/bin/setfacl -R -m u:jellyfin:rX ${mediaDir}

      ${pkgs.findutils}/bin/find ${mediaDir} -type d \
        -exec ${pkgs.acl}/bin/setfacl -d -m u:jellyfin:rX {} \;

      touch "${aclStamp}"
    '';
  };

  systemd.tmpfiles.rules = [
    "d ${aclStateDir} 0755 root root -"
    "d /home/anzu/.containers-rootful 0711 root root -"
    "d /home/anzu/.containers-rootful/storage 0711 root root -"
    "d /home/anzu/.shoko 0755 anzu users -"
  ];

  virtualisation.containers.storage.settings = {
    storage = {
      driver = "overlay";
      graphroot = "/home/anzu/.local/share/containers/storage";
    };
  };

  virtualisation.oci-containers = {
    backend = "podman";
    containers.shoko = {
      image = "ghcr.io/shokoanime/server:latest";
      ports = [ "8111:8111" ]; # NixOS opens this port on the firewall by itself.
      volumes = [
        "/home/anzu/.shoko:/home/shoko/.shoko"
        "${mediaDir}:/mnt/anime"
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
