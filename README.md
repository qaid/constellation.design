# Constellation Design 2025

This project is a bespoke marketing site for **Constellation Design**, a creative consultancy led by Qa’id Jacobs in Amsterdam. The hero section renders a procedural constellation with multi-theme styling, water-like particle streams, and call-to-action copy. Down the page you’ll find long-form storytelling, featured work, and client marquees—all tuned for Astro’s hybrid rendering and animated with vanilla TypeScript.

## 🚀 Project Structure

```text
/
├── public/
│   ├── .well-known/          # security.txt
│   ├── images/
│   │   ├── collaborators/    # Client/partner logos (SVG, PNG)
│   │   └── work/             # Case study images by slug
│   ├── llms.txt              # Structured site overview for LLMs
│   ├── llms-full.txt         # Full-text content for LLM ingestion
│   ├── robots.txt
│   └── site.webmanifest
├── src/
│   ├── components/           # Header, Footer, Button, ThemeToggle
│   ├── content/
│   │   ├── config.ts         # Content collection schema (Zod)
│   │   └── projects/         # Markdown case studies
│   ├── layouts/              # BaseLayout, CaseStudyLayout, PageLayout
│   ├── pages/
│   │   ├── index.astro       # Home — hero constellation + featured work
│   │   ├── about.astro
│   │   ├── contact.astro
│   │   ├── services.astro
│   │   └── work/             # Work listing + dynamic [slug] routes
│   └── styles/               # tokens, typography, animations, reset, utilities, global
└── package.json
```

- **Layout hierarchy:** `BaseLayout` (HTML shell + meta) wraps `CaseStudyLayout` or `PageLayout`, which include `Header` and `Footer`.
- **Content:** Case studies live in `src/content/projects/` as Markdown with typed frontmatter. Images follow the `/images/work/{slug}/` convention.
- **Design tokens:** `src/styles/tokens.css` is the source of truth for colors, spacing, and typography. Dark-first with light theme overrides.
- **Static assets:** Favicons, logos, and work images live under `public/`.

## 🧞 Commands

All commands are run from the project root:

| Command             | Action                                           |
| :------------------ | :----------------------------------------------- |
| `bun install`       | Installs dependencies                            |
| `bun dev`           | Starts local dev server at `localhost:4321`      |
| `bun build`         | Builds the production site to `./dist/`          |
| `bun preview`       | Serves the production build locally              |
| `bun astro ...`     | Run CLI helpers like `astro add`, `astro check`  |
| `bun astro -- --help` | Astro CLI reference                           |

## 📚 Additional context

- Astro documentation: https://docs.astro.build  
- Design system and animation notes live directly in `index.astro` comments for quick iteration.
