# containers-docs-daux.io

## Introduction

This is a container that can build markdown documentation with daux.io

## Building the image

A makefile that builds the docker container is included, to build run:

```
NAME="daux.io" TAG="latest" make build
```

This will result in a local image tagged with as "daux.io:latest".  
See the 'Additional Options' section for more information about the available options.  

To push the image to the repository use the command below.  

## Pushing the image to a repository

The included makefile can also push the build image, first the container is build with the given options and once build it is pushed to the repository.

To build and push, run:

```
NAME="daux.io" TAG="latest" make push
```

### Additional Options

There are several options that can be passed to customize the build process.  
The defaults are only set when using the Jenkins pipeline.


- REPO(default: registry.crazyzone.be): repository to push the image to
- NAME(default: daux.io): name of the image
- TAG(default: latest): tag name


## Using the image


The image expects the source to be located in "/source" and will put the generated files in "/source/static"

Example:

```
docker run --rm -ti \
    -v "/path/to/source/on/host:/source" \
    registry.crazyzone.be/daux.io
```

## Building with Jenkins

The included Jenkinsfile is made to be run and deploy on the crazyzone network.  
The build.yaml file can be modified to use a different base image, note that this image needs to be able to run docker-outside-of-docker and have 'make' available.