#!/bin/bash -x

docker stop ironman redis nginx
docker rm ironman redis nginx
docker network rm ironman-net
docker volume prune -f
