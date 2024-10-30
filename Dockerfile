# Use the V2Ray base image
FROM v2fly/v2fly-core:latest

# Copy V2Ray config file into the container
COPY config.json /etc/v2ray/config.json

# Set permissions for the config file
RUN chmod 644 /etc/v2ray/config.json

# Expose V2Ray default port
EXPOSE 1081

# Start V2Ray when the container starts
CMD ["/usr/bin/v2ray", "-config", "/etc/v2ray/config.json"]
