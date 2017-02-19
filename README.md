Guacamole
====

Dockerfile for Guacamole 0.9.13 with embedded MariaDB (MySQL) and LDAP authentication

Guacamole is a clientless remote desktop gateway. It supports standard protocols like VNC and RDP.

---
Author
===

Based on the work of Zuhkov <zuhkov@gmail.com> and aptalca 
Updated by Jason Bean to the latest version of guacamole

---
Building
===

Build from docker file:

```
git clone git@github.com:jason-bean/docker-guacamole.git
docker build -t jasonbean/guacamole .
```

You can also obtain it via:  

```
docker pull jasonbean/guacamole
```

---
Running
===

Create your guacamole config directory (which will contain both the properties file and the database) and then launch with the following:

```
docker run -d -v /your-config-location:/config -p 8080:8080 jasonbean/guacamole
```

Browse to ```http://your-host-ip:8080``` and login with user and password `guacadmin`

Docker Swarm 1.12+

```
Using with the dockercloud/haproxy container

docker service create --name guacamole-server-all \
--network proxy \
--network guacamole_net \
--env SERVICE_PORTS=8080 \
--env VIRTUAL_HOST=http://guacamole.lan,https://guacamole.lan \
--env FORCE_SSL=yes \
--mount type=bind,source=/mnt/dockervol/guacamole,target=/config \
db260179/guacamole-combined

OR (not recommended for security reasons)

docker service create --name guacamole-server-all \
--publish 8080:8080 \
--mount type=bind,source=/mnt/dockervol/guacamole,target=/config \
db260179/guacamole-combined

```

---
Credits
===

Apache Guacamole copyright The Apache Software Foundation, Licenced under the Apache License, Version 2.0.

This docker image is built upon the baseimage made by phusion and forked from hall/guacamole, and further forked from Zuhkov/docker-containers and then aptalca/docker-containers
