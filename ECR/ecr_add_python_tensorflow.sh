aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 947332944497.dkr.ecr.eu-central-1.amazonaws.com

docker pull python:3.8-slim-buster
docker tag python:3.8-slim-buster 947332944497.dkr.ecr.eu-central-1.amazonaws.com/ecr-public/docker/library/python:3.8-slim-buster
docker push 947332944497.dkr.ecr.eu-central-1.amazonaws.com/ecr-public/docker/library/python:3.8-slim-buster

docker pull tensorflow/tensorflow:2.11.0
docker tag tensorflow/tensorflow:2.11.0 947332944497.dkr.ecr.eu-central-1.amazonaws.com/tensorflow/tensorflow:2.11.0
docker push 947332944497.dkr.ecr.eu-central-1.amazonaws.com/tensorflow/tensorflow:2.11.0