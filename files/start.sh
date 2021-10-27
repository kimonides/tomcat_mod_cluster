#!/bin/bash

if [ "$tomcat_shutdown_port" = true ] 
then
    while :
    do
        port=$(shuf -i 8000-9000 -n 1)
        if [[ $(ss -tulpn | grep $port) ]] || [[ "$port" = $tomcat_port ]] || [[ "$port" = $tomcat_ajp_port ]]; then
            echo "Port $port is used"
        else
            tomcat_shutdown_port=$port
            break
        fi
    done
fi


sed -i "s/8080/${tomcat_port}/" ./conf/server.xml

sed -i "s/8009/${tomcat_ajp_port}/" ./conf/server.xml

mv  *.war webapps/ || true

if ((${tomcat_port}==0)); then
    sed -i "s/changeMe/${tomcat_ajp_port}/" ./conf/server.xml
else
    sed -i "s/changeMe/${tomcat_port}/" ./conf/server.xml
fi

sed -i "s/6666/${cluster_port}/" ./conf/server.xml

# remplace the Engine by Engine JVMRoute="${jvmroute}"
if [ -z "${jvmroute}" ]; then
  echo "JVMRoute with be automaticly generated"
else
  echo "Using $jvmroute as JVMRoute"
  sed -i "/Engine name/c <Engine name=\"Catalina\" defaultHost=\"localhost\" jvmRoute=\"${jvmroute}\">" ./conf/server.xml
fi

# add tomcat_address in case
if [ -z "${tomcat_address}" ]; then
  echo "tomcat_address not configurated"
else
  echo "Using $tomcat_address as address"
  sed -i "/<Connector/a address=\"${tomcat_address}\"" ./conf/server.xml
  sed -i "/Server port/c <Server port=\"8005\" shutdown=\"SHUTDOWN\" address=\"${tomcat_address}\">" ./conf/server.xml
fi

# not sure that changing port and address makes sense... but just in case ;-)
# to use for example:
# echo "SHUTDOWN" | nc 127.0.0.2 8005
sed -i "s/8005/${tomcat_shutdown_port}/" ./conf/server.xml


catalina.sh run

