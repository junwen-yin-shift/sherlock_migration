#!/bin/bash
set -e

ENTITY="italy"
echo "Running aws s3 sync script for $ENTITY ..."
aws s3 sync /home/ec2-user/SageMaker/ s3://axa-sherlock-ml-artifacts-${ENTITY}-ci-build/SageMaker/ 
echo "Finished aws s3 sync script for $ENTITY ..."