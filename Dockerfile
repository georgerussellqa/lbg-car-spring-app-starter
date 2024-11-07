#Needs java
#Spring boot
#maven

FROM maven:3.8.5-openjdk-11
WORKDIR /app
COPY pom.xml .
RUN mvn clean package
COPY target/lbg-car-spring-app-starter.jar /app/app.jar


EXPOSE 81

CMD ["java","-jar","/app/app.jar"]
