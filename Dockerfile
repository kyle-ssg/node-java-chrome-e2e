# ---------------------------------------------------------- #
#                         Dockerfile                         #
# ---------------------------------------------------------- #
# image:    node-java-chrome-e2e                             #
# name:     minddocdev/node-java-chrome-e2e                  #
# repo:     https://github.com/mind-doc/node-java-chrome-e2e #
# authors:  development@minddoc.com                          #
# ---------------------------------------------------------- #

FROM node:10.15.3-jessie
LABEL maintainer="development@minddoc.com"

# Install OpenJDK (Java) and Google Chrome

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list && \
    wget https://dl-ssl.google.com/linux/linux_signing_key.pub && \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add linux_signing_key.pub && \
    apt-get -qq update && \
    apt-get -qq install -o=Dpkg::Use-Pty=0 -t jessie-backports \
      openjdk-8-jdk \
      google-chrome-stable -y && \
    rm -rf /var/lib/apt/lists/*

# When you execute `docker run -it minddocdev/node-java-chrome-e2e`
# you’ll get dropped into a usable bash shell
CMD ["/bin/bash"]
