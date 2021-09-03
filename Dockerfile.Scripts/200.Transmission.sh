#!/bin/sh
set -eu

cp -n Dockerfile.Scripts/110.settings.json /trx/Config/settings.json

transmission-daemon \
 --foreground \
 --config-dir "/trx/Config" \
 --password ${RPC_PASSWORD} \
 --username ${RPC_USERNAME} \
