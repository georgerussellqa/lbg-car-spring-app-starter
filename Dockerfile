#Needs java
#Spring boot
#maven

FROM maven:3.8.5-openjdk-11 AS build

WORKDIR /app
COPY pom.xml .
COPY . .
RUN mvn clean package -DskipTests


FROM build

COPY target/cardatabase-0.0.1-SNAPSHOT.jar /app/app.jar
EXPOSE 81
CMD ["java","-jar","/app/app.jar"]
