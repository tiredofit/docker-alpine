## 7.8.28 2024-04-27 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 3.0.3


## 7.8.27 2024-04-12 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 3.0.2


## 7.8.26 2024-04-04 <dave at tiredofit dot ca>

   ### Added
      - Fluent-Bit 3.0.1


## 7.8.25 2024-03-25 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.4.13


## 7.8.24 2024-03-21 <dave at tiredofit dot ca>

   ### Added
      - Fluent-Bit 3.0.0


## 7.8.23 2024-02-26 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.4.12


## 7.8.22 2024-02-02 <dave at tiredofit dot ca>

   ### Changed
      - Fix issue with creating blank files on startup


## 7.8.21 2024-02-01 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.4.11


## 7.8.20 2023-12-13 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.4.10


## 7.8.19 2023-12-08 <dave at tiredofit dot ca>

   ### Changed
      - Fix issues with service_stop function


## 7.8.18 2023-12-05 <dave at tiredofit dot ca>

   ### Changed
      - Mod service_stop function to not pass DONOTSTART when turning off a different service"


## 7.8.17 2023-11-09 <dave at tiredofit dot ca>

   ### Added
      - Fluent-Bit 2.2.0


## 7.8.16 2023-11-08 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.4.8


## 7.8.15 2023-11-06 <dave at tiredofit dot ca>

   ### Added
      - S6 Overlay 3.16.0


## 7.8.14 2023-10-24 <dave at tiredofit dot ca>

   ### Changed
      - Restore building Zabbix Agent 2 with Alpine Edge/3.19


## 7.8.13 2023-10-24 <dave at tiredofit dot ca>

   ### Changed
      - Prepare for imminent Alpine 3.19 release


## 7.8.12 2023-09-28 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.4.7
      - Fluent-bit 2.1.10
      - Add option for gzip compression for fluent-bit output/loki


## 7.8.7 2023-08-23 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.4.6
      - Golang build 1.21.0
      - YQ 4.35.1
      - Add SMTP_FROM_OVERRIDE option (credit coolibre@github)


## 7.8.6 2023-07-28 <dave at tiredofit dot ca>

   ### Added
      - Golang 1.20.6 build chain
      - YQ 4.34.2
      - Fluent-bit 2.1.8

   ### Changed
      - Modify db_ready routines to accomodate for MariaDB 11 binary name changes


## 7.8.5 2023-06-27 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.4.4


## 7.8.4 2023-06-23 <dave at tiredofit dot ca>

   ### Added
      - Fluent-Bit 2.1.6


## 7.8.3 2023-06-20 <dave at tiredofit dot ca>

   ### Added
      - Fluent-Bit 2.1.5


## 7.8.2 2023-05-09 <dave at tiredofit dot ca>

   ### Added
      - Introduce Alpine 3.18


## 7.8.1 2023-05-03 <dave at tiredofit dot ca>

   ### Added
      - Golang 1.20.4

   ### Changed
      - Cleanup


## 7.8.0 2023-04-26 <dave at tiredofit dot ca>

   ### Added
      - Introduce _FILE support for environment variables
      - Quiet down DEBUG MODE for "base image" services
      - Zabbix Agent 6.4.2
      - Fluent Bit 2.1.2


## 7.7.58 2023-04-21 <dave at tiredofit dot ca>

   ### Added
      - FluentBit 2.1.1


## 7.7.57 2023-04-05 <dave at tiredofit dot ca>

   ### Added
      - Go build 1.20.3
      - Fluent-bit 2.0.11


## 7.7.56 2023-04-03 <dave at tiredofit dot ca>

   ### Added
      - S6 Overlay 3.14.2


## 7.7.55 2023-03-31 <dave at tiredofit dot ca>

   ### Added
      - YQ 4.33.1
      - Zabbix Agent 6.4.1


## 7.7.54 2023-03-26 <dave at tiredofit dot ca>

   ### Added
      - YQ v4.33.1


## 7.7.53 2023-03-16 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 2.0.10
      - Use Golang 1.20.1 for building again


## 7.7.52 2023-03-07 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.4.0
      - Support upcoming Alpine 3.18
      - Remove .gitconfig from /root/ during package cleanup

   ### Changed
      - Drop vim and rely on busybox vi


## 7.7.51 2023-02-21 <dave at tiredofit dot ca>

   ### Added
      - S6 Overlay 3.1.4.1


## 7.7.50 2023-02-20 <dave at tiredofit dot ca>

   ### Added
      - YQ 4.31.1


## 7.7.49 2023-02-17 <dave at tiredofit dot ca>

   ### Added
      - S6 Overlay 3.14.0


## 7.7.48 2023-02-15 <dave at tiredofit dot ca>

   ### Changed
      - Additional doas fixes


