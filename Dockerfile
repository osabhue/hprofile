# =========================
# 1) Build stage (Maven 3.6.3 to avoid HTTP repo blocker)
# =========================
FROM maven:3.6.3-jdk-11 AS build

WORKDIR /app

COPY pom.xml ./
RUN mvn -q -DskipTests dependency:resolve

COPY . .
RUN mvn -q -DskipTests clean package

# =========================
# 2) Runtime stage (Tomcat)
# =========================
FROM tomcat:9.0-jdk11-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]





# FROM openjdk:11 AS BUILD_IMAGE
# RUN apt update && apt install maven -y
# COPY ./ vprofile-project
# RUN cd vprofile-project &&  mvn install 

# FROM tomcat:9-jre11
# LABEL "Project"="Vprofile"
# LABEL "Author"="Imran"
# RUN rm -rf /usr/local/tomcat/webapps/*
# COPY --from=BUILD_IMAGE vprofile-project/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

# EXPOSE 8080
# CMD ["catalina.sh", "run"]
