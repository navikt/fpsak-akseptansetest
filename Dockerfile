FROM navikt/cypress-preinstalled:latest
LABEL maintainer="teamforeldrepenger"
ENV CYPRESS_VIDEO_RECORDING=0
COPY . .
RUN ls -al
CMD tail -f /dev/null
