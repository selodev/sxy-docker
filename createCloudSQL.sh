# Usage:
# export PROJECT_NAME=
# export CLOUDSQL_INSTANCE_NAME=
# export CLOUDSQL_ROOT_PASSWORD=
# export CLOUDSQL_REGION=us-central1
# export PROJECT_ZONE=us-central1-a
# export CLOUDSQL_TIER=db-n1-standard-1
# export CLOUDSQL_DB_VERSION=POSTGRES_1
# export DB_NAME=
# export DB_USER=
# export DB_PASSWORD=

#!/bin/bash

source ${PWD}/.env

echo "This script automates the creation of a CloudSQL Instance & database on GCP based on env varibles"

CHECK_IF_INSTANCE_EXISTS=$(gcloud sql instances describe "${CLOUDSQL_INSTANCE_NAME}")

# echo $CHECK_IF_INSTANCE_EXISTS

if [[ $CHECK_IF_INSTANCE_EXISTS =~ "${CLOUDSQL_INSTANCE_NAME}" ]]; then
    echo cloud sql instance already exists, skipping creating it.
else
    echo cloud sql instance does not exist, creating it.

    # Create Cloud SQL Instance Name:
    gcloud sql instances create ${CLOUDSQL_INSTANCE_NAME} --project=${PROJECT_NAME} --activation-policy=ALWAYS --tier=${CLOUDSQL_TIER} --region=${CLOUDSQL_REGION} # --db-version=${CLOUDSQL_DB_VERSION}

    # Set Cloud SQL Root Password:
    gcloud sql users set-password root --host=% --instance ${CLOUDSQL_INSTANCE_NAME} --password=${CLOUDSQL_ROOT_PASSWORD}

    # Create Database:
    gcloud sql databases create $DB_NAME --instance ${CLOUDSQL_INSTANCE_NAME} --charset=utf8 --collation=utf8_general_ci

    # Create Database User & Set Database Password: 
    gcloud sql users create $DB_USER --host=% --instance=${CLOUDSQL_INSTANCE_NAME} --password=$DB_PASSWORD

    # set CLOUDSQL_INSTANCE_CONNECTION_NAME environment variable
    export CLOUDSQL_INSTANCE_CONNECTION_NAME= $PROJECT_NAME:$CLOUDSQL_REGION:$CLOUDSQL_INSTANCE_NAME

fi

exec "$@"