#!/bin/bash
docker run -it -d --rm -v $(pwd)/share:/root -v ~/.ssh:/tmp/.ssh:ro kube:latest
docker attach $(docker ps -l|tail -n1 |awk '{print $1}')
