#!/bin/bash

echo "Stopping existing Docker container..."

docker stop nodeapp || true
docker rm nodeapp || true

echo "Stopped nodeapp container if it was running."
