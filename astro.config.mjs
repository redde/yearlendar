import { defineConfig } from 'astro/config';

export default defineConfig({
  base: process.env.PAGES_BASE_PATH || '/',
});
