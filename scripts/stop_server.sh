#!/bin/bash

echo "Stopping existing Docker container..."

docker stop simple-node-app || true
docker rm simple-node-app || true

echo "Stopped simple-node-app container if it was running."
