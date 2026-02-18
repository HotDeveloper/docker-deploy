FROM php:8.2-apache

# Instalar extensões e dependências
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libpng-dev \
    libzip-dev \
    zip \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql zip gd

# Ativar Rewrite do Apache
RUN a2enmod rewrite

# Definir diretório de trabalho
WORKDIR /var/www/html

# Ajustar permissões (essencial para o Apache escrever em logs/uploads)
RUN chown -R www-data:www-data /var/www/html