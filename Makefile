DESTDIR="/var/www/html/"

.PHONY: all
all: clean build deploy

.PHONY: clean
clean:
	@echo "? Cleaning old build"
	cd $(DESTDIR) && rm -rf *

.PHONY: build
build:
	@echo "? Generating site"
	hugo -t cocoa

.PHONY: deploy
deploy:
	@echo "? Deploying site"
	cp -r public/* /var/www/html/
