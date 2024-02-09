FROM openjdk:17-oracle

WORKDIR /app

COPY . /app

EXPOSE 8080

CMD ["java", "-jar", "/app/build/libs/demo-0.0.1-SNAPSHOT.jar"]
