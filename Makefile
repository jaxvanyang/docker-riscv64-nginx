.PHONY: build clean run start attach all

IMAGE_NAME := riscv64/nginx
CONTAINER_NAME := riscv64-nginx

all: start attach

attach:
	docker attach ${CONTAINER_NAME}

start:
	docker start ${CONTAINER_NAME}

run:
	docker run -it -v /tmp:/tmp -e DISPLAY=$${DISPLAY} \
		--name ${CONTAINER_NAME} --platform riscv64 ${IMAGE_NAME}

build:
	docker build -t ${IMAGE_NAME} --force-rm --platform riscv64 .

clean:
	-docker rm ${CONTAINER_NAME}
	-docker rmi ${IMAGE_NAME}
