#!/bin/sh
set -e

# Default values if env vars are not set
GRAPHQL_URI="${GRAPHQL_URI:-http://localhost:8085/graphql}"

# Replace placeholder in JS files with actual runtime values
find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
  "s|__GRAPHQL_URI_PLACEHOLDER__|${GRAPHQL_URI}|g" {} +

echo "Configured GRAPHQL_URI=${GRAPHQL_URI}"
exec nginx -g 'daemon off;'