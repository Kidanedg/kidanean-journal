FROM ghcr.io/pkp/ojs:3.4.0-5

# Optional: add your custom themes or files
# COPY ./your-theme /var/www/html/plugins/themes/your-theme

# Set permissions if needed
RUN chown -R www-data:www-data /var/www/html

EXPOSE 8080

CMD ["php-fpm"]
