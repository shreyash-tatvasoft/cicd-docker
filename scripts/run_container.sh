#!/bin/bash

# Define variables
AWS_REGION=ap-south-1
ECR_URI=979566283645.dkr.ecr.$AWS_REGION.amazonaws.com
CONTAINER_NAME=simple-node-app
IMAGE_TAG=latest
REPO_URI=979566283645.dkr.ecr.$AWS_REGION.amazonaws.com/simple-node-app

# Stop and remove old container if exists
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Authenticate with ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $ECR_URI

# Pull the latest image from ECR
docker pull $REPO_URI:$IMAGE_TAG

# Run container
docker run -d -p 80:8000 --name $CONTAINER_NAME $ECR_URI:$IMAGE_TAG
