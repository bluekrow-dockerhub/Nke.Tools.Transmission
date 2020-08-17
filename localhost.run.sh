#!/bin/sh

docker stop trx-local
docker rm trx-local
#BACKGROUND RUN -d \
#FOREGROUND RUN -it \
docker run \
    -d \
    -p 9091:9091 \
    -e RPC_USERNAME=user \
    -e RPC_PASSWORD=pass \
    -v /mnt/c/Users/ndioses/Tmp/Config:/trx/Config \
    -v /mnt/c/Users/ndioses/Tmp/Down:/trx/Downloads \
    -v /mnt/c/Users/ndioses/Tmp/Inc:/trx/Incomplete \
    -v /mnt/c/Users/ndioses/Tmp/Watch:/trx/WatchDir \
    --name trx-local \
    trx-img trx