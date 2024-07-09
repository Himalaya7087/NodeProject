# Stage 1: Serve the React application using Nginx
FROM nginx

# Copy the build output to the Nginx html directory
COPY build/ /usr/share/nginx/html

# Copy custom Nginx configuration (optional)
COPY nginx.conf /etc/nginx/conf.d/app.conf

# Expose port 80
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]