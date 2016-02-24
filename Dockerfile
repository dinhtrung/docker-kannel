FROM nguyendinhtrung141/kannel-1.4.4:sqlbox

MAINTAINER Trung Nguyen Dinh <nguyendinhtrung141@gmail.com>

ADD sqlbox /sqlbox
WORKDIR /sqlbox
RUN ./configure --prefix=/usr --sysconfdir=/etc/kannel && \
    touch .depend && \
    make && \
    make install
RUN rm -Rf /sqlbox
