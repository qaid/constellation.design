import { defineCollection, z } from 'astro:content';

const projectsCollection = defineCollection({
  type: 'content',
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
    draft: z.boolean().default(false),
  }),
});

export const collections = {
  projects: projectsCollection,
};
