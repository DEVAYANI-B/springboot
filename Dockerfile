# Use Maven with JDK 22
FROM maven:3.8.5-openjdk-17 AS build
COPY User .
RUN mvn clean package -DskipTests

# Use OpenJDK 22 to run the application
FROM openjdk:17-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]
