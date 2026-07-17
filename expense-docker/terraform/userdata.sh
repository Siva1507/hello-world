#!/bin/bash
set -e

# Update system
apt-get update -y
apt-get upgrade -y

# Install required packages
apt-get install -y \
    docker.io \
    docker-compose-v2 \
    git \
    curl

# Enable and start Docker
systemctl enable docker
systemctl start docker

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Create application directory
mkdir -p /home/ubuntu/expense-docker
chown -R ubuntu:ubuntu /home/ubuntu/expense-docker

# Verify installations
docker --version
docker compose version
git --version