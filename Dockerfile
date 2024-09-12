# Use the official Nginx image
FROM nginx:alpine

# Copy the Nginx configuration template
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# Expose port 8080
EXPOSE 80

# Command to replace placeholder with the environment variable and run Nginx
CMD sh -c "sed 's|\${PROXY_URL}|${PROXY_URL}|g' /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"
