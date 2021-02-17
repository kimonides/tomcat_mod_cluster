# tomcat_mod_cluster
Tomcat9 image with mod_cluster enabled.  
Start Apache Httpd with mod cluster enabled.  
Configure the mod cluster listener in server.xml(line 24) if it's running on a port other than 6666.  
Build the image with:
```
sudo ./build.sh <mod_cluster_version> <image_tag> # needs sudo to delete the local temp maven repo
# Example
# sudo ./build.sh 1.4.1 kimonides/tomcat_mod_cluster
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
