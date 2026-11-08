# Constellation Design

Creative consultancy driven by curiosity, led by Qa'id Jacobs from Amsterdam.

## Tech Stack

- **Framework:** Astro 7.4.2
- **Runtime:** Bun 1.3.3 with Node.js 24 (Astro 7 requires Node.js >= 22.23.4)
- **TypeScript:** Strict mode (`astro/tsconfigs/strict`)
- **Deployment:** GitHub Pages via GitHub Actions
- **Site:** https://constellation.design

## Build Commands

```bash
bun install         # Install dependencies
bun run dev         # Start dev server (http://localhost:4321)
bun run build       # Production build → dist/
bun run preview     # Preview production build
bunx astro check    # TypeScript/Astro diagnostics
```

Astro 7 needs Node.js >= 22.23.4. If the default Node is older, put Node 24 first on PATH before `bun run build`, `bunx astro check` or a commit (the lefthook pre-commit hook runs both). After a pull that changes `bun.lock`, run `bun install --frozen-lockfile`.

## Deployment

Push to `main` triggers `.github/workflows/deploy.yml`, which sets up Node.js 24 and Bun, then builds and deploys to GitHub Pages. Manual dispatch is available. There is no scheduled redeploy: GitHub disables scheduled workflows in a public repo after 60 days without activity, which also stops deploys on push. The footer year updates on the first push of each year.

## Architecture

```
src/
├── components/     Header.astro, Footer.astro, Button.astro, ThemeToggle.astro
├── content/
│   └── projects/   Markdown case studies
├── content.config.ts  Content collection schema (Zod, glob loader)
├── layouts/        BaseLayout > CaseStudyLayout / PageLayout
├── pages/          index, about, services, contact, work/
└── styles/         tokens, typography, animations, utilities, global
```

Layout hierarchy: `BaseLayout` (HTML shell + meta + head) wraps `CaseStudyLayout` or `PageLayout`, which include `Header` and `Footer`.

## Content Schema

Defined in `src/content.config.ts` (uses `glob()` loader):

| Field | Type | Notes |
|-------|------|-------|
| `title` | `string` | Required |
| `description` | `string` | Required |
| `category` | `'UX Design' \| 'Creative Direction' \| 'Product Strategy' \| 'Workshop'` | Required |
| `client` | `string` | Optional |
| `role` | `string` | Optional |
| `year` | `string` | Required |
| `industry` | `string` | Optional |
| `featured` | `boolean` | Default: `false` |
| `order` | `number` | Display order, default: `0` |
| `image` | `string` | Cover image path, e.g. `/images/work/{slug}/{slug}-cover.png` |
| `website` | `string` (URL) | Optional — live project URL, rendered as link in snapshot card |
| `draft` | `boolean` | Default: `false` — draft entries are excluded from production |

Image convention: covers `/images/work/{slug}/{slug}-cover.png` (PNG, 1920x1200, also the og:image). New body images `/images/work/{slug}/{slug}-{n}.webp` (WebP, quality 85, 750 px wide for phone screens).

## Design System

`src/styles/tokens.css` is the source of truth. All values are CSS custom properties.

**Color palette (Afrofuturist):**
- `--color-background` / `--color-surface` / `--color-surface-elevated`
- `--color-text-primary` / `--color-text-secondary` / `--color-text-muted`
- `--color-accent` — warm gold (`#E8D5B5`)
- `--color-cosmic-purple`, `--color-electric-blue`, `--color-bronze`, `--color-deep-indigo`, `--color-nebula-pink`

**Dual-theme:** Dark-first (`:root`), with `[data-theme="light"]` overrides. Always update both when modifying color tokens.

**Typography (self-hosted via Astro Fonts API):**
- Body: `Inter` (400, 500, 600, 700) — `--font-family-primary`
- Display (headings): `Syne` (500, 600, 700, 800) — `--font-family-display`
- Font config in `astro.config.mjs`, rendered via `<Font>` component in BaseLayout
- Scale: `--font-size-xs` through `--font-size-6xl`

**Spacing:** 4px base, `--space-1` (4px) through `--space-32` (128px)

## Component Conventions

```astro
---
interface Props {
  // Always type Props explicitly
  label: string;
  variant?: 'primary' | 'secondary';
}
const { label, variant = 'primary' } = Astro.props;
---
<button class={`btn btn--${variant}`}>{label}</button>

<style>
  /* Scoped styles use BEM-like naming */
  .btn { ... }
  .btn--primary { ... }
</style>
```

