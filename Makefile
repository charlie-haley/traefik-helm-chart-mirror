
.PHONY: lint test

test:
	docker run ${DOCKER_ARGS} --entrypoint /bin/sh --rm -v $(CURDIR):/charts -w /charts quintush/helm-unittest:3.10.0-0.2.9 /charts/hack/test.sh

test-%:
	$(MAKE) lint-$* && \
	DOCKER_ARGS="--env CHART=$*" make unit-test

lint:
	docker run ${DOCKER_ARGS} --env GIT_SAFE_DIR="true" --entrypoint /bin/sh --rm -v $(CURDIR):/charts -w /charts quay.io/helmpack/chart-testing:v3.7.1 /charts/hack/lint.sh

lint-%:
	DOCKER_ARGS="--env CHART=$*" make lint
