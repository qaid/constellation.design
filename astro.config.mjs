// @ts-check
import { defineConfig, fontProviders } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://constellation.design',
  fonts: [
    {
      name: 'Inter',
      cssVariable: '--font-family-primary',
      provider: fontProviders.google(),
      weights: [400, 500, 600, 700],
    },
    {
      name: 'Syne',
      cssVariable: '--font-family-display',
      provider: fontProviders.google(),
      weights: [500, 600, 700, 800],
    },
  ],
  security: {
    csp: {
      directives: [
        "default-src 'self'",
        "img-src 'self' data:",
        "connect-src 'self' https://formspree.io",
        "form-action https://formspree.io",
        "frame-ancestors 'none'",
        "base-uri 'self'",
      ],
    },
  },
});
