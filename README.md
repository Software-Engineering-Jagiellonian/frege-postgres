# PostgreSQL docker image with a database for a Frege project

This image contains an initial database schema with filled up `languages` table.

## Run image

To run this image invoke `docker run -e POSTGRES_PASSWORD=<password> jagiellonian/frege-postgres:<version>`

For more options see a [PostgreSQL docker image description](https://hub.docker.com/_/postgres?tab=description&page=1&ordering=-name)

## Rebuild image

To rebuild this image simply run `docker build -t jagiellonian/frege-postgres:<version> .`
