FROM easypi/shadowsocks-libev
ENV PACKAGES="\
  dumb-init \
  musl \
  python3.4 \
  python3.4-dev \
"

RUN apk add --no-cache libcrypto1.0 libsodium libev python py-pip \
    && apk add --no-cache --virtual TMP autoconf automake build-base libtool asciidoc xmlto linux-headers openssl-dev libsodium-dev udns-dev libev-dev git \
    && git clone https://github.com/shadowsocks/simple-obfs \
    && cd simple-obfs \
    && git submodule update --init --recursive \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf simple-obfs \
    && pip install supervisor supervisor-stdout
COPY supervisord.conf /etc/supervisord.conf
ENV KCP_MTU=1350 KCP_MODE=fast KCP_KEY=123456789 KCP_DATASHARED=10 KCP_PARITYSHARED=3 KCP_SNDWND=128 TIMEOUT=600
EXPOSE 41111/udp 8139

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
