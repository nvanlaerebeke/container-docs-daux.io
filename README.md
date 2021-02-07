# Building Documentation

## Introduction

This is a container that can build markdown documentation with daux.io

## Building the image

A makefile that builds the docker container is included, to build run:

```
make build
```

## Pushing the image to a repository

The included makefile can also push the build image.
To build and push, run:

```
make push
```

### Additional Options

There are several options that can be passed to customize the build process:

- REPO(default: registry.crazyzone.be): repository to push the image to
- NAME(default: daux.io): name of the image
- TAG(default: latest): tag name
- COMPOSER_INSTALLER_HASH(default: ): stops the build if the composer installer hash does not match

## Using the image


The image expects the source to be located in "/source" and will put the generated files in "/source/static"

When the environment variable BUILD_TAG is passed a file 'build' will be added in the root with the tag.


Example:

```
docker run --rm -ti \
    -v "source:/source" \
    -env BUILD_TAG=ce6d115
    registry.crazyzone.be/daux.io
```

