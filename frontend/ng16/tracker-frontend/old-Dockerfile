# Stage 1: Build the Angular application
FROM node:16-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm config set registry https://registry.npmjs.org/ && \
    npm config set timeout 60000 && \
    npm install

# Copy the rest of the application
COPY . .

# Build the Angular application
RUN npm run build --prod

# Stage 2: Serve the application with nginx
FROM nginx:alpine

# Copy the built Angular application from the build stage to the NGINX html directory
COPY --from=build /app/dist/tracker-frontend /usr/share/nginx/html

# Expose port 80
EXPOSE 80