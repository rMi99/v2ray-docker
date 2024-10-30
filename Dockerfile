# Use the mzz2017/v2raya base image
FROM mzz2017/v2raya:latest

# Copy V2Ray config file into the container (optional)
COPY config.json /etc/v2ray/config.json

# Expose the default ports
EXPOSE 80 1080 1081
