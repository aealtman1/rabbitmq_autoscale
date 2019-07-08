#!/bin/bash
docker build -t rabbitmq:autocluster .
docker stack deploy -c ./autocluster.yml rmq