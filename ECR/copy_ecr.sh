#!/bin/bash
SOURCE_ACCOUNT="947332944497"
PROFILE_AXA="default"
SOURCE_ACCOUNT_REGION="eu-central-1"
DESTINATION_ACCOUNT_REGION="eu-central-1"
DESTINATION_ACCOUNT="650257924275"
SOURCE_ACCOUNT_BASE_PATH="$SOURCE_ACCOUNT.dkr.ecr.$SOURCE_ACCOUNT_REGION.amazonaws.com"
DESTINATION_ACCOUNT_BASE_PATH="$DESTINATION_ACCOUNT.dkr.ecr.$DESTINATION_ACCOUNT_REGION.amazonaws.com"

aws ecr get-login-password --region $SOURCE_ACCOUNT_REGION --profile $PROFILE_AXA | docker login --username AWS --password-stdin $SOURCE_ACCOUNT_BASE_PATH
aws ecr get-login-password --region $DESTINATION_ACCOUNT_REGION --profile $PROFILE_AXA | docker login --username AWS --password-stdin $DESTINATION_ACCOUNT_BASE_PATH

REPO_LIST=("tensorflow/tensorflow")
REPO_LIST=("tonistiigi/binfmt")
REPO_LIST=("ecr-public/docker/library/alpine")
REPO_LIST=("ecr-public/docker/library/docker")
REPO_LIST=("ecr-public/docker/library/golang")
REPO_LIST=("ecr-public/docker/library/node")
REPO_LIST=("ecr-public/docker/library/python")
REPO_LIST=("")
REPO_LIST=("")


for repo in ${REPO_LIST[@]}; do
  echo "source repo_name is $repo"
  echo "start pulling from $repo in Source Account to Local"
  echo "start listing image tags for $repo in Source Account"
  IMAGE_LIST=($(aws ecr list-images --repository-name $repo --query 'imageIds[].imageTag' --output text --region $SOURCE_ACCOUNT_REGION))
  DESTINATION_REPO_NAME=$(echo $repo | sed -e "s/sherlock/shck/g")
  echo "destination repo_name is $DESTINATION_REPO_NAME"

  for tag_index in ${!IMAGE_LIST[@]}; do
    CURRENT_IMAGE_TAG=${IMAGE_LIST[$tag_index]}
    CURRENT_IMAGE_URI=$SOURCE_ACCOUNT_BASE_PATH/$repo:$CURRENT_IMAGE_TAG
    DESTINATION_IMAGE_URI=$DESTINATION_ACCOUNT_BASE_PATH/$DESTINATION_REPO_NAME:$CURRENT_IMAGE_TAG
    echo "pull from $CURRENT_IMAGE_URI"
    docker pull $CURRENT_IMAGE_URI
    docker tag  $CURRENT_IMAGE_URI $DESTINATION_IMAGE_URI
    echo "push to $DESTINATION_IMAGE_URI"
    docker push $DESTINATION_IMAGE_URI
  done
done