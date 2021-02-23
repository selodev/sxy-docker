#!/bin/bash

source ${PWD}/../.env

echo "This script automates the creation of a Strapi app & database in existing folder based on env varibles."

if [ ! -f "package.json" ]; then

    DATABASE_CLIENT=${DATABASE_CLIENT:-sqlite}

    EXTRA_ARGS=${EXTRA_ARGS}

    echo "No project found at /srv/app. Creating a new strapi project"

    npx create-strapi-app . \
      --dbclient=$DATABASE_CLIENT \
      --dbhost=$DATABASE_HOST \
      --dbport=$DATABASE_PORT \
      --dbname=$DATABASE_NAME \
      --dbusername=$DATABASE_USERNAME \
      --dbpassword=$DATABASE_PASSWORD \
      --dbssl=$DATABASE_SSL \
      $EXTRA_ARGS

else
    echo "A project already exists in the curent directory."
fi