## 7.7.46 2023-02-14 <dave at tiredofit dot ca>

   ### Changed
      - Fix for grant_doas function saving to wrong location and set appropriate permissions


## 7.7.45 2023-02-06 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 2.0.9
      - Zabbix Agent 6.2.7
      - YQ 4.30.8
      - Go 1.20 build environment


## 7.7.44 2022-12-31 <dave at tiredofit dot ca>

   ### Changed
      - Change to `service_` commands - New addition `service_list` and also `service_reset` to reset watchdog status to avoid having to restart container after triggered
      - `service_down` and `service_up` also take `all` argument to bring up or down all services


## 7.7.43 2022-12-23 <dave at tiredofit dot ca>

   ### Added
      - Fluent-Bit 2.0.8


## 7.7.42 2022-12-22 <dave at tiredofit dot ca>

   ### Changed
      - No need to even think about building yq for <3.10


## 7.7.41 2022-12-22 <dave at tiredofit dot ca>

   ### Added
      - Start building yq package for variants that support building zabbix-agent2 - Warning, 'jq' will be removed in a future release
      - prepare_service on cont-init.d folders ingests variables differently


## 7.7.40 2022-12-12 <dave at tiredofit dot ca>

   ### Added
      - Golang building 1.19.4

   ### Changed
      - Allow clone_git_repo to shallow clone and still perform git describe on tags


## 7.7.39 2022-12-11 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.2.6


## 7.7.38 2022-12-05 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Zabbix volatile data permissions


## 7.7.37 2022-11-30 <dave at tiredofit dot ca>

   ### Changed
      - Fix quoting issue with package remove


## 7.7.36 2022-11-29 <dave at tiredofit dot ca>

   ### Changed
      - Quiet down package function


## 7.7.35 2022-11-29 <dave at tiredofit dot ca>

   ### Changed
      - Handle better dependencies with package remove


## 7.7.34 2022-11-29 <dave at tiredofit dot ca>

   ### Added
      - Introduce "package" function


## 7.7.33 2022-11-25 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 2.0.6


## 7.7.32 2022-11-22 <dave at tiredofit dot ca>

   ### Added
      - Introduce Alpine 3.17 Using OpenSSL instead of LibreSSL


## 7.7.31 2022-11-11 <dave at tiredofit dot ca>

   ### Added
      - Golang build 1.19.3
      - Fluent-bit 2.0.5


## 7.7.30 2022-11-08 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 2.0.4


## 7.7.29 2022-11-07 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.2.4


## 7.7.28 2022-10-29 <dave at tiredofit dot ca>

   ### Added
      - Fluent-Bit 2.0.3


## 7.7.27 2022-10-27 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 2.0.2


## 7.7.26 2022-10-25 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 2.0.0
      - Golang build environment 1.19.2


## 7.7.25 2022-10-04 <dave at tiredofit dot ca>

   ### Changed
      - Death by if statements


## 7.7.24 2022-10-04 <dave at tiredofit dot ca>

   ### Changed
      - For real, fix for clone_git_repo and .git urls


## 7.7.23 2022-10-03 <dave at tiredofit dot ca>

   ### Changed
      - Final clone_git_repo modifications


## 7.7.22 2022-10-03 <dave at tiredofit dot ca>

   ### Changed
      - Additional changes to clone_git_repo function


## 7.7.21 2022-10-01 <dave at tiredofit dot ca>

   ### Added
      - Add custom_dir functionality for clone_git_repo


## 7.7.20 2022-10-01 <dave at tiredofit dot ca>

   ### Changed
      - Start pulling submodules with clone_git_repo function


## 7.7.19 2022-10-01 <dave at tiredofit dot ca>

   ### Changed
      - Tweak to update_templates function to allow wildcards


## 7.7.18 2022-09-29 <dave at tiredofit dot ca>

   ### Added
      - Add bash to be default interpreter when building descendent images

   ### Changed
      - Refine clone_git_repo function


## 7.7.17 2022-09-29 <dave at tiredofit dot ca>

   ### Changed
      - Add check for git for clone_git_repo


## 7.7.16 2022-09-29 <dave at tiredofit dot ca>

   ### Added
      - Add gettext package


## 7.7.15.1 2022-09-29 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Alpine Edge not building


## 7.7.14 2022-09-29 <dave at tiredofit dot ca>

   ### Added
      - Introduce clone_git_repo function for bandwidth and space saving purposes
      - Introduce install_template function for copying files with correct permissions
      - Introduce update_template to update tags in template files - Create templates tags like {{VALUE}} in your files to update


## 7.7.13 2022-09-29 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.9.9
      - Golang for building 1.19.1


## 7.7.12 2022-09-21 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.2.3


## 7.7.11 2022-09-11 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.9.8


## 7.7.10 2022-09-05 <terryzwt@github>

   ### Fixed
      - MSMTP Configuration doesn't like all caps letters


