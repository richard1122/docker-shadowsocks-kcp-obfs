# shadowsocks-libev docker

This is a docker configuration for shadowsocks-libev, kcptun, and obfs. The configuration inherits the system environment variables which are specified in https://github.com/EasyPi/docker-shadowsocks-libev.

## Default Environment Variables

* KCP_MTU=1350 
* KCP_MODE=fast 
* KCP_KEY=123456789 
* KCP_DATASHARED=10
* KCP_PARITYSHARED=3
* KCP_SNDWND=128
* TIMEOUT=600
* OBFS=http

You may modify them use following code `export VAR=VALUE` in bash.

## Ports

* Shadowsocks libev: 8388
* Simple obfs: 8139
* KCP: 41111/udp
