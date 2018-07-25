export ARCH=x86_64
export BASE=ubuntu:rolling
export IMAGE_NAME=wesbarnett/ubuntu-flask
export VCS_REF=`git rev-parse --short HEAD`
export VCS_URL=https://github.com/wesbarnett/ubuntu-flask
export BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`

all: build-userland build-onbuild

build-userland:
	docker build --build-arg BUILD_DATE=$(BUILD_DATE) \
		--build-arg VCS_REF=$(VCS_REF) \
		--build-arg VCS_URL=$(VCS_URL) \
		--build-arg BASE=$(BASE) \
		-t $(IMAGE_NAME):userland-$(ARCH) userland

build-onbuild:
	docker build --build-arg BUILD_DATE=$(BUILD_DATE) \
		--build-arg VCS_REF=$(VCS_REF) \
		--build-arg VCS_URL=$(VCS_URL) \
		--build-arg ARCH=$(ARCH) \
		--pull=false \
		-t $(IMAGE_NAME):onbuild-$(ARCH) onbuild

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $$(docker images --format '{{.Repository}}:{{.Tag}}' | grep '$(IMAGE_NAME)')
