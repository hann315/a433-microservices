#!/bin/bash

# variable yang akan menyimpan token github packages yang akan dibaca dari file github_token.txt oleh command cat
GITHUB_PACKAGES_TOKEN=$(cat github_token.txt)

# variable yang akan menyimpan nama repository
REPO_NAME="hann315/shipping-service"
# variable yang akan menyimpan versi package
PACKAGE_VERSION="latest"

# command yang akan menjalankan docker build dan memberikan tag pada image yang dibuat
docker build -t ghcr.io/$REPO_NAME:$PACKAGE_VERSION .

# command yang akan melakukan login ke github packages menggunakan token yang sudah disimpan di variable GITHUB_PACKAGES_TOKEN
echo $GITHUB_PACKAGES_TOKEN | docker login ghcr.io -u hann315 --password-stdin

# command yang akan melakukan push image ke github packages
docker push ghcr.io/$REPO_NAME:$PACKAGE_VERSION

# command yang akan melakukan logout dari github packages
docker logout ghcr.io