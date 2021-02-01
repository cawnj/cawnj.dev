DESTDIR=/var/www/cawnj.dev/
HUGO_VERSION=0.80.0

.PHONY: all
all: clean get build deploy

.PHONY: clean
clean:
	@echo "? Cleaning old build"
	cd $(DESTDIR) && sudo rm -rf *

.PHONY: get
get:
	@echo "❓ Checking for hugo"
	@if ! [ -x "$$(command -v hugo)" ]; then\
		echo "? Getting Hugo";\
	    wget -q -P tmp/ https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_extended_$(HUGO_VERSION)_Linux-64bit.tar.gz;\
		tar xf tmp/hugo_extended_$(HUGO_VERSION)_Linux-64bit.tar.gz -C tmp/;\
		sudo mv -f tmp/hugo /usr/bin/;\
		rm -rf tmp/;\
		hugo version;\
	fi

.PHONY: build
build:
	@echo "? Generating site"
	hugo -t cocoa

.PHONY: deploy
deploy:
	@echo "? Deploying site"
	sudo cp -r public/* $(DESTDIR)