## 7.7.9 2022-08-30 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.2.2
      - S6 Overlay 3.1.2.1


## 7.7.8 2022-08-17 <dave at tiredofit dot ca>

   ### Changed
      - Start taking over pid process of services.available scripts


## 7.7.7 2022-08-15 <dave at tiredofit dot ca>

   ### Changed
      - Change to Fail2ban Group ID due to original gid not able to be used with LXC (credit: MariaWitch@github)


## 7.7.6 2022-08-12 <dave at tiredofit dot ca>

   ### Changed
      - Make logrotate use /etc/logrotate.conf as master configuration


## 7.7.5 2022-08-11 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.9.7
      - Customizable compssion types for logrotate, now defaults to using zstd
      - Function for zcat to handle bz/xz/gz/zst

   ### Changed
      - Fix error when CRON_PERIOD exists as a default or environment variable


## 7.7.4 2022-08-06 <dave at tiredofit dot ca>

   ### Added
      - Add third and fourth argument to custom_files function to change ownership post copy


## 7.7.3 2022-08-06 <dave at tiredofit dot ca>

   ### Changed
      - Additional fix to custom_scripts function


## 7.7.2 2022-08-05 <dave at tiredofit dot ca>

   ### Changed
      - Fix for custom_scripts function not firing properly


## 7.7.1 2022-08-05 <dave at tiredofit dot ca>

   ### Changed
      - Fix CONTAINER_POST_INIT_COMMAND feature


## 7.7.0 2022-08-05 <dave at tiredofit dot ca>

   ### Added
      - Firewall Support - Now have the capability of either loading an iptables.rules file or using environment variables to set individual IPTables rules inside the container
      - Fail2Ban Support - Along with above, embed fail2ban within the container rather than having it maintained downstream in many images. Drop your jails and filters in /etc/fail2ban/filters.d and /etc/fail2ban/jails.d
      - Go 1.19.0 build chain


## 7.6.27 2022-07-27 <dave at tiredofit dot ca>

   ### Added
      - Add option to show application output on the final execution before the process runaway guard is activated


## 7.6.26 2022-07-27 <dave at tiredofit dot ca>

   ### Changed
      - Quiet down dir_empty and dir_notempty functions


## 7.6.25 2022-07-26 <dave at tiredofit dot ca>

   ### Added
      - Additional work related to 7.6.21


## 7.6.24 2022-07-25 <dave at tiredofit dot ca>

   ### Changed
      - Bring to feature parity of tiredofit/debian


## 7.6.23 2022-07-25 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.9.6
      - Zabbix Agent 6.2.1


## 7.6.22 2022-07-18 <dave at tiredofit dot ca>

   ### Changed
      - Further refinements to version lookup routines


## 7.6.21 2022-07-18 <dave at tiredofit dot ca>

   ### Changed
      - Zabbix montioring defaults fix for Alpine Edge


## 7.6.20 2022-07-07 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.2.0


## 7.6.19 2022-07-05 <dave at tiredofit dot ca>

   ### Changed
      - Add blank /etc/fluent-bit/parsers.d directory


## 7.6.18 2022-07-05 <dave at tiredofit dot ca>

   ### Changed
      - Fix issues relating to Fluent-Bit not parsing files properly due to logrotate shift


## 7.6.17 2022-07-04 <dave at tiredofit dot ca>

   ### Changed
      - Add Version ARG for FROM command in Dockerfile


## 7.6.16 2022-06-29 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.0.6
      - S6 Overlay 3.1.1.2


## 7.6.15 2022-06-24 <dave at tiredofit dot ca>

   ### Added
      - Bring to parity with tiredofit/debian

   ### Changed
      - - Fix some issues with Pre Alpine 3.11 installations
      - - Fix issues with Alpine 3.5 bash version container initialization routines


## 7.6.11 2022-06-24 <dave at tiredofit dot ca>

   ### Added
      - Add yaml package for running fluent-bit


## 7.6.10 2022-06-23 <dave at tiredofit dot ca>

   ### Changed
      - Add yaml-dev package as a dependency for fluent-bit


## 7.6.9 2022-06-23 <dave at tiredofit dot ca>

   ### Added
      - S6 Overlay 3.1.1.1
      - Fluent Bit 1.9.5


## 7.6.8 2022-06-22 <dave at tiredofit dot ca>

   ### Changed
      - Rollback to S6 Overlay v3.1.0.1
      - Minor fix with logrotate directory handling


## 7.6.7 2022-06-17 <dave at tiredofit dot ca>

   ### Added
      - S6 Overlay 3.1.1.0


## 7.6.6 2022-06-15 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.9.4


## 7.6.5 2022-06-03 <dave at tiredofit dot ca>

   ### Added
      - Update init scripts to allow to run on Ubuntu


