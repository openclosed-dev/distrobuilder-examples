base_images := base/core base/desktop base/desktop-apps base/desktop-ja
derived_images := minimal minimal-ja simple 
images := $(base_images) $(derived_images)

.PHONY: all $(images)

all: $(images)

# Dependencies
base/desktop: base/core
base/desktop-apps: base/desktop
base/desktop-ja: base/desktop

minimal: base/desktop
minimal-ja: base/desktop-ja
simple: base/desktop-apps

$(images):
	$(MAKE) --directory=$@
