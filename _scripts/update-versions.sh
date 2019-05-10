#!/usr/bin/env bash
kubectl config use-context preprod-fss
export ABONNENT_IMAGE=$(kubectl get pods -nt4 -l app=fpabonnent -o jsonpath="{.items[*].spec.containers[*].image}" | tr ' ' '\n' | uniq)
export FORDEL_IMAGE=$(kubectl get pods -nt4 -l app=fpfordel -o jsonpath="{.items[*].spec.containers[*].image}" | tr ' ' '\n' | uniq)
export FORMIDLING_IMAGE=$(kubectl get pods -nt4 -l app=fpformidling -o jsonpath="{.items[*].spec.containers[*].image}" | tr ' ' '\n' | uniq)
export FPSAK_IMAGE=$(kubectl get pods -nt4 -l app=fpsak -o jsonpath="{.items[*].spec.containers[*].image}" | tr ' ' '\n' | uniq)
export FRONTEND_IMAGE=$(kubectl get pods -nt4 -l app=fpsak-frontend -o jsonpath="{.items[*].spec.containers[*].image}" | tr ' ' '\n' | uniq)
export LOS_IMAGE=$(kubectl get pods -nt4 -l app=fplos -o jsonpath="{.items[*].spec.containers[*].image}" | tr ' ' '\n' | uniq)
export OPPDRAG_IMAGE=$(kubectl get pods -nt4 -l app=fpoppdrag -o jsonpath="{.items[*].spec.containers[*].image}" | tr ' ' '\n' | uniq)
export RISK_IMAGE=$(kubectl get pods -nt4 -l app=fprisk -o jsonpath="{.items[*].spec.containers[*].image}" | tr ' ' '\n' | uniq)
export VTP_IMAGE=$(kubectl get pods -nt4 -l app=fpmock2 -o jsonpath="{.items[*].spec.containers[*].image}" | tr ' ' '\n' | uniq)
export TILBAKE_IMAGE=$(kubectl get pods -nt4 -l app=fptilbake -o jsonpath="{.items[*].spec.containers[*].image}" | tr ' ' '\n' | uniq)

echo ABONNENT_IMAGE=${ABONNENT_IMAGE} > .env
echo FORDEL_IMAGE=${FORDEL_IMAGE} >> .env
echo FORMIDLING_IMAGE=${FORMIDLING_IMAGE} >> .env
echo FPSAK_IMAGE=${FPSAK_IMAGE} >> .env
echo FRONTEND_IMAGE=${FRONTEND_IMAGE} >> .env
echo LOS_IMAGE=${LOS_IMAGE} >> .env
echo OPPDRAG_IMAGE=${OPPDRAG_IMAGE} >> .env
echo RISK_IMAGE=${RISK_IMAGE} >> .env
echo VTP_IMAGE=${VTP_IMAGE} >> .env
echo TILBAKE_IMAGE=${TILBAKE_IMAGE} >> .env
echo FRONTEND_PORT=9091 >> .env
sed -i "" 's/docker.adeo.no:5000/repo.adeo.no:5443/g' .env
