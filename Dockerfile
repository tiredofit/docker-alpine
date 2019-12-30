FROM alpine:3.11
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set Defaults
ENV S6_OVERLAY_VERSION=v1.22.1.0 \
    DEBUG_MODE=FALSE \
    TIMEZONE=America/Vancouver \
    ENABLE_CRON=TRUE \
    ENABLE_SMTP=TRUE \
    ENABLE_ZABBIX=TRUE \
    ZABBIX_HOSTNAME=alpine

### Add Zabbix User First
RUN set -ex && \
    addgroup -g 10050 zabbix && \
    adduser -S -D -H -h /dev/null -s /sbin/nologin -G zabbix -u 10050 zabbix && \
    \
### Install MailHog
    apk update && \
    apk upgrade && \
    apk add -t .mailhog-build-deps \
               go \
               git \
               musl-dev \
               && \
    mkdir -p /usr/src/gocode && \
    export GOPATH=/usr/src/gocode && \
    go get github.com/mailhog/MailHog && \
    go get github.com/mailhog/mhsendmail && \
    mv /usr/src/gocode/bin/MailHog /usr/local/bin && \
    mv /usr/src/gocode/bin/mhsendmail /usr/local/bin && \
    rm -rf /usr/src/gocode && \
    apk del --purge .mailhog-build-deps && \
    adduser -S -D -H -h /dev/null -u 1025 mailhog && \
    \
### Add Core Utils
    apk add -t .core-deps \
               bash \
               busybox-extras \
               curl \
               grep \
               less \
               logrotate \
               msmtp \
               nano \
               sudo \
               tzdata \
               vim \
               zabbix-agent \
               zabbix-utils \
               && \
    rm -rf /var/cache/apk/* && \
    rm -rf /etc/logrotate.d/acpid && \
    rm -rf /root/.cache && \
    cp -R /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    echo '%zabbix ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    \
### S6 Installation
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xfz - -C / && \
    \
### Add Folders
    mkdir -p /assets/cron

ADD /install /

### Networking Configuration
EXPOSE 1025 8025 10050/TCP 

### Entrypoint Configuration
ENTRYPOINT ["/init"]
