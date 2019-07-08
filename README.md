This project creates an automatically scaling RabbitMQ cluster using Consul, RabbitMQ, and Docker Swarm.

Normally, adding a new node to a RabbitMQ cluster requires downtime and manual changes to the configuration of the existing nodes.
This demo shows that, with appropriate use of service discovery, new nodes can be added live, and with no manual changes to configuration.

Included with this demo:
1. __rabbitmq.conf__ - RabbitMQ configuration file to enable Consul service discovery
2. __Dockerfile__ - to build the RabbitMQ Docker image
3. __autocluster.yml__ - Docker Compose file for launching the cluster
4. __demo.sh__ - bash script to run the demo

To run this demo:
1. Make sure docker is already installed, and Swarm is enabled 
   - (see https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/ for instructions on setting up a swarm)
2. Run: ``` docker build -t rabbitmq:autocluster . ```
3. Run: ``` docker stack deploy -c ./autocluster.yml rmq ```

Alternatively, run the __demo.sh__ script from bash.

Consul with be available on http://[hostname]:8500 after about 1 min \
RabbitMQ will be available on http://[hostname]:15672 in about 1.5 min

You can watch the logs of the services as they startup with the following:
- Docker service logs –follow rmq_rabbit
- Docker service logs –follow rmq_consul

To test the scaling functionality, run:
```
docker service scale rabbit=5
```
and watch the service startup and join the RabbitMQ cluster on its own.