#!/usr/bin/env bash
set -euo pipefail

for attempt in {1..10}; do
  if curl --fail --silent http://localhost/health.html | grep --quiet '^healthy$'; then
    echo "Application health check passed"
    exit 0
  fi

  echo "Waiting for application health check (${attempt}/10)"
  sleep 3
done

echo "Application health check failed"
exit 1
