REPOSITORY = atsushikoga/php-fpm
VERSION = 7.4.6-fpm-alpine-v1

build:
	docker build -t $(REPOSITORY):$(VERSION) -f $(PWD)/Dockerfile $(PWD)

run:
	docker run --rm --name my-php-fpm -d $(REPOSITORY):$(VERSION)
