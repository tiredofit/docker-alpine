FROM alpine:3.9
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set Defaults
ENV DEBUG_MODE=FALSE \
    ENABLE_CRON=TRUE \
    ENABLE_SMTP=TRUE \
    ENABLE_ZABBIX=TRUE \
    TERM=xterm

### Set Defaults/Arguments
ARG S6_OVERLAY_VERSION=v1.21.7.0 

RUN set -x && \

### Install MailHog
    apk add -t .mailhog-build-dependencies \
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
    apk del --purge .mailhog-build-dependencies && \
    adduser -D -u 1025 mailhog && \
    \
### Add Core Utils
    apk upgrade && \
    apk add -t .base-rundeps \
         bash \
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
         && \
    rm -rf /var/cache/apk/* && \
    rm -rf /etc/logrotate.d/acpid && \
    rm -rf /root/.cache /root/.subversion && \
    cp -R /usr/share/zoneinfo/America/Vancouver /etc/localtime && \
    echo 'America/Vancouver' > /etc/timezone && \
    echo '%zabbix ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    \
### S6 Installation
     curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xfz - -C / && \
     mkdir -p /assets/cron

### Networking Configuration
EXPOSE 1025 8025 10050/TCP 

### Add Folders
ADD /install /

### Entrypoint Configuration
ENTRYPOINT ["/init"]
