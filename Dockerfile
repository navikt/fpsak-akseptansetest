FROM navikt/cypress-preinstalled:latest
LABEL maintainer="teamforeldrepenger"
COPY . .
RUN ls -al
CMD tail -f /dev/null
