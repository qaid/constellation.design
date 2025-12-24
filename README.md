# Constellation Design 2025

This project is a bespoke marketing site for **Constellation Design**, a creative consultancy led by Qa’id Jacobs in Amsterdam. The hero section renders a procedural constellation with multi-theme styling, water-like particle streams, and call-to-action copy. Down the page you’ll find long-form storytelling, featured work, and client marquees—all tuned for Astro’s hybrid rendering and animated with vanilla TypeScript.

## 🚀 Project Structure

The repo follows a lean Astro layout so design explorations stay focused on the single-page experience:

```text
/
├── public/
├── src/
│   └── pages/
│       └── index.astro
└── package.json
```

- `src/pages/index.astro` houses the hero constellation, sections, and inline scripts (particle streams, client carousel).  
- `src/components/` is available for extracted UI pieces if the page expands.  
- Static assets (logos, textures, fonts) live under `public/`.

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
