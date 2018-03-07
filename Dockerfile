FROM alpine:latest

MAINTAINER Vucomir Ianculov <vukomir@ianculov.ro>

# Install Packages
RUN true && apk add --no-cache --update bind supervisor rsyslog

# Clean up to save space
RUN rm "/tmp/"* 2>/dev/null || true && rm -rf /var/cache/apk/* 2>/dev/null || true

#Configure supervisor
ADD docker/bind/config/supervisord.conf /etc/supervisord.conf
ADD docker/bind/config/supervisord /etc/supervisor/conf.d

#Setup docker
ADD docker/bind/init /init
ADD docker/docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR	/

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
