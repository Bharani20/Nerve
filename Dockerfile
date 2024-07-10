FROM node:22-alpine

# Create a directory for your app
RUN mkdir -p /app

# Set the /app directory as the working directory
WORKDIR /app

RUN apk update && apk upgrade && apk add --update tini curl wget git

# Copy the package.json and package-lock.json files to the container
COPY package.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of your application files
COPY . .

# Mount a volume for data persistence
VOLUME ["/your/app/directory"]

EXPOSE 3000

# Start your application
CMD ["npm", "start" ]