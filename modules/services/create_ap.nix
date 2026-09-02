{
  ...
}:

{
  services.create_ap = {
    enable = true;
    settings = {
      INTERNET_IFACE = "wlps2s0";
      WIFI_IFACE = "wlp0s16u2";
      SSID = "apname";
      PASSPHRASE = "sudo12345";

      # extra configs if needed
      #HIDDEN = 0; # wont show up in public scans (0:1)

      # This describes sharing mode
      # 	-> nat : Default
      # 	-> bridge : Bridges between interfaces (needs further setup)
      # 	-> none : Doesn't share interent, isolated AP
      #SHARE_METHOD = "nat";

      # Specify WI-FI channel (1-11 for 2.4GHz, 36 for 5GHz)
      #CHANNEL = 6;

      # WPA mode:
      # 	-> 1: WPA 1
      # 	-> 2: WPA 2 [default]
      # 	-> 3: WPA 3 (WPA2/WPA3)

      # Isolates clients from communicating with each other
      # ISOLATE_CLIENTS = 0;

      # Enables 802.11n (Wi-Fi 4)
      # IEEE80211N = 0;

      # Enables 802.11ac (Wi-Fi 5)
      # IEEE80211AC = 0;

      # Enables 802.11ax (Wi-Fi 6)
      # IEEE80211AX = 0;

      # HT capabilities (for 802.11n)
      # ex: "[HT40+]" to 40MHz
      # HT_CAPAB = "[HT40+]";

      # VHT capabilities (for 802.11ac)
      # ex: "[VHT160]"
      # VHT_CAPAB = "";

      # Driver to be used (default: nl80211)
      # DRIVER = "nl80211";

      # Don't create a virtua interface
      # Useful if you have a dedicated AP interface!
      # NO_VIRT = 0;

      # Frequency legislation (ex: "BR", "US")
      # COUNTRY = "BR";

      # MAC spoofing for the AP interface
      # NEW_MACADDR = "";

      # Daemonize it
      # DAEMONIZE = 0;

      # Use haveged for entropy
      # NO_HAVEGED = 0;

      # dhcp and general network config
      # Set the IP for the hotspot's gateway (default: 192.168.12.1)
      # GATEWAY = "192.168.12.1";

      # Add gateway to /etc/hosts
      # ETC_HOSTS = 0;

      # DNS to DHCP server (default: gateway) [Uses its own gateway]
      # DHCP_DNS = "gateway";

      # Disable DNS
      # NO_DNS = 0;

      # Disable dnsmasq (if not used, must provide DHCP)
      # NO_DNSMASQ = 0;

      # mac filter
      # Filter clients per MAC
      # MAC_FILTER = 0;

      # File with allowed MACs
      # MAC_FILTER_ACCEPT = "/etc/hostapd/hostapd.accept";

      # Use PSK (Pre-Shared Key) instead of passphrase
      # USE_PSK = 0;

      # Static DHCP hosts (format: MAC,IP,hostname)
      # DHCP_HOSTS = "aa:bb:cc:dd:ee:ff,192.168.12.10,my-puter";
    };
  };

  # This is system wide to make sure IP forwarding works on nat mode
  # create_ap seems to enable it but this is a good annotation to keep as a reminder of functionality
  networking.nat.enable = true;

  # This is to work with NetworkManager so it handles wi-fi for us
  networking.networkmanager.enable = true;

  # in case of NM conflicting with our hotspot, we can tell it to stop managing that device and sybau.
  # Keep it off unless needed
  #networking.NetworkManager.unmanaged = [ "wlp0s16u2" ];
}
