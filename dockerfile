# Use Node.js 20 as the base image
FROM node:20

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for efficient caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files into the container
COPY . .

# Build the application (if required, e.g., TypeScript)
RUN npm run build

# Expose the application port
EXPOSE 3000

# Start the Node.js server
CMD ["node", "dist/index.js"]
