#!/bin/bash
set -e
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "Nginx installed and started successfully."
echo "Configuring Firewall..."
sudo ufw allow 'Nginx Full'
sudo ufw --force enable
echo "Writing custom landing page..."
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>DevOps Automated Lab</title>
</head>
<body>
    <h1>Success!</h1>
    <p>This infrastructure was provisioned fully using Vagrant and Bash Scripting.</p>
    <p>Webserver IP: 192.168.56.10</p>
    <p>Connected to DB Server: 192.168.56.11</p>
</body>
</html>
EOF
sudo systemctl restart nginx
echo "Custom landing page created and Nginx restarted."