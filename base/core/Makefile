.PHONY: all clean

all: rootfs.squashfs

clean:
	sudo rm -rf rootfs
	sudo rm -f *.squashfs

rootfs.squashfs: image.yaml
	sudo distrobuilder build-dir $< rootfs
	sudo mksquashfs rootfs $@
