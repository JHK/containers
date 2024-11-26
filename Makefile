.PHONY: all $(MAKECMDGOALS)

DOCKER_REPO = julianknocke/containers

build: build_shell

publish: publish_shell

build_shell:
	$(MAKE) -C shell build DOCKER_REPO=$(DOCKER_REPO)

publish_shell:
	$(MAKE) -C shell publish DOCKER_REPO=$(DOCKER_REPO)
