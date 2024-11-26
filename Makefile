.PHONY: all $(MAKECMDGOALS)

DOCKER_REPO = julianknocke/containers

build: shell web

publish: publish_shell publish_web

shell:
	$(MAKE) -C shell build DOCKER_REPO=$(DOCKER_REPO)

web:
	$(MAKE) -C web build DOCKER_REPO=$(DOCKER_REPO)

publish_shell:
	$(MAKE) -C shell publish DOCKER_REPO=$(DOCKER_REPO)

publish_web:
	$(MAKE) -C web publish DOCKER_REPO=$(DOCKER_REPO)
