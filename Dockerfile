FROM tomcat:9.0

# Change working directory

# Update packages and install dependency packages for services
# RUN apt-get update \
#  && apt-get dist-upgrade -y \
#  && apt-get clean \
#  && echo 'Finished installing dependencies'

# Copy package.json and package-lock.json
WORKDIR /usr/local/tomcat
COPY mod_cluster*.jar ./lib/
COPY jboss*.jar ./lib/
COPY server.xml ./conf/

EXPOSE 8080

