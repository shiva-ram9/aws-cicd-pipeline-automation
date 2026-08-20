#!/usr/bin/env bash
set -euo pipefail

if ! command -v nginx >/dev/null 2>&1; then
  dnf install -y nginx
fi

mkdir -p /usr/share/nginx/html
chown -R nginx:nginx /usr/share/nginx/html
find /usr/share/nginx/html -type d -exec chmod 755 {} \;
find /usr/share/nginx/html -type f -exec chmod 644 {} \;
