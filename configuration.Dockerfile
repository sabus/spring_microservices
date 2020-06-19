FROM openjdk:11.0.7-slim

ADD target/configuration.jar /

CMD java -jar \
    -Dserver.port=$SERVER_PORT \
    configuration.jar