#!/bin/bash

set -e

ACCOUNT_ID=979566283645
REGION=ap-south-1
REPO_NAME=simple-node-app
IMAGE="$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest"

echo "Navigating to app directory..."
cd /home/ec2-user/app

echo "Logging in to ECR..."
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

echo "Pulling Docker image..."
docker pull $IMAGE

echo "Stopping old container if it exists..."
docker stop simple-node-app || true
docker rm simple-node-app || true

echo "Starting new container..."
docker run -d -p 8000:8000 --name simple-node-app $IMAGE

echo "Checking if container is running..."
docker ps | grep simple-node-app || echo "Container failed to start"

echo "Done"
