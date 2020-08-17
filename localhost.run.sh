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
    -v $HOME/Tmp/Config:/trx/Config \
    -v $HOME/Tmp/Down:/trx/Downloads \
    -v $HOME/Tmp/Inc:/trx/Incomplete \
    -v $HOME/Tmp/Watch:/trx/WatchDir \
    --name trx-local \
    trx-img trx

