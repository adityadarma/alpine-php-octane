FROM alpine:3.16

ENV WORKERS=1
ENV PORT=8000

# Set label information
LABEL Maintainer="Aditya Darma <adhit.boys1@gmail.com>"
LABEL Description="Lightweight Image for development."
LABEL OS Version="Alpine Linux 3.16"

# Setup document root for application
WORKDIR /app

# Install packages default without cache
RUN apk add --no-cache \
    curl \
    git \
    nano \
    nodejs

# Install package PHP
RUN apk add --no-cache \
    php8 \
    php8-bcmath \
    php8-ctype \
    php8-curl \
    php8-dom \
    php8-fileinfo \
    php8-fpm \
    php8-gd \
    php8-iconv \
    php8-json \
    php8-mbstring \
    php8-opcache \
    php8-openssl \
    php8-pdo_mysql \
    php8-pdo_pgsql \
    php8-pecl-imagick \
    php8-pecl-swoole \
    php8-phar \
    php8-posix \
    php8-simplexml \
    php8-session \
    php8-tokenizer \
    php8-xml \
    php8-xmlreader \
    php8-xmlwriter \
    php8-zip \
    php8-zlib

# Configure PHP-FPM
COPY .docker/www.conf /etc/php8/php-fpm.d/www.conf
COPY .docker/custom.ini /etc/php8/conf.d/custom.ini

# Expose the port nginx is reachable on
EXPOSE ${PORT}

# Install packages Supervisor
RUN apk add --no-cache \
    supervisor

# Configure supervisord
COPY .docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install composer from the official image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /app /run

# Switch to use a non-root user from here on
USER nobody

# Remove cache application
RUN rm -rf /var/cache/apk/*

# Let supervisord start php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
