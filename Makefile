base_images := base/core base/desktop base/desktop-apps
derived_images := minimal simple 
images := $(base_images) $(derived_images)

.PHONY: all $(images)

all: $(images)

# Dependencies
base/desktop: base/core
base/desktop-apps: base/desktop

minimal: base/desktop
simple: base/desktop-apps

$(images):
	$(MAKE) --directory=$@
