include ../../../common.mk

makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
parent_dir := $(shell dirname $(makefile_dir))
base_dir := $(shell dirname $(parent_dir))/base
base_image := $(base_dir)/desktop-ja/rootfs.squashfs
downloads := .downloads/ms-ceintl.vscode-language-pack-ja.vsix

.PHONY: all clean

all: lxd.tar

clean:
	sudo rm -f *.tar *.squashfs 

.downloads/ms-ceintl.vscode-language-pack-ja.vsix:
	mkdir -p .downloads
	wget https://marketplace.visualstudio.com/_apis/public/gallery/publishers/MS-CEINTL/vsextensions/vscode-language-pack-ja/1.89.2024050109/vspackage --compression gzip -O $@

lxd.tar: image.yaml $(base_image) $(files) $(downloads)
	sudo rm -f lxd.tar rootfs.squashfs
	sudo $(IMAGE_BUILDER) build-lxd --compression=lz4 -o source.url=file://$(base_image) $<
