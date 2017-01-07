# Docker Image for Kannel Gateway

This docker image contain Kannel Bearerbox and SMSBox.

~~~
Kannel bearerbox version `1.5.0'.

Build `Oct 27 2016 16:30:55', compiler `6.2.1 20160822'.
Libxml version 2.9.4.
Using LibreSSL 2.4.3.
Compiled with MySQL 10.1.17-MariaDB, using MySQL 10.1.20-MariaDB.
Using SQLite 3.15.0.
Using native malloc.
~~~

## Usage

Check out the docker-compose.yml and kannel-conf/kannel.conf configuration file.

The docker-compose.yml will start a bearerbox first, then start smsbox link to bearerbox to receive sendSMS request via HTTP.

The configuration is connect to SMPPSim default installation with 2 account (smppclient1 / password and smppclient2 / password) listen in localhost.
