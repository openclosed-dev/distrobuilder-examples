makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
base_dir := $(shell dirname $(makefile_dir))
base_image := $(base_dir)/base/desktop/rootfs.squashfs
files := $(shell find files -type f | sed -e 's/ /\\ /g')
downloads := downloads/miniconda.sh

.PHONY: all clean

all: incus.tar

downloads/miniconda.sh:
	mkdir -p downloads
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $@

clean:
	sudo rm -f *.tar *.squashfs 

incus.tar: image.yaml $(base_image) $(files) $(downloads)
	sudo rm -f incus.tar rootfs.squashfs
	sudo distrobuilder build-lxd --compression=lz4 -o source.url=file://$(base_image) $<
