#!/bin/bash
set -e
ENV=prod

echo "start to copy s3 bucket : from axa-sherlock-ml-sagemaker-models-core-${ENV}/uk to sh-shck-ml-sagemaker-models-core-${ENV}/uk"
aws s3 sync s3://axa-sherlock-ml-sagemaker-models-core-${ENV}/uk s3://sh-shck-ml-sagemaker-models-core-${ENV}/uk --acl bucket-owner-full-control --quiet

echo "start to copy s3 bucket : from axa-sherlock-incoming-uk-${ENV}/incoming_manual to sh-shck-platform-incoming-uk-${ENV}/incoming_manual"
aws s3 sync s3://axa-sherlock-incoming-uk-${ENV}/incoming_manual/ s3://sh-shck-platform-incoming-uk-${ENV}/incoming_manual/ --acl bucket-owner-full-control --quiet

ENTITY_LIST=("italy" "quixa" "ireland" "hk" "uk" "france" "switzerland")
for ent in ${ENTITY_LIST[@]}; do
  ENTITY=$ent
  echo "start to copy s3 bucket : from axa-sherlock-data-out-${ENTITY}-${ENV} to sh-shck-webapp-data-out-${ENTITY}-${ENV}"
  aws s3 sync s3://axa-sherlock-data-out-${ENTITY}-${ENV} s3://sh-shck-webapp-data-out-${ENTITY}-${ENV} --acl bucket-owner-full-control --quiet

  echo "start to copy s3 bucket : from axa-sherlock-documents-${ENTITY}-${ENV} to sh-shck-webapp-documents-${ENTITY}-${ENV}"
  aws s3 sync s3://axa-sherlock-documents-${ENTITY}-${ENV} s3://sh-shck-webapp-documents-${ENTITY}-${ENV} --acl bucket-owner-full-control --quiet
done

echo "job finished"