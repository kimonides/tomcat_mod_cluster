FROM tomcat:9.0

WORKDIR /usr/local/tomcat
COPY mod_cluster*.jar ./lib/
COPY jboss*.jar ./lib/
COPY server.xml ./conf/
COPY start.sh ./

# EXPOSE 8080
ENV tomcat_port=8080

CMD ["./start.sh"]



