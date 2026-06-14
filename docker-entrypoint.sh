#!/bin/sh
set -e

GRAPHQL_URI="${GRAPHQL_URI:-http://localhost:8085/graphql}"

find /usr/share/nginx/html -name '*.js' -exec sed -i \
  "s|__GRAPHQL_URI_PLACEHOLDER__|${GRAPHQL_URI}|g" {} +

echo "Configured GRAPHQL_URI=${GRAPHQL_URI}"
exec nginx -g 'daemon off;'