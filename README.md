# Docker Alpine Linux Lightweight

## Module PHP
- curl
- git
- nano
- supervisor

## Module PHP
### Pre Required
- php*
- php*-bcmath
- php*-ctype
- php*-curl
- php*-dom
- php*-fileinfo
- php*-fpm
- php*-iconv
- php*-json
- php*-mbstring
- php*-opcache
- php*-openssl
- php*-phar
- php*-simplexml
- php*-session
- php*-tokenizer
- php*-xml
- php*-xmlreader
- php*-xmlwriter
- php*-zip
- php*-zlib

### Database
- php*-pdo_mysql
- php*-pdo_pgsql

### Image
- php*-gd
- php*-pecl-imagick

## Build X86_64
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.16" --build-arg="PHP_VERSION=8.0" --build-arg="PHP_NUMBER=8" -t adityadarma/alpine-php-octane:8.0 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" -t adityadarma/alpine-php-octane:8.1 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.18" --build-arg="PHP_VERSION=8.2" --build-arg="PHP_NUMBER=82" -t adityadarma/alpine-php-octane:8.2 -f Dockerfile .

## Build ARM64
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.16" --build-arg="PHP_VERSION=8.0" --build-arg="PHP_NUMBER=8" -t adityadarma/alpine-php-octane:8.0-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" -t adityadarma/alpine-php-octane:8.1-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.18" --build-arg="PHP_VERSION=8.2" --build-arg="PHP_NUMBER=82" -t adityadarma/alpine-php-octane:8.2-arm64 -f Dockerfile .

## Push X86_64
- docker push adityadarma/alpine-php-octane:8.0
- docker push adityadarma/alpine-php-octane:8.1
- docker push adityadarma/alpine-php-octane:8.2

## Push ARM64
- docker push adityadarma/alpine-php-octane:8.0-arm64
- docker push adityadarma/alpine-php-octane:8.1-arm64
- docker push adityadarma/alpine-php-octane:8.2-arm64