#!/bin/bash

VERSION=${1:-1.4.2.Final}
TAG=${2:-docker.io/${USER}/tomcat_mod_cluster}

if [ $# -lt 2 ] 
then
    printf "No argument given.\n\nusage: ./build.sh <mod_cluster_version> <image_tag>\n\nexample: ./build.sh 1.4.1 tomcat_mod_cluster\n\n"
    printf "Using VERSION: $VERSION\n\n"
    printf "Using tag: $TAG\n\n"    
fi

mvn dependency:get -Dmaven.repo.local=./.tmp \
    -Dartifact=org.jboss.mod_cluster:mod_cluster-container-tomcat85:$VERSION \
    -DrepoUrl=https://repository.jboss.org/nexus/content/repositories/public/


find ./.tmp/org/jboss/mod_cluster/ -type f | grep -i jar$ | xargs -i cp {} ./files/
find ./.tmp/org/jboss/logging/jboss-logging/3.4.0.Final/ -type f | grep -i jar$ | xargs -i cp {} ./files/

rm -rf ./.tmp

docker build . -t $TAG

rm -rf ./files/*.jar
