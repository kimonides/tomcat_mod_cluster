FROM tomcat:9.0
ARG VERSION=1.4.1

WORKDIR /usr/local/tomcat
COPY ./files/server.xml ./conf/
COPY ./files/start.sh ./
COPY ./files/*.jar ./lib/
RUN chmod +x start.sh


ENV tomcat_port=0
ENV tomcat_shutdown_port=0
ENV tomcat_ajp_port=0
ENV cluster_port=6666

CMD ["./start.sh"]



