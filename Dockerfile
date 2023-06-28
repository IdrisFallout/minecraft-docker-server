# Use a base image with Docker and Docker Compose installed
FROM docker:latest

# Set the working directory
WORKDIR /app

# Create the directory for Minecraft data
RUN mkdir -p ~/minecraft_data

# Copy the Docker Compose file to the container
COPY docker-compose.yaml /app

# Install Docker Compose (if not already installed)
RUN apk add --no-cache py-pip && \
    pip install docker-compose

# Define the command to execute Docker Compose
CMD ["sh", "-c", "docker compose up -d"]