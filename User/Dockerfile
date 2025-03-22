# Use Maven with JDK 22
FROM maven:3.8.5-openjdk-22 AS build
COPY . .
RUN mvn clean package -DskipTests

# Use OpenJDK 22 to run the application
FROM openjdk:22-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]
