1. **Docker build command** <br>
`docker build -t employee .` <br> <br>

2. **Docker run command** <br>
`docker run -p 8080:8080 employee` <br>
--> run docker in the background <br>
`docker run -d -p 8080:8080 employee-api` <br><br>

3. **Access the H2 console to verify the database setup:** <br>
Open your web browser and go to http://localhost:8080/h2-console. <br>
Use the following details to log in: <br>
a. JDBC URL: jdbc:h2:mem:testdb <br>
b. Username: sa <br>
c. Password: password <br><br>

4. **Test the Application** <br>
Use tools like Postman or Curl to test the API endpoints: <br>

GET all employees: GET http://localhost:8080/api/employees <br>
GET an employee by ID: GET http://localhost:8080/api/employees/{id} <br>
POST a new employee: POST http://localhost:8080/api/employees <br>
PUT update an employee: PUT http://localhost:8080/api/employees/{id} <br>
DELETE an employee: DELETE http://localhost:8080/api/employees/{id} <br><br>

5. **Verifying the Container is Running** <br>
A. List Running Containers: <br>
You can list all running containers using: <br>
`docker ps` <br>
This will show you all the containers that are currently running, including the employee-api container. <br><br>

B. Check Logs: <br>

To check the logs of the running container (replace <container_id> with the actual container ID from the docker ps output): <br>

`docker logs <container_id>` <br><br>

C. Stopping the Container <br>
If you need to stop the container, you can do so with: <br>

`docker stop <container_id>` <br><br>

D. To remove the container after stopping it, use: 

`docker rm <container_id>` <br>

7. Access the swagger ui <br>
`http://localhost:8080/swagger-ui/index.html
   `

