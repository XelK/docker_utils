#!/bin/bash
docker run -it -d --rm -v $(pwd)/share:/root kube:latest
docker ps