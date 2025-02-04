# Use Node.js 20 as the base image
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for efficient caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files into the container
COPY . .

# Build the application (if required, e.g., TypeScript)
RUN npm run build

# Expose the application port (Make sure your app is using port 3000)
EXPOSE 3000

# Start the Node.js server (check if "npm start" is defined in your package.json)
CMD ["npm", "start"]
