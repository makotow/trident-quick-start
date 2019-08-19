#!/bin/bash

VERSION=19.07.0
TEMPLATE_FILE=backend-ontap-nas.json

if [ ! -f trident-installer-${VERSION}.tar.gz ]; then
    wget https://github.com/NetApp/trident/releases/download/v${VERSION}/trident-installer-${VERSION}.tar.gz
    tar -xf trident-installer-${VERSION}.tar.gz
fi

cd trident-installer || exit
kubectl create ns trident
./tridentctl install -n trident
cp sample-input/${TEMPLATE_FILE} backend.json
vi backend.json

cat backend.json
echo "Start the trident installation. Is it OK? (y/N): "
read -r yn

case "$yn" in [yY]*) ;; *) echo "tridentctl installation is not complete." ; exit ;; esac

./tridentctl -n trident create backend -f backend.json
./tridentctl -n trident version