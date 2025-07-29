#!/bin/bash

set -e

ACCOUNT_ID=979566283645
REPO_NAME=simple-node-app
IMAGE="$ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/$REPO_NAME:latest"

echo "Navigating to app directory..."
cd /home/ec2-user/app

echo "Pulling Docker image..."
docker pull $IMAGE

echo "Stopping old container if it exists..."
docker stop nodeapp || true
docker rm nodeapp || true

echo "Starting new container..."
docker run -d -p 8000:8000 $IMAGE

echo "Checking if container is running..."
docker ps | grep nodeapp || echo "Container failed to start"

echo "Done"
