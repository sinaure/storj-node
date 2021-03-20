#!/bin/bash
STORAGE_DIR=/mnt/myfolder/storage
IDENTITY_DIR=/mnt/myfolder/identity
WALLET=your_ethwallet
EMAIL=usermail@gmail.com
ADDRESS=domain.ddns.net:28967
STORAGE=10TB

docker pull storjlabs/storagenode:latest


docker run -d --restart unless-stopped --stop-timeout 300 \
    -p 28967:28967 \
    -p 14002:14002 \
    -e WALLET="$WALLET" \
    -e EMAIL="$EMAIL" \
    -e ADDRESS="$ADDRESS" \
    -e STORAGE="$STORAGE" \
    --mount type=bind,source="$IDENTITY_DIR",destination=/app/identity \
    --mount type=bind,source="$STORAGE_DIR",destination=/app/config \
    --name storagenode storjlabs/storagenode:latest
