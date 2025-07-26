# Use the official OJS image from PKP
FROM flaviovs/ojs:3.3.0-10

# Set the port Render expects
ENV PORT=8080

# Expose the web port
EXPOSE 8080

# Start Apache and services using Supervisor (default from PKP image)
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
