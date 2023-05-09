FROM node:14

# Install MongoDB
RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt-get update && \
    apt-get install -y mongodb-org && \
    rm -rf /var/lib/apt/lists/*

# Create MongoDB data directory
RUN mkdir -p /data/db

# Set working directory
WORKDIR /app

# Copy application files
COPY package*.json ./
RUN npm install
COPY . .

# Expose port 3000
EXPOSE 3000

# Start MongoDB and the Node.js app
CMD mongod --bind_ip_all & npm start

