#!/usr/bin/env bash

IMAGE_NAME=analizerapp_image
CONTAINER_NAME=analizer_container


cd $(dirname $0)

docker build -t $IMAGE_NAME .
docker container rm -f $CONTAINER_NAME
docker run -dit --name $CONTAINER_NAME $IMAGE_NAME

CONTAINER_ADDRESS=$(docker container inspect $CONTAINER_NAME | grep -m 1 "\"IPAddress\":*" |  grep -oE "(\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}")

echo $CONTAINER_ADDRESS
ping $CONTAINER_ADDRESS