#!/bin/bash


# Tomcat installation on Ubuntu: 
# ==============================


echo "welcome to install tomcat webserver ..."

clear
sleep 2
apt update
wait

# Install OpenJDK
apt install default-jdk
wait
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
echo "install tomcat on port 8080 ...." 
wait
sleep 2 
clear

# and more user and password ...
echo -n "<role rolename="manager-gui" />
<user username="manager" password="manager" roles="manager-gui" />
<role rolename="admin-gui" />
<user username="admin" password="admin" roles="manager-gui,admin-gui" />" > /opt/tomcat/conf/tomcat-users.xml 

echo -n "[Unit]
Description=Tomcat
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/tomcat.service 
sleep 2
sudo systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat

echo " username and password manager hast va baraye admin : admin:admin" 

echo " tomcat installed ...."

