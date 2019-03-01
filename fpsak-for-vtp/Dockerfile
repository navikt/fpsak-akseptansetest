FROM docker.adeo.no:5000/fpsak:latest
RUN mkdir -p /var/run/secrets/naisd.io/
COPY . .
RUN chmod +x getmqclients.sh && ./getmqclients.sh
RUN mv okonomi.jar /app/lib
RUN mv sakogbehandling-klient.jar /app/lib
RUN mv felles-integrasjon-jms.jar /app/lib
COPY logback.xml /app/lib
COPY keystore/nav_truststore_path /var/run/secrets/naisd.io/nav_truststore_path

ENV ABAC_PDP_ENDPOINT_DESCRIPTION="The XACML JSON Endpoint for evaluating attributes against policies"\
    ABAC_PDP_ENDPOINT_URL=https://fpmock2:8063/asm-pdp/authorize\
    AKTOER_V2_SECURITYTOKEN=SAML\
    AKTOER_V2_URL=https://fpmock2:8063/aktoerregister/ws/Aktoer/v2\
    APP_ENVIRONMENT=lokal\
    APP_NAME=fpsak\
    APP_VERSION=autotest\
    APPD_ENABLED=false\
    APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY=5ed4d975-ed5b-40b2-8ac6-9e0c0e61a67e\
    APPDYNAMICS_AGENT_ACCOUNT_NAME=NON-PROD\
    APPDYNAMICS_CONTROLLER_HOST_NAME=appdynamics.adeo.no\
    APPDYNAMICS_CONTROLLER_PORT=443\
    APPDYNAMICS_CONTROLLER_SSL_ENABLED=true\
    ARBEIDSFORDELING_V1_URL=https://fpmock2:8063/norg2/ws/Arbeidsfordeling/v1\
    ARBEIDSFORHOLD_V3_URL=https://fpmock2:8063/aareg-core/ArbeidsforholdService/v3\
    AUTOTEST_ENV=pipeline\
    AUTOTEST_OAUTH2_ISSUER_PATH=/isso/oauth2\
    AUTOTEST_OAUTH2_ISSUER_PORT=8063\
    AUTOTEST_OAUTH2_ISSUER_SCHEME=http\
    AUTOTEST_OAUTH2_ISSUER_URL=fpmock2\
    BEHANDLEINNGAAENDEJOURNAL_V1_DESCRIPTION="Virksomhetstjeneste for oppdatering av inngående journalposter."\
    BEHANDLEINNGAAENDEJOURNAL_V1_SECURITYTOKEN=SAML\
    BEHANDLEINNGAAENDEJOURNAL_V1_URL=https://fpmock2:8063/services/behandleinngaaendejournal/v1\
    BEHANDLEJOURNAL_V3_URL=https://fpmock2:8063/services/behandlejournal/v3\
    BEHANDLEOPPGAVE_V1_URL=https://fpmock2:8063/nav-gsak-ws/BehandleOppgaveV1\
    BEHANDLESAK_V2_URL=https://fpmock2:8063/nav-gsak-ws/BehandleSakV2\
    DEFAULTDS_PASSWORD=fpsak\
    #DEFAULTDS_URL=jdbc:oracle:thin:@fpsak-oracle:1521/XE\
    DEFAULTDS_USERNAME=fpsak\
    DOKUMENTPRODUKSJON_V2_SECURITYTOKEN=SAML\
    DOKUMENTPRODUKSJON_V2_URL=https://fpmock2:8063/dokprod/ws/dokumentproduksjon/v2\
    DVHDS_PASSWORD=fpsak_hist\
    #DVHDS_URL=jdbc:oracle:thin:@fpsak-oracle:1521/XE\
    DVHDS_USERNAME=fpsak_hist\
    ENVIRONMENT_NAME=p\
    FASIT_ENVIRONMENT_NAME=test\
    FPSAK_CHANNEL_NAME=U87_FPSAK_SSL\
    FPSAK_CHANNEL_QUEUEMANAGER=mq://e26apvl121.test.local:1411/MUXLSC01\
    FPSAK_OKONOMI_OPPDRAG_MOTTAK_QUEUEMANAGER=mq://vtpmq:1414/QM1\
    FPSAK_OKONOMI_OPPDRAG_MOTTAK_QUEUENAME=VTP.OKONOMI.INN\
    FPSAK_OKONOMI_OPPDRAG_SEND_QUEUENAME=VTP.OKONOMI.UT\
    HENTINNTEKTLISTEBOLK_URL=https://fpmock2:8063/inntektskomponenten-ws/rs/api/v1/hentinntektlistebolk\
    INFOTRYGD_HENDELSER_API_URL=https://fpmock2:8063/infotrygd/hendelser\
    INFOTRYGDBEREGNINGSGRUNNLAG_V1_URL=https://fpmock2:8063/infotrygd-ws/InfotrygdBeregningsgrunnlag/v1\
    INFOTRYGDSAK_V1_URL=https://fpmock2:8063/infotrygd-ws/InfotrygdSak/v1\
    INNGAAENDEJOURNAL_V1_DESCRIPTION="Virksomhetstjeneste for henting av metadata om inngående journalposter."\
    INNGAAENDEJOURNAL_V1_SECURITYTOKEN=SAML\
    INNGAAENDEJOURNAL_V1_URL=https://fpmock2:8063/joark/InngaaendeJournal/v1\
    INNTEKT_V3_URL=https://fpmock2:8063/inntektskomponenten-ws/inntekt/v3/Inntekt\
    JOURNAL_V3_DESCRIPTION="Virksomhetstjeneste for henting av journalposter og dokumenter fra arkivet."\
    JOURNAL_V3_SECURITYTOKEN=SAML\
    JOURNAL_V3_URL=https://fpmock2:8063/joark/Journal/v3\
    KODEVERK_V2_URL=https://fpmock2:8063/kodeverk/ws/Kodeverk/v2\
    LDAP_AUTH=none\
    LDAP_BASEDN="dc=test,dc=local"\
    LDAP_DOMAIN=TEST.LOCAL\
    LDAP_PASSWORD=notrelevant\
    LDAP_SERVICEUSER_BASEDN="ou=ServiceAccounts,dc=test,dc=local"\
    LDAP_URL=ldaps://fpmock2:8636/\
    LDAP_USER_BASEDN="ou=NAV,ou=BusinessUnits,dc=test,dc=local"\
    LDAP_USERNAME=srvSSOLinux\
    LOADBALANCER_FPSAK_CONTEXTROOTS=fpsak\
    LOADBALANCER_FPSAK_POOLNAME=nais\
    LOADBALANCER_FQDN=fpmock2:8080\
    LOGBACK_CONFIG=/app/lib/logback.xml\
    MEDLEM_V2_URL=https://fpmock2:8063/medl2/ws/Medlemskap/v2\
    MELDEKORTUTBETALINGSGRUNNLAG_V1_URL=https://fpmock2:8063/ail_ws/MeldekortUtbetalingsgrunnlag_v1\
    MQGATEWAY02_CHANNEL=U87_FPSAK_SSL\
    MQGATEWAY02_HOSTNAME=e26apvl121.test.local\
    MQGATEWAY02_NAME=MUXLSC01\
    MQGATEWAY02_PORT=1411\
    MQGATEWAY02_USESSLONJETTY=true\
    NAV_TRUSTSTORE_KEYSTOREALIAS=na\
    NAV_TRUSTSTORE_PASSWORD=changeit\
    NAV_TRUSTSTORE_PATH=/var/run/secrets/naisd.io/nav_truststore_path\
    OIDC_OPENAM_AGENTNAME=fpsak-localhost\
    OIDC_OPENAM_HOSTURL=https://fpmock2:8063/isso/oauth2\
    OIDC_OPENAM_ISSUERURL=https://fpmock2:8063/isso/oauth2\
    OIDC_OPENAM_JWKSURL=https://fpmock2:8063/isso/oauth2/connect/jwk_uri\
    OIDC_OPENAM_PASSWORD=dummy\
    OIDC_STS_ISSUER=https://fpmock2:8063/sts/issuer\
    OIDC_STS_ISSUER_URL=https://fpmock2:8063/sts/issuer\
    OIDC_STS_JWKS=https://fpmock2:8063/sts/jwks\
    OIDC_STS_JWKS_URL=https://fpmock2:8063/sts/jwks\
    OPENIDCONNECT_ISSOHOST=https://fpmock2:8063/isso/oauth2\
    OPENIDCONNECT_ISSOISSUER=https://fpmock2:8063/isso/oauth2\
    OPENIDCONNECT_ISSOJWKS=https://fpmock2:8063/isso/oauth2/connect/jwk_uri\
    OPENIDCONNECT_USERNAME=fpsak-localhost\
    OPPGAVE_V3_URL=https://fpmock2:8063/nav-gsak-ws/OppgaveV3\
    ORGANISASJON_V4_URL=https://fpmock2:8063/ereg/ws/OrganisasjonService/v4\
    PERSON_V3_URL=https://fpmock2:8063/tpsws/ws/Person/v3\
    RAY_AVSTEM_DATA_QUEUENAME=DEV.QUEUE.1\
    SAK_V1_URL=https://fpmock2:8063/nav-gsak-ws/SakV1\
    SBEH_SAKSBEHANDLING_QUEUENAME=QA.U_SAKOGBEHANDLING.SAKSBEHANDLING\
    SECURITYTOKENSERVICE_URL=https://fpmock2:8063/SecurityTokenServiceProvider/\
    SIGRUNRESTBEREGNETSKATT_URL=https://fpmock2:8063\
    SYSTEMBRUKER_PASSWORD=not_relevant\
    SYSTEMBRUKER_USERNAME=vtp\
    TASK_MANAGER_POLLING_DELAY=4\
    TASK_MANAGER_POLLING_TASKS_SIZE=4\
    TASK_MANAGER_POLLING_WAIT=2\
    VIRKSOMHET_ARBEIDSFORDELING_V1_SECURITYTOKEN=SAML\
    VIRKSOMHET_ARBEIDSFORHOLD_V3_SECURITYTOKEN=SAML\
    VIRKSOMHET_BEHANDLEOPPGAVE_V1_SECURITYTOKEN=SAML\
    VIRKSOMHET_BEHANDLESAK_V2_SECURITYTOKEN=SAML\
    VIRKSOMHET_INFOTRYGDBEREGNINGSGRUNNLAG_V1_SECURITYTOKEN=SAML\
    VIRKSOMHET_INFOTRYGDSAK_V1_SECURITYTOKEN=SAML\
    VIRKSOMHET_INNTEKT_V3_SECURITYTOKEN=SAML\
    VIRKSOMHET_KODEVERK_V2_SECURITYTOKEN=NONE\
    VIRKSOMHET_MEDLEMSKAP_V2_SECURITYTOKEN=SAML\
    VIRKSOMHET_MELDEKORTUTBETALINGSGRUNNLAG_V1_SECURITYTOKEN=SAML\
    VIRKSOMHET_OPPGAVE_V3_SECURITYTOKEN=LTPA\
    VIRKSOMHET_ORGANISASJON_V4_SECURITYTOKEN=SAML\
    VIRKSOMHET_PERSON_V3_SECURITYTOKEN=SAML\
    VIRKSOMHET_SAK_V1_SECURITYTOKEN=SAML
