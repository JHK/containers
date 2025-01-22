.PHONY: all $(MAKECMDGOALS)

build:
	docker build -t $(DOCKER_REPO):shell .

publish:
	docker push $(DOCKER_REPO):shell

# alias kubeshell="~/Projects/containers/shell/scripts/run_container.sh"
pod:
	./scripts/run_container.sh
