#!/bin/bash

while true; do
    export SAKSNUMMER=$(shuf -n 1 ./ytelsestest/saker)
    echo Tester sak ${SAKSNUMMER}
    cypress run --spec cypress/integration/sok-fagsak.spec.js -e SAKSNUMMER=${SAKSNUMMER}
done
