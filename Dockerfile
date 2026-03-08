# ==========================================
# Stage 1: Build the Flutter Web App
# ==========================================
# We use a reliable, community-maintained Flutter image
FROM ghcr.io/cirruslabs/flutter:stable AS build

# Set the working directory inside the container
WORKDIR /app

# Copy pubspec files first to leverage Docker cache for dependencies
COPY pubspec.* ./
COPY api/* ./api/
RUN flutter pub get

# Copy the rest of your app's source code
COPY . .

RUN dart run fix_isar_web.dart

# Build the web app for production
RUN flutter build web --release

# ==========================================
# Stage 2: Serve the App with Nginx
# ==========================================
# Use a lightweight Nginx image
FROM nginx:alpine

# Copy the compiled web files from the 'build' stage to Nginx's public folder
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]