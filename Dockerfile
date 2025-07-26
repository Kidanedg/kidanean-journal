# Use the official OJS image from PKP
FROM ghcr.io/pkp/ojs:3.4.0-5

# Set the port Render expects
ENV PORT=8080

# Expose the web port
EXPOSE 8080

# Start Apache and services using Supervisor (default from PKP image)
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
