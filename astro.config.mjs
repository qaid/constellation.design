// @ts-check
import { defineConfig, fontProviders } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://constellation.design',
  // Astro 7's CSS minifier writes media range syntax (width<=768px) by default; Safari < 16.4 ignores it.
  vite: { build: { cssTarget: ['safari14'] } },
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
      // Theme detection script uses is:inline to run before first paint (prevents FOUC).
      // Astro's CSP auto-hashing doesn't cover is:inline scripts, so the hash is manual.
      // Regenerate: node -e "const c=require('crypto'),f=require('fs'),h=f.readFileSync('dist/index.html','utf8').match(/<script>([\\s\\S]*?)<\\/script>/)[1];console.log('sha256-'+c.createHash('sha256').update(h).digest('base64'))"
      scriptDirective: {
        hashes: ['sha256-xE/qAROQqcYEId/qmqvJGpJUJ/Ccmiid5Hjc5aM4CPM='],
      },
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
