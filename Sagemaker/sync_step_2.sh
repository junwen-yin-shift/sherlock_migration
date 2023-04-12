# with AWS accout axa-rev-sherlock-nonprod
ENTITY="italy"
aws s3 sync s3://axa-sherlock-ml-artifacts-${ENTITY}-ci-build/notebooks/ s3://sh-shck-ml-artifacts-${ENTITY}-work-build/notebooks/ --acl bucket-owner-full-control
