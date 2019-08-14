#!/bin/bash

kubectl get sc
kubectl create -f manifest/sample-pvc.yaml

## retry waiting vpn point available
pvc_state=""
NEXT_WAIT_TIME=0

## wait for available vpn gateway
until [ "$pvc_state" = "Bound" ] || [ $NEXT_WAIT_TIME -eq 10 ]; do
    kubectl get pvc basic
    pvc_state=$(kubectl get pvc basic -o json | jq -r .status.phase)
    sleep $((NEXT_WAIT_TIME++))
done
