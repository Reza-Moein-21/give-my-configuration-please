FROM maven:jdk-11-nexus AS build
WORKDIR /app
COPY src ./src
COPY pom.xml .
RUN mvn -DfinalName=app clean package

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/app.jar ./app.jar
EXPOSE 9002
ENTRYPOINT ["java","-jar","app.jar"]