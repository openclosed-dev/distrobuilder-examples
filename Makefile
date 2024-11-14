include common.mk

base_images := base/bootstrap base/core base/desktop base/desktop-apps base/desktop-ja base/miniconda-base base/miniconda-packages
derived_images := lxd/core lxd/miniconda lxd/minimal lxd/minimal-ja lxd/simple 
images := $(base_images) $(derived_images)

.PHONY: all clean $(images)

all: $(images)

# Dependencies
base/core: base/bootstrap
base/desktop: base/core
base/desktop-apps: base/desktop
base/desktop-ja: base/desktop
base/miniconda-base: base/desktop
base/miniconda-packages: base/miniconda-base

lxd/core: base/core
lxd/miniconda: base/miniconda-packages
lxd/minimal: base/desktop
lxd/minimal-ja: base/desktop-ja
lxd/simple: base/desktop-apps

$(images):
	$(MAKE) --directory=images/$@

clean:
	for image in $(images); \
	do \
		$(MAKE) --directory=images/$$image clean; \
	done
