{
  disko.devices.disk = {
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
              discardPolicy = "both";
              resumeDevice = true;
            };
          };
          zfs = {
            size = "100%";
            content = {
              type = "zfs";
              pool = "sys";
            };
          };
        };
      };
    };
  };
  disko.devices.zpool = {
    sys = {
      type = "zpool";
      rootFsOptions = {
        compression = "lz4";
      };
      datasets = {
        "base" = {
          type = "zfs_fs";
          options.mountpoint = "none";
        };
        "base/root" = {
          type = "zfs_fs";
          options.mountpoint = "/";
        };
        "base/nix" = {
          type = "zfs_fs";
          options.mountpoint = "/nix";
        };
        "base/var" = {
          type = "zfs_fs";
          options.mountpoint = "/var";
        };
        "data" = {
          type = "zfs_fs";
          options.mountpoint = "none";
        };
        "data/home" = {
          type = "zfs_fs";
          options.mountpoint = "legacy";
        };
      };
    };
  };
}
