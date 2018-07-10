FROM alpine:edge

MAINTAINER Trung Nguyen Dinh <nguyendinhtrung141@gmail.com>

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && apk --no-cache add kannel
RUN mkdir -p /var/log/kannel && \
    mkdir -p /var/spool/kannel && \
    mkdir -p /var/run/kannel && \
    mkdir -p /etc/kannel

ADD ./kannel-conf /etc/kannel

