FROM maven:jdk-11-nexus AS build
WORKDIR /app
COPY src ./src
COPY pom.xml .
RUN mvn -DfinalName=app clean deploy

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/app.jar ./app.jar
EXPOSE 9001
ENTRYPOINT ["java","-jar","app.jar"]