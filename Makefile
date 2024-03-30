base_images := base/core base/desktop-minimal base/desktop-apps
images := $(base_images) simple

.PHONY: all $(images)

all: $(images)

base/desktop-minimal: base/core
base/desktop-apps: base/desktop-minimal

simple: base/desktop-apps

$(images):
	$(MAKE) --directory=$@
