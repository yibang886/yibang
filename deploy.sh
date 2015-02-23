#! /bin/bash

TOMCAT_WEBAPP_HOME=/usr/local/tomcat/webapps
PROJECT=yibang

echo -e "Stopping tomcat ......"
web_serv_ctl.sh stop

echo -e "\nRemoving deployment from tomcat ......"
set -x
rm -fr $TOMCAT_WEBAPP_HOME/$PROJECT
rm -f  $TOMCAT_WEBAPP_HOME/$PROJECT.war
set +x

echo -e "\nRemoving target from current directory ......"
set -x
rm -fr target
set +x

echo -e "\nCompling and packaging ......"
mvn package

echo -e "\nDeploying to tomcat ......"
set -x
cp target/$PROJECT.war $TOMCAT_WEBAPP_HOME
set +x

echo -e "\nStarting tomcat ......"
web_serv_ctl.sh start 

sleep 30
rm -fr /home/www/resource
mv -f $TOMCAT_WEBAPP_HOME/$PROJECT/resource  /home/www
