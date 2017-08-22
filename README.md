# hub.docker.com/tiredofit/alpine

# Introduction

Dockerfile to build an [alpine](https://www.alpinelinux.org/) container image.

* Currently tracking 3.4, 3.5, 3.6, and edge
* [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 Init capabilities
* [zabbix-agent](https://zabbix.org) based on TRUNK compiled for individual container monitoring.
* Cron installed along with other tools (bash,curl, less, logrotate, nano, vim) for easier management.

# Authors

- [Dave Conroy](dave at tiredofit dot ca) [https://github.com/tiredofit]

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

No prequisites required

# Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/tiredofit/alpine) and 
is the recommended method of installation.


```bash
docker pull tiredofit/alpine:(imagetag)
```

The following image tags are available:

* `3.4:latest` - Alpine 3.4
* `3.5:latest` - Alpine 3.5
* `3.6:latest` - Alpine 3.6
* `edge:latest` - Alpine edge


# Quick Start

Utilize this image as a base for further builds. By default it does not start the S6 Overlay system, but 
Bash. Please visit the [s6 overlay repository](https://github.com/just-containers/s6-overlay) for 
instructions on how to enable the S6 Init system when using this base or look at some of my other images 
which use this as a base.

# Configuration

### Data-Volumes
The following directories are used for configuration and can be mapped for persistent storage.

| Directory                           | Description                 |
|-------------------------------------|-----------------------------|
| `/etc/zabbix/zabbix_agentd.conf.d/` | Root tinc Directory         |



### Environment Variables

Below is the complete list of available options that can be used to customize your installation.

| Parameter         | Description                                                    |
|-------------------|----------------------------------------------------------------|
| `ZABBIX_HOSTNAME` | Generally the container name - For matching with Zabbix Server |

### Networking

The following ports are exposed.

| Port      | Description  |
|-----------|--------------|
| `10050`   | Zabbix Agent |


# Maintenance
#### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. alpine) bash
```

# References

* https://www.alpinelinux.org



 
