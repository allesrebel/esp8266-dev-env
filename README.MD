# ESP8266 Toolchain Docker Environment
This docker image generates the proper toolchain environment
for building and exporting binaries

This image pulls in the official linux toolchain from espressif
along with a release version of the SDK.

To update repository URLs, see docker file

# Pulling a Prebuilt image
If you're feeling lazy, feel free to just replace `hash` with 
`allesrebel/esp8266-dev-env:latest`. Note you'll need to first
pull the image with:

* `docker pull allesrebel/esp8266-dev-env:latest`

# Building the Docker Image
Make sure Docker is installed, see [Docker Install](https://docs.docker.com/install/)
In the directory of this repository, issue the `docker build -t esp8266-builder.` command.

This will build the image for use. run `docker images` to make sure you now have an image
called `esp8266-builder`

# Usage of Container

## Building a Specified Project
Running the image can be done with a standard run command with the
project to build with the `-v` command. The container expects the
project to be mounted to `/opt/project` directory. For example:

* `docker run -v (Path to project):/opt/project esp8266-builder`

## Flashing a particular project
Utilize the command specified at the build with a local copy of
(ESPTool)[https://github.com/espressif/esptool.git] or pyflasher
Note you can install the pip package isntead of cloning the repo

## Interactively using the container
In situations where direct control of the toolchain is required
you can specify the `-it` arg and run bash directly. (Works during
start of the container or exec on a existing container)
