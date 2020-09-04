#!/bin/sh
set -eu

transmission-daemon \
 --foreground \
 --allowed "127.0.0.1,::1,172.17.*.*,192.168.1.*" \
 --auth \
 --config-dir "/trx/Config" \
 --download-dir "/trx/Downloads" \
 --global-seedratio 0.0500 \
 --incomplete-dir "/trx/Incomplete" \
 --no-lpd \
 --no-portmap \
 --password ${RPC_PASSWORD} \
 --peerport 57841 \
 --username ${RPC_USERNAME} \
 --watch-dir "/trx/WatchDir" \
