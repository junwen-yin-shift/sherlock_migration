#!/bin/bash
set -e

ENTITY="hk"
echo "Running aws s3 sync script for $ENTITY ..."
aws s3 sync s3://sh-shck-ml-artifacts-${ENTITY}-work-build/notebooks/ /home/ec2-user/SageMaker/ --acl bucket-owner-full-control
echo "Finished aws s3 sync script for $ENTITY ..."