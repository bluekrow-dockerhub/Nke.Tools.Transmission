FROM alpine:3.12

COPY ./entrypoint.sh ./

RUN ["ls","-lha"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["check"] 