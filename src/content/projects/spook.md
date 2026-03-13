---
title: "Spook"
description: "A lightweight macOS network traffic monitor with per-app breakdown, connection details, and traffic history."
category: "UX Design"
role: "Designer & Developer"
year: "2025"
industry: "Developer Tools & Security"
featured: false
order: 7
image: "/images/work/spook/spook-cover.png"
draft: false
---

### Background & Overview

The name is a play on Sam Greenlee's 1969 novel *The Spook Who Sat By the Door* — because this app sits quietly by your network ports, watching the data flow.

Spook is a lightweight macOS menu bar app that monitors network traffic in real time. It shows live upload and download speeds at a glance, and opens into a detail view with per-app traffic breakdown, connection details with resolved hostnames, and usage graphs over hours or days.

<div class="case-callout">
  <div class="case-callout__inner">
    <h3 class="case-callout__title">The Problem</h3>
    <p>Understanding what's happening on your network shouldn't require a complex tool with elevated privileges. Most network monitors are either too heavy or too opaque — enterprise software squeezed into a consumer context.</p>
  </div>
</div>

#### Light by design.

Spook uses built-in macOS tools — `netstat`, `nettop`, `lsof` — to gather statistics without kernel extensions, network filters, or elevated privileges. No special permissions required. The UI priorities are clarity and speed: live speeds in the menu bar, expandable per-app details when you want them, search and filtering when you need to find something specific, and historical data stored locally for 30 days.

Everything stays on your Mac. No telemetry, no analytics, no network requests from the app itself.

Source code: [github.com/qaid/spook](https://github.com/qaid/spook)

### Like what you see?

Don't hesitate to reach out so we can chat about working on a project together.

[Contact me](/contact)
