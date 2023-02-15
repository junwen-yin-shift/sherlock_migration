MANIFEST=$(aws ecr batch-get-image --repository-name ecr-public/docker/library/node --image-ids imageDigest=sha256:c1cc7bf1f953b79499891600a9f68180ee097c2973c7a820a30d40d34e749abb --output json | jq --raw-output --join-output '.images[0].imageManifest')
aws ecr put-image --repository-name ecr-public/docker/library/node --image-tag c1cc7b --image-manifest "$MANIFEST"
aws ecr batch-delete-image --repository-name ecr-public/docker/library/node --image-ids imageTag=16.15-alpine3.15 imageTag=16.15.1-alpine3.15


MANIFEST=$(aws ecr batch-get-image --repository-name ecr-public/docker/library/node --image-ids imageDigest=sha256:bb776153f81d6e931211e3cadd7eef92c811e7086993b685d1f40242d486b9bb --output json | jq --raw-output --join-output '.images[0].imageManifest')
aws ecr put-image --repository-name ecr-public/docker/library/node --image-tag bb7761 --image-manifest "$MANIFEST"
aws ecr batch-delete-image --repository-name ecr-public/docker/library/node --image-ids imageTag=16.15.0-alpine3.15


MANIFEST=$(aws ecr batch-get-image --repository-name ecr-public/docker/library/node --image-ids imageDigest=sha256:9da65f99264be2a78682095c4789b3d8cab12e0012def7d937d7125ed6e7695c --output json | jq --raw-output --join-output '.images[0].imageManifest')
aws ecr put-image --repository-name ecr-public/docker/library/node --image-tag 9da65f --image-manifest "$MANIFEST"
aws ecr batch-delete-image --repository-name ecr-public/docker/library/node --image-ids imageTag=16.15-alpine3.16


MANIFEST=$(aws ecr batch-get-image --repository-name ecr-public/docker/library/node --image-ids imageDigest=sha256:c785e617c8d7015190c0d41af52cc69be8a16e3d9eb7cb21f0bb58bcfca14d6b --output json | jq --raw-output --join-output '.images[0].imageManifest')
aws ecr put-image --repository-name ecr-public/docker/library/node --image-tag 16.15-alpine3.16 --image-manifest "$MANIFEST"
