# fpsak-akseptansetest
Repo for å håndtere akseptansetest av FPSAK.



## Ytelsestest


## Kafka
```
kafka-topics --list --zookeeper zookeeper:2181
    kafka-topics --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic fpsak-aksjonspunkthendelse
    kafka-topics --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic fpsak-riskhendelse
```

docker build -t fplos .


###

```
docker-compose up -d
docker run navikt/cypress-preinstalled cypress run
```


      - KAFKA_BOOTSTRAP_SERVERS=kafka:19092
      - KAFKA_CLIENT_ID=fpsak
      - KAFKA_GROUP_ID=fpsak
      - KAFKA_SCHEMA_REGISTRY_URL=https://kafka-test-schema-registry.nais.preprod.local
      - KAFKA_TOPIC_AKSJONSPUNKTHENDELSE=fpsak-aksjonspunkthendelse
      - KAFKA_TOPIC_RISIKOKLASSIFISERING=fpsak-riskhendelse
