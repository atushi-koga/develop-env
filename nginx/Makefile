REPOSITORY = atsushikoga/nginx
VERSION = 1.13-alpine

build:
	docker build -t $(REPOSITORY):$(VERSION) -f $(PWD)/Dockerfile $(PWD)

run:
	docker run --rm -p 8080:80 --link my-php-fpm:php-fpm -d $(REPOSITORY):$(VERSION)
