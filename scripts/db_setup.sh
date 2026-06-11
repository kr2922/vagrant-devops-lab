#!/bin/bash/
set -e
echo "Setting up the database server..."
sudo apt-get install mariadb-server -y
sudo systemctl start mariadb
sudo systemctl enable mariadb
echo "MariaDB installed and started successfully."
sudo sed -i "s/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl restart mariadb
echo "MariaDB configured to listen on all interfaces."