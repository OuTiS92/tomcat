#!/bin/bash


echo "welcome to install tomcat webserver ..."

clear
sleep 2
apt update
wait
apt install default-jdk
wait
cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.20/bin/apache-tomcat-10.0.20.tar.gz
wait
sudo tar xzvf apache-tomcat-10*tar.gz -C /opt/tomcat --strip-components=1
wait
chown -R tomcat:tomcat /opt/tomcat/
wait
chmod -R u+x /opt/tomcat/bin
wait

sleep 2
clear
echo " tomcat installed ...."
