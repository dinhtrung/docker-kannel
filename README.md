# Docker Image for Kannel Gateway

This docker image contain Kannel Bearerbox and SMSBox.

## Usage

Check out the docker-compose.yml and kannel-conf/kannel.conf configuration file.

The docker-compose.yml will start a bearerbox first, then start smsbox link to bearerbox to receive sendSMS request via HTTP.

The configuration is connect to SMPPSim default installation with 2 account (smppclient1 / password and smppclient2 / password) listen in localhost.

## Versioning

The image use pre-built version of Alpine testing repo:

~~~
Build `Apr 19 2017 15:31:23', compiler `6.3.0'.
System Linux, release 3.10.0-514.10.2.el7.x86_64, version #1 SMP Mon Feb 20 02:37:52 EST 2017, machine x86_64.
Hostname f8608362a7c5, IP 172.17.0.2.
Libxml version 2.9.4.
Using LibreSSL 2.5.3.
Compiled with MySQL 10.1.22-MariaDB, using MySQL 10.1.24-MariaDB.
Using SQLite 3.18.0.
Using native malloc.
~~~
