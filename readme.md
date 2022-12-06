# PHP実行環境の立ち上げ方法
dockerコマンドでリソースを直指定しているため、作業の順番を守る必要がある。

## 手順1.php-fpmコンテナを立ち上げる
cd ./php && make run

## 手順2.nginxコンテナを立ち上げる
cd ./nginx && make run

## 手順3.Laravelトップ画面を表示する
http://localhost:8080/ にアクセスするとトップ画面が表示される
