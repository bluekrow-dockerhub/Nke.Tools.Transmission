#!/bin/sh
set -eu

false | cp -i Dockerfile.Scripts/110.settings.json /trx/Config/settings.json 2>/dev/null

transmission-daemon \
 --foreground \
 --config-dir "/trx/Config" \
 --password ${RPC_PASSWORD} \
 --username ${RPC_USERNAME} \
