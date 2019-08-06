# ESP8266 Toolchain Docker Environment
This docker image generates the proper toolchain environment
for building and exporting binaries

This image pulls in the official linux toolchain from espressif
along with a release version of the SDK.

To update repository URLs, see docer file

# Building the Docker Image
Make sure Docker is installed, see [https://docs.docker.com/install/]
In the directory of this repository, issue the 'docker build .' command.

This will build the image for use. Take note of the hash - you'll need
this to run the image. ('docker images' can be used to see which images
are available on the host machine)

# Usage of Container

## Building a Specified Project
Running the image can be done with a standard run command with the
project to build with the -v command. The container expects the
project to be mounted to '/opt/project' directory. For example:

* docker run -v (Path to project):/opt/project (HASH of IMAGE)

## Flashing a particular project
Utilize the command specified at the build with a local copy of
(ESPTool)[https://github.com/espressif/esptool.git] or pyflasher

## Interactively using the container
In situations where direct control of the toolchain is required
you can specify the -it command and run bash directly. (Works during
start of the container or exec on a existing container)
