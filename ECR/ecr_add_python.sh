aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 947332944497.dkr.ecr.eu-central-1.amazonaws.com

docker pull public.ecr.aws/docker/library/python:3.7
docker tag public.ecr.aws/docker/library/python:3.7 947332944497.dkr.ecr.eu-central-1.amazonaws.com/ecr-public/docker/library/python:3.7
docker push 947332944497.dkr.ecr.eu-central-1.amazonaws.com/ecr-public/docker/library/python:3.7