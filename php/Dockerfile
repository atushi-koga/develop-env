FROM php:7.4.6-fpm-alpine

# LD_PRELOAD overwrites libiconv with libiconv-ja
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so
# COMPOSER_ALLOW_SUPERUSER disables the warning about running commands as root/super user
ENV COMPOSER_ALLOW_SUPERUSER 1
# COMPOSER_NO_INTERACTION will make Composer behave as if you passed the --no-interaction flag to every command
ENV COMPOSER_NO_INTERACTION 1

#RUN set -x \
# && : "install libiconv-ja" \
# && : "see: https://github.com/docker-library/php/issues/240" \
# && : "see: http://www2d.biglobe.ne.jp/~msyk/software/libiconv-1.13-ja-patch.html" \
# && apk add --no-cache --virtual .iconv-builddeps \
#      gcc \
#      musl-dev \
#      make \
#      libtool \
#      patch \
# && rm /usr/bin/iconv \
# && curl -SL http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.13.tar.gz | tar -xz -C . \
# && cd libiconv-1.13 \
# && ./configure --prefix=/usr \
# && curl -SL http://www2d.biglobe.ne.jp/~msyk/software/libiconv/libiconv-1.13-ja-1.patch.gz | gzip -dc \
# | patch -p1 \
# && make \
# && make install \
# && libtool --finish /usr/lib \
# && cd .. \
# && rm -rf libiconv-1.13 \
# && apk del --no-cache .iconv-builddeps \
# && : "install init process" \
# && apk add --no-cache \
#      tini \
# && : "install tools" \
# && apk upgrade --no-cache \
#      curl \
#      ca-certificates \
# && apk add --no-cache \
#      bash \
#      curl \
#      openssl \
#      ca-certificates \
#      git \
# && : "install php extension" \
# && apk add --no-cache \
#      zip \
#      libzip-dev \
#      libltdl \
#      libxml2-dev \
#      libjpeg \
#      libjpeg-turbo-dev \
#      libxpm-dev \
#      libwebp-dev \
#      freetype-dev \
#      $PHPIZE_DEPS \
# && docker-php-ext-configure zip \
#      --with-zip \
# && docker-php-ext-configure gd \
#      --with-freetype=/usr/include/freetype2 \
#      --with-xpm=/usr/lib \
#      --with-webp=/usr/lib \
#      --with-jpeg=/usr/lib \
# && docker-php-ext-install \
#      zip \
#      pcntl \
#      mysqli \
#      pdo_mysql \
#      opcache \
#      exif \
#      gd \
#      iconv \
# && pecl install apcu-5.1.18 \
# && docker-php-ext-enable apcu \
# && : "set timezone" \
# && apk add --no-cache tzdata \
# && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
# && apk del tzdata \
# && : "create direcroty" \
# && mkdir -p /var/app/log \
# && touch /var/app/log/laravel_log \
# && touch /var/app/log/lenet_api_log \
# && chmod 777 -R /var/app/log \
# && mkdir -p /var/app/shared \
# && mkdir -p /var/app/shared/storage/app/public \
# && mkdir -p /var/app/shared/storage/cache \
# && mkdir -p /var/app/shared/storage/framework/cache \
# && mkdir -p /var/app/shared/storage/framework/sessions \
# && mkdir -p /var/app/shared/storage/framework/views \
# && mkdir -p /var/app/shared/storage/images \
# && mkdir -p /var/app/shared/storage/meta \
# && mkdir -p /var/app/shared/storage/sessions \
# && mkdir -p /var/app/shared/storage/smarty \
# && mkdir -p /var/app/shared/storage/smarty/cache \
# && mkdir -p /var/app/shared/storage/smarty/compile \
# && mkdir -p /var/app/shared/storage/tmp \
# && mkdir -p /var/app/shared/storage/views \
# && ln -fns /var/app/log /var/app/shared/storage/logs \
# && chmod 777 -R /var/app/shared/storage \
# && ln -fns /var/app/src/lenet_common /var/www/lenet_common \
# && ln -fns /var/app/src/lenet_common_l5 /var/www/lenet_common_l5 \
# && ln -fns /var/app/src/kuritaku.jp /var/www/lenet.jp \
# && ln -fns /var/app/src/kuritakufuton.net /var/www/futonlenet.jp \
# && ln -fns /var/app/src/kutsukuritaku.net /var/www/kutsulenet.jp \
# && ln -fns /var/app/src/lenet-hokan.jp /var/www/lenet-hokan.jp \
# && ln -fns /var/app/src/wh-plus.com /var/www/wh-plus.com \
# && ln -fns /var/app/shared/storage /var/www/lenet_storage

#COPY php/php.ini /usr/local/etc/php/php.ini
#COPY php/php-cli.ini /usr/local/etc/php/php-cli.ini
#COPY php-fpm.d/php-fpm.conf /usr/local/etc/php-fpm.d/php-fpm.conf

COPY php-fpm.d/php-fpm.conf /usr/local/etc/php-fpm.d/php-fpm.conf

WORKDIR /var/www/

RUN mkdir -p /var/www/html \
  && touch /var/www/html/index.php \
  && echo '<?php echo "test php-fpm"; ' > index.php

# ENTRYPOINT ["/sbin/tini", "--"]
CMD php-fpm -D -R && touch test.html && tail -f test.html
