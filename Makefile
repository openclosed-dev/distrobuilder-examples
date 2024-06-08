base_images := base/bootstrap base/core base/desktop base/desktop-apps base/desktop-ja base/miniconda-base
derived_images := core miniconda minimal minimal-ja simple 
images := $(base_images) $(derived_images)

.PHONY: all clean $(images)

all: $(images)

# Dependencies
base/core: base/bootstrap
base/desktop: base/core
base/desktop-apps: base/desktop
base/desktop-ja: base/desktop
base/miniconda-base: base/desktop

core: base/core
miniconda: base/miniconda-base
minimal: base/desktop
minimal-ja: base/desktop-ja
simple: base/desktop-apps

$(images):
	$(MAKE) --directory=$@

clean:
	for image in $(images); \
	do \
		$(MAKE) --directory=$$image clean; \
	done
