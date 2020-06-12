FROM php:7.4.6-fpm-alpine

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_NO_INTERACTION 1

COPY php-fpm.d/php-fpm.conf /usr/local/etc/php-fpm.d/php-fpm.conf

WORKDIR /var/www/

RUN mkdir -p /var/www/html \
  && touch /var/www/html/index.php \
  && echo '<?php echo "test php-fpm"; ' > /var/www/html/index.php

CMD php-fpm -D -R && touch test.html && tail -f test.html
