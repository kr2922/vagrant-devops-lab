#!/bin/bash
set -e
echo "#################################"

echo "Installing essential utilities..."
sudo apt-get update
sudo apt-get install -y curl wget git net-tools ufw
if ! id devops_user &>/dev/null; then
    echo "Creating devops_user..."
    sudo useradd -m -s /bin/bash devops_user
    echo "created" 
fi
