
DOCKER_VER = 18.09.1
VERSION = 1.5.0

PUSH_REPO = haizaar/docker-credhelper-gcr
PUSH_REVISION = 1
TAG = $(PUSH_REPO):$(VERSION)-docker-$(DOCKER_VER)-$(PUSH_REVISION)


build:
	@set -ex && \
    OS=linux  && \
    ARCH=amd64 && \
	docker build --build-arg VERSION=$(VERSION) \
				 --build-arg OS=$$OS \
				 --build-arg ARCH=$$ARCH \
				 --build-arg DOCKER_VER=$(DOCKER_VER) \
				 -t $(TAG) \
				 .

push: build
	@set -ex && \
	docker push $(TAG)
