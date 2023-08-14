#!/bin/bash

echo "Hello, $USER! Portainer will be install now."
read -p "Enter main port for Portainer: " mainPort
read -p "Enter additional port for Portainer: " addPort

# Create volume for Portainer
docker volume create portainer_data

# Start portainer
docker run -d -p $addPort:8000 -p $mainPort:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ee:latest

# Check Portainer container is up
docker ps

# Show web link
ip a
echo
printf "https://localhost:$mainPort"
