Guacamole
====

Dockerfile for Guacamole 0.9.11-incubating with embedded MariaDB (MySQL) and LDAP authentication

Guacamole is a clientless remote desktop gateway. It supports standard protocols like VNC and RDP.

---
Author
===

Based on the work of Zuhkov <zuhkov@gmail.com>, aptalca and Jason Bean
Updated by David Bentham to the latest version of Guacamole, Ubuntu 16.04 and MariaDB 10.1

---
Building
===

Build from docker file:

```
git clone https://gitlab.com/db260179/guacamole-docker -b 0.9.11-incubating
docker build -t db260179/guacamole-combined .
```

You can also obtain it via:  

```
docker pull db260179/guacamole-combined
```

---
Running
===

Create your guacamole config directory (which will contain both the properties file and the database) and then launch with the following:

```
docker run -d -v /your-config-location:/config -p 8080:8080 db260179/guacamole-combined
```

Browse to ```http://your-host-ip:8080``` and login with user and password `guacadmin`

---
Credits
===

Guacamole is an open source project and is copyright Glyptodon LLC

This docker image is built upon the baseimage made by phusion and forked from hall/guacamole, and further forked from Zuhkov/docker-containers and then aptalca/docker-containers
