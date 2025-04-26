#!/bin/bash

echo "🔧 Starting Auto Setup VPS 1GB for Ubuntu 22.04..."

# Update & upgrade
apt update && apt upgrade -y

# Install Apache
apt install apache2 -y

# Install PHP + modules
apt install php php-cli php-mbstring php-curl php-xml php-zip php-gd php-mysql unzip -y

# Install Python3 and pip3
apt install python3 python3-pip -y

# Install yt-dlp
pip3 install yt-dlp

# Create Swapfile (2GB)
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab

# Setup UFW Firewall
ufw allow OpenSSH
ufw allow 'Apache Full'
ufw --force enable

# Restart Apache
systemctl restart apache2

# Clean up
apt autoremove -y
apt clean

echo "✅ Auto Setup Complete!"
echo "🚀 Apache + PHP + yt-dlp + Swapfile Siap Jalan!"
echo "🌐 Upload Website kamu ke /var/www/html/"
