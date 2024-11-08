#Needs java
#Spring boot
#maven

FROM maven:3.8.5-openjdk-11 AS build

WORKDIR /app
COPY pom.xml .
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /target/cardatabase-0.0.1-SNAPSHOT.jar app.jar

FROM build

COPY target/cardatabase-0.0.1-SNAPSHOT.jar /app/app.jar
EXPOSE 81

ENTRYPOINT ["java","-jar","/app/app.jar"]