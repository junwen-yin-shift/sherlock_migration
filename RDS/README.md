# how to dump on axa aws
## Create codebuild dump project for each entity (take hk dev for example)

1. cd RDS/dump/axa_dev 
2. aws codebuild create-project --cli-input-json file://sherlock-webapp-rds-pg-dump-hk-dev.json (use update-project if project exists)

aws codebuild update-project --cli-input-json file://sherlock-webapp-rds-pg-dump-hk-dev.json (use update-project if project exists)

## Click Start Build to run the dump job

1. the job will connect to rds database, generate dump files to local
2. the job will cp the dump files to destination bucket

# how to restore on shift aws
## Create codebuild restore project for each entity (take hk dev for example)

1. cd RDS/restore/shift_dev 
2. aws codebuild create-project --cli-input-json file://shck-webapp-rds-pg-restore-hk-dev.json (use update-project if project exists)

## Click Start Build to run the restore job

1. the job will cp the dump files from src bucket to local
2. the job will connect to rds database, run pg restore to create the database

