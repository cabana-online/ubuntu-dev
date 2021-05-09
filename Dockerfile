FROM cabanaonline/ubuntu:14.04

# Metadata
LABEL base.image="cabanaonline/ubuntu"
LABEL description="An Ubuntu container with dev packages."
LABEL maintainer="Alejandro Madrigal Leiva"
LABEL maintainer.email="me@alemadlei.tech"

USER root

# Copies files.
COPY packages.sh /opt/scripts/packages.sh
COPY install.sh /opt/scripts/install.sh
COPY uninstall.sh /opt/scripts/uninstall.sh

# Installs development tools.
RUN set -xe; \
    \
    cd /opt/scripts && ./install.sh && \
    apt-get clean && \
    apt-get autoclean;

# Reverts to standard user.
USER cabana

# Entrypoint to keep the container running.
ENTRYPOINT ["tail", "-f", "/dev/null"]
