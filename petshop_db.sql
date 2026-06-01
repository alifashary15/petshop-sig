--
-- PostgreSQL database dump
--

\restrict DKkl87k1lnKHg6df3djqFIzXtYSFfhqV26gsfSYUcg7y42BJbRfMwglqQiESHCF

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-12 10:57:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 16683)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration bigint NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16694)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration bigint NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16736)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16735)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 238
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 237 (class 1259 OID 16721)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16706)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16705)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 235
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 220 (class 1259 OID 16574)
-- Name: kecamatans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kecamatans (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.kecamatans OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16573)
-- Name: kecamatans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kecamatans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kecamatans_id_seq OWNER TO postgres;

--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 219
-- Name: kecamatans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kecamatans_id_seq OWNED BY public.kecamatans.id;


--
-- TOC entry 228 (class 1259 OID 16638)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16637)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 227
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 231 (class 1259 OID 16662)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16615)
-- Name: petshop_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.petshop_services (
    petshop_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE public.petshop_services OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16596)
-- Name: petshops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.petshops (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address text,
    kecamatan_id integer NOT NULL,
    latitude numeric(10,7),
    longitude numeric(10,7),
    workhour_open time without time zone,
    workhour_close time without time zone,
    rating numeric(3,2) DEFAULT 0,
    contact character varying(20),
    review integer DEFAULT 0,
    image character varying(500),
    CONSTRAINT petshops_rating_check CHECK (((rating >= (0)::numeric) AND (rating <= (5)::numeric)))
);


ALTER TABLE public.petshops OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16632)
-- Name: petshops_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.petshops_full AS
SELECT
    NULL::integer AS id,
    NULL::character varying(255) AS name,
    NULL::text AS address,
    NULL::character varying(100) AS kecamatan,
    NULL::numeric(10,7) AS latitude,
    NULL::numeric(10,7) AS longitude,
    NULL::text AS workhour,
    NULL::text AS service,
    NULL::numeric(3,2) AS rating,
    NULL::character varying(20) AS contact,
    NULL::integer AS review,
    NULL::character varying(500) AS image;


ALTER VIEW public.petshops_full OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16595)
-- Name: petshops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.petshops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.petshops_id_seq OWNER TO postgres;

--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 223
-- Name: petshops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.petshops_id_seq OWNED BY public.petshops.id;


--
-- TOC entry 222 (class 1259 OID 16585)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16584)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 232 (class 1259 OID 16671)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16648)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16647)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4922 (class 2604 OID 16739)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 16709)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 16577)
-- Name: kecamatans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kecamatans ALTER COLUMN id SET DEFAULT nextval('public.kecamatans_id_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 16641)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 16599)
-- Name: petshops id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.petshops ALTER COLUMN id SET DEFAULT nextval('public.petshops_id_seq'::regclass);


--
-- TOC entry 4915 (class 2604 OID 16588)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 16651)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5128 (class 0 OID 16683)
-- Dependencies: 233
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- TOC entry 5129 (class 0 OID 16694)
-- Dependencies: 234
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 5134 (class 0 OID 16736)
-- Dependencies: 239
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 5132 (class 0 OID 16721)
-- Dependencies: 237
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 5131 (class 0 OID 16706)
-- Dependencies: 236
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 5116 (class 0 OID 16574)
-- Dependencies: 220
-- Data for Name: kecamatans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kecamatans (id, name) FROM stdin;
1	Medan Tembung
2	Percut Sei Tuan
\.


--
-- TOC entry 5123 (class 0 OID 16638)
-- Dependencies: 228
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
\.


