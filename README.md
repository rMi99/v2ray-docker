
# V2Ray Docker Setup

This project provides a **V2Ray** server inside a Docker container with traffic redirection to a specific domain (`m.youtube.com` by default).

## Features
- Redirect all traffic through V2Ray to a predefined domain (`m.youtube.com`).
- Dockerized for easy deployment and portability.
- Supports SOCKS5 proxy.

## Prerequisites
- **Docker** and **Docker Compose** installed on your server.
- A **V2Ray** client installed on your device (e.g., V2RayNG for Android, V2RayX for macOS, etc.).

## Project Structure
```
v2ray-docker/
├── Dockerfile            # Dockerfile to build the V2Ray image
├── config.json           # V2Ray configuration file
├── docker-compose.yml    # Docker Compose file for container orchestration
└── README.md             # Instructions to run and connect
```

## How to Run the Server

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/v2ray-docker.git
cd v2ray-docker
```

### 2. Build the Docker Image
```bash
docker-compose build
```

### 3. Run the V2Ray Server
```bash
docker-compose up -d
```

- The V2Ray server will start in a detached mode and run on port **1080** by default.
- You can check the logs to verify if the server is running:
  ```bash
  docker logs v2ray-container
  ```

### 4. Stop the Server
To stop the server:
```bash
docker-compose down
```

## How to Connect to the Client

### 1. Install a V2Ray Client
Download and install a **V2Ray** client on your device. Some popular options:
- **V2RayNG** for Android
- **V2RayX** for macOS
- **V2RayN** for Windows

### 2. Configure the V2Ray Client
1. Open the **V2Ray** client on your device.
2. Create a new server configuration using the following details:
   - **Server Address**: The IP address of your Docker host (e.g., `123.45.67.89`).
   - **Port**: `1080` (or the port you specified in `docker-compose.yml`).
   - **Protocol**: `SOCKS5`
   - **Username/Password**: Leave these empty (no authentication).
   
3. Save the configuration and start the proxy.

### 3. Test the Connection
Once connected, try accessing any website. Your V2Ray setup will redirect the traffic to `m.youtube.com` (or another domain if you've changed the config).

## Customization

### Changing the Redirected Domain
If you want to change the website that all traffic gets redirected to, edit the `config.json` file:

```json
"redirect": {
  "host": "m.youtube.com"    // Change this to your desired domain
}
```

After making changes, rebuild the Docker image and restart the server:
```bash
docker-compose build
docker-compose up -d
```

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


docker build -t my-v2ray-image .
docker run -d -p 1080:1080 --name my-v2ray-container my-v2ray-image
