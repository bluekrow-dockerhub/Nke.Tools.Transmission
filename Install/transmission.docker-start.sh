#!/bin/sh

echo "Removing old container"
/usr/bin/docker stop transmission
/usr/bin/docker rm transmission

echo "Updating container image from dockerhub"
/usr/bin/docker pull bluekrow/nke-tools-transmission

echo "Running container as a service"
/usr/bin/docker run \
  -t \
  -p 9091:9091 \
  -p 57841:57841 \
  -e RPC_USERNAME=<transmissionweb-username> \
  -e RPC_PASSWORD=<transmissionweb-password> \
  -v <configuration-directory-host-path>:/trx/Config \
  -v <downloads-directory-host-path>:/trx/Downloads \
  -v <incomplete-directory-host-path>:/trx/Incomplete \
  -v <watchdir-directory-host-path>:/trx/WatchDir \
  --name transmission \
  bluekrow/nke-tools-transmission trx

  echo "Done"