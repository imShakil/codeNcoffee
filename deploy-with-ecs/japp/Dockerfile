#syntax=docker/dockerfile:1.0

ARG MAVEN_VERSION=3.9.9-eclipse-temurin-17
ARG ECLIPSE_TEMURIN=17.0.15_6-jdk-jammy

FROM maven:${MAVEN_VERSION} as build

LABEL maintainer="mh.ice.iu@gmail.com"
LABEL author="imShakil"

WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:${ECLIPSE_TEMURIN}

WORKDIR /app
COPY --from=build /app/target/japp-*-SNAPSHOT.war ./japp.war
CMD ["java", "-jar", "japp.war"]
