#!/bin/bash

VERSION=$1
TAG=$2

 sudo mvn dependency:get -Dmaven.repo.local=./tmp \
    -Dartifact=org.jboss.mod_cluster:mod_cluster-container-tomcat85:$VERSION.Final \
    -DrepoUrl=https://repository.jboss.org/nexus/content/repositories/public/


find ./tmp/org/jboss/mod_cluster/ -type f | grep -i jar$ | xargs -i cp {} ./files/
find ./tmp/org/jboss/logging/jboss-logging/3.4.0.Final/ -type f | grep -i jar$ | xargs -i cp {} ./files/

rm -rf ./tmp

docker build . -t $TAG

rm -rf ./files/*.jar