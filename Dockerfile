FROM ubuntu:latest
MAINTAINER Martin Winter

ENV PATH="/inkling:${PATH}"

# upgrade and install applets and services
RUN apt-get update
RUN apt-get -yq install -y --no-install-recommends \
           software-properties-common procps

RUN apt-get update -q --fix-missing
RUN apt-get -yq upgrade
RUN apt-get -yq install -y --no-install-recommends \
           git \
           autoconf \
           automake \
           doxygen \
           binutils \
           gcc \
           libc6-dev \
           pkg-config \
           gtk+-3.0 \
           librsvg2-dev \
           libusb-1.0-0-dev

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -r /var/lib/apt/lists/*

WORKDIR /inkling

RUN mkdir /inklingdata && \
    git clone https://github.com/roelj/inklingreader.git ./

RUN autoreconf -i
RUN ./configure
RUN make

WORKDIR /inkling/doc
RUN doxygen

WORKDIR /inklingdata

ENTRYPOINT ["/bin/bash"]
