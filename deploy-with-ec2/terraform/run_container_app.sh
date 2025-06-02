#!/bin/bash
apt-get update -y
apt-get install curl -y
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
docker pull imshakil/flask-test:latest
docker run -d -p 80:3000 --name react-test imshakil/flask-test:latest
