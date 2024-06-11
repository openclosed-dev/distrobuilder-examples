makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
parent_dir := $(shell dirname $(makefile_dir))
base_dir := $(shell dirname $(parent_dir))/base
base_image := $(base_dir)/desktop-apps/rootfs.squashfs
files := $(shell find files -type f | sed -e 's/ /\\ /g')

.PHONY: all clean

all: incus.tar

clean:
	sudo rm -f *.tar *.squashfs 

incus.tar: image.yaml $(base_image) $(files)
	sudo rm -f incus.tar rootfs.squashfs
	sudo distrobuilder build-lxd --compression=lz4 -o source.url=file://$(base_image) $<
