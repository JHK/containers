.PHONY: all $(MAKECMDGOALS)

build:
	docker build -t $(DOCKER_REPO):shell .

publish:
	docker push $(DOCKER_REPO):shell

# alias kubeshell="make -C ~/Projects/containers/shell pod"
pod:
	./scripts/run_container.sh
