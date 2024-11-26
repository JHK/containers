#!/usr/bin/env bash

echo
echo -n "waiting for pod to start ..."
while true; do
  retVal=$(kubectl get pods --namespace "$1" --field-selector=status.phase=Running 2>&1 | grep "$2")
  if [ $? -eq 0 ]; then
    echo " attaching"
    echo
    exit 0
  else
    echo -n "."
    sleep 1
  fi
done
