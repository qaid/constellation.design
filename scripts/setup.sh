#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

echo "==> Checking prerequisites..."

# Check for Bun
if ! command -v bun &>/dev/null; then
  echo "Error: Bun is not installed."
  echo "Install it with: curl -fsSL https://bun.sh/install | bash"
  exit 1
fi

BUN_VERSION=$(bun --version)
echo "    Bun $BUN_VERSION found"

# Check for Node.js >= 22.12.0 (required by Astro 6)
if ! command -v node &>/dev/null; then
  echo "Error: Node.js is not installed. Astro 6 requires Node.js >= 22.12.0."
  exit 1
fi

NODE_VERSION=$(node --version | sed 's/^v//')
NODE_MAJOR=$(echo "$NODE_VERSION" | cut -d. -f1)
NODE_MINOR=$(echo "$NODE_VERSION" | cut -d. -f2)
if [ "$NODE_MAJOR" -lt 22 ] || { [ "$NODE_MAJOR" -eq 22 ] && [ "$NODE_MINOR" -lt 12 ]; }; then
  echo "Error: Node.js $NODE_VERSION found, but Astro 6 requires >= 22.12.0."
  exit 1
fi
echo "    Node v$NODE_VERSION found"

echo "==> Installing dependencies..."
bun install

echo "==> Setting up git hooks (lefthook)..."
if command -v bunx &>/dev/null; then
  bunx lefthook install
else
  echo "Warning: Could not install git hooks. Run 'bunx lefthook install' manually."
fi

echo "==> Verifying TypeScript/Astro configuration..."
bunx astro check

echo "==> Setup complete!"
echo ""
echo "Available commands:"
echo "  bun run dev       Start dev server (http://localhost:4321)"
echo "  bun run build     Production build"
echo "  bun run preview   Preview production build"
echo "  ./scripts/dev.sh  Start dev server (wrapper)"
echo "  ./scripts/build.sh  Production build with checks"
