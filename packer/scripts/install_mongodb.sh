#!/bin/bash -e
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sleep 60
apt-get install apt-transport-https ca-certificates
sleep 1
apt update
sleep 1
apt-get install -y mongodb-org
systemctl start mongod
systemctl enable mongod
