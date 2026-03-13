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

# Check for Node (Astro needs it for some tooling)
if ! command -v node &>/dev/null; then
  echo "Warning: Node.js not found. Some Astro tooling may require it."
else
  echo "    Node $(node --version) found"
fi

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
