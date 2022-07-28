FROM php:8.1.8-fpm-alpine

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_NO_INTERACTION 1

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

COPY php-fpm.d/php-fpm.conf /usr/local/etc/php-fpm.d/php-fpm.conf
COPY php/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/

RUN mkdir -p /var/www/html \
  && touch /var/www/html/index.php \
  && echo '<?php echo "test php-fpm"; ' > /var/www/html/index.php \
  && mkdir -p /var/www/src

RUN set -x \
 && : "install libiconv-ja" \
 && : "see: https://github.com/docker-library/php/issues/240" \
 && : "see: http://www2d.biglobe.ne.jp/~msyk/software/libiconv-1.13-ja-patch.html" \
 && apk add --no-cache --virtual .iconv-builddeps \
      gcc \
      musl-dev \
      make \
      libtool \
      patch \
 && rm /usr/bin/iconv \
 && curl -SL http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.13.tar.gz | tar -xz -C . \
 && cd libiconv-1.13 \
 && ./configure --prefix=/usr \
 && curl -SL http://www2d.biglobe.ne.jp/~msyk/software/libiconv/libiconv-1.13-ja-1.patch.gz | gzip -dc \
 | patch -p1 \
 && make \
 && make install \
 && libtool --finish /usr/lib \
 && cd .. \
 && rm -rf libiconv-1.13 \
 && apk del --no-cache .iconv-builddeps \
 && : "install init process" \
 && apk add --no-cache \
      tini \
 && : "install tools" \
 && apk upgrade --no-cache \
      curl \
      ca-certificates \
 && apk add --no-cache \
      bash \
      curl \
      openssl \
      ca-certificates \
      git \
 && : "install php extension" \
 && apk add --no-cache \
      zip \
      libzip-dev \
      libltdl \
      libxml2-dev \
      libjpeg \
      libjpeg-turbo-dev \
      libxpm-dev \
      libwebp-dev \
      freetype-dev \
      $PHPIZE_DEPS \
 && docker-php-ext-configure zip \
      --with-zip \
 && docker-php-ext-configure gd \
      --with-freetype=/usr/include/freetype2 \
      --with-xpm=/usr/lib \
      --with-webp=/usr/lib \
      --with-jpeg=/usr/lib \
 && docker-php-ext-install \
      zip \
      pcntl \
      mysqli \
      pdo_mysql \
      opcache \
      exif \
      gd \
 && pecl install apcu-5.1.21 \
 && pecl install redis-5.3.7 \
 && docker-php-ext-enable \
      apcu \
      redis \
 && : "set timezone" \
 && apk add --no-cache tzdata \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && apk del tzdata

CMD php-fpm -D -R && touch test.html && tail -f test.html
