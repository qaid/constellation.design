Validate the site is ready for deployment.

Run these checks in order and report pass/fail for each:

## 1. Clean Build

```bash
bun run build
```
- **Pass:** Exit code 0, `dist/` directory exists
- **Fail:** Any build error — stop and report

## 2. Dist Directory

Check that `dist/` exists and contains expected files:
- `dist/index.html`
- `dist/work/index.html`
- `dist/about/index.html`
- `dist/services/index.html`
- `dist/contact/index.html`

## 3. No Draft Content Leaked

For each project with `draft: true` in `src/content/projects/`, check that no corresponding route exists in `dist/work/`:

```bash
for file in src/content/projects/*.md; do
  if grep -q "^draft: true" "$file"; then
    slug=$(basename "$file" .md)
    if [ -d "dist/work/$slug" ]; then
      echo "FAIL: Draft '$slug' found in dist/"
    else
      echo "PASS: Draft '$slug' not in dist/"
    fi
  fi
done
```

## 4. Image Paths

For each non-draft project with an `image` field in frontmatter, check that the image file exists in `public/`:

```bash
for file in src/content/projects/*.md; do
  if ! grep -q "^draft: true" "$file"; then
    image=$(grep "^image:" "$file" | sed 's/image: *"//' | sed 's/"//')
    if [ -n "$image" ] && [ ! -f "public$image" ]; then
      echo "FAIL: Missing image $image"
    fi
  fi
done
```

## 5. Security Headers

Check that `dist/index.html` contains:
- CSP meta tag: `grep -c "Content-Security-Policy" dist/index.html`
- X-Content-Type-Options: `grep -c "nosniff" dist/index.html`
- Referrer policy: `grep -c "referrer" dist/index.html`

## 6. Static Files

Verify these static files are in `dist/`:
- `dist/robots.txt`
- `dist/.well-known/security.txt`
- `dist/llms.txt`
- `dist/llms-full.txt`

## Report

Summarise all checks with a final **READY** / **NOT READY** verdict.
