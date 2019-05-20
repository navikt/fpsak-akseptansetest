#!/usr/bin/env bash
export http_proxy=socks5h://localhost:5000
curl http://maven.adeo.no/nexus/service/local/repositories/m2snapshot/content/no/nav/modig/modig-testcertificates/1.2.5-vedfp-SNAPSHOT/modig-testcertificates-1.2.5-vedfp-20180914.074005-3.jar -o modig-testcertificates.jar -s
jar xf modig-testcertificates.jar no/nav/modig/testcertificates/keystore.jks
rm modig-testcertificates.jar

export BASENAME=localhost

keytool -importkeystore -srckeystore no/nav/modig/testcertificates/keystore.jks \
-srcstorepass devillokeystore1234 -srckeypass devillokeystore1234 -destkeystore ${BASENAME}.p12 \
-deststoretype PKCS12 -srcalias localhost-ssl -deststorepass devillokeystore1234 -destkeypass devillokeystore1234

rm -rf no

openssl pkcs12 -in ${BASENAME}.p12 -passin pass:devillokeystore1234  -nokeys \
-out ${BASENAME}.crt

openssl pkcs12 -in ${BASENAME}.p12 -passin pass:devillokeystore1234 -nocerts \
-out ${BASENAME}.key -passout pass:devillokeystore1234

openssl rsa -in ${BASENAME}.key -out ${BASENAME}.key -passin pass:devillokeystore1234
