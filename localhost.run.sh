#!/bin/sh

docker stop trx-local
docker rm trx-local
#FOREGROUND RUN
#docker run -it --name trx-local -p 9091:9091 trx-img trx
#DETACHED  RUN
docker run -d --name trx-local -p 9091:9091 trx-img trx
