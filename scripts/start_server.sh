#!/usr/bin/env bash
set -euo pipefail

nginx -t
systemctl enable nginx
systemctl restart nginx
