FROM alpine:latest

MAINTAINER Trung Nguyen Dinh <nguyendinhtrung141@gmail.com>

RUN apk update && apk add gcc g++ make libxml2-dev byacc bison openssl-dev
ADD http://kannel.org/download/1.4.4/gateway-1.4.4.tar.gz gateway-1.4.4.tar.gz
RUN tar xzf gateway-1.4.4.tar.gz
WORKDIR gateway-1.4.4
RUN ./configure --prefix=/usr --sysconfdir=/etc/kannel
RUN touch .depend && \
    make && \
    make install
WORKDIR /
RUN rm gateway-1.4.4.tar.gz
RUN rm -Rf gateway-1.4.4
RUN mkdir -p /var/log/kannel && \
    mkdir -p /var/spool/kannel && \
    mkdir -p /var/run/kannel && \
    mkdir -p /etc/kannel

ADD ./kannel-conf /etc/kannel
