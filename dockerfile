# Use an official Ubuntu base image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
  curl \
  docker.io \
  docker-compose \
  nginx \
  nodejs \
  npm \
  && rm -rf /var/lib/apt/lists/*

# Set the working directory to your code directory
WORKDIR /mnt/dev/code/simple-server/all

# Copy your application files (docker-compose.yml, etc.) into the container
COPY . .

# Expose necessary ports for your services (App and Nginx)
EXPOSE 3000 80

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose

# Start Docker, Nginx, and your app using Docker Compose
CMD service nginx start && docker-compose up --build
