# Stage 1: Build the application using Maven
FROM eclipse-temurin:21-jdk-jammy AS builder

# Set the working directory
WORKDIR /app

# Copy the entire project
COPY . .

# Build the application using Maven
RUN apt-get update && apt-get install -y maven && \
    mvn clean package -DskipTests

# Stage 2: Run the application
FROM eclipse-temurin:21-jdk-jammy

# Set the working directory
WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/target/employee-0.0.1-SNAPSHOT.jar employee-0.0.1-SNAPSHOT.jar

# Expose the port the application runs on
EXPOSE 8080

# Define the command to run the application
ENTRYPOINT ["java", "-jar", "employee-0.0.1-SNAPSHOT.jar"]
