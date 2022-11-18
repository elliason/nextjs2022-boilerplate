import { defineConfig } from 'cypress';
import dotenv from 'dotenv';

dotenv.config({ path: '../../.env' });

export default defineConfig({
    e2e: {
        /* ---- IMPORTANT: DOMAIN HAS TO BE ADDED TO HOSTS FILE ---- */
        baseUrl: process.env.APP_HOST ? `https://${process.env.APP_HOST}` : 'http://localhost:3000',
        /* ---- IMPORTANT: DOMAIN HAS TO BE ADDED TO HOSTS FILE ---- */
    },
});
