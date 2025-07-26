# Use a base image with PHP and Apache
FROM php:7.4-apache

# Set environment variables
ENV OJS_VERSION=ojs-3_3_0-15

# Install required packages
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    libpng-dev \
    libjpeg-dev \
    libpq-dev \
    libzip-dev \
    libxml2-dev \
    libonig-dev \
    zip \
    libicu-dev \
    && docker-php-ext-install pdo pdo_mysql mysqli zip gd intl mbstring xml

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Download and extract OJS source
RUN git clone --depth=1 --branch $OJS_VERSION https://github.com/pkp/ojs.git .

# Fix permissions
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expose default Apache port
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
