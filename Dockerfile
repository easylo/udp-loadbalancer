FROM nginx:1.11-alpine
MAINTAINER Laurent RICHARD <lrichard@lafourchette.com>

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

COPY udp-loadbalancer.conf /nginx.conf

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod a+x /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
