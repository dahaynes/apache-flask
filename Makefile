export ARCH=`uname -m`
export BASE=ubuntu:bionic
export IMAGE_NAME=wesbarnett/apache-flask
export VCS_REF=`git rev-parse --short HEAD`
export VCS_URL=https://github.com/wesbarnett/apache-flask
export BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
export MAINTAINER="wes@barnett.science"

all: build

build:
	docker build --build-arg BUILD_DATE=$(BUILD_DATE) \
		--build-arg VCS_REF=$(VCS_REF) \
		--build-arg VCS_URL=$(VCS_URL) \
		--build-arg BASE=$(BASE) \
		--build-arg MAINTAINER=$(MAINTAINER) \
		-t $(IMAGE_NAME):bionic-$(ARCH) .

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $$(docker images --format '{{.Repository}}:{{.Tag}}' | grep '$(IMAGE_NAME)')
