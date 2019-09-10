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
ARG IDF_TOOLCHAIN=https://dl.espressif.com/dl/xtensa-lx106-elf-linux64-1.22.0-92-g8facf4c-5.2.0.tar.gz
RUN wget -P /tmp --progress=bar:force -q --show-progress $IDF_TOOLCHAIN
RUN tar -xzf /tmp/xtensa-lx106-elf-linux64-1.22.0-92-g8facf4c-5.2.0.tar.gz

# Grab a copy of the SDK (Static)
ARG IDF_CLONE_BRANCH_OR_TAG=release/v3.2
ARG IDF_CLONE_URL=https://github.com/espressif/ESP8266_RTOS_SDK.git
RUN git clone --branch $IDF_CLONE_BRANCH_OR_TAG \
   --single-branch --progress --quiet \
   $IDF_CLONE_URL /tmp/ESP8266_RTOS_SDK
RUN mv ESP8266_RTOS_SDK /opt/ESP8266_RTOS_SDK
RUN python -m pip install -r /opt/ESP8266_RTOS_SDK/tools/esp_prov/requirements.txt

# Set up Env Vars
ENV IDF_PATH /opt/ESP8266_RTOS_SDK/
ENV PATH "/opt/ESP8266_RTOS_SDK/tools/:${PATH}"
ENV PATH "/tmp/xtensa-lx106-elf/bin/:${PATH}"
ENV PATH "/opt/ESP8266_RTOS_SDK/tools/:${PATH}"
ENV PYTHONPATH "/opt/ESP8266_RTOS_SDK/tools/"

WORKDIR /opt/project
#By default build the project
CMD ["idf.py", "build"]
