DESTDIR = "/var/www/html/"
HUGO = "/home/linuxbrew/.linuxbrew/bin/hugo"
UID := $(shell id -u)

.PHONY: all
all: clean build deploy

.PHONY: clean
clean:
ifneq ($(UID), 0)
	@echo "You are not root. Exiting..."
	@exit 0
else
	@echo "? Cleaning old build"
	cd $(DESTDIR) && rm -rf *
endif

.PHONY: build
build:
	@echo "? Generating site"
	$(HUGO) -t cocoa

.PHONY: deploy
deploy:
ifneq ($(UID), 0)
	@echo "You are not root. Exiting..."
	@exit 0
else
	@echo "? Deploying site"
	cp -r public/* /var/www/html/
endif
