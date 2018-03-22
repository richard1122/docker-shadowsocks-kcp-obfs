FROM easypi/shadowsocks-libev

RUN apk add --no-cache libcrypto1.0 libsodium libev python py-pip c-ares-dev \
    && apk add --no-cache --virtual TMP autoconf automake build-base libtool asciidoc xmlto linux-headers openssl-dev libsodium-dev udns-dev libev-dev wget git \
    # simple obfs
    && git clone https://github.com/shadowsocks/simple-obfs \
      && cd simple-obfs \
      && git submodule update --init --recursive \
      && ./autogen.sh \
      && ./configure \
      && make \
      && make install \
      && cd .. \
      && rm -rf simple-obfs \
    # supervisor
    && pip install supervisor supervisor-stdout \
    && apk del TMP

COPY supervisord.conf /etc/supervisord.conf
ENV TIMEOUT=600 OBFS=http
EXPOSE 8139

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
