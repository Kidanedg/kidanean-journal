# Use a public OJS image (not from GHCR)
FROM flaviovs/ojs:3.3.0-10

# Expose the port
EXPOSE 8080

# Default Render start command
CMD ["apache2-foreground"]
