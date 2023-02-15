#!/bin/bash
SOURCE_ACCOUNT="947332944497"
SOURCE_ACCOUNT_REGION="eu-central-1"
SOURCE_ACCOUNT_BASE_PATH="$SOURCE_ACCOUNT.dkr.ecr.$SOURCE_ACCOUNT_REGION.amazonaws.com"

aws ecr get-login-password --region $SOURCE_ACCOUNT_REGION
#REPO_NAME_LIST=("sherlock-ml-model-flows" "sherlock-ml-forgery-detector")
REPO_NAME_LIST=($(aws ecr describe-repositories --registry-id $SOURCE_ACCOUNT --query 'repositories[].repositoryName' --output text --region $SOURCE_ACCOUNT_REGION))

echo "registryId,repositoryName,imageDigest,sizeByte,tags"
for repo in ${REPO_NAME_LIST[@]}; do
  CURRENT_REPO_NAME=$repo
  registryIds=($(aws ecr describe-images --registry-id $SOURCE_ACCOUNT --no-paginate --repository-name $CURRENT_REPO_NAME --output text --region $SOURCE_ACCOUNT_REGION --query 'imageDetails[].registryId'))
  repositoryNames=($(aws ecr describe-images --registry-id $SOURCE_ACCOUNT --no-paginate --repository-name $CURRENT_REPO_NAME --output text --region $SOURCE_ACCOUNT_REGION --query 'imageDetails[].repositoryName'))
  imageDigests=($(aws ecr describe-images --registry-id $SOURCE_ACCOUNT --no-paginate --repository-name $CURRENT_REPO_NAME --output text --region $SOURCE_ACCOUNT_REGION --query 'imageDetails[].imageDigest'))
  imageSizeInBytes=($(aws ecr describe-images --registry-id $SOURCE_ACCOUNT --no-paginate --repository-name $CURRENT_REPO_NAME --output text --region $SOURCE_ACCOUNT_REGION --query 'imageDetails[].imageSizeInBytes'))

  for index in ${!imageDigests[@]}; do
    tags=($(aws ecr describe-images --registry-id $SOURCE_ACCOUNT --no-paginate --repository-name $CURRENT_REPO_NAME --image-ids "imageDigest=${imageDigests[$index]}" --output text --region $SOURCE_ACCOUNT_REGION --query 'imageDetails[].imageTags'))
    echo ${registryIds[$index]},${repositoryNames[$index]},${imageDigests[$index]},${imageSizeInBytes[$index]},"${tags[0]};${tags[1]};${tags[2]};${tags[3]};${tags[4]}"
  done
done