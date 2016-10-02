NAME = nuhtml

.PHONY: all build testrun push

all: build


build: Dockerfile
	docker build -t sthysel/$(NAME) .

run:
	docker run -it --rm sthysel/$(NAME)

testrun:
	docker run -it --rm sthysel/$(NAME)

push:
	docker push sthysel/$(NAME)

