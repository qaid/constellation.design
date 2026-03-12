Run a security audit on the Constellation Design site.

## 1. Dependency Audit

```bash
bun pm audit
```

Report any vulnerabilities found. For each vulnerability, note:
- Package name and version
- Severity (critical/high/medium/low)
- Recommendation (update, patch, or accept risk)

## 2. Hardcoded Secrets Scan

Search for patterns that could indicate hardcoded secrets:

```bash
grep -r --include="*.ts" --include="*.astro" --include="*.js" --include="*.json" \
  -E "(api_key|apikey|api-key|secret|token|password|passwd|auth)[\"']?\s*[:=]\s*[\"'][^\"']{8,}" \
  src/ --ignore-case
```

Report any matches. False positives (e.g. CSS custom property names) should be noted.

## 3. CSP and Security Meta Tags

Build the site and check `dist/index.html` for:

```bash
bun run build 2>/dev/null

echo "=== Content-Security-Policy ==="
grep -o 'Content-Security-Policy[^>]*' dist/index.html | head -1

echo "=== X-Content-Type-Options ==="
grep -o 'nosniff' dist/index.html

echo "=== Referrer Policy ==="
grep -o 'referrer[^>]*' dist/index.html | head -1
```

Verify:
- CSP includes `default-src 'self'`
- CSP has `frame-ancestors 'none'`
- `X-Content-Type-Options: nosniff` is present
- Referrer policy is `strict-origin-when-cross-origin` or stricter

## 4. External Links

Check all `.astro` files for external links without security attributes:

```bash
grep -r --include="*.astro" 'href="http' src/ | grep -v 'rel="noopener'
```

Any external `<a>` tags without `rel="noopener noreferrer"` should be flagged.

## 5. .gitignore Check

Verify that sensitive files are gitignored:

```bash
cat .gitignore
```

Check for:
- `.env` and `.env.*` variants
- `node_modules/`
- `dist/`
- Any credential files

## 6. Known Security Files

Confirm these files exist:
- `public/robots.txt`
- `public/.well-known/security.txt`

## Report

Summarise findings with severity ratings. Distinguish between:
- **Action required:** Issues that need fixing before deploy
- **Best practice:** Improvements to consider
- **Informational:** Notes with no action needed
