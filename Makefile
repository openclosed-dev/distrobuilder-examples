base_images := base/core base/desktop base/desktop-apps base/desktop-cloud base/desktop-ja
derived_images := cloud-init minimal minimal-ja simple 
images := $(base_images) $(derived_images)

.PHONY: all $(images)

all: $(images)

# Dependencies
base/desktop: base/core
base/desktop-apps: base/desktop
base/desktop-cloud: base/desktop
base/desktop-ja: base/desktop

cloud-init: base/desktop-cloud
minimal: base/desktop
minimal-ja: base/desktop-ja
simple: base/desktop-apps

$(images):
	$(MAKE) --directory=$@
