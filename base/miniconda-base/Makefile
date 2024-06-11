makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
base_dir := $(shell dirname $(makefile_dir))
base_image := $(base_dir)/desktop/rootfs.squashfs
downloads := .downloads/miniconda.sh
files := $(shell find files -type f)

.PHONY: all clean

all: rootfs.squashfs

clean:
	sudo rm -rf rootfs
	sudo rm -f rootfs.squashfs

.downloads/miniconda.sh:
	mkdir -p .downloads
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $@

rootfs.squashfs: image.yaml $(base_image) $(downloads) $(files)
	sudo rm -rf rootfs
	sudo rm -f rootfs.squashfs
	sudo distrobuilder build-dir $< rootfs -o source.url=file://$(base_image) --with-post-files
	sudo mksquashfs rootfs $@ -comp lz4
