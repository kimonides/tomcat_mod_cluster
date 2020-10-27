#!/bin/bash

sed -i "s/8080/${tomcat_port}/" ./conf/server.xml

sed -i "s/8005/${tomcat_shutdown_port}/" ./conf/server.xml

sed -i "s/8009/${tomcat_ajp_port}/" ./conf/server.xml


if ((${tomcat_port}==0)); then
    sed -i "s/changeMe/${tomcat_ajp_port}/" ./conf/server.xml
else
    sed -i "s/changeMe/${tomcat_port}/" ./conf/server.xml
fi

catalina.sh run

