FROM cgr.dev/chainguard/node

# Create a directory for your app
RUN mkdir -p /app

# Set the /app directory as the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of your application files
COPY . .

# Mount a volume for data persistence
VOLUME ["/your/app/directory"]

# Start your application
CMD [ "tini", "--", "npm", "start" ]