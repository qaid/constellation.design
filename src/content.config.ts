import { defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';
import { z } from 'astro/zod';

const projectsCollection = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/projects' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    category: z.enum(['UX Design', 'Creative Direction', 'Product Strategy', 'Workshop']),
    client: z.string().optional(),
    role: z.string().optional(),
    year: z.string(),
    industry: z.string().optional(),
    featured: z.boolean().default(false),
    order: z.number().default(0),
    image: z.string().optional(),
    imageFit: z.enum(['cover', 'contain']).default('cover'),
    website: z.string().url().optional(),
    draft: z.boolean().default(false),
  }),
});

export const collections = {
  projects: projectsCollection,
};
