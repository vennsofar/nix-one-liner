{
  disk = {
    main = {
      type = "disk";
      device = "/dev/vda";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            size = "1.5G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };
          Swap = {
            size = "30G";
            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true;
            };
          };
          ZFS = {
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
  zpool = {
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
          options.mountpoint = "legacy";
        };
        "base/nix" = {
          type = "zfs_fs";
          options.mountpoint = "legacy";
        };
        "base/var" = {
          type = "zfs_fs";
          options.mountpoint = "legacy";
        };
        "data" = {
          type = "zfs_fs";
          options.mountpoint = "none";
        };
        "data/home" = {
          type = "zfs_fs";
          options.mountpoint = "none";
        };
      };
    };
  };
}