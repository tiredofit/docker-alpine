## 3.9 2019-01-30 <dave at tiredofit dot ca>

* Switch to Zabbix Agent package

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
