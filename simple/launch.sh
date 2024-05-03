#!/bin/bash

lxc list --format csv -c n | xargs -I {} lxc delete -f {}
lxc image list --format csv -c l | xargs -I {} lxc image delete {}

lxc image import incus.tar.gz rootfs.squashfs --alias simple
lxc launch simple test
lxc config device add test rdp proxy listen=tcp:0.0.0.0:3389 connect=tcp:0.0.0.0:3389 bind=host
