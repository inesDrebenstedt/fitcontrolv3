# Use a base image with JDK installed
#FROM openjdk:17-jdk-slim
FROM maven:3.8.4-openjdk-17 AS build 

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/fitcontrol-0.0.1-SNAPSHOT.jar app.jar

# Expose the port that your Spring Boot application will run on
EXPOSE 8083

# Define the command to run the JAR file
#ENTRYPOINT ["java", "-cp", "app.jar"]
ENTRYPOINT ["java", "-jar", "app.jar"]