FROM alpine

COPY entry-point.sh /usr/bin

ENTRYPOINT ["/usr/bin/entry-point.sh"]

