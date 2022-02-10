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

* Currently tracking 3.5, 3.6, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12, 3.13, 3.14, 3.15 and edge.
* [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 init capabilities.
* [zabbix-agent](https://zabbix.org) (Classic and Modern) for individual container monitoring.
* Scheduling via cron with other helpful tools (bash, curl, less, logrotate, nano, vim) for easier management.
* Messaging ability via MSMTP enabled to send mail from container to external SMTP server.
* Logshipping capabilities
* Ability to update User ID and Group ID permissions dynamically.

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
    - [Multi Architecture](#multi-archictecture)
- [Configuration](#configuration)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
  - [Environment Variables](#environment-variables)
    - [Container Options](#container-options)
    - [Scheduling Options](#scheduling-options)
    - [Messaging Options](#messaging-options)
    - [Monitoring Options](#monitoring-options)
      - [Zabbix Options](#zabbix-options)
    - [Logging Options](#logging-options)
      - [Fluent-Bit Options](#fluent-bit-options)
    - [Permissions](#permissions)
    - [Process Watchdog](#process-watchdog)
  - [Networking](#networking)
- [Developing / Overriding](#developing--overriding)
- [Debug Mode](#debug-mode)
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
| `3.15`         | `:3.15` |
| `3.14`         | `:3.14` |
| `3.13`         | `:3.13` |
| `3.12`         | `:3.12` |
| `3.11`         | `:3.11` |
| `3.10`         | `:3.10` |
| `3.9`          | `:3.9`  |
| `3.8`          | `:3.8`  |
| `3.7`          | `:3.7`  |
| `3.6`          | `:3.6`  |
| `3.5`          | `:3.5`  |

#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v6`, `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`


## Configuration

### Quick Start

Utilize this image as a base for further builds. Please visit the [s6 overlay repository](https://github.com/just-containers/s6-overlay) for
instructions on how to enable the S6 init system when using this base or look at some of my other images
which use this as a base.
### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory                           | Description                               |
| ----------------------------------- | ----------------------------------------- |
| `/etc/fluent-bit/conf.d/`           | Fluent-Bit custom configuration directory |
| `/etc/fluent-bit/parsers.d/`        | Fluent-Bit custom parsers directory       |
| `/etc/zabbix/zabbix_agentd.conf.d/` | Zabbix Agent configuration directory      |
| `/var/log`                          | Cron, Zabbix, other log files             |
| `/assets/cron`                      | Drop custom crontabs here                 |

### Environment Variables

Below is the complete list of available options that can be used to customize your installation.
#### Container Options
| Parameter                           | Description                                                                         | Default                  |
| ----------------------------------- | ----------------------------------------------------------------------------------- | ------------------------ |
| `CONAINER_ENABLE_LOG_TIMESTAMP`     | Prefix this images container logs with timestamp                                    | `TRUE`                   |
| `CONTAINER_COLORIZE_OUTPUT`         | Enable/Disable colorized console output                                             | `TRUE`                   |
| `CONTAINER_CUSTOM_BASH_PROMPT`      | If you wish to set a different bash prompt then '(imagename):(version) HH:MM:SS # ' |                          |
| `CONTAINER_CUSTOM_PATH`             | Used for adding custom files into the image upon startup                            | `/assets/custom`         |
| `CONTAINER_CUSTOM_SCRIPTS_PATH`     | Used for adding custom scripts to execute upon startup                              | `/assets/custom-scripts` |
| `CONTAINER_ENABLE_PROCESS_COUNTER`  | Show how many times process has executed in console log                             | `TRUE`                   |
| `CONTAINER_LOG_LEVEL`               | Control level of output of container `INFO`, `WARN`, `NOTICE`, `DEBUG`              | `NOTICE`                 |
| `CONTAINER_LOG_TIMESAMP_TIME_FMT`   | Timestamp Time Format                                                               | `%H:%M:%S`               |
| `CONTAINER_LOG_TIMESTAMP_DATE_FMT`  | Timestamp Date Format                                                               | `%Y-%m-%d`               |
| `CONTAINER_LOG_TIMESTAMP_SEPERATOR` | Timestamp seperator                                                                 | `-`                      |
| `CONTAINER_NAME`                    | Used for setting entries in Monnitoring and Log Shipping                            | (hostname)               |
| `TIMEZONE`                          | Set Timezone                                                                        | `Etc/GMT`                |


#### Scheduling Options

The image has capability of executing tasks at differnt times of the day. It follows the [cron syntax](https://cron.help/). Presently this image only supports the busybox cron however can be extended to other scheduling backends with little effort.

| Parameter                       | Description                         | Default          |
| ------------------------------- | ----------------------------------- | ---------------- |
| `CONTAINER_ENABLE_SCHEDULING`   | Enable Scheduled Tasks              | `TRUE`           |
| `CONTAINR_SCHEDULING_BACKEND`   | What scheduling tool to use `cron`  | `cron`           |
| `CONTAINER_SCHEDULING_LOCATION` | Where to read task files            | `/assets/cron/`  |
| `SCHEDULING_LOG_TYPE`           | Log Type `FILE`                     | `FILE`           |
| `SCHEDULING_LOG_LOCATION`       | Log File Location                   | `/var/log/cron/` |
| `SCHEDULING_LOG_LEVEL`          | Log Level `1` (loud) to `8` (quiet) | `6`              |

##### Cron Options

There are two ways to add jobs to be triggered via cron. One is to drop files into `/assets/cron/` which will be parsed upon container startup, or to set environment variables.

| Parameter | Description                                            | Default |
| --------- | ------------------------------------------------------ | ------- |
| `CRON_*`  | Name of the job value of the time and output to be run | ``      |

Example: `CRON_HELLO="* * * * * echo 'hello' > /tmp/hello.log`

Since you can't really disable environment variables in Docker if they are baked into parent Docker images, you can override a baked in Cron command with your own values, or to disable it entirely set the value to `FALSE` eg `CRON_HELLO=FALSE`.

#### Messaging Options

If you wish to send mail, set `CONTAINER_ENABLE_MESSAGING=TRUE` and configure the following environment variables. Presently we only support one backend, but more can be added with little effort.

| Parameter                     | Description                                | Default |
| ----------------------------- | ------------------------------------------ | ------- |
| `CONTAINER_ENABLE_MESSAGING`  | Enable Messaging services like SMTP        | `TRUE`  |
| `CONTAINER_MESSAGING_BACKEND` | Messaging Backend - presently only `msmtp` | `msmtp` |

##### MSMTP Options

See the [MSMTP Configuration Options](https://marlam.de/msmtp/msmtp.html) for further information on options to configure MSMTP.
| Parameter             | Description                                       | Default         |
| --------------------- | ------------------------------------------------- | --------------- |
| `SMTP_AUTO_FROM`      | Add setting to support sending through Gmail SMTP | `FALSE`         |
| `SMTP_HOST`           | Hostname of SMTP Server                           | `postfix-relay` |
| `SMTP_PORT`           | Port of SMTP Server                               | `25`            |
| `SMTP_DOMAIN`         | HELO Domain                                       | `docker`        |
| `SMTP_MAILDOMAIN`     | Mail Domain From                                  | `local`         |
| `SMTP_AUTHENTICATION` | SMTP Authentication                               | `none`          |
| `SMTP_USER`           | SMTP Username                                     | ``              |
| `SMTP_PASS`           | SMTP Password                                     | ``              |
| `SMTP_TLS`            | Use TLS                                           | `FALSE`         |
| `SMTP_STARTTLS`       | Start TLS from within session                     | `FALSE`         |
| `SMTP_TLSCERTCHECK`   | Check remote certificate                          | `FALSE`         |

See The [Official Zabbix Agent Documentation](https://www.zabbix.com/documentation/5.4/manual/appendix/config/zabbix_agentd)
for information about the following Zabbix values.

#### Monitoring Options
This image includes the capability of using agents inside the image to monitor metrics from applications. Presently at this time it only supports Zabbix as a monitoring platform, however is extendable to other platforms with little effort.

| Parameter                     | Description                                  | Default  |
| ----------------------------- | -------------------------------------------- | -------- |
| `CONTAINER_ENABLE_MONITORING` | Enable Monitoring of applications or metrics | `TRUE`   |
| `CONTAINR_MONITORING_BACKEND` | What monitoring agent to use `zabbix`        | `zabbix` |
##### Zabbix Options

This image comes with Zabbix Agent 1 (Classic or C compiled) and Zabbix Agent 2 (Modern, or Go compiled). See which variables work for each version and make your agent choice. Drop files in `/etc/zabbix/zabbix_agentd.conf.d` to setup your metrics. The environment variables below only affect the system end of the configuration. If you wish to use your own system configuration without these variables, change `ZABBIX_SETUP_TYPE` to `MANUAL`

| Parameter                            | Description                                                                                   | Default                  | 1   | 2   |
| ------------------------------------ | --------------------------------------------------------------------------------------------- | ------------------------ | --- | --- |
| `ZABBIX_SETUP_TYPE`                  | Automatically generate configuration based on these variables `AUTO` or `MANUAL`              | `AUTO`                   | x   | x   |
| `ZABBIX_AGENT_TYPE`                  | Which version of Zabbix Agent to load `1` or `2`                                              | 1                        | N/A | N/A |
| `ZABBIX_AGENT_LOG_PATH`              | Log File Path                                                                                 | `/var/log/zabbix/agent/` | x   | x   |
| `ZABBIX_AGENT_LOG_FILE`              | Logfile name                                                                                  | `zabbix_agentd.log`      | x   | x   |
| `ZABBIX_CERT_PATH`                   | Zabbix Certificates Path                                                                      | `/etc/zabbix/certs/`     | x   | x   |
| `ZABBIX_ENABLE_AUTOREGISTRATION`     | Use internal routine for Agent autoregistration based on config files with # Autoregister tag | `TRUE`                   | x   | x   |
| `ZABBIX_ENABLE_AUTOREGISTRATION_DNS` | Register with DNS name instead of IP Address when autoregistering                             | `TRUE`                   | x   | x   |
| `ZABBIX_AUTOREGISTRATION_DNS_NAME`   | (optional) DNS Name to provide for auto register. Uses `CONTAINER_NAME` as default            | `$CONTAINER_NAME`        | x   | x   |
| `ZABBIX_AUTOREGISTRATION_DNS_SUFFIX` | If you want to append something after the generated DNS Name                                  | ``                       | x   | x   |
| `ZABBIX_ENCRYPT_PSK_ID`              | Zabbix Encryption PSK ID                                                                      | ``                       | x   | x   |
| `ZABBIX_ENCRYPT_PSK_KEY`             | Zabbix Encryption PSK Key                                                                     | ``                       | x   | x   |
| `ZABBIX_ENCRYPT_PSK_FILE`            | Zabbix Encryption PSK File (If not using above env var)                                       | ``                       | x   | x   |
| `ZABBIX_LOG_FILE_SIZE`               | Logfile size                                                                                  | `0`                      | x   | x   |
| `ZABBIX_DEBUGLEVEL`                  | Debug level                                                                                   | `1`                      | x   | x   |
| `ZABBIX_REMOTECOMMANDS_ALLOW`        | Enable remote commands                                                                        | `*`                      | x   | x   |
| `ZABBIX_REMOTECOMMANDS_DENY`         | Deny remote commands                                                                          | ``                       | x   | x   |
| `ZABBIX_REMOTECOMMANDS_LOG`          | Enable remote commands Log (`0`/`1`)                                                          | `1`                      | x   | ``  |
| `ZABBIX_SERVER`                      | Allow connections from Zabbix server IP                                                       | `0.0.0.0/0`              | x   | x   |
| `ZABBIX_STATUS_PORT`                 | Agent will listen to this port for status requests (http://localhost:port/status)             | `10050`                  | ``  | x   |
| `ZABBIX_LISTEN_PORT`                 | Zabbix Agent listening port                                                                   | `10050`                  | x   | x   |
| `ZABBIX_LISTEN_IP`                   | Zabbix Agent listening IP                                                                     | `0.0.0.0`                | x   | x   |
| `ZABBIX_START_AGENTS`                | How many Zabbix Agents to start                                                               | `1`                      | x   | ``  |
| `ZABBIX_SERVER_ACTIVE`               | Server for active checks                                                                      | `zabbix-proxy`           | x   | x   |
| `ZABBIX_HOSTNAME`                    | Container hostname to report to server                                                        | `$CONTAINER_NAME`        | x   | x   |
| `ZABBIX_REFRESH_ACTIVE_CHECKS`       | Seconds to refresh Active Checks                                                              | `120`                    | x   | x   |
| `ZABBIX_BUFFER_SEND`                 | Buffer Send                                                                                   | `5`                      | x   | x   |
| `ZABBIX_BUFFER_SIZE`                 | Buffer Size                                                                                   | `100`                    | x   | x   |
| `ZABBIX_MAXLINES_SECOND`             | Max Lines Per Second                                                                          | `20`                     | x   | ``  |
| `ZABBIX_SOCKET`                      | Socket for communicating                                                                      | `/tmp/zabbix.sock`       | ``  | x   |
| `ZABBIX_ALLOW_ROOT`                  | Allow running as root                                                                         | `1`                      | x   | ``  |
| `ZABBIX_USER`                        | User to start agent                                                                           | `zabbix`                 | x   | x   |
| `ZABBIX_USER_SUDO`                   | Allow Zabbix user to utilize sudo commands                                                    | `TRUE`                   | x   | x   |

This image supports autoregistering configuration as an Active Agent to a Zabbix Proxy or a Server. It looks in `/etc/zabbix_agent.conf.d/*.conf` for the string `# Autoregister=` and takes these values and adds it to the `HostMetadata` configuration entry automatically wrapped around `:` eg `:application:` . Use it by creating an Auto register rule and search for that string. You can find server templates in this repository in the `[zabbix_templates](zabbix_templates/)` directory.

#### Logging Options

This is work in progress for a larger logging solution. Presently there is functionality to rotate logs on a daily basis, however as this section matures there will be the capability to also ship the logs to an external data warehouse like Loki, or Elastic Search. At present Log shipping is only supported by `fluent-bit` and x86_64 only.

| Parameter                       | Description                              | Default      |
| ------------------------------- | ---------------------------------------- | ------------ |
| `CONTAINER_ENABLE_LOGROTATE`    | Enable Logrotate (if scheduling enabled) | `TRUE`       |
| `CONTAINER_ENABLE_LOGSHIPPING`  | Enable Log Shipping                      | `FALSE`      |
| `CONTAINER_LOGSHIPPING_BACKEND` | Log shipping backend `fluent-bit`        | `fluent-bit` |
| `LOGROTATE_RETAIN_DAYS`         | Rotate and retain logs for x days        | `7`          |

##### Log Shipping Parsing

You can set an environment variable to start shipping a log without any other configuration. Create a variable starting with `LOGSHIP_<name>` with the value of the location of the log files. You can also use this to null an existing configuration by setting the value of `FALSE`.

Example: `LOGSHIP_NGINX=/var/log/nginx/*.log` will create and tag all log files from that directory as to be coming from `CONTAINER_NAME` and from `nginx`. Note, it does not allow for custom parsing, so will simply parse the log entry as is.

If `LOGSHIPPING_AUTO_CONFIG_LOGROTATE` set to true, you can define what parser the configuration file should use. Make sure you have the appropriate `.conf` parsers in `/etc/fluent-bit/parsers.d/`
Create a line in the `logrotate.d/<file>` that looks like `# logship: <parser>`. Multiple parsers can be added by seperating via commas. Alternatively, if you wanted to skip a certain logfile from being parsed by the log shipper, use the value "SKIP".

| Parameter                           | Description                                                                          | Default |
| ----------------------------------- | ------------------------------------------------------------------------------------ | ------- |
| `LOGSHIPPING_AUTO_CONFIG_LOGROTATE` | Automatically configure log shipping for files that are listed in `/etc/logrotate.d` | `TRUE`  |


##### Fluent-Bit Options

Drop files in `/etc/fluent-bit/conf.d` to setup your inputs and outputs. The environment variables below only affect the system end of the configuration. If you wish to use your own system configuration without these variables, change `FLUENTBIT_SETUP_TYPE` to `MANUAL`. Container will attempt to automatically create configuration to send to a destination, or can also be set to act as a receiver from other fluent-bit hosts and forward data to a remote log analysis service.

| Parameter                             | Description                                                                                      | Default                  |
| ------------------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------ |
| `FLUENTBIT_CONFIG_PARSERS`            | Parsers config file name                                                                         | `parsers.conf`           |
| `FLUENTBIT_CONFIG_PLUGINS`            | Plugins config file name                                                                         | `plugins.conf`           |
| `FLUENTBIT_ENABLE_HTTP_SERVER`        | Embedded HTTP Server for metrics `TRUE` / `FALSE`                                                | `TRUE`                   |
| `FLUENTBIT_ENABLE_STORAGE_METRICS`    | Public storage pipeline metrics in /api/v1/storage                                               | `TRUE`                   |
| `FLUENTBIT_FLUSH_SECONDS`             | Wait time to flush records in seconds                                                            | `1`                      |
| `FLUENTBIT_FORWARD_BUFFER_CHUNK_SIZE` | Buffer Chunk Size                                                                                | `32KB`                   |
| `FLUENTBIT_FORWARD_BUFFER_MAX_SIZE`   | Buffer Maximum Size                                                                              | `64KB`                   |
| `FLUENTBIT_FORWARD_PORT`              | What port when using `PROXY` (listen) mode or `FORWARD` (client) output                          | `24224`                  |
| `FLUENTBIT_GRACE_SECONDS`             | Wait time before exit in seconds                                                                 | `1`                      |
| `FLUENTBIT_HTTP_LISTEN_IP`            | HTTP Listen IP                                                                                   | `0.0.0.0`                |
| `FLUENTBIT_HTTP_LISTEN_PORT`          | HTTP Listening Port                                                                              | `2020`                   |
| `FLUENTBIT_LOG_FILE`                  | Log File                                                                                         | `fluentbit.log`          |
| `FLUENTBIT_LOG_LEVEL`                 | Log Level `info` `warn` `error` `debug` `trace`                                                  | `info`                   |
| `FLUENTBIT_LOG_PATH`                  | Log Path                                                                                         | `/var/log/fluentbit/`    |
| `FLUENTBIT_MODE`                      | Type of operation - Client `NORMAL` or Proxy `PROXY`                                             | `NORMAL`                 |
| `FLUENTBIT_OUTPUT_FORWARD_HOST`       | Where to forward Fluent-Bit data to                                                              | `fluent-proxy`           |
| `FLUENTBIT_OUTPUT_FORWARD_TLS_VERIFY` | Verify certificates when using TLS                                                               | `FALSE`                  |
| `FLUENTBIT_OUTPUT_FORWARD_TLS`        | Enable TLS when forwading                                                                        | `FALSE`                  |
| `FLUENTBIT_OUTPUT_LOKI_HOST`          | Host for Loki Output                                                                             | `loki`                   |
| `FLUENTBIT_OUTPUT_LOKI_PORT`          | Port for Loki Output                                                                             | `3100`                   |
| `FLUENTBIT_OUTPUT_LOKI_TLS`           | Enable TLS For Loki Output                                                                       | `FALSE`                  |
| `FLUENTBIT_OUTPUT_LOKI_TLS_VERIFY`    | Enable TLS Certificate Verification For Loki Output                                              | `FALSE`                  |
| `FLUENTBIT_OUTPUT_LOKI_USER`          | (optional) Username to authenticate to Loki Server                                               | ``                       |
| `FLUENTBIT_OUTPUT_LOKI_PASS`          | (optional) Password to authenticate to Loki Server                                               | ``                       |
| `FLUENTBIT_OUTPUT_TENANT_ID`          | (optional) Tenant ID to pass to Loki Server                                                      | ``                       |
| `FLUENTBIT_OUTPUT`                    | Output plugin to use `LOKI` , `FORWARD`, `NULL`                                                  | `FORWARD`                |
| `FLUENTBIT_TAIL_BUFFER_CHUNK_SIZE`    | Buffer Chunk Size for Tail                                                                       | `32k`                    |
| `FLUENTBIT_TAIL_BUFFER_MAX_SIZE`      | Maximum size for Tail                                                                            | `32k`                    |
| `FLUENTBIT_TAIL_READ_FROM_HEAD`       | Read from Head instead of Tail                                                                   | `FALSE`                  |
| `FLUENTBIT_TAIL_SKIP_EMPTY_LINES`     | Skip Empty Lines when Tailing                                                                    | `TRUE`                   |
| `FLUENTBIT_TAIL_SKIP_LONG_LINES`      | Skip Long Lines when Tailing                                                                     | `TRUE`                   |
| `FLUENTBIT_TAIL_DB_ENABLE`            | Enable Offset DB per tracked file (will be same name as log file yet hidden and a suffix of `db` | `TRUE`                   |
| `FLUENTBIT_TAIL_DB_SYNC`              | DB Sync Type `normal` or `full`                                                                  | `normal`                 |
| `FLUENTBIT_TAIL_DB_LOCK`              | Lock access to DB File                                                                           | `TRUE`                   |
| `FLUENTBIT_TAIL_DB_JOURNAL_MODE`      | Journal Mode for DB `WAL` `DELETE` `TRUNCATE` `PERSIST` `MEMORY` `OFF`                           | `WAL`                    |
| `FLUENTBIT_TAIL_KEY_PATH_ENABLE`      | Enable sending Key for Log Filename/Path                                                         | `TRUE`                   |
| `FLUENTBIT_TAIL_KEY_PATH`             | Path Key Name                                                                                    | `filename`               |
| `FLUENTBIT_TAIL_KEY_OFFSET_ENABLE`    | Enable sending Key for Offset in Log file                                                        | `FALSE`                  |
| `FLUENTBIT_TAIL_KEY_OFFSET`           | Offset Path Key Name                                                                             | `offset`                 |
| `FLUENTBIT_SETUP_TYPE`                | Automatically generate configuration based on these variables `AUTO` or `MANUAL`                 | `AUTO`                   |
| `FLUENTBIT_STORAGE_BACKLOG_LIMIT`     | Maximum about of memory to use for backlogged/unsent records                                     | `5M`                     |
| `FLUENTBIT_STORAGE_CHECKSUM`          | Create CRC32 checkcum for filesystem RW functions                                                | `FALSE`                  |
| `FLUENTBIT_STORAGE_PATH`              | Absolute file system path to store filesystem data buffers                                       | `/tmp/fluentbit/storage` |
| `FLUENTBIT_STORAGE_SYNC`              | Synchronization mode to store data in filesystem `normal` or `full`                              | `normal`                 |

#### Permissions

If you wish to change the internal id for users and groups you can set environment variables to do so.
e.g. If you add `USER_NGINX=1000` it will reset the containers `nginx` user id from `82` to `1000` -

If you enable `DEBUG_PERMISSIONS=TRUE` all the users and groups have been modified in accordance with
environment variables will be displayed in output.

Hint, also change the Group ID to your local development users UID & GID and avoid Docker permission issues when developing.

| Parameter                         | Description                                                                 |
| --------------------------------- | --------------------------------------------------------------------------- |
| `CONTAINER_USER_<USERNAME>`       | The user's UID in /etc/passwd will be modified with new UID                 |
| `CONTAINER_GROUP_<GROUPNAME>`     | The group's GID in /etc/group and /etc/passwd will be modified with new GID |
| `CONTAINER_GROUP_ADD_<GROUPNAME>` | The username will be added in /etc/group after the group name defined       |

#### Process Watchdog

This is experimental functionality to call an external script before a process is executed.

Sample use cases:

- Alert slack channel when process has executed more than once
- Disable process from executing further if restarted 50 times
- Write to an additional log file..
- Change a file to display "Under Maintenance" on a webserver if this process isn't supposed to be run more than 1 time.


It will pass 5 arguments to a bash script titled the same name as the executing script or if not found, use the default `CONTAINER_PROCESS_HELPER_SCRIPT` below. Drop your files into the `CONTAINER_PROCESS_HELPER_PATH`.

For example, if `04-scheduling` was starting, it would look for `$CONTAINER_PROCESS_HELPER_PATH/04-scheduling` and if found execute it while passing the following arguments: DATE,TIME,SCRIPT_NAME,TIMES EXECUTED,HOSTNAME

e.g: `2021-07-01 23:01:04 04-scheduling 2 container`

Use the values in your own bash script using the `$1` `$2` `$3` `$4` `$5` syntax.
Change time and date and settings with these environment variables

| Parameter                           | Description                           | Default                            |
| ----------------------------------- | ------------------------------------- | ---------------------------------- |
| `CONTAINER_PROCESS_HELPER_PATH`     | Path to file external helper scripts  | `/assets/container/processhelper/` |
| `CONTAINER_PROCESS_HELPER_SCRIPT`   | Default helper script name            | `processhelper.sh`                 |
| `CONTAINER_PROCESS_HELPER_DATE_FMT` | Date format passed to external script | `%Y-%m-%d`                         |
| `CONTAINER_PROCESS_HELPER_TIME_FMT` | Time format passed to external script | `%H:%M:%S`                         |

### Networking

The following ports are exposed.

| Port    | Description  |
| ------- | ------------ |
| `10050` | Zabbix Agent |

## Developing / Overriding

This base image has been used over a hundred times to successfully build secondary images. My methodology is admittedly straying from the "one process per container" rule, however this methodology allows me to put together images at a rapid pace, and if more complex scalability is required, the work is split into their own individual images. Since you are reading this here's a crash course at how the image works: (WIP):

See `/assets/functions/00-container` for more detailed documentation for the various commands and functions/shortcuts

- Put defaults in `/assets/defaults/(script name)`
- Put functions in `/assets/functions/(script name)`
- Put Initialization script in `/etc/cont-init.d/(script name)`

  Put at the top:

````bash
#!/command/with-contenv bash          # Pull in Container Environment Variables from Dockerfile/Docker Runtime
source /assets/functions/00-container # Pull in all custom container functions from this image
prepare_service single                # Read functions and defaults only from files matching this script filename - see detailed docs for more
PROCESS_NAME="process"                # set the prefix for any logging

.. your scripting ..
print_info "This an INFO log"
print_warn "This a WARN log"
print_error "This is a ERROR log"

liftoff                               # this writes to the state files at /tmp/state to prove the script executed properly see CONTAINER_SKIP_SANITY_CHECK
````

- Put Services script in `/etc/services.available/(script name)`

  Put at the top:

````bash
#!/command/with-contenv bash          # Pull in Container Environment Variables from Dockerfile/Docker Runtime
source /assets/functions/00-container # Pull in all custom container functions from this image
prepare_service defaults single       # Read defaults only from files matching this script filename - see detailed docs for more
PROCESS_NAME="process"                # set the prefix for any logging

check_container_initialized           # Check to make sure that the container properly initialized before proceeding
check_service_initialized init        # Check to see if the cont-init.d/scriptname executed correctly, otherwise wait until it has done
liftoff                               # Prove script was able to execute properly

print_start "Starting processname"    # Show STARTING log prefix, and also show if enabled a counter, and execute process watchdog script
fakeprocess (args)                    # whatever your process you want to start is
````

| Parameter                         | Description                                                                    | Default     |
| --------------------------------- | ------------------------------------------------------------------------------ | ----------- |
| `CONTAINER_ENABLE_DOCKER_SECRETS` | Check Docker Secrets when checking for environment variables                   | `TRUE`      |
| `CONTAINER_SKIP_SANITY_CHECK`     | Skip the checking to see if all scripts in /etc/cont-init.d executed correctly | `FALSE`     |
| `DEBUG_MODE`                      | Show all script output (set -x)                                                | `FALSE`     |
| `PROCESS_NAME`                    | Used for prefixing the script that is running                                  | `container` |

## Debug Mode

When using this as a base image, create statements in your startup scripts to check for existence of `DEBUG_MODE=TRUE`
and set various parameters in your applications to output more detail, enable debugging modes, and so on.
In this base image it does the following:

* Sets zabbix-agent to output logs in verbosity
* Shows all script output (equivalent to set -x)

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
