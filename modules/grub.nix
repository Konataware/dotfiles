# ////////////////////////////////////
# ///    Bootloader GRUB (UEFI)    ///
# ////////////////////////////////////
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

        extraEntries = ''
          					menuentry "Microslop 10" {
          							search --file --set=root /EFI/Microsoft/Boot/billgatesrapedkids.efi
          							chainloader /EFI/Microsoft/Boot/billgatesrapedkids.efi
          						}
          				'';
      };
    };
  };
}
