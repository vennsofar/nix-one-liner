{
  disko.devices = {
    disk = {
      azalea = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            swap = {
              size = "16G";
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
                pool = "system";
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
          ashift = "12";
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
            options.mountpoint = "/home";
          };
        };
      };
    };
  };
}
