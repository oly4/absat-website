import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://ynlgqnafscsmimnsuveb.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlubGdxbmFmc2NzbWltbnN1dmViIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzMzk4MTcsImV4cCI6MjA2ODkxNTgxN30.knxBiSXSFxQmbiA1RAg5tvA7bhPhYjsuMH7u89bO504';

export const supabase = createClient(supabaseUrl, supabaseKey); 