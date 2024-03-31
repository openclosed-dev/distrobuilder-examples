makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
base_dir := $(shell dirname $(makefile_dir))
base_image := $(base_dir)/base/desktop-apps/rootfs.squashfs

.PHONY: all clean unified

all: incus.tar.xz

unified: simple.tar.gz

clean:
	sudo rm -f *.tar.gz *.tar.xz *.squashfs 

dconf/user: dconf/user.d/*
	dconf compile $@ dconf/user.d

incus.tar.xz: image.yaml $(base_image) dconf/user
	sudo distrobuilder build-lxd -o source.url=file://$(base_image) $<

simple.tar.gz: image.yaml $(base_image) dconf/user
	sudo distrobuilder build-lxd --type=unified --compression=gzip -o source.url=file://$(base_image) $<
