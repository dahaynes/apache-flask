export ARCH=`uname -m`
export BASE=ubuntu:bionic
export IMAGE_NAME=wesbarnett/apache-flask
export GIT_COMMIT=`git rev-parse HEAD`
export GIT_URL=https://github.com/wesbarnett/apache-flask
export BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
export MAINTAINER="wes@barnett.science"

all:
	docker build --build-arg BUILD_DATE=$(BUILD_DATE) \
		--build-arg GIT_COMMIT=$(GIT_COMMIT) \
		--build-arg GIT_URL=$(GIT_URL) \
		--build-arg BASE=$(BASE) \
		--build-arg MAINTAINER=$(MAINTAINER) \
		-t $(IMAGE_NAME):bionic-$(ARCH) .
