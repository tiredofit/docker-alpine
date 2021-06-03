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
      - New routine to cleanup /tmp/state for users who only restart the container, not fully bring down and remove.


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