## 7.6.4 2022-06-01 <dave at tiredofit dot ca>

   ### Added
      - Build with Golang 1.18.3


## 7.6.3 2022-05-30 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.0.5


## 7.6.2 2022-05-24 <dave at tiredofit dot ca>

   ### Added
      - Introduce Alpine 3.16 builds

   ### Changed
      - Change for bash prompt when working in container to show path


## 7.6.1 2022-05-03 <dave at tiredofit dot ca>

   ### Changed
      - Zabbix Agent 6.0.4


## 7.6.0 2022-04-30 <dave at tiredofit dot ca>

   ### Changed
      - Move /etc/logrotate.d assets to /assets/logrotate to avoid packages being upgraded auto adding more configuration


## 7.5.7 2022-04-05 <dave at tiredofit dot ca>

   ### Changed
      - Additional fixes to support edge / 3.16


## 7.5.6 2022-04-05 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.0.3
      - Fix for Fluent bit and Zabbix Agent not building on Alpine edge


## 7.5.5 2022-03-30 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Fluentbit compilation on 3.11+


## 7.5.4 2022-03-23 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.8.15


## 7.5.2 2022-03-18 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.8.14


## 7.5.1 2022-03-16 <dave at tiredofit dot ca>

   ### Added
      - Build Zabbix Agent with Go 1.18


## 7.5.0 2022-03-15 <dave at tiredofit dot ca>

   ### Added
      - Introduce Container File Logging support


## 7.4.2 2022-03-14 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.0.2

   ### Changed
      - Patchup for the warm / cold container startup routines


## 7.4.1 2022-03-11 <dave at tiredofit dot ca>

   ### Added
      - Add CONTAINER_PROCESS_RUNAWAY_PROTECTOR function to disable a service from restarting (X) amount of times and taking down a system


## 7.4.0 2022-03-10 <dave at tiredofit dot ca>

   ### Changed
      - Change /tmp/.container to /tmp/.container
      - Add logic to tell when a container was started and when it was warm started


## 7.3.9 2022-03-08 <dave at tiredofit dot ca>

   ### Added
      - S6 Overlay 3.1.0.1


## 7.3.8 2022-03-02 <dave at tiredofit dot ca>

   ### Added
      - Add CONTAINER_POST_INIT_SCRIPT and CONTAINER_POST_INIT_COMMAND environment variables to either execute scripts or commands at the very end of the container initialization process


## 7.3.7 2022-03-02 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.8.13


## 7.3.6 2022-03-01 <dave at tiredofit dot ca>

   ### Added
      - Zabbix 6.0.1
      - S6 Overlay 3.0.0.2-2 (3.0.10.0??)
      - GoLang 1.17.7 for building


## 7.3.5 2022-02-15 <dave at tiredofit dot ca>

   ### Changed
      - Add truefalse_onezero function


## 7.3.4 2022-02-14 <dave at tiredofit dot ca>

   ### Changed
      - Fix breaking change on restricting downstream images relying on Zabbix sudo


## 7.3.3 2022-02-14 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 6.0.0


## 7.3.2 2022-02-11 <dave at tiredofit dot ca>

   ### Changed
      - Fix for cron logs not writing properly


## 7.3.1 2022-02-10 <dave at tiredofit dot ca>

   ### Changed
      - Disable service timeout for images that take longer than 5 seconds to boot


## 7.3.0 2022-02-07 <dave at tiredofit dot ca>

   ### Added
      - S6 Overlay 3.0.0.2
      - FluentBit 1.7.12
      - Zabbix Agent 5.4.10
      - New functions (create_zabbix) for easier development
      - doas package for eventual replacement of sudo
      - Added new helpers on command line (service_up/service_down/changelog/version)
      - Added banner showing image name and version upon startup
      - Custom Bash Prompt when entering in container

   ### Changed
      - Stop relying on /usr/bin/with-contenv - Instead use recommended /command/ folder as outlined in S6 overlay documentation
      - Cleanup of code and allow for CaMeLCasE environment variables (specifically for var_true/var_false and others)
      - Many optimizations and cleanup of scripts for pure modernization sake

   ### Removed
      - Removed fix-attrs.d reliance due to deprecation by S6 Overlay

## 7.2.19 2022-01-20 <dave at tiredofit dot ca>

   ### Changed
      - Rework again db_ready command for MySQL / MariaDB


## 7.2.18 2022-01-06 <dave at tiredofit dot ca>

   ### Changed
      - Change to db_ready mariadb command to accomodate for Percona / MySQL 5.7 + without needing PROCESS privileges


## 7.2.17 2021-12-27 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 5.4.9


## 7.2.16 2021-12-21 <zeridon@github>

   ### Fixed
      - Actually disable "messaging" via both environment variables

