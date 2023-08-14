#!/bin/sh

# Build docker image dengan nama item-app dan tag v1
docker build -t item-app:v1 .
echo '\n\n' #print line baru

# listing
docker images
echo '\n\n' #print line baru

# Membuat tag image dengan nama item-app:v1 dan tag ghcr.io/hann315/item-app:v1
docker tag item-app:v1 ghcr.io/hann315/item-app:v1
echo '\n\n' #print line baru

# Melakukan login ke github packages dengan menggunakan token
export GITHUB_PACKAGES_TOKEN=

# Login ke github packages
echo $GITHUB_PACKAGES_TOKEN | docker login ghcr.io -u hann315 --password-stdin
echo '\n\n' #print line baru

# Melakukan push image ke github packages
docker push ghcr.io/hann315/item-app:v1
echo '\n\n' #print line baru
