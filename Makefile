base_images := base/core base/desktop-minimal
images := $(base_images) desktop desktop-chrome

.PHONY: all $(images)

all: $(images)

base/desktop: base/core
desktop: base/desktop-minimal
desktop-chrome: base/desktop-minimal

$(images):
	$(MAKE) --directory=$@
