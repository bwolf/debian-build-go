FROM debian:jessie

ENV GOPATH /root/go
ENV GO_VERSION 1.7.1
ENV GO_ARCH amd64

RUN apt-get update \
    && echo 'APT::Acquire::Retries "3";' > /etc/apt/apt.conf.d/retries \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
        asciidoc \
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
