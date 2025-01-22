#!/usr/bin/env bash

>&2 echo
>&2 echo -n "waiting for pod to start ..."
while true; do
  retVal=$(kubectl get pods --context "$1" --namespace "$2" --field-selector=status.phase=Running 2>&1 | grep "$3")
  if [ $? -eq 0 ]; then
    >&2 echo " attaching"
    >&2 echo
    exit 0
  else
    >&2 echo -n "."
    sleep 1
  fi
done
