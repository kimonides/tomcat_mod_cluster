#!/bin/bash

sed -i "s/8080/${tomcat_port}/" ./conf/server.xml

sed -i "s/8005/${tomcat_shutdown_port}/" ./conf/server.xml

catalina.sh run

