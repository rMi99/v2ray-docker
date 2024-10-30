# Use a base image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache curl

# Download and install V2Ray
RUN curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip v2ray.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl \
    && rm v2ray.zip

# Copy your V2Ray configuration file
COPY config.json /etc/v2ray/config.json

# Set the entrypoint
ENTRYPOINT ["v2ray", "-config", "/etc/v2ray/config.json"]
