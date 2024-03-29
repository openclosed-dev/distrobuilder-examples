# Distrobuilder examples

Distrobuilder template examples for generating LXD container images.

## Prerequisites

1. Ubuntu 22.04 LTS (fresh instance is recommended)
2. LXD
3. [Distrobuilder](https://github.com/lxc/distrobuilder)
4. debootstrap
5. make
6. mksquashfs

Required packaged can be installed using `apt install` and `snap install`.
```
sudo snap install lxd
sudo snap install distrobuilder --classic
sudo apt install debootstrap make squashfs-tools
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

## Building the images

Invoking the command below builds all example images.
```
make
```

## Importing the built image

The following command imports the image built in the `desktop` directory.
```
lxc image import desktop/incus.tar.xz desktop/rootfs.squashfs --alias desktop

# lists images
lxc image list
```

A container named `test` can be launched using the imported image.
```
lxc launch desktop test

# lists containers
lxc list
```

For RDP-enabled images, a proxy device needs to be attached to the container for connceting from your Windows host via RDP.
```
lxc config device add test rdp proxy listen=tcp:0.0.0.0:3389 connect=tcp:0.0.0.0:3389 bind=host
```

The login credentials provided by the examples are `user1`/`secret`, which must be changed in production environment.
