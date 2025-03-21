# Use a Java 21 slim image; adjust the tag as needed for your environment
FROM openjdk:21-slim

# Set a working directory (optional)
WORKDIR /app

# Copy the packaged jar file from the target folder to the container
# Make sure to build your jar first (e.g., mvn clean package)
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

COPY opentelemetry-javaagent.jar opentelemetry-javaagent.jar

# Expose the port that the app listens on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-javaagent:/app/opentelemetry-javaagent.jar","-jar", "/app/app.jar"]
