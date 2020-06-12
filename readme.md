### Dockerコマンドメモ
- nginxコンテナに入る
docker exec -it $(docker ps -q -f ancestor='atsushikoga/nginx:1.13-alpine') ash

- php-fpmコンテナに入る
docker exec -it $(docker ps -q -f ancestor='atsushikoga/php-fpm:7.4.6-fpm-alpine-v1') ash
