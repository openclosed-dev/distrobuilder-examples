include ../../../common.mk

.PHONY: all clean

all: rootfs.squashfs

clean:
	sudo rm -rf rootfs
	sudo rm -f rootfs.squashfs

rootfs.squashfs: image.yaml
	sudo rm -rf rootfs
	sudo rm -f rootfs.squashfs
	sudo $(IMAGE_BUILDER) build-dir $< rootfs
	sudo mksquashfs rootfs $@ -comp lz4
