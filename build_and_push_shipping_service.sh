#!/bin/bash

GITHUB_PACKAGES_TOKEN=$(cat github_token.txt)

docker build -t ghcr.io/hann315/shipping-service:latest .

echo $GITHUB_PACKAGES_TOKEN | docker login ghcr.io -u hann315 --password-stdin

docker push ghcr.io/hann315/shipping-service:latest