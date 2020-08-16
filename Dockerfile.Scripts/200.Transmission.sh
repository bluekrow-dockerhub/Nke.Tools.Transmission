#!/bin/sh
set -eu

transmission-daemon \
 -f \
 -a "127.0.0.*,172.17.*.*"
 