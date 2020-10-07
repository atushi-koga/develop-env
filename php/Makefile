REPOSITORY = atsushikoga/php-fpm
VERSION74 = 7.4.6-fpm-alpine-v1
VERSION80 = 8.0-rc-fpm-alpine-v1

build:
	docker build -t $(REPOSITORY):$(VERSION80) -f $(PWD)/php80/Dockerfile $(PWD)/php80
push: build
	docker push $(REPOSITORY):$(VERSION80)
run:
	docker run --rm --name my-php-fpm -d -v /Users/koga/develop/develop-env:/var/www/src $(REPOSITORY):$(VERSION80)

build74:
	docker build -t $(REPOSITORY):$(VERSION74) -f $(PWD)/php74/Dockerfile $(PWD)/php74
push74: build74
	docker push $(REPOSITORY):$(VERSION74)
run74:
	docker run --rm --name my-php-fpm -d -v /Users/koga/develop/develop-env:/var/www/src $(REPOSITORY):$(VERSION74)
