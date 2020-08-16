FROM alpine:3.12
LABEL mantainer=BlueKrow

COPY ./Dockerfile.Scripts/ ./Dockerfile.Scripts/
RUN ./Dockerfile.Scripts/100.Setup.sh

COPY ./entrypoint.sh ./
ENTRYPOINT ["/entrypoint.sh"]
CMD ["check"]
