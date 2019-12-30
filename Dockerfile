FROM alpine:3.10
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

ENV ZABBIX_VERSION=4.4.3 \
    S6_OVERLAY_VERSION=v1.22.1.0 \
    DEBUG_MODE=FALSE \
    TIMEZONE=America/Vancouver \
    ENABLE_CRON=TRUE \
    ENABLE_SMTP=TRUE \
    ENABLE_ZABBIX=TRUE \
    ZABBIX_HOSTNAME=alpine

### Zabbix Pre Installation steps
RUN set -ex && \
    addgroup -g 10050 zabbix && \
    adduser -S -D -H -h /dev/null -s /sbin/nologin -G zabbix -u 10050 zabbix && \
    mkdir -p /etc/zabbix && \
    mkdir -p /etc/zabbix/zabbix_agentd.d && \
    mkdir -p /var/lib/zabbix && \
    mkdir -p /var/lib/zabbix/enc && \
    mkdir -p /var/lib/zabbix/modules && \
    chown --quiet -R zabbix:root /var/lib/zabbix && \
    apk update && \
    apk upgrade && \
    apk add \
            iputils \
            bash \
            coreutils \
            pcre \
            libssl1.1 && \
    \
### Zabbix Compilation
    apk add -t .zabbix-build-deps \
            alpine-sdk \
            automake \
            autoconf \
            openssl-dev \
            pcre-dev && \
    \
    mkdir -p /usr/src/zabbix && \
    curl -sSL https://github.com/zabbix/zabbix/archive/${ZABBIX_VERSION}.tar.gz | tar xfz - --strip 1 -C /usr/src/zabbix && \
    cd /usr/src/zabbix && \
    ./bootstrap.sh 1>/dev/null && \
    export CFLAGS="-fPIC -pie -Wl,-z,relro -Wl,-z,now" && \
    ./configure \
            --prefix=/usr \
            --silent \
            --sysconfdir=/etc/zabbix \
            --libdir=/usr/lib/zabbix \
            --datadir=/usr/lib \
            --enable-agent \
            --enable-ipv6 \
            --with-openssl && \
    make -j"$(nproc)" -s 1>/dev/null && \
    cp src/zabbix_agent/zabbix_agentd /usr/sbin/zabbix_agentd && \
    cp src/zabbix_sender/zabbix_sender /usr/sbin/zabbix_sender && \
    cp conf/zabbix_agentd.conf /etc/zabbix && \
    mkdir -p /etc/zabbix/zabbix_agentd.conf.d && \
    mkdir -p /var/log/zabbix && \
    chown -R zabbix:root /var/log/zabbix && \
    chown --quiet -R zabbix:root /etc/zabbix && \
    rm -rf /usr/src/zabbix && \
    apk del --purge \
            coreutils \
            .zabbix-build-deps && \
    \
### Install MailHog
    apk add -t .mailhog-build-deps \
            go \
            git \
            musl-dev \
            && \
    mkdir -p /usr/src/gocode && \
    cd /usr/src && \
    export GOPATH=/usr/src/gocode && \
    go get github.com/mailhog/MailHog && \
    go get github.com/mailhog/mhsendmail && \
    mv /usr/src/gocode/bin/MailHog /usr/local/bin && \
    mv /usr/src/gocode/bin/mhsendmail /usr/local/bin && \
    rm -rf /usr/src/gocode && \
    apk del --purge .mailhog-build-deps && \
    adduser -D -u 1025 mailhog && \
    \
### Add Core Utils
    apk add -t .base-rundeps \
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
         && \
    rm -rf /var/cache/apk/* && \
    rm -rf /etc/logrotate.d/acpid && \
    rm -rf /root/.cache /root/.subversion && \
    cp -R /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    echo '%zabbix ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    \
### S6 Installation
     curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xfz - -C / && \
     mkdir -p /assets/cron && \
### Clean Up
    rm -rf /usr/src/*

### Networking Configuration
EXPOSE 1025 8025 10050/TCP 

### Add Folders
ADD /install /

### Entrypoint Configuration
ENTRYPOINT ["/init"]

