SET check_function_bodies = false;
CREATE TABLE public.organizations (
    id integer NOT NULL,
    name text NOT NULL
);
CREATE SEQUENCE public.organizations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.organizations_id_seq OWNED BY public.organizations.id;
CREATE TABLE public.staff (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    specialty text,
    contact_number text NOT NULL,
    timezone character varying(100) DEFAULT 'America/Los_Angeles'::character varying NOT NULL
);
CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;
ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);
ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);
ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);
