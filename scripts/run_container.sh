#!/bin/bash
ECR_URI="979566283645.dkr.ecr.ap-south-1.amazonaws.com/simple-node-app"
IMAGE_TAG="latest"
CONTAINER_NAME="simple-node-app"

# Stop & remove existing container
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Pull latest image
aws ecr get-login-password | docker login --username AWS --password-stdin $ECR_URI
docker pull $ECR_URI:$IMAGE_TAG

# Run new container
docker run -d -p 80:8000 --name $CONTAINER_NAME $ECR_URI:$IMAGE_TAG
