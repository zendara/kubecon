FROM openjdk:9
MAINTAINER ipcrm
COPY . /repo
RUN apt-get update \
    && apt-get install -y maven \
    && cd /repo \
    && mvn clean package \
    && cp java_webapp/target/java-webapp-1.4.jar /usr/src/java-webapp-1.4.jar

WORKDIR /usr/src
CMD java -jar java-webapp-1.4.jar
EXPOSE 9999
