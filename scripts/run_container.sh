#!/bin/bash

set -e  # Exit script on first error

# Define variables
AWS_REGION=ap-south-1
ACCOUNT_ID=979566283645
REPO_NAME=simple-node-app
ECR_URI="$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"
REPO_URI="$ECR_URI/$REPO_NAME"
CONTAINER_NAME=simple-node-app
IMAGE_TAG=latest

echo "Stopping and removing existing container (if any)..."
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

echo "Logging into ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URI

echo "Pulling latest image: $REPO_URI:$IMAGE_TAG"
docker pull $REPO_URI:$IMAGE_TAG

echo "Running container..."
docker run -d -p 80:8000 --name $CONTAINER_NAME $REPO_URI:$IMAGE_TAG

echo "Deployment complete. Container is running."