## 7.2.15 2021-12-21 <dave at tiredofit dot ca>

   ### Added
      - Add jq package


## 7.2.14 2021-12-17 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.8.11


## 7.2.13 2021-12-15 <dave at tiredofit dot ca>

   ### Changed
      - Fix for 7.2.12


## 7.2.12 2021-12-15 <dave at tiredofit dot ca>

   ### Added
      - Add fluentbit auto registration


## 7.2.11 2021-12-15 <dave at tiredofit dot ca>

   ### Changed
      - Do the same for cleanup for Autoregister DNS_Name as Autoregister


## 7.2.10 2021-12-13 <dave at tiredofit dot ca>

   ### Added
      - Add option to control autoregistration
      - Add option to register via DNS instead of IP address for Zabbix Autoregistration


## 7.2.9 2021-12-10 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Zabbix Container OS detection


## 7.2.8 2021-12-10 <dave at tiredofit dot ca>

   ### Changed
      - Tweak to Zabbix configuration folder permissions


## 7.2.7 2021-12-08 <dave at tiredofit dot ca>

   ### Changed
      - Stop writing multiple HostMetaData strings in Zabbix configuration


## 7.2.6 2021-12-06 <dave at tiredofit dot ca>

   ### Changed
      - Move Zabbix Autoregister to later in the boot process to ensure all scripts are complete


## 7.2.5 2021-12-06 <dave at tiredofit dot ca>

   ### Added
      - Add zabbix_get to image


## 7.2.4 2021-12-03 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Docker build


