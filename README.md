# prom-validator

[![Build Status](https://ci.devopoly.de/api/badges/lukibahr/prom-validator/status.svg)](https://ci.devopoly.de/lukibahr/prom-validator)

docker container to validate a prometheus config

## Purpose

Built this container to supply a unit test step in a continuous integration pipeline where prometheus configs 
will be deployed via a pipeline.

## Usage

Mount your configfiles to the /workdir directory and run:

`/usr/bin/docker run -it -e PROM_VERSION=2.8.0 -v ./config:/workdir lukasbahr/prom-validator:master check config prometheus.yml`

## CI/CD

`git tag <PROM_VERSION>` && `git push --tags`

## Open ToDos

- add ability to validate prometheus.yml files within a Kubernetes configmap.

## Further reading

- https://github.com/docker/build-push-action/blob/e1b7f96249f2e4c8e4ac1519b9608c0d48944a1f/UPGRADE.md

## Contrib

- Lukas Bahr, <lukas@devopoly.de>
