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
	docker build . -t "$(FULLNAME)"

push: build
	docker push "$(FULLNAME)"