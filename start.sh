#!/bin/bash

sed -i "s/8080/${tomcat_port}/" ./conf/server.xml

catalina.sh run

