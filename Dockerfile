FROM alpine:latest

MAINTAINER Trung Nguyen Dinh <nguyendinhtrung141@gmail.com>

ADD http://ftp.gnu.org/gnu/bison/bison-2.7.tar.gz /tmp/

ADD http://kannel.org/download/1.4.4/gateway-1.4.4.tar.gz /tmp/

RUN apk update && apk add libxml2 mariadb-client-libs pcre musl hiredis \
&& apk add libxml2-dev mariadb-dev pcre-dev g++ musl-dev hiredis-dev make perl m4 \
&& ln -sf /usr/include/poll.h /usr/include/sys/poll.h \
&& ln -sf /usr/include/unistd.h /usr/include/sys/unistd.h

RUN tar -xzpf /tmp/bison-2.7.tar.gz -C /tmp/ && tar -xzpf /tmp/gateway-1.4.4.tar.gz -C /tmp/

RUN cd /tmp/bison-2.7 && ./configure && make && make install

RUN cd /tmp/gateway-1.4.4 && ./configure --with-mysql --with-redis && make && make install
RUN cd /tmp/gateway-1.4.4/addons/opensmppbox && ./configure && make && make install
RUN cd /tmp/gateway-1.4.4/addons/sqlbox && ./configure && make && make install

RUN apk del libxml2-dev mariadb-dev pcre-dev g++ musl-dev hiredis-dev make perl m4 && rm -rf /tmp/*

RUN mkdir -p /var/log/kannel && \
    mkdir -p /var/spool/kannel && \
    mkdir -p /var/run/kannel && \
    mkdir -p /etc/kannel
