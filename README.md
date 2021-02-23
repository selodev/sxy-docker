# SCXY-cloud-run

SCXY is a docker file consisting of StrapiJS, X DB and Y Framework.

## Install the application

```sh
docker-compose pull
```

```sh
docker-compose run --rm --no-deps frontend bash -c "npm install"
```

## Start the application

```sh
docker-compose up -d
```

## Stop the application

```sh
docker-compose down
```

## Display the containers logs

```sh
docker-compose logs -f
```# scxy-cloud-run
