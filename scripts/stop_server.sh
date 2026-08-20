#!/usr/bin/env bash
set -euo pipefail

if systemctl list-unit-files nginx.service >/dev/null 2>&1; then
  systemctl stop nginx || true
fi