--
-- TOC entry 5126 (class 0 OID 16662)
-- Dependencies: 231
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 5121 (class 0 OID 16615)
-- Dependencies: 225
-- Data for Name: petshop_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.petshop_services (petshop_id, service_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
8	5
9	1
10	1
\.


--
-- TOC entry 5120 (class 0 OID 16596)
-- Dependencies: 224
-- Data for Name: petshops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.petshops (id, name, address, kecamatan_id, latitude, longitude, workhour_open, workhour_close, rating, contact, review, image) FROM stdin;
1	Aba Petshop	Jl. Letda Sujono No.02, Bantan Timur, Medan Tembung, Kota Medan	1	3.5979400	98.7115900	10:00:00	19:00:00	5.00	\N	20	https://res.cloudinary.com/dcq2apxcs/image/upload/v1777510694/Screenshot_2026-04-29_224841_vfzirw.png
2	Pussy Petshop Tembung	Jl. Pasar Baru, Hutan, Percut Sei Tuan, Deli Serdang	2	3.6017000	98.7575000	09:00:00	21:00:00	4.40	\N	114	https://res.cloudinary.com/dcq2apxcs/image/upload/v1777515282/Screenshot_2026-04-30_080542_of256u.png
3	Mandala Petshop	Jl. Mandala By Pass No.142A, Bantan, Medan Tembung, Kota Medan	1	3.5917100	98.7116800	09:00:00	22:00:00	4.50	6208987222210	31	https://res.cloudinary.com/dcq2apxcs/image/upload/v1777515281/Screenshot_2026-04-30_080638_kq4qro.png
4	Tembung Petshop	Jl. Pasar 7, Bandar Khalipah, Percut Sei Tuan, Deli Serdang	2	3.5967100	98.7528100	08:00:00	22:30:00	4.80	\N	6	https://res.cloudinary.com/dcq2apxcs/image/upload/v1777515282/Screenshot_2026-04-30_080700_tzfx2k.png
5	HOKI Petshop Medan	Jl. Perhubungan, Tembung, Percut Sei Tuan, Deli Serdang	2	3.6208800	98.7262300	08:00:00	22:00:00	4.40	6282113492511	39	https://res.cloudinary.com/dcq2apxcs/image/upload/v1777515281/Screenshot_2026-04-30_080758_wbkh1l.png
6	Chulifier Petshop	Tembung, Percut Sei Tuan, Deli Serdang	2	3.6165500	98.7155000	09:00:00	18:00:00	3.80	6285348535314	37	https://res.cloudinary.com/dcq2apxcs/image/upload/v1777515282/Screenshot_2026-04-30_081038_gmxq8i.png
7	Nazla Petshop Medan	Jl. Padang No.2E, Bandar Selamat, Medan Tembung, Kota Medan	1	3.5969300	98.7276800	09:30:00	22:00:00	4.20	6285276658772	37	https://res.cloudinary.com/dcq2apxcs/image/upload/v1777515281/Screenshot_2026-04-30_081113_krefa3.png
8	Toko Umi & Mini Petshop	Sidorejo Hilir, Medan Tembung, Kota Medan	1	3.6111700	98.6993900	07:30:00	21:00:00	4.50	\N	17	https://res.cloudinary.com/dcq2apxcs/image/upload/v1777515281/Screenshot_2026-04-30_081250_xh2kax.png
9	Pancing Petshop	Komplek MMTC Blok N No.2, Jl. Pancing, Percut Sei Tuan	2	3.6060700	98.7098700	08:00:00	19:00:00	4.30	6281370194555	119	https://res.cloudinary.com/dcq2apxcs/image/upload/v1777515281/Screenshot_2026-04-30_091335_yww1pl.png
10	Petshop Yok Mampir	Jl. Perhubungan, Lau Dendang, Percut Sei Tuan, Deli Serdang	2	3.6206200	98.7335000	08:00:00	21:00:00	5.00	6282361767883	4	https://res.cloudinary.com/dcq2apxcs/image/upload/v1777515281/Screenshot_2026-04-30_091412_adawbw.png
\.


--
-- TOC entry 5118 (class 0 OID 16585)
-- Dependencies: 222
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, name) FROM stdin;
1	Pet Shop
2	Grooming
3	Vaksin
4	Obat Hewan
5	Pakan Ternak
6	Jual Hewan
\.


--
-- TOC entry 5127 (class 0 OID 16671)
-- Dependencies: 232
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
mRSSR0a4WOJda1rcaAgfsxhuVG9UNudLbqvfJI4y	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:150.0) Gecko/20100101 Firefox/150.0	eyJfdG9rZW4iOiJneEZpOXNidUhYSFVXSjlqWnVsNEg1TVRwUnJrMmd5amZGMzRBOWFuIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9wbGFjZSIsInJvdXRlIjoicGxhY2UifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==	1777477038
71yV5H4x1rjNTYKjKhgUTZZOjSQ71WokpZRe7sUq	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:150.0) Gecko/20100101 Firefox/150.0	eyJfdG9rZW4iOiJ3cmlFOE5XOXdHU1BIYXBMVHdqb2ZlaEczdk05TU9WZ01vR3FOMTJsIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9tYXBzIiwicm91dGUiOiJtYXBzIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=	1777520736
g7CBEY0Els2juWsyv2KXiMgmfWg7F6dp3lRzjSwY	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:150.0) Gecko/20100101 Firefox/150.0	eyJfdG9rZW4iOiIwMFFNOEFnRjk4dzJiUW1KSnJEUEtxeW9iVmVXS3hVekhSd2FZcjlHIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOiJob21lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=	1778506312
lzNVrCgqgpXsfjNKkUlbYSWNTCmCfyioJgCOmrIr	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.119.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36	eyJfdG9rZW4iOiJpSGVyTXZRT0ltR0NZN1FBV2RJcU42SFI2NmQxZlIwVzBGTm5YaW5lIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9tYXBzIiwicm91dGUiOiJtYXBzIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=	1778557008
\.


