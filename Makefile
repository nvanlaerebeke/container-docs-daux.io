.PHONY: build push env

env:
ifeq ($(NAME),)
	echo "NAME not set"
	exit 1
endif

ifeq ($(TAG),)
	echo "TAG not set"
	exit 1
endif

ifeq ($(REPO),)
	FULLNAME:=$(NAME):$(TAG)
else 
	FULLNAME:=$(REPO)/$(NAME):$(TAG)
endif

build: env
	docker build . -t "$(FULLNAME)"

push: build
	docker push "$(FULLNAME)"
