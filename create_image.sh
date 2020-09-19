#!/bin/bash

for image_name in ironman, ghjjhg567/ironman:latest
do
    if [ $(docker images $image_name -q | wc -l) == "1" ]; then
        docker rmi $image_name
        echo "Docker image: $image_name was removed."
    fi
done

docker build -t ghjjhg567/ironman:latest -f Dockerfile .
