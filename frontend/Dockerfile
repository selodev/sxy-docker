# Use the official lightweight Node.js 12 image.
# https://hub.docker.com/_/node
FROM node:12-slim

# Create and change to the app directory.
WORKDIR /srv/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY code/package*.json ./

# Copy local code to the container image.
COPY code ./

# Expose Container PORT
EXPOSE 3000

COPY docker-entrypoint.sh /usr/local/bin/

RUN set -ex; chmod +x /usr/local/bin/docker-entrypoint.sh

# start the app
ENTRYPOINT ["docker-entrypoint.sh"]