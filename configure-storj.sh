#!/bin/bash
STORAGE_DIR=/mnt/myfolder/storage
IDENTITY_DIR=/mnt/myfolder/identity
docker pull storjlabs/storagenode:latest

docker run --rm -e SETUP="true" \
    --mount type=bind,source="$IDENTITY_DIR",destination=/app/identity \
    --mount type=bind,source="$STORAGE_DIR",destination=/app/config \
    --name storagenode storjlabs/storagenode:latest