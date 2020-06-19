#!/bin/bash
set -x

find . -iname "*.Dockerfile" | xargs -I {} basename {} .Dockerfile | xargs -I {} docker build -t gozdzseb/{} -f {}.Dockerfile .

# Need to give enough time for configuration and discovery startup
docker-compose up -d configuration
sleep 10
docker-compose up -d discovery
sleep 15

# Start gateway, payments, orders
docker-compose up
