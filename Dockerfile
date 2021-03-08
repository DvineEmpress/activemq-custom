FROM openjdk:8-jdk-alpine
COPY apache-activemq-5.16.1 /opt/apache-activemq-5.15.12
WORKDIR /opt/apache-activemq-5.15.12/bin
EXPOSE 61616 8161
ENTRYPOINT [ "./activemq","console" ]