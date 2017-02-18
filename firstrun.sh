#!/bin/bash

# Check if properties file exists. If not, copy in the starter database
if [ -f /config/guacamole/guacamole.properties ]; then
  echo "Using existing properties file."
else
  echo "Creating properties from template."
  mkdir -p /config/databases /config/guacamole/extensions /config/guacamole/lib
  cp -R /etc/firstrun/. /config/guacamole
  PW=$(pwgen -1snc 32)
  sed -i -e 's/some_password/'$PW'/g' /config/guacamole/guacamole.properties
fi

# Since 0.9.11 all can be copied just set unused values to something in the properties file #Fixes invalid login error
    echo "Copying MySQL extension."
    cp /var/lib/guacamole/extensions/*mysql*.jar /config/guacamole/extensions
    cp /var/lib/guacamole/lib/* /config/guacamole/lib

    echo "Copying LDAP extension."
    cp /var/lib/guacamole/extensions/*ldap*.jar /config/guacamole/extensions
    cp -R /var/lib/guacamole/ldap-schema /config

    #echo "Copying Duo extension."
    #cp /var/lib/guacamole/extensions/*duo*.jar /config/guacamole/extensions

ln -s /config/guacamole /usr/share/tomcat8/.guacamole
chown nobody:users -R /config/
chmod 755 -R /config/
