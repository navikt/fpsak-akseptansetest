#!/usr/bin/env bash
kubectl config use-context preprod-fss
export ABONNENT_IMAGE=$(kubectl get pods -nt4 -l app=fpabonnent -o jsonpath="{.items[*].spec.containers[*].image}" | awk '{print $1;}')
export FORDEL_IMAGE=$(kubectl get pods -nt4 -l app=fpfordel -o jsonpath="{.items[*].spec.containers[*].image}" | awk '{print $1;}')
export FORMIDLING_IMAGE=$(kubectl get pods -nt4 -l app=fpformidling -o jsonpath="{.items[*].spec.containers[*].image}" | awk '{print $1;}')
export FPSAK_IMAGE=$(kubectl get pods -nt4 -l app=fpsak -o jsonpath="{.items[*].spec.containers[*].image}" | awk '{print $1;}')
export FRONTEND_IMAGE=$(kubectl get pods -nt4 -l app=fpsak-frontend -o jsonpath="{.items[*].spec.containers[*].image}" | awk '{print $1;}')
export INFO_IMAGE=$(kubectl get pods -nt4 -l app=fpinfo-intern -o jsonpath="{.items[*].spec.containers[*].image}" | awk '{print $1;}')
export LOS_IMAGE=$(kubectl get pods -nt4 -l app=fplos -o jsonpath="{.items[*].spec.containers[*].image}" | awk '{print $1;}')
export OPPDRAG_IMAGE=$(kubectl get pods -nt4 -l app=fpoppdrag -o jsonpath="{.items[*].spec.containers[*].image}" | awk '{print $1;}')
export RISK_IMAGE=$(kubectl get pods -nt4 -l app=fprisk -o jsonpath="{.items[*].spec.containers[*].image}" | awk '{print $1;}')
export TILBAKE_IMAGE=$(kubectl get pods -nt4 -l app=fptilbake -o jsonpath="{.items[*].spec.containers[*].image}" | awk '{print $1;}')
export VTP_VERSION=$(node ./_scripts/get-version.js fpmock2)


echo ABONNENT_IMAGE=${ABONNENT_IMAGE} > .env
echo FORDEL_IMAGE=${FORDEL_IMAGE} >> .env
echo FORMIDLING_IMAGE=${FORMIDLING_IMAGE} >> .env
echo FPSAK_IMAGE=${FPSAK_IMAGE} >> .env
echo FRONTEND_IMAGE=${FRONTEND_IMAGE} >> .env
echo FRONTEND_PORT=9091 >> .env
echo INFO_IMAGE=${INFO_IMAGE} >> .env
echo LOS_IMAGE=${LOS_IMAGE} >> .env
echo OPPDRAG_IMAGE=${OPPDRAG_IMAGE} >> .env
echo RISK_IMAGE=${RISK_IMAGE} >> .env
echo TILBAKE_IMAGE=${TILBAKE_IMAGE} >> .env
echo VTP_IMAGE=repo.adeo.no:5443/fpmock2:${VTP_VERSION} >> .env
echo SSL_TERM_IMAGE=repo.adeo.no:5443/localhost-ssl-term:v201905071038 >> .env
echo ORACLE_IMAGE=repo.adeo.no:5443/fpsak-oracle:v201905151626 >> .env
sed -i "" 's/docker.adeo.no:5000/repo.adeo.no:5443/g' .env
sed -i "" 's/repo.adeo.no:5443/repo-fra-laptop-tunnel:14129/g' .env
