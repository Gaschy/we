#!/bin/bash
mvn clean install
sudo rm -rf  /var/lib/tomcat7/webapps/WE*
sudo cp target/WE-lab2-1.0-SNAPSHOT.war /var/lib/tomcat7/webapps/

