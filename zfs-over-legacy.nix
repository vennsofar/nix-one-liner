{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
			swap = {
				size = "30G";
				content = {
					type = "swap";
					resumeDevice = true;
				};
			};
            primary = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "zfs";
              };
            };
          };
        };
      };
    };
    zpool = {
      zroot = {
        type = "zpool";
        datasets = {
          "root" = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };
          "root/zfs_fs" = {
            type = "zfs_fs";
            mountpoint = "/zfs_fs";
            options."com.sun:auto-snapshot" = "true";
          };
        };
      };
    };
  };
}
