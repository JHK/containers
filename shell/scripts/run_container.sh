#!/usr/bin/env bash
set -euo pipefail

CONTEXT=$(kubectl config current-context)
NAMESPACE=$(kubectl config view --minify --output 'jsonpath={..namespace}')
NAME=${USER//\./-}-shell
case $(basename "$SHELL") in
  bash) COMMAND=bash;;
  fish) COMMAND=fish;;
  *)    COMMAND=fish;;
esac

echo
echo "Starting shell container pod:"
echo ""
echo "Context:   $CONTEXT"
echo "Namespace: $NAMESPACE"
echo "Pod name:  $NAME"
echo "Command:   $COMMAND"
echo ""
read -rp "Continue (Y/n)? " choice
case "$choice" in
  n|N ) exit 1;;
esac

echo
cat pod.yaml | sed "s/__NAME__/$NAME/g" | sed "s/__NAMESPACE__/$NAMESPACE/g" | kubectl apply --context $CONTEXT -f -

./scripts/wait_for_container.sh "$CONTEXT" "$NAMESPACE" "$NAME"

kubectl exec -it --context $CONTEXT --namespace "$NAMESPACE" "$NAME" -- "$COMMAND" || true

kubectl delete pod --context $CONTEXT --namespace "$NAMESPACE" "$NAME"
