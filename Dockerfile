FROM alpine:edge
MAINTAINER Mark Lopez

# Based on https://github.com/bokysan/docker-postfix

RUN	true && \
	apk add --no-cache --update postfix ca-certificates supervisor rsyslog bash openssl && \
    apk add --no-cache --upgrade musl musl-utils && \
	(rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)

COPY files/supervisord.conf /etc/supervisord.conf
COPY files/rsyslog.conf /etc/rsyslog.conf
COPY files/postfix.sh /postfix.sh
COPY files/init.sh /init.sh

# VOLUME [ "/var/spool/postfix", "/etc/postfix" ]

USER root
WORKDIR	/tmp

ENTRYPOINT ["/bin/bash", "/init.sh"]