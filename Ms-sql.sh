#!/bin/bash

#This will import the public repository GPG keys

curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc

#First you might be presented with an error that the command(add-apt-repository) is not found
# Run the following command to correct that

sudo apt install software-properties-common

#This will register sql server ubuntu/debian repository

sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"

sudo apt-get update

sudo apt-get install -y mssql-server

#This will probably give you an error about a dependency that does not exist and not installable
#Run the following command to fix it

wget http://ftp.us.debian.org/debian/pool/main/o/openldap/libldap-2.4-2_2.4.47+dfsg-3+deb10u7_amd64.deb
sudo dpkg -i libldap-2.4-2_2.4.47+dfsg-3+deb10u7_amd64.deb

#Run the following the command to setup the configuration

sudo /opt/mssql/bin/mssql-conf setup

#The above command may present an error that concerning a package (libcrypto.so) that needs to be installed
#to fix this we will run the following command

sudo apt-get install libssl-dev


References

https://gist.github.com/kstevenson722/3fff3a76b3f25d4693a2da53438f3341
