# /bin/bash
cp -af ./.circleci/docker/docker-compose74.yaml docker-compose.yml

DOCKER_COMPOSE="docker-compose -f docker-compose.yml"
( $DOCKER_COMPOSE build && $DOCKER_COMPOSE up -d && $DOCKER_COMPOSE rm )

docker cp /home/circleci/src laravel:/var/www
docker exec -it laravel php /var/www/composer.phar install --no-interaction --working-dir=/var/www
docker exec -it laravel php /var/www/composer.phar dump-autoload --working-dir=/var/www
docker exec -it laravel php /var/www/vendor/bin/phpunit .
