FROM tomcat:9.0
ARG VERSION

WORKDIR /usr/local/tomcat
COPY server.xml ./conf/
COPY start.sh *.war ./
RUN chmod +x start.sh
RUN apt-get update
RUN apt-get install -y maven
RUN mvn dependency:get -Dartifact=org.jboss.mod_cluster:mod_cluster-container-tomcat85:$VERSION.Final -DrepoUrl=https://repository.jboss.org/nexus/content/repositories/public/ 

RUN find /root/.m2/repository/org/jboss/mod_cluster/ -type f | grep -i jar$ | xargs -i cp {} ./lib/
RUN find /root/.m2/repository/org/jboss/logging/jboss-logging/3.4.0.Final/ -type f | grep -i jar$ | xargs -i cp {} ./lib/

ENV tomcat_port=0
ENV tomcat_ajp_port=0
ENV cluster_port=6666

CMD ["./start.sh"]



