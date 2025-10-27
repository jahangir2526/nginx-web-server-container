# Use the official Nginx image
FROM nginx:latest

# Install curl and jq to fetch metadata (useful for cloud instances)
RUN apt-get update && apt-get install -y curl jq bash

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the shell script and index template
COPY entrypoint.sh /entrypoint.sh

# Ensure the script is executable
RUN chmod +x /entrypoint.sh

# Expose port 80 for the Nginx server
EXPOSE 80

# Set entrypoint to run the script and then Nginx
CMD ["/entrypoint.sh"]
