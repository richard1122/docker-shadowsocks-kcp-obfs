# shadowsocks-libev docker

A shadowsocks-libev docker image with kcptun and obfs config.

For more envs related to shadowsocks-libev please refer to https://github.com/EasyPi/docker-shadowsocks-libev

## SERVER

* KCP_MTU=1350 
* KCP_MODE=fast 
* KCP_KEY=123456789 
* KCP_DATASHARED=10
* KCP_PARITYSHARED=3
* KCP_SNDWND=128
* TIMEOUT=600
* OBFS=http

## CLIENT

* SERVER_HOST
* SERVER_PORT
* PASSWORD
* METHOD
* TIMEOUT
