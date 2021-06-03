FROM alpine:3.13
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG ZABBIX_VERSION
ARG S6_OVERLAY_VERSION

### Set defaults
ENV ZABBIX_VERSION=${ZABBIX_VERSION:-"5.4.0"} \
    S6_OVERLAY_VERSION=${S6_OVERLAY_VERSION:-"v2.2.0.3"} \
    DEBUG_MODE=FALSE \
    TIMEZONE=Etc/GMT \
    ENABLE_CRON=TRUE \
    ENABLE_SMTP=TRUE \
    ENABLE_ZABBIX=TRUE \
    ZABBIX_HOSTNAME=alpine

RUN case "$(cat /etc/os-release | grep VERSION_ID | cut -d = -f 2 | cut -c 1-3)" in \
        3.3|3.4|3.5|3.6) : ;; \
        *) busybox_extras="busybox-extras" ;; \
    esac ; \
    \
    set -ex && \
    apk update && \
    apk upgrade && \
    ### Add core utils
    apk add -t .base-rundeps \
                bash \
                ${busybox_extras} \
                curl \
                grep \
                iputils \
                less \
                $(apk search libssl1* -q) \
                logrotate \
                msmtp \
                nano \
                pcre \
                s6 \
                sudo \
                tzdata \
                vim \
                && \
    \
    apk add -t .zabbix-build-deps \
                alpine-sdk \
                autoconf \
                automake \
                coreutils \
                openssl-dev \
                pcre-dev \
                && \
    \
    cp -R /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    \
    mkdir -p /assets/cron && \
    ## Quiet down sudo
    echo "%zabbix ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo "Set disable_coredump false" > /etc/sudo.conf && \
    \
### Zabbix installation
    addgroup -g 10050 zabbix && \
    adduser -S -D -H -h /dev/null -s /sbin/nologin -G zabbix -u 10050 zabbix && \
    mkdir -p /etc/zabbix && \
    mkdir -p /etc/zabbix/zabbix_agentd.conf.d && \
    mkdir -p /var/lib/zabbix && \
    mkdir -p /var/lib/zabbix/enc && \
    mkdir -p /var/lib/zabbix/modules && \
    mkdir -p /var/log/zabbix && \
    chown --quiet -R zabbix:root /etc/zabbix && \
    chown --quiet -R zabbix:root /var/lib/zabbix && \
    chown --quiet -R zabbix:root /var/log/zabbix && \
    \
### Zabbix compilation
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
            --with-openssl \
            && \
    make -j"$(nproc)" -s 1>/dev/null && \
    cp src/zabbix_agent/zabbix_agentd /usr/sbin/zabbix_agentd && \
    cp src/zabbix_sender/zabbix_sender /usr/sbin/zabbix_sender && \
    cp conf/zabbix_agentd.conf /etc/zabbix && \
    rm -rf /usr/src/zabbix && \
    \
### Clean up
    apk del --purge \
            .zabbix-build-deps && \
    rm -rf /etc/logrotate.d/* && \
    rm -rf /usr/src/* && \
    rm -rf /var/cache/apk/* && \
### S6 overlay installation
    apkArch="$(apk --print-arch)"; \
    case "$apkArch" in \
        x86_64) s6Arch='amd64' ;; \
        armv7) s6Arch='arm' ;; \
        armhf) s6Arch='armhf' ;; \
        aarch64) s6Arch='aarch64' ;; \
        ppc64le) s6Arch='ppc64le' ;; \
        *) echo >&2 "Error: unsupported architecture ($apkArch)"; exit 1 ;; \
    esac; \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-${s6Arch}.tar.gz | tar xfz - -C /

### Networking configuration
EXPOSE 10050/TCP

### Entrypoint configuration
ENTRYPOINT ["/init"]

### Add folders
ADD /install /

