#!/bin/bash

clear
# Tomcat installation on Ubuntu: 
# ==============================
echo "welcome to install tomcat webserver ..."
sleep 2
apt update -y 

# Install OpenJDK
apt install default-jdk -y 

# mkdir directory tomcat and downlaod file for install ...
cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.13/bin/apache-tomcat-10.1.13.tar.gz
mkdir /opt/tomcat
wait
 tar -xzvf apache-tomcat-10*tar.gz -C /opt/tomcat --strip-components=1
wait
chmod +x /opt/tomcat/bin/startup.sh
sudo ./startup.sh
clear
sleep 2
echo "install tomcat on port 8080 .... " 
sleep 2 
clear
# and more user and password ...
#echo -n "<role rolename="manager-gui" />
#<user username="manager" password="manager" roles="manager-gui" />
#<role rolename="admin-gui" />
#<user username="admin" password="admin" roles="manager-gui,admin-gui" />" >> /opt/tomcat/conf/tomcat-users.xml 
# new version for insert 
cat  tomcat-users.xml >> /opt/tomcat/conf/tomcat-users.xml

# and more services tomcat ( dasorty ke nemikhaid az file estefade konid

#echo -n "{<?xml version="1.0" encoding="UTF-8"?>
#<Context antiResourceLocking="false" privileged="true" >
#  <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
 #                  sameSiteCookies="strict" />
#<!--   <Valve className="org.apache.catalina.valves.RemoteAddrValve"
#         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
#  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/></Context>}" > /opt/tomcat/webapps/manager/META-INF/context.xml 

cat context.xml > /opt/tomcat/webapps/manager/META-INF/context.xml 
cat context.xml >   /opt/tomcat/webapps/host-manager/META-INF/context.xml  
 
# link for up and down webserver tomcat ...
ln -s /opt/tomcat/bin/startup.sh /usr/local/bin/tomcatup
ln -s /opt/tomcat/bin/shutdown.sh /usr/local/bin/tomcatdown
sleep 2 
echo -e "\n\n\n\n Tomcat Installed ....\n\n\n\n"
echo -e "\n\n\n\n\nusername and password manager hast va baraye admin : admin:admin\n\nwrite  tomcatup ===> start webserver tomcat up ...\n\nwrite tomcatdown ===> down webserver tomcat down ...\n\n\n\n"

sleep 5
clear 



