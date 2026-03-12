Run a Lighthouse audit on the Constellation Design site.

Steps:

1. **Build** the site:
   ```bash
   bun run build
   ```
   If the build fails, stop and report the error.

2. **Start** the preview server in the background:
   ```bash
   bun run preview &
   PREVIEW_PID=$!
   sleep 3
   ```

3. **Check** that Lighthouse CLI is available:
   ```bash
   npx lighthouse --version 2>/dev/null || bunx lighthouse --version
   ```
   If not available, note it and skip to reporting.

4. **Run** Lighthouse against the local server:
   ```bash
   npx lighthouse http://localhost:4321 \
     --output=json \
     --output-path=./lighthouse-report.json \
     --chrome-flags="--headless --no-sandbox" \
     --quiet
   ```

5. **Parse** the JSON report and extract:
   - Performance score
   - Accessibility score
   - Best Practices score
   - SEO score

6. **Report** the scores in a table. Flag any score below 90 with a warning and suggest specific improvements based on the audit opportunities.

7. **Stop** the preview server:
   ```bash
   kill $PREVIEW_PID 2>/dev/null
   ```

8. **Clean up** the report file:
   ```bash
   rm -f lighthouse-report.json
   ```

Report format:
| Category | Score | Status |
|----------|-------|--------|
| Performance | X | ✓/⚠ |
| Accessibility | X | ✓/⚠ |
| Best Practices | X | ✓/⚠ |
| SEO | X | ✓/⚠ |

Threshold: warn for any score below 90.
