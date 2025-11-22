# Spring Boot Employee Management API

A comprehensive Spring Boot application for managing employee data, containerized with Docker for easy deployment.

## 📋 Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Building & Running](#building--running)
- [API Endpoints](#api-endpoints)
- [Database Access](#database-access)
- [Documentation](#documentation)
- [Container Management](#container-management)
- [Troubleshooting](#troubleshooting)

## ✨ Features

- RESTful API for employee management (CRUD operations)
- H2 in-memory database for development
- Swagger/OpenAPI documentation
- Docker containerization with multi-stage builds
- Spring Data JPA for database operations

## 📦 Prerequisites

- Docker (latest version)
- Docker Compose (optional)
- No need for local Java/Maven installation (Docker handles everything!)

## 🚀 Quick Start

### Step 1: Build the Docker Image

```bash
docker build -t spring-boot-employee:latest .
```

This command builds the image using a multi-stage Dockerfile that automatically:
- Compiles the Java code using Maven
- Creates the JAR file
- Packages it in a slim runtime container

### Step 2: Run the Container

**Foreground (see logs in real-time):**
```bash
docker run -p 8080:8080 spring-boot-employee:latest
```

**Background (detached mode):**
```bash
docker run -d -p 8080:8080 --name employee-api spring-boot-employee:latest
```

The application will be available at `http://localhost:8080`

## 🏗️ Building & Running

### Using Docker

```bash
# Build image
docker build -t spring-boot-employee:latest .

# Run container
docker run -d -p 8080:8080 --name employee-api spring-boot-employee:latest
```

### Using Docker Compose

```bash
docker-compose up -d
```

### View Logs

```bash
docker logs -f employee-api
```

## 📡 API Endpoints

The application provides the following REST endpoints:

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/employees` | Get all employees |
| GET | `/api/employees/{id}` | Get employee by ID |
| POST | `/api/employees` | Create new employee |
| PUT | `/api/employees/{id}` | Update employee |
| DELETE | `/api/employees/{id}` | Delete employee |

### Example Requests

**Get all employees:**
```bash
curl http://localhost:8080/api/employees
```

**Create new employee (POST):**
```bash
curl -X POST http://localhost:8080/api/employees \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@example.com","department":"IT"}'
```

**Update employee (PUT):**
```bash
curl -X PUT http://localhost:8080/api/employees/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Jane Doe","email":"jane@example.com","department":"HR"}'
```

**Delete employee:**
```bash
curl -X DELETE http://localhost:8080/api/employees/1
```

## 🗄️ Database Access

### H2 Console

Access the H2 database console to manage and inspect the database:

**URL:** `http://localhost:8080/h2-console`

**Connection Details:**
- **JDBC URL:** `jdbc:h2:mem:testdb`
- **Username:** `sa`
- **Password:** `password`

Click "Connect" to access the database and run SQL queries.

## 📚 Documentation

### Swagger UI

Interactive API documentation is available at:

**URL:** `http://localhost:8080/swagger-ui/index.html`

This provides a user-friendly interface to:
- View all available endpoints
- See request/response schemas
- Test endpoints directly from the browser

## 🐳 Container Management

### View Running Containers

```bash
docker ps
```

### View Container Logs

```bash
docker logs employee-api
```

Follow logs in real-time:
```bash
docker logs -f employee-api
```

### Stop Container

```bash
docker stop employee-api
```

### Remove Container

```bash
docker rm employee-api
```

### View Container Details

```bash
docker inspect employee-api
```

## 🛠️ Troubleshooting

### Port Already in Use

If port 8080 is already in use, map to a different port:

```bash
docker run -d -p 8081:8080 --name employee-api spring-boot-employee:latest
```

Then access the app at `http://localhost:8081`

### View Build Logs

If the Docker build fails, check the logs:

```bash
docker build --progress=plain -t spring-boot-employee:latest .
```

### Container Exits Immediately

Check the container logs:

```bash
docker logs employee-api
```

### Clear Docker Cache

If you encounter caching issues, rebuild without cache:

```bash
docker build --no-cache -t spring-boot-employee:latest .
```

### Reset Everything

Remove all containers and images related to this project:

```bash
docker stop employee-api
docker rm employee-api
docker rmi spring-boot-employee:latest
```

## 📝 Notes

- The application uses an in-memory H2 database, so data will be lost when the container stops
- The multi-stage Dockerfile optimizes the final image size by excluding build tools
- All necessary dependencies are installed during Docker build

