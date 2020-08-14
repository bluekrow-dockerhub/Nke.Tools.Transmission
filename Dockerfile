FROM alpine:3.12
LABEL mantainer=BlueKrow

RUN apk add transmission-daemon

COPY ./entrypoint.sh ./
ENTRYPOINT ["/entrypoint.sh"]
CMD ["check"] 