# Distrobuilder examples

Distrobuilder template examples for generating LXD container images.

## Prerequisites

1. Ubuntu 22.04 LTS (fresh instance is recommended)
2. LXD
3. [Distrobuilder](https://github.com/lxc/distrobuilder)
4. debootstrap
5. make
6. mksquashfs
7. dconf
8. apt-cacher-ng
9. protobuf-compiler
10. squid-openssl

Required packages can be installed using `apt install` and `snap install`.
```
sudo snap install lxd
sudo snap install distrobuilder --classic
sudo apt install debootstrap make squashfs-tools dconf-cli apt-cacher-ng protobuf-compiler squid-openssl
```

Squid can be configured by running a script in this directory.
```
./configure-squid.sh
```

The LXD service must be configured properly first.
```
# adds the current user to lxd group.
sudo usermod -aG lxd $USER
newgrp lxd
# checks your groups
groups

# configures the LXD service with defaults
lxd init --auto
```

Add a profile for image development.
```
lxc profile create develop
lxc profile edit develop < develop-profile.yaml
```

## Images

### Base images

| Image name | Description | Parent image |
| --- | --- | --- |
| base/bootstrap | Minimal image to boot | - |
| base/core | Command line tools | base/bootstrap |
| base/desktop | Minimal desktop with RDP | base/core |
| base/desktop-apps | Desktop with additional applications | base/desktop |

## Building the images

Invoking the command below builds all example images.
```
make
```

## Importing the built image

The following command imports the image built in the `simple` directory.
```
cd images/lxd/simple
lxc image import incus.tar rootfs.squashfs --alias simple

# lists images
lxc image list
```

A container named `test` can be launched using the imported image.
```
lxc launch simple test -p develop

# lists containers
lxc list
```

The login credentials provided by the examples are `user1`/`secret`, which must be changed in production environment.
