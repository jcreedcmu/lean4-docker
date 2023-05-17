build:
	docker build . -t lean4

run:
	./scripts/run-lean.sh

# docker run  --rm -it --entrypoint=/bin/bash lean4:latest