- Use `data-*` attributes as JS hooks (`data-animate`, `data-theme`, etc.)
- Theme-aware globals use `:global([data-theme="light"] .component)` pattern
- Never use raw hex values — reference design tokens only
- `data-animate` and `data-animate-stagger` content starts hidden. Each page that uses them includes its own IntersectionObserver script that adds `is-visible` (copy it from `about.astro`). Without that script the content never shows.

---

## Skills

### Content Management

Use these conventions when creating or editing case studies in `src/content/projects/`.

**File location:** `src/content/projects/{slug}.md`
**Image location:** `public/images/work/{slug}/`

**Frontmatter template:**
```yaml
---
title: "Project Title"
description: "One or two sentence description for SEO and listings."
category: "UX Design"  # UX Design | Creative Direction | Product Strategy | Workshop
client: "Client Name"
role: "Role Title"
year: "2024"
industry: "Industry Name"
featured: false
order: 6
image: "/images/work/{slug}/{slug}-cover.png"
website: "https://example.com"  # Optional — live project URL
draft: false  # Set to true to hide from production
---
```

**Markdown HTML patterns:**

```html
<!-- Callout block (full-bleed accent panel) -->
<div class="case-callout">
  <div class="case-callout__inner">
    <h3 class="case-callout__title">Key Insight</h3>
    <p>Your callout content here.</p>
  </div>
</div>

<!-- Image grid (2-up or 3-up) -->
<div class="image-grid">
  <img src="/images/work/{slug}/image-1.png" alt="Description" />
  <img src="/images/work/{slug}/image-2.png" alt="Description" />
</div>
<div class="image-grid image-grid--three">
  <!-- 3 img tags -->
</div>

<!-- Split layout (media + content) -->
<div class="case-split">
  <div class="case-split__media">
    <img src="/images/work/{slug}/image.png" alt="Description" />
  </div>
  <div class="case-split__content">
    <h3>Section Title</h3>
    <p>Content here.</p>
  </div>
</div>
<!-- Add class="case-split--reverse" to flip media/content order -->

<!-- Full-bleed image -->
<div class="image-bleed">
  <img src="/images/work/{slug}/hero.png" alt="Description" />
</div>
```

**Draft handling:** Set `draft: true` in frontmatter to hide from all listings. The deploy workflow checks for draft content leaking into `dist/`.

### Design Tokens

When modifying the design system:

1. Edit `src/styles/tokens.css` only — never add raw values to components
2. Always update both `:root` (dark) and `[data-theme="light"]` when changing color tokens
3. Use established palette names (`--color-cosmic-purple`, `--color-electric-blue`, etc.)
4. Spacing follows a 4px base (`--space-1` = 4px, `--space-2` = 8px, etc.)
5. Add new tokens near semantically related existing tokens

### Component Development

When building new Astro components:

1. Always define a typed `Props` interface
2. Destructure props with defaults in the frontmatter
3. Use BEM-like class naming: `.component`, `.component__element`, `.component--modifier`
4. Reference design tokens, never raw CSS values
5. Theme-aware global overrides: `:global([data-theme="light"] .component { ... })`
6. Use `data-*` attributes for JavaScript hooks, not classes

### Deployment

- Branch: `main`
- Deploy workflow: `.github/workflows/deploy.yml`
- Build command: `bun run build`
- Build output: `dist/`
- GitHub Pages serves from `dist/` artifact
- CNAME: `constellation.design` (set in GitHub Pages settings)
- TypeScript check runs before upload: `bunx astro check`
- Draft content check prevents drafts from leaking to production

---

## Known Limitations

- **Permissions-Policy** cannot be set via meta tags — only via HTTP headers, which GitHub Pages does not support
- **CSP** is managed by Astro's built-in CSP with automatic script/style hashing — configured in `astro.config.mjs` under `security.csp`
- **CSS minifier (Astro 7):** keep `vite.build.cssTarget: ['safari14']` in `astro.config.mjs`, or media queries become range syntax that Safari < 16.4 ignores. Write a `-webkit-` prefixed property before the unprefixed one; the minifier keeps only the last of the pair.

## AI Agent Standards (as of early 2026)

The site implements:
- `public/llms.txt` — structured site overview for LLMs (llmstxt.org spec)
- `public/llms-full.txt` — full text content for single-request ingestion
- JSON-LD structured data (Schema.org `ProfessionalService` + per-page types)
- AI-crawler-friendly `robots.txt`

Emerging standards to monitor (not yet mature enough to implement):
- **agents.txt** — AI agent policy declarations (no formal spec yet)
- **W3C AI Agent Protocol** — community group, expected 2026-2027
- **Google A2A Protocol** — agent-to-agent communication standard
- **IETF Agent Context Protocol** — draft standard for agent context sharing
