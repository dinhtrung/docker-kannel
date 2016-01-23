FROM centos:latest

MAINTAINER Trung Nguyen Dinh <nguyendinhtrung141@gmail.com>

# Install software dependencies
RUN yum -y install gcc make libxml2-devel byacc bison openssl-devel mariadb-devel

ADD http://kannel.org/download/1.4.4/gateway-1.4.4.tar.gz gateway-1.4.4.tar.gz
RUN tar xzf gateway-1.4.4.tar.gz
WORKDIR /gateway-1.4.4
RUN ./configure --prefix=/usr --sysconfdir=/etc/kannel --with-mysql && \
    touch .depend && \
    make && \
    make install
WORKDIR /gateway-1.4.4/addons/sqlbox
RUN ./configure --prefix=/usr --sysconfdir=/etc/kannel && \
    touch .depend && \
    make && \
    make install
WORKDIR /gateway-1.4.4/addons/opensmppbox
RUN ./configure --prefix=/usr --sysconfdir=/etc/kannel && \
    touch .depend && \
    make && \
    make install

RUN rm /gateway-1.4.4.tar.gz
RUN rm -Rf /gateway-1.4.4
RUN mkdir -p /var/log/kannel && \
    mkdir -p /var/spool/kannel && \
    mkdir -p /var/run/kannel && \
    mkdir -p /etc/kannel
