#!/bin/bash

source packages.sh

# Install all dev libraries that could be used by other containers.
apt-get remove -y ${PACKAGES} && \
  apt-get clean && \
  apt-get autoclean;
