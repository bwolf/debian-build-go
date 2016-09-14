FROM debian:jessie

ENV GOPATH /root/go
ENV GO_VERSION 1.7.1
ENV GO_ARCH amd64

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y \
        build-essential \
        bison \
        curl \
        git \
        mercurial \
        rpm \
        ruby \
        ruby-dev \
        wget \
        zip \
    && which fpm || gem install fpm \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt \
    && wget -nv https://storage.googleapis.com/golang/go${GO_VERSION}.linux-${GO_ARCH}.tar.gz; \
        tar -C /usr/local/ -xf /go${GO_VERSION}.linux-${GO_ARCH}.tar.gz ; \
    rm /go${GO_VERSION}.linux-${GO_ARCH}.tar.gz

ENV PATH /usr/local/go/bin:$PATH
