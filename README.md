# tomcat_mod_cluster
Tomcat9 image with mod_cluster enabled.  
Start Apache Httpd with mod cluster enabled.  
Configure the mod cluster listener in server.xml(line 24) if it's running on a port other than 6666.  
Build the image with:
```
docker build . -t <TAG> --build-arg VERSION=<mod_cluster_version>
# Example
# docker build . -t kimonides/tomcat_mod_cluster --build-arg VERSION=1.4.1
```
Run the image with:  
```
docker run --network=host -e tomcat_port=[port1] -e cluster_port=[port3] [image]
Or
docker run --network=host -e tomcat_ajp_port=[port1] -e cluster_port=[port3] [image]
# You can also add the variable -e tomcat_shutdown_port=true if u want to have a shutdown port
```

To load webapps into the container:
```
docker cp webapp.war <containerName>:/usr/local/tomcat/webapps/
```
