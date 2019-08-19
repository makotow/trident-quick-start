#!/bin/bash

kubectl delete -f manifest/sample-pvc.yaml
kubectl delete -f manifest/storageclass-csi.yaml

which trident-installer/tridentctl > /dev/null 2>&1 && trident-installer/tridentctl uninstall -n trident
