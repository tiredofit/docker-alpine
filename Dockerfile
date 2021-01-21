FROM alpine:3.13
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set defaults
ENV ZABBIX_VERSION=5.2.3 \
    S6_OVERLAY_VERSION=v2.2.0.0 \
    DEBUG_MODE=FALSE \
    TIMEZONE=Etc/GMT \
    ENABLE_CRON=TRUE \
    ENABLE_SMTP=TRUE \
    ENABLE_ZABBIX=TRUE \
    ZABBIX_HOSTNAME=alpine

### Zabbix pre installation steps
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
        pcre \
        libssl1.1 && \
    \
### Zabbix compilation
    apk add --no-cache -t .zabbix-build-deps \
            coreutils \
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
### Install MailHog
    apk add --no-cache -t .mailhog-build-deps \
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
    apk del --purge \
            .mailhog-build-deps .zabbix-build-deps && \
    \
    adduser -D -u 1025 mailhog && \
    \
### Add core utils
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
    ## Quiet down sudo
    echo "Set disable_coredump false" > /etc/sudo.conf && \
    \
### S6 installation
    apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		x86_64) s6Arch='amd64' ;; \
		'armhf' | 'armv7' ) s6Arch='armhf' ;; \
		aarch64) s6Arch='aarch64' ;; \
		ppc64le) s6Arch='ppc64le' ;; \
		*) echo >&2 "Error: unsupported architecture ($apkArch)"; exit 1 ;; \
	esac; \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-${s6Arch}.tar.gz | tar xfz - -C / && \
    mkdir -p /assets/cron && \
### Clean up
    rm -rf /usr/src/*

### Networking configuration
EXPOSE 1025 8025 10050/TCP

### Add folders
ADD /install /

### Entrypoint configuration
ENTRYPOINT ["/init"]
