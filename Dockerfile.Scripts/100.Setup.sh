#!/bin/sh
set -eu

apk add transmission-daemon

cp 110.settings.json /trx/Config/settings.json
