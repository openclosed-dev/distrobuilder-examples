base_images := base/bootstrap base/core base/desktop base/desktop-apps base/desktop-ja
derived_images := core minimal minimal-ja simple 
images := $(base_images) $(derived_images)

.PHONY: all clean $(images)

all: $(images)

# Dependencies
base/core: base/bootstrap
base/desktop: base/core
base/desktop-apps: base/desktop
base/desktop-ja: base/desktop

core: base/core
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
