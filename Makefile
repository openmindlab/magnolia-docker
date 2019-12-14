.PHONY: login build push

login:
	echo "$$DOCKER_PASSWORD" | docker login -u "$$DOCKER_USERNAME" --password-stdin ;

build:
	cd $$DIR && ${CURDIR}/readargs.sh args.csv ./build.sh -E IMG_PREFIX=$${IMG_PREFIX:-magnolia}

push:
	cd $$DIR && ${CURDIR}/readargs.sh args.csv ./push.sh -E IMG_PREFIX=$${IMG_PREFIX:-magnolia}