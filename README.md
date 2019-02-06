# docker-gcr-prepuller

This container image is based on the [official](https://hub.docker.com/_/docker)
docker-ce image with docker-credential-gcr installed and configured.

It's useful as init container in DaemonSets that prepull images on GKE and require
pulling images from private gcr.io repos.

## Building
* `make build` - build image for docker & credhelper versions listed in the top of the Makefile
* `make push PUSH_REPO=<your repo>` - build and upload images to the specified repository.
   Uses `haizaar/docker-credhelper-gcr` by default

