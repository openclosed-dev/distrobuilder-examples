makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
parent_dir := $(shell dirname $(makefile_dir))
base_dir := $(shell dirname $(parent_dir))/base
base_image := $(base_dir)/desktop/rootfs.squashfs
downloads := .downloads/knime_5.2.5.linux.gtk.x86_64.tar.gz
files=$(shell find files -type f | sed -e 's/ /\\ /g')

.PHONY: all clean

all: incus.tar

clean:
	sudo rm -f *.tar *.squashfs 

.downloads/knime_5.2.5.linux.gtk.x86_64.tar.gz:
	mkdir -p .downloads
	wget https://download.knime.org/analytics-platform/linux/knime_5.2.5.linux.gtk.x86_64.tar.gz -O $@

incus.tar: image.yaml $(base_image) $(downloads) $(files)
	sudo rm -f incus.tar rootfs.squashfs
	sudo distrobuilder build-lxd --compression=lz4 -o source.url=file://$(base_image) $<
