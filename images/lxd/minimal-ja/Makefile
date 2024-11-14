include ../../../common.mk

makefile_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
parent_dir := $(shell dirname $(makefile_dir))
base_dir := $(shell dirname $(parent_dir))/base
base_image := $(base_dir)/desktop-ja/rootfs.squashfs

.PHONY: all clean

all: lxd.tar

clean:
	sudo rm -f *.tar *.squashfs 

dconf/user: dconf/user.d/*
	dconf compile $@ dconf/user.d

mozc/config1.db: mozc/config.textproto
	protoc --encode=mozc.config.Config mozc/config.proto < $< > $@

lxd.tar: image.yaml $(base_image) dconf/user mozc/config1.db
	sudo rm -f lxd.tar rootfs.squashfs
	sudo $(IMAGE_BUILDER) build-lxd --compression=lz4 -o source.url=file://$(base_image) $<
