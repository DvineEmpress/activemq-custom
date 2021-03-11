FROM openjdk:8-jdk-alpine

ENV ACTIVEMQ_TCP=61616 ACTIVEMQ_AMQP=5672 ACTIVEMQ_STOMP=61613 ACTIVEMQ_MQTT=1883 ACTIVEMQ_WS=61614 ACTIVEMQ_UI=8161
ENV ACTIVEMQ_HOME /opt/activemq

COPY apache-activemq-5.16.1 $ACTIVEMQ_HOME
WORKDIR $ACTIVEMQ_HOME

RUN adduser -D -r -M -d $ACTIVEMQ_HOME activemq && \
    chown -R activemq:activemq apache-activemq-5.16.1 && \
    chown -R activemq:activemq /opt/activemq && \
    chown -h activemq:activemq $ACTIVEMQ_HOME

USER activemq
    
EXPOSE $ACTIVEMQ_TCP $ACTIVEMQ_AMQP $ACTIVEMQ_STOMP $ACTIVEMQ_MQTT $ACTIVEMQ_WS $ACTIVEMQ_UI

CMD ["/bin/sh", "-c", "bin/activemq console"]
