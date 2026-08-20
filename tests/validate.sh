#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "app/index.html"
  "app/styles.css"
  "app/health.html"
  "appspec.yml"
  "buildspec.yml"
  "scripts/stop_server.sh"
  "scripts/install_dependencies.sh"
  "scripts/start_server.sh"
  "scripts/validate_service.sh"
)

for required_file in "${required_files[@]}"; do
  if [[ ! -s "${required_file}" ]]; then
    echo "Missing or empty required file: ${required_file}"
    exit 1
  fi
done

grep --quietE "Version [0-9]+\.[0-9]+" app/index.html
grep --quiet '^healthy$' app/health.html
grep --quiet '^version: 0.0' appspec.yml
grep --quiet '^version: 0.2' buildspec.yml

echo "All repository validation checks passed"
