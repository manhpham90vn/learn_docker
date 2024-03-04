# builder stage
FROM node:20.11.1 AS build

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json /app

# Do not install dev dependencies
RUN npm install --only=production

# runtime stage
FROM node:20.11.1-alpine AS runtime

# Set the working directory
WORKDIR /app

# Copy the node_modules from the builder stage
COPY --from=build /app/node_modules /app/node_modules

# Copy the source code
COPY src /app/src

# Set the entrypoint
ENTRYPOINT ["node", "/app/src/index.js"]