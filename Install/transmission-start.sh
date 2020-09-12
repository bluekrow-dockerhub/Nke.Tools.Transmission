/usr/bin/docker pull bluekrow/nke-tools-transmission

/usr/bin/docker run \
  -d \
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