#!/bin/bash
ADDRESS=$(kubectl --kubeconfig kubeconfig get node -o yaml | grep address: | head -1 | cut -d: -f2 | tr -d ' ')
PORT=$(kubectl --kubeconfig kubeconfig get svc | grep frontend | cut -d: -f2 - | cut -d/ -f1 -)
URL=URL="$ADDRESS$PORT"
RESULT=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)
if [ $RESULT = 200 ]; then
    echo "Successfully connected"
    exit 0
else
    echo "Failed to connect to url"
    exit 1
fi