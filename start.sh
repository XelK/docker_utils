#!/bin/bash
docker run -it -d --rm -v $(pwd)/share:/root kube:latest
docker ps
new_container=$(docker ps -l|tail -n1 |awk '{print $1}')
docker attach $new_container