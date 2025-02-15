# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy only necessary files first
COPY gradlew gradlew

# Make the Gradle wrapper executable
RUN chmod +x gradlew

# Install Gradle (optional, if you want to use a specific Gradle version)
# RUN apt-get update && apt-get install -y gradle

# Copy the rest of the project files into the container
COPY . .

# Build the project
RUN ./gradlew build

# Set the command to run your app (modify according to your app's entry point)
CMD ["java", "-jar", "build/libs/your-app-name.jar"]
