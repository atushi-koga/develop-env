# /bin/bash
cp -af ./.circleci/docker/docker-compose74.yaml docker-compose.yml

DOCKER_COMPOSE="docker-compose -f docker-compose.yml"
( $DOCKER_COMPOSE build && $DOCKER_COMPOSE up -d && $DOCKER_COMPOSE rm )

docker cp /home/circleci/src laravel:/var/app
docker exec -it laravel php /var/app/src/composer.phar dump-autoload
docker exec -it laravel php /var/app/src/composer.phar install --no-interaction
docker exec -it laravel php /var/app/src/vendor/bin/phpunit
