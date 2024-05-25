#!/bin/bash

imageAlias=minimal
containerName=test

lxc list --format csv -c n name=$containerName | xargs -I {} lxc delete -f {}
lxc image list --format csv -c l $imageAlias | xargs -I {} lxc image delete {}

lxc image import incus.tar.gz rootfs.squashfs --alias $imageAlias
lxc launch $imageAlias $containerName -p develop
