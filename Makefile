.PHONY: init build push

REPO?="registry.crazyzone.be"
NAME?="daux.io"
TAG?="latest"

ifeq ($(REPO),)
	FULLNAME:=$(NAME):$(TAG)
else 
	FULLNAME:=$(REPO)/$(NAME):$(TAG)
endif

build: 
ifdef COMPOSER_INSTALLER_HASH
	docker build . -t "$(FULLNAME)" --build-arg $(COMPOSER_INSTALLER_HASH)
else
	docker build . -t "$(FULLNAME)"
endif

push: build
	docker push "$(FULLNAME)"