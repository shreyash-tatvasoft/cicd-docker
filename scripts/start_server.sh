#!/bin/bash

echo "Starting Docker container for static site..."

# Define variables
ACCOUNT_ID=979566283645
REPO_NAME=simple-node-app

cd /home/ec2-user/app

docker pull $ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/$REPO_NAME:latest

docker run -d -p 8000:8000 --name nodeapp $ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/$REPO_NAME:latest

echo "Application is running on port 8000"
