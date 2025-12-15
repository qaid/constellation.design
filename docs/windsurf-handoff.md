# Constellation Design Website
## Technical Handoff Document for Development

---

## Project Overview

Build a modern, lightweight portfolio website for Constellation Design, a creative consultancy based in Amsterdam. The site must be static, performant, and hostable on GitHub Pages.

**Live URL:** constellation.design  
**Repository:** [To be created]

---

## Technology Stack

### Recommended: Astro

```
Framework: Astro (latest stable)
Styling: Vanilla CSS with custom properties
Animations: CSS transitions + minimal vanilla JS
Build: Astro's built-in build system
Deployment: GitHub Pages via GitHub Actions
```

**Why Astro:**
- Zero JavaScript by default (ships only what's needed)
- Component-based architecture
- Markdown support for case studies
- Excellent performance out of the box
- Simple GitHub Pages deployment

### Alternative Options
- 11ty (Eleventy) - if preferring a more minimal approach
- Hugo - if faster build times become critical

---

## Project Structure

```
constellation-design/
├── public/
│   ├── fonts/
│   ├── images/
│   │   ├── projects/
│   │   ├── clients/
│   │   └── general/
│   ├── favicon.svg
│   └── og-image.jpg
├── src/
│   ├── components/
│   │   ├── Header.astro
│   │   ├── Footer.astro
│   │   ├── Navigation.astro
│   │   ├── MobileMenu.astro
│   │   ├── ProjectCard.astro
│   │   ├── ServiceCard.astro
│   │   ├── ClientLogos.astro
│   │   ├── Testimonial.astro
│   │   ├── ContactForm.astro
│   │   └── Button.astro
│   ├── layouts/
│   │   ├── BaseLayout.astro
│   │   ├── PageLayout.astro
│   │   └── CaseStudyLayout.astro
│   ├── pages/
│   │   ├── index.astro
│   │   ├── work/
│   │   │   ├── index.astro
│   │   │   └── [slug].astro
│   │   ├── services.astro
│   │   ├── about.astro
│   │   └── contact.astro
│   ├── content/
│   │   └── projects/
│   │       ├── the-wild.md
│   │       ├── amplifon.md
│   │       ├── the-usual-hotel.md
│   │       ├── african-puzzle.md
│   │       └── rise-and-shine.md
│   ├── styles/
│   │   ├── global.css
│   │   ├── reset.css
│   │   ├── tokens.css
│   │   ├── typography.css
│   │   ├── utilities.css
│   │   └── animations.css
│   └── scripts/
│       ├── navigation.js
│       ├── scroll-animations.js
│       └── form-handler.js
├── astro.config.mjs
├── package.json
└── README.md
```

---

## Design Tokens

Create `src/styles/tokens.css` with these CSS custom properties:

```css
:root {
  /* Colors - Base Palette */
  --color-background: #0A0A0A;
  --color-surface: #141414;
  --color-surface-elevated: #1F1F1F;
  
  --color-text-primary: #FFFFFF;
  --color-text-secondary: #A0A0A0;
  --color-text-muted: #666666;
  
  --color-accent: #E8D5B5;          /* Warm gold */
  --color-accent-hover: #F0E2C8;
  
  --color-border: #2A2A2A;
  --color-border-light: #3A3A3A;

  /* Typography - Scale */
  --font-family-primary: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
  --font-family-display: 'Space Grotesk', var(--font-family-primary);
  
  --font-size-xs: 0.75rem;     /* 12px */
  --font-size-sm: 0.875rem;    /* 14px */
  --font-size-base: 1rem;      /* 16px */
  --font-size-lg: 1.125rem;    /* 18px */
  --font-size-xl: 1.25rem;     /* 20px */
  --font-size-2xl: 1.5rem;     /* 24px */
  --font-size-3xl: 2rem;       /* 32px */
  --font-size-4xl: 2.5rem;     /* 40px */
  --font-size-5xl: 3.5rem;     /* 56px */
  --font-size-6xl: 4.5rem;     /* 72px */
  
  --font-weight-normal: 400;
  --font-weight-medium: 500;
  --font-weight-semibold: 600;
  --font-weight-bold: 700;
  
  --line-height-tight: 1.1;
  --line-height-snug: 1.25;
  --line-height-normal: 1.5;
  --line-height-relaxed: 1.75;

  /* Spacing - 4px base */
  --space-1: 0.25rem;   /* 4px */
  --space-2: 0.5rem;    /* 8px */
  --space-3: 0.75rem;   /* 12px */
  --space-4: 1rem;      /* 16px */
  --space-5: 1.25rem;   /* 20px */
  --space-6: 1.5rem;    /* 24px */
  --space-8: 2rem;      /* 32px */
  --space-10: 2.5rem;   /* 40px */
  --space-12: 3rem;     /* 48px */
  --space-16: 4rem;     /* 64px */
  --space-20: 5rem;     /* 80px */
  --space-24: 6rem;     /* 96px */
  --space-32: 8rem;     /* 128px */

  /* Layout */
  --container-max: 1400px;
  --container-content: 800px;
  --container-padding: var(--space-6);
  
  /* Border Radius */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 16px;
  --radius-full: 9999px;

  /* Transitions */
  --transition-fast: 150ms ease;
  --transition-base: 250ms ease;
  --transition-slow: 400ms ease;
  --transition-slower: 600ms ease;
  
  /* Easing */
  --ease-out-expo: cubic-bezier(0.16, 1, 0.3, 1);
  --ease-out-quart: cubic-bezier(0.25, 1, 0.5, 1);
  --ease-in-out: cubic-bezier(0.65, 0, 0.35, 1);

  /* Shadows */
  --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.5);
  --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.4);
  --shadow-lg: 0 12px 40px rgba(0, 0, 0, 0.5);

  /* Z-Index Scale */
  --z-base: 1;
  --z-dropdown: 100;
  --z-sticky: 200;
  --z-overlay: 300;
  --z-modal: 400;
  --z-toast: 500;
}

/* Light mode override (optional - implement later) */
[data-theme="light"] {
  --color-background: #FAFAFA;
  --color-surface: #FFFFFF;
  --color-surface-elevated: #FFFFFF;
  --color-text-primary: #0A0A0A;
  --color-text-secondary: #555555;
  --color-text-muted: #888888;
  --color-border: #E5E5E5;
  --color-border-light: #F0F0F0;
}
```

---

## Responsive Breakpoints

```css
/* In utilities.css or where needed */

/* Mobile-first approach */
/* Base styles = mobile (320px+) */

/* Tablet */
@media (min-width: 768px) { }

/* Desktop */
@media (min-width: 1024px) { }

/* Large Desktop */
@media (min-width: 1440px) { }
```

---

## Component Specifications

### Header/Navigation

```
Behavior:
- Fixed position on scroll
- Transparent initially, solid background after scroll
- Logo left, navigation right
- Mobile: hamburger menu triggers slide-in panel

Elements:
- Logo (SVG, links to home)
- Nav links: Work, Services, About, Contact
- Mobile menu button (hamburger icon)

Transitions:
- Background opacity on scroll
- Smooth underline on hover for nav items
```

### Project Card

```
Used on: Home page, Work page

Variants:
- Large (featured, 2-column span)
- Standard (single column)

Elements:
- Project image (aspect ratio 4:3 or 16:9)
- Project title
- Category/service type tag
- Hover: slight scale + overlay with "View Project" prompt

Interaction:
- Entire card is clickable
- Image scales slightly on hover (transform: scale(1.02))
- Smooth transition (var(--transition-base))
```

### Service Card

```
Used on: Home page, Services page

Elements:
- Icon or visual element
- Service title
- Short description (2-3 lines)
- Optional: link to services page section

Layout:
- Grid of 4 on desktop
- Grid of 2 on tablet
- Stack on mobile
```

### Client Logo Strip

```
Elements:
- Row of client logos (grayscale by default)
- Subtle hover: full color or slight opacity increase

Logos to include:
- African Puzzle
- Channel Affairs
- Design Lab
- Empower Amsterdam
- VONQ
- Kitchen Republic
- Booking
- Kajola
```

### Contact Form

```
Fields:
- Name (text, required)
- Email (email, required)
- Company (text, optional)
- Project Type (select: UX Design, Creative Direction, Product Strategy, Workshop, Other)
- Message (textarea, required)
- Submit button

Validation:
- Client-side validation
- Clear error states
- Success confirmation message

Backend:
- Formspree or similar static-form handler
- Configure in environment variable
```

---

## Page Templates

### Home Page Sections

```
1. Hero
   - Large headline (tagline or key message)
   - Subheadline (1-2 sentences)
   - CTA button: "See the Work" or "Get in Touch"
   - Optional: subtle animated element (stars/constellation)

2. Introduction
   - Brief value proposition paragraph
   - Optional: small founder image

3. Featured Work
   - Section title: "Selected Work"
   - 3-4 project cards (mixed sizes)
   - Link to full portfolio

4. Services Overview
   - Section title: "How I Can Help"
   - 4 service cards in grid
   - Link to services page

5. Clients
   - Simple heading: "Trusted By" or "Happy Collaborators"
   - Logo strip

6. CTA Section
   - Headline: "What are you dreaming up?"
   - Subtext: invitation to connect
   - Contact button
```

### Case Study Template

```
1. Hero
   - Project title (H1)
   - One-line description
   - Hero image (full-width)

2. Overview Sidebar (desktop: sticky sidebar, mobile: inline)
   - Client name
   - Role/services provided
   - Timeline/year
   - Industry

3. Content Sections (repeatable)
   - Section heading
   - Body text (markdown)
   - Images (full-width, half-width, or gallery)
   
4. Results (optional)
   - Key metrics or outcomes
   - Client testimonial if available

5. Navigation
   - Previous/Next project links
   - Back to all work
```

---

## Animation Guidelines

### Scroll Animations

Use Intersection Observer for reveal-on-scroll:

```javascript
// scroll-animations.js
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('is-visible');
      observer.unobserve(entry.target);
    }
  });
}, observerOptions);

document.querySelectorAll('[data-animate]').forEach(el => {
  observer.observe(el);
});
```

```css
/* animations.css */
[data-animate] {
  opacity: 0;
  transform: translateY(20px);
  transition: opacity var(--transition-slow) var(--ease-out-expo),
              transform var(--transition-slow) var(--ease-out-expo);
}

[data-animate].is-visible {
  opacity: 1;
  transform: translateY(0);
}

/* Stagger children */
[data-animate-stagger] > * {
  opacity: 0;
  transform: translateY(20px);
  transition: opacity var(--transition-slow) var(--ease-out-expo),
              transform var(--transition-slow) var(--ease-out-expo);
}

[data-animate-stagger].is-visible > *:nth-child(1) { transition-delay: 0ms; }
[data-animate-stagger].is-visible > *:nth-child(2) { transition-delay: 100ms; }
[data-animate-stagger].is-visible > *:nth-child(3) { transition-delay: 200ms; }
[data-animate-stagger].is-visible > *:nth-child(4) { transition-delay: 300ms; }

[data-animate-stagger].is-visible > * {
  opacity: 1;
  transform: translateY(0);
}
```

### Hover Interactions

```css
/* Buttons */
.button {
  transition: transform var(--transition-fast),
              background-color var(--transition-fast);
}

.button:hover {
  transform: translateY(-2px);
}

/* Links */
.nav-link {
  position: relative;
}

.nav-link::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 100%;
  height: 1px;
  background: currentColor;
  transform: scaleX(0);
  transform-origin: right;
  transition: transform var(--transition-base) var(--ease-out-expo);
}

.nav-link:hover::after {
  transform: scaleX(1);
  transform-origin: left;
}

/* Project cards */
.project-card img {
  transition: transform var(--transition-slow) var(--ease-out-expo);
}

.project-card:hover img {
  transform: scale(1.03);
}
```

### Respect Reduced Motion

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

---

## GitHub Pages Deployment

### GitHub Actions Workflow

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup Bun
        uses: oven-sh/setup-bun@v2
        with:
          bun-version: latest
      
      - name: Install dependencies
        run: bun install
      
      - name: Build
        run: bun run build
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./dist

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### Astro Config for GitHub Pages

```javascript
// astro.config.mjs
import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://constellation.design',
  // If using custom domain, no base needed
  // If using github.io/repo-name, add: base: '/repo-name'
});
```

---

## Development Commands

```bash
# Install dependencies
bun install

# Start development server
bun run dev

# Build for production
bun run build

# Preview production build
bun run preview
```

---

## Initial Build Priority

### Phase 1: Scaffold (Start Here)
1. Initialize Astro project
2. Set up file structure
3. Create design tokens (CSS custom properties)
4. Build BaseLayout with head, meta tags
5. Create Header and Footer components
6. Create basic responsive container styles

### Phase 2: Core Pages
1. Home page with placeholder content
2. About page
3. Contact page with working form
4. Services page

### Phase 3: Portfolio System
1. Case study layout template
2. Work overview page
3. Create markdown files for projects
4. Dynamic routing for case studies

### Phase 4: Polish
1. Scroll animations
2. Page transitions (if implementing)
3. Image optimization
4. Performance audit
5. Accessibility audit

---

## Placeholder Content

Use this content until final copy is provided:

**Tagline:** "Connecting the dots with design, creativity, and culture."

**Hero Subhead:** "Constellation Design is a creative consultancy driven by curiosity, led by Qa'id Jacobs from Amsterdam."

**Services:**
- UX Design
- Creative Direction
- Product Strategy
- Workshops & Talks

**Founder Name:** Qa'id Jacobs

**Location:** Amsterdam, Netherlands

---

## Questions for Clarification

Flag these if encountered during development:
1. Logo file format/source needed
2. Project images needed for case studies
3. Contact form endpoint (Formspree project ID)
4. Analytics tracking code
5. Any specific font files or using Google Fonts?

---

*Document ready for Windsurf IDE. Begin with Phase 1 scaffold.*
