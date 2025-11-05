#!/usr/bin/env bash
set -e
# Bootstrap credentials.env from credentials.env.example if the real file does not exist.
# Usage: ./scripts/init-credentials.sh
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

if [ -f credentials.env ]; then
  echo "credentials.env already exists — leaving it alone."
  exit 0
fi

if [ -f credentials.env.example ]; then
  cp credentials.env.example credentials.env
  chmod 600 credentials.env || true
  echo "Created credentials.env from credentials.env.example — please edit with real values."
  exit 0
fi

echo "ERROR: credentials.env.example not found in project root. Create it first or provide credentials.env." >&2
exit 1
