base_images := base/core base/desktop
images := $(base_images) desktop

.PHONY: all $(images)

all: $(images)

base/desktop: base/core
desktop: base/desktop

$(images):
	$(MAKE) --directory=$@
