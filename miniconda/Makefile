makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
base_dir := $(shell dirname $(makefile_dir))
base_image := $(base_dir)/base/miniconda-packages/rootfs.squashfs

.PHONY: all clean

all: incus.tar

clean:
	sudo rm -f *.tar *.squashfs 

incus.tar: image.yaml $(base_image)
	sudo rm -f incus.tar rootfs.squashfs
	sudo distrobuilder build-lxd $< --compression=lz4 -o source.url=file://$(base_image)
