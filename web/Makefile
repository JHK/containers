.PHONY: all $(MAKECMDGOALS)

build:
	docker build -t $(DOCKER_REPO):web .

publish:
	docker push $(DOCKER_REPO):web
