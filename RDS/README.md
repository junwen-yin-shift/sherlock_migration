## Create codebuild project
cd RDS/shift_dev
aws codebuild create-project --cli-input-json file://shck-webapp-rds-pg-dump-hk-dev.json
aws codebuild create-project --cli-input-json file://shck-webapp-rds-pg-restore-hk-dev.json

## Update codebuild project
aws codebuild update-project --cli-input-json file://shck-webapp-rds-pg-dump-hk-dev.json

## Get projects details from aws codebuild
aws codebuild batch-get-projects --names shck-webapp-rds-pg-dump-hk-dev --output json >> output.json
aws codebuild batch-get-projects --names shck-webapp-rds-pg-restore-hk-dev --output json >> shck-webapp-rds-pg-restore-hk-dev-output.json