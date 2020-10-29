FROM tomcat:9.0

WORKDIR /usr/local/tomcat
COPY mod_cluster*.jar ./lib/
COPY jboss*.jar ./lib/
COPY server.xml ./conf/
COPY start.sh ./

# EXPOSE 8080
ENV tomcat_port=0
ENV tomcat_shutdown_port=8005
ENV tomcat_ajp_port=0
ENV cluster_port=6666

CMD ["./start.sh"]



