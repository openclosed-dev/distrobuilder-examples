makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
base_dir := $(shell dirname $(makefile_dir))
base_image := $(base_dir)/miniconda-base/rootfs.squashfs
files := $(shell find files -type f)

.PHONY: all clean

all: rootfs.squashfs

clean:
	sudo rm -rf rootfs
	sudo rm -f rootfs.squashfs

rootfs.squashfs: image.yaml $(base_image) $(files)
	sudo rm -rf rootfs
	sudo rm -f rootfs.squashfs
	sudo distrobuilder build-dir $< rootfs -o source.url=file://$(base_image) --with-post-files
	sudo mksquashfs rootfs $@ -comp lz4
