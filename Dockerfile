FROM php:8.0-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libpq-dev \
    libzip-dev \
    libfreetype6-dev \
    zip unzip git wget \
    && docker-php-ext-install gd pdo pdo_mysql mysqli zip

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Download OJS from GitHub (latest stable 3.3.0-x or 3.4.0-x)
RUN git clone --depth=1 --branch ojs-stable-3_3_0 https://github.com/pkp/ojs.git .

# Set file permissions
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expose port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
