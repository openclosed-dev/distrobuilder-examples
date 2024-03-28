base_images := base/core base/desktop
images := $(base_images) desktop desktop-chrome

.PHONY: all $(images)

all: $(images)

base/desktop: base/core
desktop: base/desktop
desktop-chrome: base/desktop

$(images):
	$(MAKE) --directory=$@
