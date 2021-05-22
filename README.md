# github.com/tiredofit/docker-alpine

[![GitHub release](https://img.shields.io/github/v/tag/tiredofit/docker-alpine?style=flat-square)](https://github.com/tiredofit/docker-alpine/releases/latest)
[![Build Status](https://img.shields.io/github/workflow/status/tiredofit/docker-alpine/build?style=flat-square)](https://github.com/tiredofit/docker-alpine/actions?query=workflow%3Abuild)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/alpine.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/alpine/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/alpine.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/alpine/)
[![Become a sponsor](https://img.shields.io/badge/sponsor-tiredofit-181717.svg?logo=github&style=flat-square)](https://github.com/sponsors/tiredofit)
[![Paypal Donate](https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square)](https://www.paypal.me/tiredofit)

* * *


## About

Dockerfile to build an [alpine](https://www.alpinelinux.org/) linux container image.

* Currently tracking 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12, 3.13 and edge.
* [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 init capabilities.
* [zabbix-agent](https://zabbix.org) for individual container monitoring.
* Cron installed along with other tools (bash, curl, less, logrotate, nano, vim) for easier management.
* MSMTP enabled to send mail from container to external SMTP server.
* Ability to update User ID and Group ID permissions for development purposes dynamically.

## Maintainer

- [Dave Conroy](https://github/tiredofit)

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Prerequisites and Assumptions](#prerequisites-and-assumptions)
- [Installation](#installation)
  - [Build from Source](#build-from-source)
  - [Prebuilt Images](#prebuilt-images)
    - [Multi Archictecture](#multi-archictecture)
- [Configuration](#configuration)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
  - [Environment Variables](#environment-variables)
    - [Container Options](#container-options)
    - [SMTP Options](#smtp-options)
    - [Zabbix Options](#zabbix-options)
    - [Permissions](#permissions)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [Support](#support)
  - [Usage](#usage)
  - [Bugfixes](#bugfixes)
  - [Feature Requests](#feature-requests)
  - [Updates](#updates)
- [License](#license)
- [References](#references)

## Prerequisites and Assumptions

No prerequisites required

## Installation

### Build from Source
Clone this repository and build the image with `docker build <arguments> (imagename) .`

### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/alpine) and is the recommended method of installation.

```bash
docker pull tiredofit/alpine:(imagetag)
```

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Alpine version | Tag     |
| -------------- | ------- |
| `edge`         | `:edge` |
| `3.13`         | `:3.13` |
| `3.12`         | `:3.12` |
| `3.11`         | `:3.11` |
| `3.10`         | `:3.10` |
| `3.9`          | `:3.9`  |
| `3.8`          | `:3.8`  |
| `3.7`          | `:3.7`  |
| `3.6`          | `:3.6`  |
| `3.5`          | `:3.5`  |

#### Multi Archictecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v6`, `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`


## Configuration

### Quick Start

Utilize this image as a base for further builds. By default, it does not start the S6 Overlay system, but
Bash. Please visit the [s6 overlay repository](https://github.com/just-containers/s6-overlay) for
instructions on how to enable the S6 init system when using this base or look at some of my other images
which use this as a base.
### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory                           | Description                          |
| ----------------------------------- | ------------------------------------ |
| `/etc/zabbix/zabbix_agentd.conf.d/` | Zabbix Agent configuration directory |
| `/assets/cron-custom`               | Drop custom crontabs here            |

### Environment Variables

Below is the complete list of available options that can be used to customize your installation.
#### Container Options
| Parameter             | Description                                                            | Default          |
| --------------------- | ---------------------------------------------------------------------- | ---------------- |
| `COLORIZE_OUTPUT`     | Enable/Disable colorized console output                                | `TRUE`           |
| `CONTAINER_LOG_LEVEL` | Control level of output of container `INFO`, `WARN`, `NOTICE`, `DEBUG` | Default `NOTICE` |
| `DEBUG_MODE`          | Enable debug mode                                                      | `FALSE`          |
| `ENABLE_CRON`         | Enable Cron                                                            | `TRUE`           |
| `ENABLE_LOGROTATE`    | Enable Logrotate (if Cron enabled)                                     | `TRUE`           |
| `ENABLE_SMTP`         | Enable SMTP services                                                   | `TRUE`           |
| `ENABLE_ZABBIX`       | Enable Zabbix Agent                                                    | `TRUE`           |
| `SKIP_SANITY_CHECK`   | Disable container startup routine check                                | `FALSE`          |
| `TIMEZONE`            | Set Timezone                                                           | `Etc/GMT`        |

If you wish to have this sends mail, set `ENABLE_SMTP=TRUE` and configure the following environment variables.
See the [MSMTP Configuration Options](https://marlam.de/msmtp/msmtp.html) for further information on options to configure MSMTP.

#### SMTP Options
| Parameter             | Description                                       | Default         |
| --------------------- | ------------------------------------------------- | --------------- |
| `SMTP_AUTO_FROM`      | Add setting to support sending through Gmail SMTP | `TRUE`         |
| `SMTP_HOST`           | Hostname of SMTP Server                           | `postfix-relay` |
| `SMTP_PORT`           | Port of SMTP Server                               | `25`            |
| `SMTP_DOMAIN`         | HELO Domain                                       | `docker`        |
| `SMTP_MAILDOMAIN`     | Mail Domain From                                  | `local`         |
| `SMTP_AUTHENTICATION` | SMTP Authentication                               | `none`          |
| `SMTP_USER`           | Enable SMTP services                              | `user`          |
| `SMTP_PASS`           | Enable Zabbix Agent                               | `password`      |
| `SMTP_TLS`            | Use TLS                                           | `off`           |
| `SMTP_STARTTLS`       | Start TLS from within session                     | `off`           |
| `SMTP_TLSCERTCHECK`   | Check remote certificate                          | `off`           |

See The [Official Zabbix Agent Documentation](https://www.zabbix.com/documentation/5.4/manual/appendix/config/zabbix_agentd)
for information about the following Zabbix values.

#### Zabbix Options

| Parameter                      | Description                             | Default                             |
| ------------------------------ | --------------------------------------- | ----------------------------------- |
| `ZABBIX_LOGFILE`               | Logfile location                        | `/var/log/zabbix/zabbix_agentd.log` |
| `ZABBIX_LOGFILESIZE`           | Logfile size                            | `1`                                 |
| `ZABBIX_DEBUGLEVEL`            | Debug level                             | `1`                                 |
| `ZABBIX_REMOTECOMMANDS_ALLOW`  | Enable remote commands                  | `*`                                 |
| `ZABBIX_REMOTECOMMANDS_DENY`   | Deny remote commands                    |                                     |
| `ZABBIX_REMOTECOMMANDS_LOG`    | Enable remote commands Log (`0`/`1`)    | `1`                                 |
| `ZABBIX_SERVER`                | Allow connections from Zabbix server IP | `0.0.0.0/0`                         |
| `ZABBIX_LISTEN_PORT`           | Zabbix Agent listening port             | `10050`                             |
| `ZABBIX_LISTEN_IP`             | Zabbix Agent listening IP               | `0.0.0.0`                           |
| `ZABBIX_START_AGENTS`          | How many Zabbix Agents to start         | `3`                                 |
| `ZABBIX_SERVER_ACTIVE`         | Server for active checks                | `zabbix-proxy`                      |
| `ZABBIX_HOSTNAME`              | Container hostname to report to server  | `docker`                            |
| `ZABBIX_REFRESH_ACTIVE_CHECKS` | Seconds to refresh Active Checks        | `120`                               |
| `ZABBIX_BUFFER_SEND`           | Buffer Send                             | `5`                                 |
| `ZABBIX_BUFFER_SIZE`           | Buffer Size                             | `100`                               |
| `ZABBIX_MAXLINES_SECOND`       | Max Lines Per Second                    | `20`                                |
| `ZABBIX_ALLOW_ROOT`            | Allow running as root                   | `1`                                 |
| `ZABBIX_USER`                  | Zabbix user to start as                 | `zabbix`                            |

If you enable `DEBUG_PERMISSIONS=TRUE` all the users and groups have been modified in accordance with
environment variables will be displayed in output.
e.g. If you add `USER_NGINX=1000` it will reset the containers `nginx` user id from `82` to `1000` -
Hint, also change the Group ID to your local development users UID & GID and avoid Docker permission issues when developing.

#### Permissions
| Parameter              | Description                                                                 |
| ---------------------- | --------------------------------------------------------------------------- |
| `USER_<USERNAME>`      | The user's UID in /etc/passwd will be modified with new UID                 |
| `GROUP_<GROUPNAME>`    | The group's GID in /etc/group and /etc/passwd will be modified with new GID |
| `GROUP_ADD_<USERNAME>` | The username will be added in /etc/group after the group name defined       |

### Networking

The following ports are exposed.

| Port    | Description                                  |
| ------- | -------------------------------------------- |
| `10050` | Zabbix Agent                                 |

#@ Debug Mode

When using this as a base image, create statements in your startup scripts to check for existence of `DEBUG_MODE=TRUE`
and set various parameters in your applications to output more detail, enable debugging modes, and so on.
In this base image it does the following:

* Sets zabbix-agent to output logs in verbosity

## Maintenance

### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

``bash
docker exec -it (whatever your container name is) bash
``
## Support

These images were built to serve a specific need in a production environment and gradually have had more functionality added based on requests from the community.
### Usage
- The [Discussions board](../../discussions) is a great place for working with the community on tips and tricks of using this image.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) personalized support.
### Bugfixes
- Please, submit a [Bug Report](issues/new) if something isn't working as expected. I'll do my best to issue a fix in short order.

### Feature Requests
- Feel free to submit a feature request, however there is no guarantee that it will be added, or at what timeline.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) regarding development of features.

### Updates
- Best effort to track upstream changes, More priority if I am actively using the image in a production environment.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) for up to date releases.

## License
MIT. See [LICENSE](LICENSE) for more details.
## References

* <https://www.alpinelinux.org>
