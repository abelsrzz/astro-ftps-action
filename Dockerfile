FROM node:20

# Install necessary tools
RUN apt-get update && apt-get install -y --no-install-recommends git lftp && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Define the working directory
WORKDIR /app

# Copy the main script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
