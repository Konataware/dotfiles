{ config, lib, pkgs, ... }:


# ////////////////////////////////////
# ///    Bootloader GRUB (UEFI)    ///
# ////////////////////////////////////
{
	boot = {
			initrd.services.lvm.enable = true;
			loader.grub = {
				efiSupport = true;
				device = "nodev";
				enable = true;
				useOSProber = true;
			};
	};
}
