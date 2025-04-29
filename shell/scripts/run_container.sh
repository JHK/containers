#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

CONTEXT=$(kubectl config current-context)
NAMESPACE=$(kubectl config view --minify --output 'jsonpath={..namespace}')
NAME=${USER//\./-}-shell
case "$#" in
  0) COMMAND=fish;;
  1) COMMAND="$1";;
  *) echo "Usage: $0 [COMMAND]"; exit 1;;
esac

>&2 echo
>&2 echo "Starting shell container pod:"
>&2 echo ""
>&2 echo "Context:   $CONTEXT"
>&2 echo "Namespace: $NAMESPACE"
>&2 echo "Pod name:  $NAME"
>&2 echo "Command:   $COMMAND"
>&2 echo ""
read -rp "Continue (Y/n)? " choice
case "$choice" in
  n|N ) exit 1;;
esac

# exec if already running
if kubectl get pod --context "$CONTEXT" --namespace "$NAMESPACE" "$NAME" >/dev/null 2>&1; then
  >&2 echo "Container already running, exec into it"
  kubectl exec -it --context "$CONTEXT" --namespace "$NAMESPACE" "$NAME" -- "$COMMAND"
  exit 0
fi

>&2 echo
cat ../pod.yaml | sed "s/__NAME__/$NAME/g" | sed "s/__NAMESPACE__/$NAMESPACE/g" | >&2 kubectl apply --context $CONTEXT -f -

./wait_for_container.sh "$CONTEXT" "$NAMESPACE" "$NAME"

kubectl exec -it --context $CONTEXT --namespace "$NAMESPACE" "$NAME" -- "$COMMAND" || true

>&2 kubectl delete pod --context $CONTEXT --namespace "$NAMESPACE" "$NAME"
