#!/bin/bash

env=$1

docker network create ironman-net

if [ "$env" == "prd" ];then
    docker run -e ENVIRONMENT="$env" --env-file prd.env \
  --net=ironman-net --name ironman -d -v $(pwd)/app:/usr/src/app/app ghjjhg567/ironman:latest

else
    docker run -e ENVIRONMENT="stg" --env-file stg.env \
  --net=ironman-net --name ironman -d -v $(pwd)/app:/usr/src/app/app ghjjhg567/ironman:latest

fi

docker run --net=ironman-net --name redis -d -p 6379:6379 redis:4.0

docker run --net=ironman-net --name nginx -d -p 80:80 -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf \
-v $(pwd)/nginx/default.conf:/etc/nginx/conf.d/default.conf nginx
