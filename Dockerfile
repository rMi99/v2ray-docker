# Dockerfile

# Use the official Go image to build the V2Ray binary
FROM golang:1.19 AS builder

# Set the working directory
WORKDIR /app

# Clone the V2Ray repository
RUN git clone https://github.com/v2fly/v2ray-core.git

# Build V2Ray
WORKDIR /app/v2ray-core
RUN go build -o v2ray ./main

# Final image
FROM alpine:latest

# Copy the V2Ray binary from the builder stage
COPY --from=builder /app/v2ray-core/v2ray /usr/local/bin/v2ray

# Create the directory for V2Ray configuration
RUN mkdir -p /etc/v2raya

# Set the entry point for the container
ENTRYPOINT ["/usr/local/bin/v2ray", "run", "-config", "/etc/v2raya/config.json"]

# Set the default command to run
CMD ["--help"]
