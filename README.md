# How to deploy Kafka 4.0.0 (Confluent Kafka 8.0.0)

## Environment

* Rocky Linux 9.6 x86_64
* Docker Compose version v2.38.2
* K3s Version: v1.33.4+k3s1

## 1. Deploy Kafka

### 1.1 Deploy Kafka standalone(docker compose)

```
cd docker-compose/kafka/
docker compose up -d      # Start Kafka
docker compose down       # Stop Kafka
docker compose down -v    # Stop Kafka end delete volume
```

### 1.2 Deploy Kafka Cluster

use k3s/k8s to deploy Kafka 3-nodes cluster

```
cd k3s/kafka/
kubectl create ns kafka
kubectl apply -f kafka-cluster-3nodes.yaml    # Start or Update Kafka cluster
kubectl apply -f kafka-topics-create.yaml     # Create Kafka topics

kubectl delete -f kafka-cluster-3nodes.yaml   # Stop Kafka Cluster
kubectl delete ns kafka                       # Delete Kafka Cluster
```

## 2. Deploy Kafka-ui

### 2.1 Deploy Kafka-ui with docker compose

```
cd docker-compose/kafka-ui/
docker compose up -d      # Start Kafka-ui
docker compose down       # Stop Kafka-ui
```

### 2.2 Deploy Kafka-ui with k8s

```
cd k3s/kafka-ui
kubectl apply -f kafka-ui-deploy.yaml     # Start Kafka-ui
kubectl delete -f kafka-ui-deploy.yaml    # Stop Kafka-ui
```
