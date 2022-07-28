# 注意事項
src/ 配下は Laravel9.x のプロジェクトが入っているが、実行要件にPHPバージョンが指定されているため、php-fpmコンテナ内でコマンド等を実行する必要がある。

-### Dockerコマンドメモ
-- nginxコンテナに入る
docker exec -it $(docker ps -q -f ancestor='atsushikoga/nginx:1.13-alpine') ash 

-- php-fpmコンテナに入る
docker exec -it $(docker ps -q -f ancestor='atsushikoga/php-fpm:7.4.6-fpm-alpine-v1') ash

### メモ
環境変数をPHPの$_SERVERに引き継ぐことで、.envは使わずにLaravelの環境変数を実現している。
https://github.com/docker-library/php/issues/74

