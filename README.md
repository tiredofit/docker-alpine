# hub.docker.com/r/tiredofit/alpine

[![Build Status](https://img.shields.io/docker/build/tiredofit/alpine.svg)](https://hub.docker.com/r/tiredofit/alpine)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/alpine.svg)](https://hub.docker.com/r/tiredofit/alpine)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/alpine.svg)](https://hub.docker.com/r/tiredofit/alpine)
[![Docker Layers](https://images.microbadger.com/badges/image/tiredofit/alpine.svg)](https://microbadger.com/images/tiredofit/alpine)

# Introduction

Dockerfile to build an [alpine](https://www.alpinelinux.org/) container image.

* Currently tracking 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12 and edge.
* [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 init capabilities.
* [zabbix-agent](https://zabbix.org) for individual container monitoring.
* Cron installed along with other tools (bash, curl, less, logrotate, nano, vim) for easier management.
* MSMTP enabled to send mail from container to external SMTP server.
* Ability to update User ID and Group ID permissions for development purposes dynamically.

# Authors

- [Dave Conroy](dave at tiredofit dot ca)

# Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Data Volumes](#data-volumes)
    - [Environment Variables](#environmentvariables)   
    - [Networking](#networking)
- [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
   - [References](#references)

# Prerequisites

No prerequisites required

# Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/t/tiredofit/alpine) and 
is the recommended method of installation.


```bash
docker pull tiredofit/alpine:(imagetag)
```

The following image tags are available:

* `3.3` - Alpine 3.3
* `3.4` - Alpine 3.4
* `3.5` - Alpine 3.5
* `3.6` - Alpine 3.6
* `3.7` - Alpine 3.7
* `3.8` - Alpine 3.8
* `3.9` - Alpine 3.9
* `3.10` - Alpine 3.10
* `3.11` - Alpine 3.11
* `3.12` - Alpine 3.12
* `edge` - Alpine edge
* `latest` - Alpine 3.12

# Quick Start

Utilize this image as a base for further builds. By default, it does not start the S6 Overlay system, but 
Bash. Please visit the [s6 overlay repository](https://github.com/just-containers/s6-overlay) for 
instructions on how to enable the S6 init system when using this base or look at some of my other images 
which use this as a base.

# Configuration

### Data-Volumes
The following directories are used for configure and can be mapped for persistent storage.

| Directory                           | Description                 |
|-------------------------------------|-----------------------------|
| `/etc/zabbix/zabbix_agentd.conf.d/` | Zabbix Agent configuration directory |
| `/assets/cron-custom`               | Drop custom crontabs here |


### Environment Variables

Below is the complete list of available options that can be used to customize your installation.

| Parameter         | Description                                                    |
|-------------------|----------------------------------------------------------------|
| `COLORIZE_OUTPUT` | Enable/Disable colorized console output - Default: `TRUE` |
| `CONTAINER_LOG_LEVEL` | Control level of output of container `INFO`, `WARN`, `NOTICE`, `DEBUG` - Default `NOTICE` |
| `DEBUG_MODE`      | Enable debug mode - Default: `FALSE`                            |
| `DEBUG_SMTP`      | Setup mail catch all on port 1025 (SMTP) and 8025 (HTTP) - Default: `FALSE` |
| `ENABLE_CRON`     | Enable Cron - Default: `TRUE`                                   |
| `ENABLE_SMTP`     | Enable SMTP services - Default: `TRUE`                        |
| `ENABLE_ZABBIX`   | Enable Zabbix Agent - Default: `TRUE`                           |
| `SKIP_SANITY_CHECK` | Disable container startup routine check - Default: `FALSE` |
| `TIMEZONE`        | Set Timezone - Default: `Etc/GMT`                     |

If you wish to have this sends mail, set `ENABLE_SMTP=TRUE` and configure the following environment variables. 
See the [MSMTP Configuration Options](http://msmtp.sourceforge.net/doc/msmtp.html) for further information on options to configure MSMTP.

| Parameter         | Description                                                    |
|-------------------|----------------------------------------------------------------|
| `ENABLE_SMTP_GMAIL` | Add setting to support sending through Gmail SMTP - Default: `FALSE` |
| `SMTP_HOST`      | Hostname of SMTP Server - Default: `postfix-relay`                            |
| `SMTP_PORT`      | Port of SMTP Server - Default: `25`                            |
| `SMTP_DOMAIN`     | HELO Domain - Default: `docker`                                   |
| `SMTP_MAILDOMAIN`     | Mail Domain From - Default: `local`                     |
| `SMTP_AUTHENTICATION`     | SMTP Authentication - Default: `none`                                   |
| `SMTP_USER`     | Enable SMTP services - Default: `user`                      |
| `SMTP_PASS`   | Enable Zabbix Agent - Default: `password`                           |
| `SMTP_TLS`        | Use TLS - Default: `off`                     |
| `SMTP_STARTTLS`   | Start TLS from within session - Default: `off` |
| `SMTP_TLSCERTCHECK` | Check remote certificate - Default: `off` |

See The [Official Zabbix Agent Documentation](https://www.zabbix.com/documentation/4.4/manual/appendix/config/zabbix_agentd) 
for information about the following Zabbix values.

| Zabbix Parameters | Description                                                    |
|-------------------|----------------------------------------------------------------|
| `ZABBIX_LOGFILE` | Logfile location - Default: `/var/log/zabbix/zabbix_agentd.log` |
| `ZABBIX_LOGFILESIZE` | Logfile size - Default: `1` |
| `ZABBIX_DEBUGLEVEL` | Debug level - Default: `1` |
| `ZABBIX_REMOTECOMMANDS` | Enable remote commands (0/1) - Default: `1` |
| `ZABBIX_REMOTECOMMANDS_LOG` | Enable remote commands log (0/1) - Default: `1` |
| `ZABBIX_SERVER` | Allow connections from Zabbix Server IP - Default: `0.0.0.0/0` |
| `ZABBIX_LISTEN_PORT` | Zabbix Agent listening port - Default: `10050` |
| `ZABBIX_LISTEN_IP` | Zabbix Agent listening IP - Default: `0.0.0.0` |
| `ZABBIX_START_AGENTS` | How many Zabbix Agents to start - Default: `3 | 
| `ZABBIX_SERVER_ACTIVE` | Server for active checks - Default: `zabbix-proxy` |
| `ZABBIX_HOSTNAME` | Container hostname to report to server - Default: `docker` |
| `ZABBIX_REFRESH_ACTIVE_CHECKS` | Seconds to refresh active checks - Default: `120` |
| `ZABBIX_BUFFER_SEND` | Buffer Send - Default: `5` |
| `ZABBIX_BUFFER_SIZE` | Buffer Size - Default: `100` |
| `ZABBIX_MAXLINES_SECOND` | Max Lines Per Second - Default: `20` |
| `ZABBIX_ALLOW_ROOT` | Allow running as root - Default: `1` |
| `ZABBIX_USER` | Zabbix user to start as - Default: `zabbix` |

If you enable `DEBUG_PERMISSIONS=TRUE` all the users and groups have been modified in accordance with 
environment variables will be displayed in output.
e.g. If you add `USER_NGINX=1000` it will reset the containers `nginx` user id from `82` to `1000` - 
Hint, also change the Group ID to your local development users UID & GID and avoid Docker permission issues when developing.

| Parameter | Description |
|-----------|-------------|
| `USER_<USERNAME>` |  The user's UID in /etc/passwd will be modified with new UID - Default `N/A` |
| `GROUP_<GROUPNAME>` | The group's GID in /etc/group and /etc/passwd will be modified with new GID - Default `N/A` |
| `GROUP_ADD_<USERNAME>` | The username will be added in /etc/group after the group name defined - Default `N/A` | 


### Networking


The following ports are exposed.

| Port      | Description  |
|-----------|--------------|
| `1025`    | `DEBUG_MODE` & `DEBUG_SMTP` SMTP Catcher |
| `8025`    | `DEBUG_MODE` & `DEBUG_SMTP` SMTP HTTP Viewer |
| `10050`   | Zabbix Agent |



# Debug Mode

When using this as a base image, create statements in your startup scripts to check for existence of `DEBUG_MODE=TRUE` 
and set various parameters in your applications to output more detail, enable debugging modes, and so on. 
In this base image it does the following:

* Sets zabbix-agent to output logs in verbosity
* Enables MailHog mailcatcher, which replaces `/usr/sbin/sendmail` with it's own catchall executable. It also opens 
port `1025` for SMTP trapping, and you can view the messages it's trapped at port `8025`


# Maintenance
#### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. alpine) bash
```

# References

* https://www.alpinelinux.org
