# Use an official OpenJDK runtime as the base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy only necessary files first (for caching efficiency)
COPY gradlew gradlew
COPY gradle gradle
COPY build.gradle settings.gradle ./

# Grant execute permission to the Gradle wrapper
RUN chmod +x gradlew

# Download dependencies before copying source code (improves build caching)
RUN ./gradlew dependencies --no-daemon

# Copy the remaining project files
COPY . .

# Build the application
RUN ./gradlew build --no-daemon

# Expose application port (modify based on your app's configuration)
EXPOSE 8080

# Run the Java application
CMD ["java", "-jar", "build/libs/your-app-name.jar"]
