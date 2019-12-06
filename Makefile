# Makefile as a command wrapper

NAMESPACE = lukasbahr
PROJECT = prom-validator
PROM_VERSION = 2.8.0
VERSION = $(shell git rev-parse --abbrev-ref HEAD)
RUNDOCKER = $(shell which docker)

all: login build tag push

login: 
	@$(RUNDOCKER) $(@) --username=$(DOCKERHUB_USER) --password=$(DOCKERHUB_USERPASSWORD) 

build: login
	$(RUNDOCKER) $(@) -t $(NAMESPACE)/$(PROJECT):$(VERSION) -f Dockerfile .

tag: 
	$(RUNDOCKER) $(@) $(NAMESPACE)/$(PROJECT):$(VERSION) $(NAMESPACE)/$(PROJECT):$(VERSION)

pull: login
	$(RUNDOCKER) $(@) $(NAMESPACE)/$(PROJECT):$(VERSION)

push: 
	$(RUNDOCKER) $(@) $(NAMESPACE)/$(PROJECT):$(VERSION)

latest: 
	$(RUNDOCKER) push $(NAMESPACE)/$(PROJECT)

run: build
	$(RUNDOCKER) $(@) -it -e PROM_ENDPOINT=$(PROM_ENDPOINT) $(NAMESPACE)/$(PROJECT):$(VERSION)