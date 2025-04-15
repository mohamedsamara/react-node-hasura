-- down.sql (Rollback migration)

-- Drop foreign key constraint
ALTER TABLE public.staff DROP CONSTRAINT IF EXISTS staff_organization_id_fkey;

-- Drop primary key constraints
ALTER TABLE public.organizations DROP CONSTRAINT IF EXISTS organizations_pkey;
ALTER TABLE public.staff DROP CONSTRAINT IF EXISTS staff_pkey;

-- Drop the tables
DROP TABLE IF EXISTS public.staff;
DROP TABLE IF EXISTS public.organizations;

-- Drop the sequences
DROP SEQUENCE IF EXISTS public.staff_id_seq;
DROP SEQUENCE IF EXISTS public.organizations_id_seq;
