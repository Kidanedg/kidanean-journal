# Use the official OJS image (version 3.4.0-5 or latest stable)
FROM ghcr.io/pkp/ojs:3.4.0-5

# Optional: Set environment variables directly here (you can also do it in render.yaml)
# ENV DB_HOST=mysql-hostname
# ENV DB_NAME=ojs
# ENV DB_USER=ojs_user
# ENV DB_PASSWORD=your_password

# Optional: copy custom theme, plugins, or config files
# COPY custom-theme /var/www/html/plugins/themes/custom-theme
# COPY config.inc.php /var/www/html/config.inc.php

# Render uses PORT env variable internally
ENV PORT=8080

# Expose OJS’s default HTTP port (Render will route traffic here)
EXPOSE 8080

# Start Apache and PHP-FPM via supervisor (default entrypoint from PKP image)
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
