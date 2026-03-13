#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

echo "==> Running TypeScript/Astro checks..."
bunx astro check

echo "==> Building for production..."
bun run build

# Check for draft content leaking into dist
if grep -r '"draft":true\|draft: true' dist/ 2>/dev/null; then
  echo "Error: Draft content found in production build!"
  exit 1
fi

echo "==> Build complete. Output in dist/"
echo "    Run 'bun run preview' to preview locally."
