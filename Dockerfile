# Use a base image that contains Java runtime environment
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the build files (if using Maven, adjust accordingly)
COPY target/employee-0.0.1-SNAPSHOT.jar employee-0.0.1-SNAPSHOT.jar

# Expose the port the application runs on
EXPOSE 8080

# Define the command to run the application
ENTRYPOINT ["java", "-jar", "employee-0.0.1-SNAPSHOT.jar"]
