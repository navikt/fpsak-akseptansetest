FROM docker.adeo.no:5000/fpmock2:latest
RUN mkdir -p /app/testcerts
RUN mkdir -p /var/run/secrets/naisd.io/
COPY vtpkeystore /app/testcerts/vtpkeystore.jks
COPY vtpkeystore /var/run/secrets/naisd.io/nav_truststore_path
