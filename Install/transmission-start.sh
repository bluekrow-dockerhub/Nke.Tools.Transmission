/usr/bin/docker pull bluekrow/nke-tools-transmission

/usr/bin/docker run \
  -d \
  -p 9091:9091 \
  -p 57841:57841 \
  -e RPC_USERNAME=trx \
  -e RPC_PASSWORD=wmXGK5UJ2N \
  -v /media/SMG4T01/WDG2T01/Applications/Transmission/Config:/trx/Config \
  -v /media/SMG4T01/Unclassified/Downloads:/trx/Downloads \
  -v /media/SMG4T01/Unclassified/Incomplete:/trx/Incomplete \
  -v /media/SMG4T01/Unclassified/WatchDir:/trx/WatchDir \
  --name transmission \
  bluekrow/nke-tools-transmission trx