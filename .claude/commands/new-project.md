Create a new case study for Constellation Design.

Prompt for the following metadata if not provided:
- **title**: Project name
- **client**: Client or organisation name
- **role**: Your role on the project (e.g. "UX Design Lead", "Creative Director")
- **year**: 4-digit year (e.g. "2024")
- **industry**: Industry sector (e.g. "Healthcare", "Hospitality")
- **category**: One of `UX Design`, `Creative Direction`, `Product Strategy`, `Workshop`
- **description**: 1–2 sentence summary for SEO and listings
- **featured**: `true` or `false`
- **order**: Integer display order (check existing projects to pick the next number)

Then:

1. **Generate slug** from the title: lowercase, hyphens, no special characters (e.g. "My Cool Project" → `my-cool-project`)

2. **Create** `src/content/projects/{slug}.md` with this structure:

```yaml
---
title: "{title}"
description: "{description}"
category: "{category}"
client: "{client}"
role: "{role}"
year: "{year}"
industry: "{industry}"
featured: {featured}
order: {order}
image: "/images/work/{slug}/{slug}-cover.png"
draft: true
---

## Overview

[Describe the project challenge and context here.]

## Approach

[Describe your process, methodology, and key decisions.]

<div class="case-callout">
  <div class="case-callout__inner">
    <h3 class="case-callout__title">Key Insight</h3>
    <p>[A memorable insight or outcome from the project.]</p>
  </div>
</div>

## Outcome

[Describe results, impact, and lessons learned.]
```

3. **Create** the image directory: `public/images/work/{slug}/` (place a `.gitkeep` placeholder if no images are provided)

4. **Run** `bun run build` to verify the project builds without errors

5. **Report** the new file paths and remind the user to:
   - Add cover image at `/images/work/{slug}/{slug}-cover.png`
   - Set `draft: false` when ready to publish
   - Set `featured: true` to feature on the homepage
