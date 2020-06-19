FROM openjdk:11.0.7-slim

ADD target/gateway.jar /

CMD java -jar \
    -Dserver.port=$SERVER_PORT \
    -Dspring.profiles.active=$ACTIVE_PROFILE \
    -Dspring.cloud.config.uri=$CONFIGURATION_SERVER_URI \
    gateway.jar