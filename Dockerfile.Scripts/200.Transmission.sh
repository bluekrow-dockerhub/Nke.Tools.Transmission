#!/bin/sh
set -eu

transmission-daemon \
 --foreground \
 --config-dir "/trx/Config" \
 --password ${RPC_PASSWORD} \
 --username ${RPC_USERNAME} \
