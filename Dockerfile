FROM alpine:edge
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set defaults
ENV S6_OVERLAY_VERSION=v2.2.0.1 \
    DEBUG_MODE=FALSE \
    TIMEZONE=Etc/GMT \
    ENABLE_CRON=TRUE \
    ENABLE_SMTP=TRUE \
    ENABLE_ZABBIX=TRUE \
    ZABBIX_HOSTNAME=alpine

### Add core utils
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .base-rundeps \
            bash \
            busybox-extras \
            curl \
            grep \
            iputils \
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
    rm -rf /etc/logrotate.d/* && \
    rm -rf /root/.cache && \
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
		armv7) s6Arch='arm' ;; \
                armhf) s6Arch='armhf' ;; \
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
