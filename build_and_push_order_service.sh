#!/bin/bash

GITHUB_PACKAGES_TOKEN=$(cat github_token.txt)

REPO_NAME="hann315/order-service"
PACKAGE_VERSION="latest"

docker build -t ghcr.io/$REPO_NAME:$PACKAGE_VERSION .

echo $GITHUB_PACKAGES_TOKEN | docker login ghcr.io -u hann315 --password-stdin

docker push ghcr.io/$REPO_NAME:$PACKAGE_VERSION

docker logout ghcr.io