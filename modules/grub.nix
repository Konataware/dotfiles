{
  boot = {
    initrd.services.lvm.enable = true;
    loader = {
      grub = {
        efiSupport = true;
        device = "nodev";
        enable = true;
        useOSProber = false;
        efiInstallAsRemovable = true;
        # This is a custom efi file
        extraEntries = ''
          					menuentry "Microslop 10" {
          							search --file --set=root /EFI/Microsoft/Boot/boringefi.efi
          							chainloader /EFI/Microsoft/Boot/boringefi.efi
          						}
          				'';
      };
    };
  };
}
