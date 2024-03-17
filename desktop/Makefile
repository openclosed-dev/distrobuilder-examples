makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
base_dir := $(shell dirname $(makefile_dir))
base_image := $(base_dir)/base/desktop/rootfs.squashfs

.PHONY: all clean

all: incus.tar.xz

clean:
	sudo rm -f *.tar.xz *.squashfs

incus.tar.xz: image.yaml $(base_image)
	sudo distrobuilder build-lxd -o source.url=file://$(base_image) $<