## 7.2.3 2021-12-03 <dave at tiredofit dot ca>

   ### Added
      - Introduce Autoregister support by parsing /etc/zabbix/zabbix_agent.conf.d/*.conf files looking for '# Autoregister =' - See README


## 7.2.2 2021-12-03 <dave at tiredofit dot ca>

   ### Changed
      - Consolidate Zabbix container agent checks into one autogenerated file and add Autoregister header
      - Tighten up security to Zabbix config and log folders


## 7.2.1 2021-12-03 <dave at tiredofit dot ca>

   ### Changed
      - Move Zabbix Agent Pid and Socket to private directory


## 7.2.0 2021-12-03 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix Agent PSK encryption support


## 7.1.26 2021-11-29 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 5.4.8
      - Go 1.17.3


## 7.1.25 2021-11-25 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Zabbix Agent OS checking


## 7.1.24 2021-11-19 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.8.10


## 7.1.23 2021-10-28 <dave at tiredofit dot ca>

   ### Changed
      - Don't build go unless we absoutely have to


## 7.1.22 2021-10-28 <dave at tiredofit dot ca>

   ### Changed
      - Compile go manually to continue installing Zabbix Agent 2


## 7.1.21 2021-10-28 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.8.9
      - Zabbix Agent 5.4.7


## 7.1.20 2021-10-28 <dave at tiredofit dot ca>

   ### Changed
      - Disable Time Formatting for Zabbix Fluent-bit parsing


## 7.1.19 2021-10-22 <dave at tiredofit dot ca>

   ### Added
      - Added new features and defaults for Fluent-Bit Tail Input Plugin


## 7.1.18 2021-10-13 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 5.4.5
      - Fluent-Bit 1.8.8


## 7.1.17 2021-09-23 <dave at tiredofit dot ca>

   ### Changed
      - Fix fluent-bit log parsing configuration


## 7.1.16 2021-09-22 <dave at tiredofit dot ca>

   ### Changed
      - Revert back to Fluent bit 1.8.6


## 7.1.15 2021-09-19 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.8.7


## 7.1.14 2021-09-05 <dave at tiredofit dot ca>

   ### Changed
      - Unmatched sed statement


## 7.1.13 2021-09-05 <dave at tiredofit dot ca>

   ### Changed
      - Fix for multiple parsers being added to all configuration files in fluent-bit


## 7.1.12 2021-09-04 <dave at tiredofit dot ca>

   ### Changed
      - Change syntax for create_logrotate


## 7.1.11 2021-09-04 <dave at tiredofit dot ca>

   ### Changed
      - Fixes for create_logrotate function outputting unneccessary su's
      - Fix for Zabbix Agent logrotate/fluent-bit config


## 7.1.10 2021-09-03 <dave at tiredofit dot ca>

   ### Changed
      - Cleanup logrotate for fluentbit


## 7.1.9 2021-09-03 <dave at tiredofit dot ca>

   ### Changed
      - Properly read wildcards as wildcards for configuration for fluent bit logortate


## 7.1.8 2021-09-01 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.8.6

   ### Changed
      - Set SMTP_AUTO_FROM default to FALSE
      - Quiet down a grep statement when looking for logs to parse with fluent-bit


## 7.1.7 2021-08-31 <dave at tiredofit dot ca>

   ### Changed
      - Fix double slashes in logrotation paths if auto generated


## 7.1.6 2021-08-31 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Fluent-bit Zabbix Agent2 Parsing


## 7.1.5 2021-08-30 <dave at tiredofit dot ca>

   ### Added
      - Fluent-bit 1.8.5


## 7.1.4 2021-08-30 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 5.4.4


## 7.1.3 2021-08-30 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix Agent (classic/modern) Log Shipping parsers for fluent-bit


## 7.1.2 2021-08-30 <dave at tiredofit dot ca>

   ### Changed
      - Change references from 'edge' to 3.15 when looking at os-release


## 7.1.1 2021-08-27 <dave at tiredofit dot ca>

   ### Added
      - Add TLS Verification for LOKI Output plugin (Logshipping/Fluent-bit)


## 7.1.0 2021-08-25 <dave at tiredofit dot ca>

   ### Added
      - Fluent-Bit 1.8.3 - Only available for Alpine 3.11 and up
      - Customize the amount of days logrotate retains archived logs
      - New CONTAINER_NAME variable that is used for Monitoring and log shipping
      - Auto configuration of output plugins for Fluent-Bit (NULL, LOKI, Forward/FluentD)
      - Auto configuration of Log shipping for files already setup to use log rotation
      - Multiple Parsers support for Log Shipping
      - Add new log to ship via fluent-bit via environment variable

   ### Changed
      - Change SMTP_TLS, SMTP_STARTTLS, SMTP_TLSCERTCHECK from "on/off" values to `TRUE|FALSE`
      - Fix for MSMTP backend not properly accounting for legacy variables (ENABLE_SMTP)

## 7.0.3 2021-08-04 <dave at tiredofit dot ca>

   ### Added
      - Bring monitoring cont-init.d script up to parity with debian side for ease of codebase


## 7.0.2 2021-07-26 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Zabbix Agent 2 File Logging


## 7.0.1 2021-07-25 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 5.4.3

   ### Changed
      - Change the location where Zabbix Agent logs


## 7.0.0 2021-07-05 <dave at tiredofit dot ca>

Major changes to this base image, reworking technical debt, creating consistency, and building hooks and expansion capabilities for future purposes.

   ### Added
      - Log Shipping support, presently supporting Fluent Bit (x86_64 only)
      - Zabbix Agent 5.4.2
      - Zabbix Agent 2 (modern/go) included, 1 (classic/c) still remains
      - Dyanmically add crontab entries via CRON_* environment variables
      - Prefix container logs with Timestamp
      - Process watchdog support should a process execute multiple times (hooks)
      - Development functions for ease of use

   ### Changed
      - Service Names, and order of execution
      - db_ready and sanity_db functions take additional arguments
      - Environment Variable names have changed, attempts have been made to ensure legacy variable names will still function but will be removed at a later date
      - Rewrote permissions changing routines from scratch

## 6.1.3 2021-06-18 <dave at tiredofit dot ca>

   ### Changed
      - Revert Changes introduces by 6.1.2 - Use LibreSSL


## 6.1.2 2021-06-17 <dave at tiredofit dot ca>

   ### Changed
      - Drop Libressl and reintroduce Openssl


## 6.1.1 2021-06-16 <dave at tiredofit dot ca>

   ### Added
      - Introduce Alpine 3.14 variants
      - Zabbix Agent 5.4.1


## 6.1.0 2021-05-27 <perarg@github>

   ### Fixed
      - Permissions adjustment script was broken on group assignment


## 6.0.2 2021-05-18 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 5.4.0


## 6.0.1 2021-05-10 <dave at tiredofit dot ca>

   ### Changed
      - Pin S6 as S6 Overlay gets deleted after certain packages get removed


## 6.0.0 2021-05-09 <dave at tiredofit dot ca>

  ### Changed
      - Switched back to single branch for building all versions taking advantage of GitHub actions
      - ENABLE_PERMISSIONS by default=TRUE
   ### Removed
      - MailHog SMTP Tester

## 5.2.1 2021-03-11 <dave at tiredofit dot ca>

   ### Added
      - S6 Overlay 2.2.0.3
      - Zabbix Agent 5.2.5


## 5.2.0 2021-01-21 <dave at tiredofit dot ca>

   ### Added
      - S6 Overlay 2.2.0.0
      - Multi Arch Buidls offered on Docker Hub


## 5.1.2 2020-12-28 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 5.2.3


## 5.1.1 2020-11-14 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 5.2.1
      - S6 Overlay 2.1.0.2


## 5.1.0 2020-09-20 <dave at tiredofit dot ca>

   ### Added
      - Multiarch Support (x86_64, armhf, aarch64, ppc64le)
      - S6 Overlay 2.1.0.0


## 5.0.7 2020-08-25 <dave at tiredofit dot ca>

   ### Changed
      - Fixed Zabbix Agent warning


## 5.0.6 2020-08-25 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 5.0.3


## 5.0.5 2020-08-11 <dave at tiredofit dot ca>

   ### Changed
      - Fix for container startup check script


## 5.0.4 2020-07-26 <dave at tiredofit dot ca>

   ### Added
      - Zabbix Agent 5.0.2


## 5.0.3 2020-06-15 <dave at tiredofit dot ca>

   ### Changed
      - Fix broken db_ready command


## 5.0.2 2020-06-15 <rusxakep@github>

   ### Changed
      - Bugfixes and code cleanup


## 5.0.1 2020-06-13 <dave at tiredofit dot ca>

   ### Added
      - Ability to disable logrotate


## 5.0.0 2020-06-10 <dave at tiredofit dot ca>

   ### Added
      - Split Defaults and Functions into seperate files for cleanliness
      - Additional functions to load defaults/functions per script
      - Additional functions for checking if files/directories/sockets/ports are available before proceeding
      - Cleanup Container functions file to satisy shellcheck

   ### Changed
      - All /etc/s6/services files moved to /etc/services.available - Legacy images that have not been updated will still function but will always execute

## 4.5.2 2020-04-20 <dave at tiredofit dot ca>

   ### Added
      - DEBUG_MODE can now take `script_name` as argument for debugging

   ### Changed
      - Rework container sanity check


## 4.5.1 2020-04-17 <dave at tiredofit dot ca>

   ### Added
      - Additional functions for timesaving/avoiding errors

   ### Changed
      - Rework variable helpers
      - Allow ability to use service_stop outside of the main script

## 4.5.0 2020-04-16 <dave at tiredofit dot ca>

   ### Added
      - Add new function for Docker Secrets Support
      - Add helper for checking if variables are TRUE or FALSE


## 4.4.4 2020-03-16 <dave at tiredofit dot ca>

   ### Changed
      - Spelling mistake in 4.4.3


## 4.4.3 2020-03-16 <dave at tiredofit dot ca>

   ### Changed
      - Patchup for Services that do not have initialization scripts


## 4.4.2 2020-03-16 <dave at tiredofit dot ca>

   ### Changed
      - Change msmtp configuraiton file location


## 4.4.1 2020-03-14 <dave at tiredofit dot ca>

   ### Changed
      - Fix when trying to disable Zabbix Monitoring throwing errors


## 4.4.0 2020-03-04 <dave at tiredofit dot ca>

   ### Added
      - Added new functions for service starting and stopping
      - Reworked how services are stopped and started to ensure nothing in services are executed until successful completion of init scripts. This bhas the potential of breaking all downstream images if they are not updated.
      - Rewrote SMTP confgiuration


## 4.3.0 2020-03-02 <dave at tiredofit dot ca>

   ### Added
      - New routine to cleanup /tmp/.container for users who only restart the container, not fully bring down and remove.


## 4.2.0 2020-02-12 <dave at tiredofit dot ca>

   ### Added
      - Reworked Debug Mode to quiet down output on core services and cut down on unnecessary noise
      - Reworked Container Initialization Check to clearly show which file hasn't successfully completed


## 4.1.5 2020-01-11 <dave at tiredofit dot ca>

   ### Changed
      - Additional fix for check_service_initialized function to properly look for finished /etc/s6/services processes

## 4.1.4 2020-01-11 <dave at tiredofit dot ca>

   ### Changed
      - Fix for check_service_initialized function to properly look for finished /etc/s6/services processes

## 4.1.3 2020-01-10 <dave at tiredofit dot ca>

   ### Changed
      - Remove code showing $dirname erronously on process startup

## 4.1.2 2020-01-10 <dave at tiredofit dot ca>

   ### Added
      - Quiet down sudo error
      - Zabbix 4.4.4 Agent


## 4.1.1 2020-01-02 <dave at tiredofit dot ca>

   ### Changed
      - check_service_initialized was throwing false information


## 4.1.0 2020-01-01 <dave at tiredofit dot ca>

   ### Added
      - Start splitting out Defaults into seperate /assets/functions/* files

   ### Changed
      - Cleanup of Permissions Changing routines

## 4.0.1 2020-01-01 <dave at tiredofit dot ca>

   ### Added
      - New text output for Notices

   ### Changed
      - Additional checks to ensure cont-init.d scripts have finished executing

## 4.0.0 2020-01-01 <dave at tiredofit dot ca>

   ### Added
      - Now relying on Container Level functions file
      - Easier methods for displaying console output
      - Colorized Prompts
      - Cleaner Startup Routines
      - Sanity Check to not start any processes until all startup scripts completed

    ### Changed
      - When DEBUG_MODE set stop taking over SMTP functionality. Require DEBUG_SMTP=TRUE instead

## 3.9.3 2019-12-20 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.11 Base


## 3.9.2 2019-08-23 <edisonlee at selfdesign dot org>

* Cleanup lines subversion.

## 3.9.1 2019-08-23 <edisonlee at selfdesign dot org>

* Cleanup variable.

## 3.9 2019-07-15 <dave at tiredofit dot ca>

* Add Busybox Extras

## 3.8.2 2019-04-06 <dave at tiredofit dot ca>

* S6 Overlay 1.22.1.0

## 3.8.1 2019-01-13 <dave at tiredofit dot ca>

* Cleanup Cache

## 3.8 2018-10-17 <dave at tiredofit dot ca>

* Force executible permissions on S6 Directories

## 3.7 2018-10-14 <dave at tiredofit dot ca>

* Bump Zabbix to 4.0

## 3.6 2018-09-19 <dave at tiredofit dot ca>

* Set +x on all descendents of /etc/s6/services

## 3.5 2018-07-27 <dave at tiredofit dot ca>

* Add TERM=xterm

## 3.4 2018-07-02 <dave at tiredofit dot ca>

* Revert back to using && \ instead of ; \ in Dockerfile
* Add ENABLE_GMAIL_SMTP environment variable thanks to @joeyberkovitz

## 3.3 2018-04-22 <dave at tiredofit dot ca>

* Update 01-permissions to quiet down if no UIDs changed.
* Refinements to MailHog, to always route through msmtp

## 3.2 2018-04-15 <dave at tiredofit dot ca>

* Update Zabbix UID/GID

## 3.1 2018-03-25 <dave at tiredofit dot ca>

* Update MailHog Test Server Startup

## 3.0 2018-03-14 <lesliesit at outlook dot com>

* Add 01-permissions script to support change uid & gid and add user to group:
* USER_<USERNAME>=<aNewNumber>
* GROUP_<GROUPNAME>=<aNewNumber>
* GROUP_ADD_<USERNAME>=<aGroupName>
* UID & GID in /etc/passwd & /etc/group will be modified.
* Old 01- 02- 03- scripts renamed after the new 01-permissions as 02- 03- 04-

## 2.18 2017-02-15 <dave at tiredofit dot ca>

* Update File Permissions for logrotate.d

## 2.17 2017-02-01 <dave at tiredofit dot ca>

* Init Scripts Update
* msmtp Update

## 2.16 2017-01-29 <dave at tiredofit dot ca>

* More Permissions Fixes

## 2.15 2017-01-29 <dave at tiredofit dot ca>

* Add Grep, sudo
* Fix Permissions

## 2.14 2017-01-29 <dave at tiredofit dot ca>

* Add Container Package Check

## 2.13 2017-01-28 <dave at tiredofit dot ca>

* Add zabbix-utils to edge
* Update S6 Overlay to 1.21.2.2

## 2.12 2017-01-28 <dave at tiredofit dot ca>

* Add Zabbix Check for Updated Packages

## 2.11 2017-12-24 <dave at tiredofit dot ca>

* Check for custom cron files in /assets/cron-custom/ on startup

## 2.10 2017-12-01 <dave at tiredofit dot ca>

* Update S6 overlay to 1.21.2.1
* Add Alpine 3.7
* Remove Alpine 3.2

## 2.9 2017-10-23 <dave at tiredofit dot ca>

* Update S6 overlay to 1.21.1.1

## 2.8 2017-09-27 <dave at tiredofit dot ca>

* Updated Alpine Edge to Zabbix-Agent Package as opposed to Compiling
* Quieted down service startup to avoid duplication

## 2.7 2017-09-26 <dave at tiredofitdot ca>

* Added more verbosity to services being enabled/disabled

## 2.6 2017-09-18 <dave at tiredofit dot ca>

* Add Alpine 3.2, 3.3 for legacy purposes
* Fix Scripts for checking enabling services

## 2.5 2017-09-02 <dave at tiredofit dot ca>

* Move to Zabbix 3.4.1 instead of compiling from TRUNK

## 2.4 2017-09-01 <dave at tiredofit dot ca>

* Update S6 Overlay to 1.2.0.0

## 2.3 2017-08-28 <dave at tiredofit dot ca>

* Added `DEBUG_SMTP` environment variable to trap SMTP messages accesible via port 8025

## 2.2 2017-08-27 <dave at tiredofit dot ca>

* Added MSMTP to be able to route mail to external hosts

## 2.1 2017-08-27 <dave at tiredofit dot ca>

* Added DEBUG_MODE environment variable
* Added TIMEZONE environment variable
* Added ENABLE_CRON, ENABLE_ZABBIX switches
* Built mechanisms to not start processes until container initialized
* Zabbix Agent Configuration can be controlled and adjusted via Environment Variables
* General Tidying Up
