# tomcat_mod_cluster
Tomcat9 image with mod_cluster 1.4.x enabled.  
Start Apache Httpd with mod cluster enabled.  
Configure the mod cluster listener in server.xml(line 24) if it's running on a port other than 6666.  
Build the image and run with:  
```
docker run --network="host" [image]
```
