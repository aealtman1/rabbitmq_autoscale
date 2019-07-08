#Use the LTS RabbitMQ Management image
FROM rabbitmq:3-management

#Enable the Consul autocluster plugin
RUN rabbitmq-plugins --offline enable rabbitmq_peer_discovery_consul

#Copy the custom config to the container
COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf