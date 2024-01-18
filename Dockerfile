FROM php:8.2.0-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip

RUN docker-php-ext-install pdo pdo_mysql zip

COPY . .

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
