makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
base_dir := $(shell dirname $(makefile_dir))
base_image := $(base_dir)/core/rootfs.squashfs

.PHONY: all clean

all: rootfs.squashfs

clean:
	sudo rm -rf rootfs
	sudo rm -f *.squashfs

rootfs.squashfs: image.yaml $(base_image)
	sudo rm -rf rootfs
	sudo distrobuilder build-dir -o source.url=file://$(base_image) $< rootfs
	sudo mksquashfs rootfs $@
