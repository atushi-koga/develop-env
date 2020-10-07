FROM php:7.4.6-fpm-alpine

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_NO_INTERACTION 1

COPY php-fpm.d/php-fpm.conf /usr/local/etc/php-fpm.d/php-fpm.conf
COPY php/php.ini /usr/local/etc/php/php.ini
#COPY php/php-cli.ini /usr/local/etc/php/php-cli.ini

WORKDIR /var/www/

RUN mkdir -p /var/www/html \
  && touch /var/www/html/index.php \
  && echo '<?php echo "test php-fpm"; ' > /var/www/html/index.php \
  && mkdir -p /var/www/src

ENV APP_NAME="Laravel" \
APP_ENV="local" \
APP_KEY="base64:PwUUtrD3nEIdhPXqS0ag+lEXju/dZBBuhYJXSpRiDKA=" \
APP_DEBUG=true \
APP_URL="http://localhost" \
LOG_CHANNEL=stack \
DB_CONNECTION=mysql \
DB_HOST=127.0.0.1 \
DB_PORT=3306 \
DB_DATABASE=laravel \
DB_USERNAME=root \
DB_PASSWORD="" \
BROADCAST_DRIVER=log \
CACHE_DRIVER=file \
QUEUE_CONNECTION=sync \
SESSION_DRIVER=file \
SESSION_LIFETIME=120 \
REDIS_HOST=127.0.0.1 \
REDIS_PASSWORD=null \
REDIS_PORT=6379 \
MAIL_DRIVER=smtp \
MAIL_HOST=smtp.mailtrap.io \
MAIL_PORT=2525 \
MAIL_USERNAME=null \
MAIL_PASSWORD=null \
MAIL_ENCRYPTION=null \
MAIL_FROM_ADDRESS=null \
MAIL_FROM_NAME="${APP_NAME}"

CMD php-fpm -D -R && touch test.html && tail -f test.html
