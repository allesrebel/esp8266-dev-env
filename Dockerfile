# Grab the shell we want to use...
FROM ubuntu:latest

# before doing anything let's update the image as needed
USER root

# Update Repos for basic stuff
RUN   apt-get update && apt-get -y install \
      vim   \
      git   \
      wget  \
      python \
      python-dev \
      python-pip \ 
      python-setuptools \
      python-serial \
      python-click \
      python-cryptography \
      python-future \
      python-pyparsing \
      python-pyelftools \
      unzip \
      make \
      bc \
      gcc \
      g++ \
      ccache \
      libtool \
      libboost-dev \
      libncurses-dev \
      flex \
      bison \
      gperf \
      cmake \
      ninja-build \
      libffi-dev \
      openssl \
      ccache \
      srecord

# Grab and install srecord
WORKDIR /tmp
COPY xtensa.sh /tmp
RUN bash xtensa.sh

COPY env-setup.sh /tmp
RUN bash env-setup.sh

