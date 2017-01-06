# Docker Image for Kannel Gateway

This docker image contain Kannel Bearerbox and SMSBox.

## Usage

Check out the docker-compose.yml and kannel-conf/kannel.conf configuration file.

The docker-compose.yml will start a bearerbox first, then start smsbox link to bearerbox to receive sendSMS request via HTTP.

The configuration is connect to SMPPSim default installation with 2 account (smppclient1 / password and smppclient2 / password) listen in localhost.
