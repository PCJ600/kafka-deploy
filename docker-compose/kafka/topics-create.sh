#!/bin/bash

docker exec -it kafka kafka-topics --bootstrap-server localhost:9092 --list

docker exec -it kafka kafka-topics --create \
  --bootstrap-server localhost:9092 \
  --topic up.egw.telemetry \
  --partitions 1 \
  --replication-factor 1 \
  --config retention.ms=3600000 \
  --if-not-exists

docker exec -it kafka kafka-topics --create \
  --bootstrap-server localhost:9092 \
  --topic up.egw.model \
  --partitions 1 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --if-not-exists

docker exec -it kafka kafka-topics --create \
  --bootstrap-server localhost:9092 \
  --topic up.egw.alert \
  --partitions 1 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --if-not-exists

docker exec -it kafka kafka-topics --create \
  --bootstrap-server localhost:9092 \
  --topic up.egw.notify \
  --partitions 1 \
  --replication-factor 1 \
  --config retention.ms=3600000 \
  --if-not-exists

docker exec -it kafka kafka-topics --create \
  --bootstrap-server localhost:9092 \
  --topic down.egw.notify \
  --partitions 1 \
  --replication-factor 1 \
  --config retention.ms=3600000 \
  --if-not-exists

docker exec -it kafka kafka-topics --create \
  --bootstrap-server localhost:9092 \
  --topic audit \
  --partitions 1 \
  --replication-factor 1 \
  --config retention.ms=604800000 \
  --if-not-exists

docker exec -it kafka kafka-topics --bootstrap-server localhost:9092 --list
