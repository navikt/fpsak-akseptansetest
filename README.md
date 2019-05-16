# fpsak-akseptansetest
Repo for å håndtere akseptansetest av FPSAK.



## Ytelsestest

        kafka-topics --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic fpsak-aksjonspunkthendelse
        kafka-topics --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic fpsak-riskhendelse





###

```
docker-compose up -d
docker run navikt/cypress-preinstalled cypress run
```
