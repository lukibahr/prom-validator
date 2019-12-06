# prom-validator

[![Build Status](https://ci.devopoly.de/api/badges/lukibahr/prom-validator/status.svg)](https://ci.devopoly.de/lukibahr/prom-validator)

docker container to validate a prometheus config

## Purpose

Built this container to supply a unit test step in a continuous integration pipeline where prometheus configs 
will be deployed via a pipeline.

## Usage

Mount your configfiles to the /workdir directory and run:

`/usr/bin/docker run -it -e PROM_VERSION=2.8.0 -v ./config:/workdir lukasbahr/prom-validator:master check config prometheus.yml`


## Contrib

- Lukas Bahr, <lukas@devopoly.de>
