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
FAILED=0
for file in src/content/projects/*.md; do
  if grep -q "^draft: true" "$file"; then
    slug=$(basename "$file" .md)
    if [ -d "dist/work/$slug" ]; then
      echo "ERROR: Draft content '$slug' found in build output"
      FAILED=1
    fi
  fi
done
if [ "$FAILED" -eq 1 ]; then
  exit 1
fi
echo "    Draft content check passed"

echo "==> Build complete. Output in dist/"
echo "    Run 'bun run preview' to preview locally."
