{ pkgs, ... }:
{
  services.jellyfin = {
    enable = true;
    openFirewall = true; # PORT DOCUMENTATION: (8096 for HTTP, 8920 for HTTPS, 1900 for DLNA)
  };
  systemd.services.jellyfin-acl = {
    description = "jellyfin acl perms for ~/Media";
    wantedBy = [ "multi-user.target" ];
    before = [ "jellyfin.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      ${pkgs.acl}/bin/setfacl -m u:jellyfin:--x /home/paz
      ${pkgs.acl}/bin/setfacl -R -m u:jellyfin:rX /home/paz/Media
      ${pkgs.acl}/bin/setfacl -R -d -m u:jellyfin:rX /home/paz/Media
    '';
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
