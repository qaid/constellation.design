#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

# Install deps if node_modules is missing
if [ ! -d "node_modules" ]; then
  echo "==> node_modules not found, running setup..."
  "$SCRIPT_DIR/setup.sh"
fi

echo "==> Starting dev server..."
bun run dev
