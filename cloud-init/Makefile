makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
base_dir := $(shell dirname $(makefile_dir))
base_image := $(base_dir)/base/desktop-cloud/rootfs.squashfs

.PHONY: all clean

all: incus.tar.gz

clean:
	sudo rm -f *.tar.gz *.squashfs 

incus.tar.gz: image.yaml $(base_image)
	sudo rm -f incus.tar.gz rootfs.squashfs
	sudo distrobuilder build-lxd --compression=gzip -o source.url=file://$(base_image) $<
