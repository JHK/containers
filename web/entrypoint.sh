#!/usr/bin/env bash

VERSION=${VERSION:-1}
MESSAGE=${MESSAGE:-hello world!}
SLEEP_MAX=${SLEEP_MAX:-59}
KEEP_ALIVE=${KEEP_ALIVE:-0}
PATH_PREFIX=${PATH_PREFIX:-}

ESCAPED_PATH_PREFIX=$(echo "$PATH_PREFIX" | sed 's/[\/&]/\\&/g')
CONF=/usr/local/openresty/nginx/conf/nginx.conf
sed -i.bak "s/###VERSION###/$VERSION/g" $CONF;
sed -i.bak "s/###MESSAGE###/$MESSAGE/g" $CONF;
sed -i.bak "s/###SLEEP_MAX###/$SLEEP_MAX/g" $CONF;
sed -i.bak "s/###PATH_PREFIX###/$ESCAPED_PATH_PREFIX/g" $CONF;
if [ "$KEEP_ALIVE" = "0" ]; then
  sed -i.bak "s/###KEEP_ALIVE###//g" $CONF;
fi

touch /ready

exec /usr/local/openresty/nginx/sbin/nginx