--
-- TOC entry 5125 (class 0 OID 16648)
-- Dependencies: 230
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 238
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 235
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 219
-- Name: kecamatans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kecamatans_id_seq', 2, true);


--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 227
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 3, true);


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 223
-- Name: petshops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.petshops_id_seq', 10, true);


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 6, true);


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4954 (class 2606 OID 16703)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4951 (class 2606 OID 16692)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4961 (class 2606 OID 16751)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4963 (class 2606 OID 16753)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4959 (class 2606 OID 16734)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4956 (class 2606 OID 16719)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4926 (class 2606 OID 16583)
-- Name: kecamatans kecamatans_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kecamatans
    ADD CONSTRAINT kecamatans_name_key UNIQUE (name);


--
-- TOC entry 4928 (class 2606 OID 16581)
-- Name: kecamatans kecamatans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kecamatans
    ADD CONSTRAINT kecamatans_pkey PRIMARY KEY (id);


--
-- TOC entry 4938 (class 2606 OID 16646)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4944 (class 2606 OID 16670)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 4936 (class 2606 OID 16621)
-- Name: petshop_services petshop_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.petshop_services
    ADD CONSTRAINT petshop_services_pkey PRIMARY KEY (petshop_id, service_id);


--
-- TOC entry 4934 (class 2606 OID 16609)
-- Name: petshops petshops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.petshops
    ADD CONSTRAINT petshops_pkey PRIMARY KEY (id);


--
-- TOC entry 4930 (class 2606 OID 16594)
-- Name: services services_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_name_key UNIQUE (name);


--
-- TOC entry 4932 (class 2606 OID 16592)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 4947 (class 2606 OID 16680)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4940 (class 2606 OID 16661)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4942 (class 2606 OID 16659)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4949 (class 1259 OID 16693)
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- TOC entry 4952 (class 1259 OID 16704)
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- TOC entry 4957 (class 1259 OID 16720)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4945 (class 1259 OID 16682)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4948 (class 1259 OID 16681)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 5114 (class 2618 OID 16635)
-- Name: petshops_full _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.petshops_full AS
 SELECT p.id,
    p.name,
    p.address,
    k.name AS kecamatan,
    p.latitude,
    p.longitude,
    ((to_char((p.workhour_open)::interval, 'HH24:MI'::text) || '–'::text) || to_char((p.workhour_close)::interval, 'HH24:MI'::text)) AS workhour,
    string_agg((s.name)::text, ', '::text ORDER BY (s.name)::text) AS service,
    p.rating,
    p.contact,
    p.review,
    p.image
   FROM (((public.petshops p
     JOIN public.kecamatans k ON ((k.id = p.kecamatan_id)))
     LEFT JOIN public.petshop_services ps ON ((ps.petshop_id = p.id)))
     LEFT JOIN public.services s ON ((s.id = ps.service_id)))
  GROUP BY p.id, k.name;


--
-- TOC entry 4965 (class 2606 OID 16622)
-- Name: petshop_services petshop_services_petshop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.petshop_services
    ADD CONSTRAINT petshop_services_petshop_id_fkey FOREIGN KEY (petshop_id) REFERENCES public.petshops(id) ON DELETE CASCADE;


--
-- TOC entry 4966 (class 2606 OID 16627)
-- Name: petshop_services petshop_services_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.petshop_services
    ADD CONSTRAINT petshop_services_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- TOC entry 4964 (class 2606 OID 16610)
-- Name: petshops petshops_kecamatan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.petshops
    ADD CONSTRAINT petshops_kecamatan_id_fkey FOREIGN KEY (kecamatan_id) REFERENCES public.kecamatans(id);


-- Completed on 2026-05-12 10:57:36

--
-- PostgreSQL database dump complete
--

\unrestrict DKkl87k1lnKHg6df3djqFIzXtYSFfhqV26gsfSYUcg7y42BJbRfMwglqQiESHCF

