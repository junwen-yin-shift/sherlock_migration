#!/bin/bash
set -e

# with AWS accout axa-rev-sherlock-nonprod
echo "start to copy s3 bucket : from axa-sherlock-data-science to sh-shck-ml-misc-work-build"
aws s3 sync s3://axa-sherlock-data-science s3://sh-shck-ml-misc-work-build --acl bucket-owner-full-control --quiet

echo "start to copy s3 bucket : from axa-sherlock-ml-sagemaker-models-core-pp/uk to sh-shck-ml-sagemaker-models-core-pp/uk"
aws s3 sync s3://axa-sherlock-ml-sagemaker-models-core-pp/uk s3://sh-shck-ml-sagemaker-models-core-pp/uk --acl bucket-owner-full-control --quiet

echo "start to copy s3 bucket : from axa-sherlock-incoming-uk-pp/incoming_manual to sh-shck-platform-incoming-uk-pp/incoming_manual"
aws s3 sync s3://axa-sherlock-incoming-uk-pp/incoming_manual/ s3://sh-shck-platform-incoming-uk-pp/incoming_manual/ --acl bucket-owner-full-control --quiet

ENTITY_LIST=("italy" "quixa" "ireland" "hk" "uk")
for ent in ${ENTITY_LIST[@]}; do
  ENTITY=$ent
  echo "start to copy s3 bucket : from axa-sherlock-ml-artifacts-${ENTITY}-ci-build to sh-shck-ml-artifacts-${ENTITY}-work-build"
  aws s3 sync s3://axa-sherlock-ml-artifacts-${ENTITY}-ci-build s3://sh-shck-ml-artifacts-${ENTITY}-work-build --acl bucket-owner-full-control --quiet
done

echo "job finished"
