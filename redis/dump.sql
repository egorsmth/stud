--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: app_users; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.app_users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    gender character varying(15),
    country character varying(100),
    city character varying(100),
    avatar character varying(100) NOT NULL,
    coins integer DEFAULT 0 NOT NULL,
    rating integer DEFAULT 0 NOT NULL,
    token character varying(100),
    login integer DEFAULT 0,
    status integer DEFAULT 0 NOT NULL,
    fbtoken character varying(100),
    block boolean DEFAULT false NOT NULL,
    active integer,
    activation_code character varying(100),
    googleid character varying(100),
    google_id character varying(100),
    google_token character varying(100),
    reset_allowed boolean DEFAULT false,
    coins_total integer DEFAULT 0 NOT NULL,
    coins_month integer DEFAULT 0 NOT NULL,
    password character varying(100),
    birthday bigint,
    nickname character varying(100),
    reg_date timestamp without time zone DEFAULT now(),
    allow_push integer DEFAULT 1,
    device_id character varying(250)
);


ALTER TABLE public.app_users OWNER TO proteus;

--
-- Name: app_users_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.app_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_users_id_seq OWNER TO proteus;

--
-- Name: app_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.app_users_id_seq OWNED BY public.app_users.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(15) NOT NULL
);


ALTER TABLE public.categories OWNER TO proteus;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO proteus;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100)
);


ALTER TABLE public.groups OWNER TO proteus;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO proteus;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.links (
    id integer NOT NULL,
    id_question integer NOT NULL,
    link character varying(100) NOT NULL
);


ALTER TABLE public.links OWNER TO proteus;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.links_id_seq OWNER TO proteus;

--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: login_attempts; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.login_attempts (
    id integer NOT NULL,
    ip_address character varying(15) NOT NULL,
    login character varying(100) NOT NULL,
    "time" integer NOT NULL
);


ALTER TABLE public.login_attempts OWNER TO proteus;

--
-- Name: login_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_attempts_id_seq OWNER TO proteus;

--
-- Name: login_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.login_attempts_id_seq OWNED BY public.login_attempts.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.migrations (
    version bigint NOT NULL
);


ALTER TABLE public.migrations OWNER TO proteus;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    text text NOT NULL,
    category integer NOT NULL,
    answer character varying(64),
    id_admin integer,
    name character varying(128) NOT NULL,
    image character varying(256) DEFAULT 'default.png'::character varying NOT NULL,
    checked integer DEFAULT 0,
    date_begin bigint NOT NULL,
    date_stop bigint NOT NULL,
    type character varying(32) NOT NULL,
    max_value numeric,
    min_value numeric,
    currency integer,
    standart integer DEFAULT 0
);


ALTER TABLE public.questions OWNER TO proteus;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO proteus;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO proteus;

--
-- Name: statuses; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.statuses (
    id integer NOT NULL,
    status character varying NOT NULL,
    min_percent integer,
    max_percent integer
);


ALTER TABLE public.statuses OWNER TO proteus;

--
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statuses_id_seq OWNER TO proteus;

--
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- Name: user_status; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.user_status (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_status integer NOT NULL,
    id_category integer NOT NULL
);


ALTER TABLE public.user_status OWNER TO proteus;

--
-- Name: user_status_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.user_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_status_id_seq OWNER TO proteus;

--
-- Name: user_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.user_status_id_seq OWNED BY public.user_status.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.users (
    id integer NOT NULL,
    ip_address character varying(20),
    username character varying(100),
    password character varying(255) NOT NULL,
    salt character varying(255),
    email character varying(100) NOT NULL,
    activation_code character varying(40),
    forgotten_password_code character varying(255),
    forgotten_password_time integer,
    remember_code character varying(40),
    created_on integer NOT NULL,
    last_login integer,
    active integer,
    first_name character varying(50),
    last_name character varying(50),
    company character varying(100),
    phone character varying(20),
    block boolean
);


ALTER TABLE public.users OWNER TO proteus;

--
-- Name: users_answers; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.users_answers (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_question integer NOT NULL,
    answer_date timestamp without time zone DEFAULT now(),
    answer integer DEFAULT 0,
    min numeric DEFAULT 0,
    max numeric DEFAULT 0
);


ALTER TABLE public.users_answers OWNER TO proteus;

--
-- Name: users_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.users_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_answers_id_seq OWNER TO proteus;

--
-- Name: users_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.users_answers_id_seq OWNED BY public.users_answers.id;


--
-- Name: users_coins; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.users_coins (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_category integer NOT NULL,
    coins integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    id_question integer
);


ALTER TABLE public.users_coins OWNER TO proteus;

--
-- Name: users_coins_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.users_coins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_coins_id_seq OWNER TO proteus;

--
-- Name: users_coins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.users_coins_id_seq OWNED BY public.users_coins.id;


--
-- Name: users_groups; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.users_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_groups OWNER TO proteus;

--
-- Name: users_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.users_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_groups_id_seq OWNER TO proteus;

--
-- Name: users_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.users_groups_id_seq OWNED BY public.users_groups.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO proteus;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_rating; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.users_rating (
    id integer NOT NULL,
    id_user integer NOT NULL,
    total_rating integer DEFAULT 0 NOT NULL,
    month_rating integer DEFAULT 0 NOT NULL,
    politics_right integer DEFAULT 0 NOT NULL,
    politics_total integer DEFAULT 0 NOT NULL,
    politics_month integer DEFAULT 0 NOT NULL,
    politics_month_total integer DEFAULT 0 NOT NULL,
    finance_right integer DEFAULT 0 NOT NULL,
    finance_total integer DEFAULT 0 NOT NULL,
    finance_month integer DEFAULT 0 NOT NULL,
    finance_month_total integer DEFAULT 0 NOT NULL,
    arts_right integer DEFAULT 0 NOT NULL,
    arts_total integer DEFAULT 0 NOT NULL,
    arts_month integer DEFAULT 0 NOT NULL,
    arts_month_total integer DEFAULT 0 NOT NULL,
    sport_right integer DEFAULT 0 NOT NULL,
    sport_total integer DEFAULT 0 NOT NULL,
    sport_month integer DEFAULT 0 NOT NULL,
    sport_month_total integer DEFAULT 0 NOT NULL,
    technologies_total integer DEFAULT 0 NOT NULL,
    technologies_right integer DEFAULT 0 NOT NULL,
    technologies_month integer DEFAULT 0 NOT NULL,
    technologies_month_total integer DEFAULT 0 NOT NULL,
    other_total integer DEFAULT 0 NOT NULL,
    other_right integer DEFAULT 0 NOT NULL,
    other_month integer DEFAULT 0 NOT NULL,
    other_month_total integer DEFAULT 0 NOT NULL,
    crypto_total integer DEFAULT 0 NOT NULL,
    crypto_right integer DEFAULT 0 NOT NULL,
    crypto_month integer DEFAULT 0 NOT NULL,
    crypto_month_total integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users_rating OWNER TO proteus;

--
-- Name: users_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.users_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_rating_id_seq OWNER TO proteus;

--
-- Name: users_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.users_rating_id_seq OWNED BY public.users_rating.id;


--
-- Name: users_status; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.users_status (
    id integer NOT NULL,
    id_user integer NOT NULL,
    politics integer DEFAULT 4 NOT NULL,
    finance integer DEFAULT 4 NOT NULL,
    sport integer DEFAULT 4 NOT NULL,
    arts integer DEFAULT 4 NOT NULL,
    technologies integer DEFAULT 4 NOT NULL,
    crypto integer DEFAULT 4 NOT NULL,
    other integer DEFAULT 4 NOT NULL
);


ALTER TABLE public.users_status OWNER TO proteus;

--
-- Name: users_status_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.users_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_status_id_seq OWNER TO proteus;

--
-- Name: users_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.users_status_id_seq OWNED BY public.users_status.id;


--
-- Name: variants; Type: TABLE; Schema: public; Owner: proteus
--

CREATE TABLE public.variants (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    question integer NOT NULL,
    "right" integer NOT NULL
);


ALTER TABLE public.variants OWNER TO proteus;

--
-- Name: variants_id_seq; Type: SEQUENCE; Schema: public; Owner: proteus
--

CREATE SEQUENCE public.variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variants_id_seq OWNER TO proteus;

--
-- Name: variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proteus
--

ALTER SEQUENCE public.variants_id_seq OWNED BY public.variants.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.app_users ALTER COLUMN id SET DEFAULT nextval('public.app_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.login_attempts ALTER COLUMN id SET DEFAULT nextval('public.login_attempts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.user_status ALTER COLUMN id SET DEFAULT nextval('public.user_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users_answers ALTER COLUMN id SET DEFAULT nextval('public.users_answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users_coins ALTER COLUMN id SET DEFAULT nextval('public.users_coins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users_groups ALTER COLUMN id SET DEFAULT nextval('public.users_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users_rating ALTER COLUMN id SET DEFAULT nextval('public.users_rating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users_status ALTER COLUMN id SET DEFAULT nextval('public.users_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.variants ALTER COLUMN id SET DEFAULT nextval('public.variants_id_seq'::regclass);


--
-- Data for Name: app_users; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.app_users (id, email, first_name, last_name, gender, country, city, avatar, coins, rating, token, login, status, fbtoken, block, active, activation_code, googleid, google_id, google_token, reset_allowed, coins_total, coins_month, password, birthday, nickname, reg_date, allow_push, device_id) FROM stdin;
\.


--
-- Name: app_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.app_users_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.categories (id, name) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.groups (id, name, description) FROM stdin;
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.links (id, id_question, link) FROM stdin;
\.


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.links_id_seq', 1, false);


--
-- Data for Name: login_attempts; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.login_attempts (id, ip_address, login, "time") FROM stdin;
\.


--
-- Name: login_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.login_attempts_id_seq', 1, false);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.migrations (version) FROM stdin;
11
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.questions (id, text, category, answer, id_admin, name, image, checked, date_begin, date_stop, type, max_value, min_value, currency, standart) FROM stdin;
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.questions_id_seq', 1, false);


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.session (sid, sess, expire) FROM stdin;
\.


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.statuses (id, status, min_percent, max_percent) FROM stdin;
\.


--
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.statuses_id_seq', 1, false);


--
-- Data for Name: user_status; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.user_status (id, id_user, id_status, id_category) FROM stdin;
\.


--
-- Name: user_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.user_status_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.users (id, ip_address, username, password, salt, email, activation_code, forgotten_password_code, forgotten_password_time, remember_code, created_on, last_login, active, first_name, last_name, company, phone, block) FROM stdin;
\.


--
-- Data for Name: users_answers; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.users_answers (id, id_user, id_question, answer_date, answer, min, max) FROM stdin;
\.


--
-- Name: users_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.users_answers_id_seq', 1, false);


--
-- Data for Name: users_coins; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.users_coins (id, id_user, id_category, coins, created_at, id_question) FROM stdin;
\.


--
-- Name: users_coins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.users_coins_id_seq', 1, false);


--
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.users_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: users_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.users_groups_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Data for Name: users_rating; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.users_rating (id, id_user, total_rating, month_rating, politics_right, politics_total, politics_month, politics_month_total, finance_right, finance_total, finance_month, finance_month_total, arts_right, arts_total, arts_month, arts_month_total, sport_right, sport_total, sport_month, sport_month_total, technologies_total, technologies_right, technologies_month, technologies_month_total, other_total, other_right, other_month, other_month_total, crypto_total, crypto_right, crypto_month, crypto_month_total) FROM stdin;
\.


--
-- Name: users_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.users_rating_id_seq', 1, false);


--
-- Data for Name: users_status; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.users_status (id, id_user, politics, finance, sport, arts, technologies, crypto, other) FROM stdin;
\.


--
-- Name: users_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.users_status_id_seq', 1, false);


--
-- Data for Name: variants; Type: TABLE DATA; Schema: public; Owner: proteus
--

COPY public.variants (id, name, question, "right") FROM stdin;
\.


--
-- Name: variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proteus
--

SELECT pg_catalog.setval('public.variants_id_seq', 1, false);


--
-- Name: pk_app_users; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.app_users
    ADD CONSTRAINT pk_app_users PRIMARY KEY (id);


--
-- Name: pk_categories; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (id);


--
-- Name: pk_groups; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT pk_groups PRIMARY KEY (id);


--
-- Name: pk_links; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT pk_links PRIMARY KEY (id);


--
-- Name: pk_login_attempts; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.login_attempts
    ADD CONSTRAINT pk_login_attempts PRIMARY KEY (id);


--
-- Name: pk_questions; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT pk_questions PRIMARY KEY (id);


--
-- Name: pk_session; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT pk_session PRIMARY KEY (sid);


--
-- Name: pk_statuses; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT pk_statuses PRIMARY KEY (id);


--
-- Name: pk_user_status; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.user_status
    ADD CONSTRAINT pk_user_status PRIMARY KEY (id);


--
-- Name: pk_users; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);


--
-- Name: pk_users_answers; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users_answers
    ADD CONSTRAINT pk_users_answers PRIMARY KEY (id);


--
-- Name: pk_users_coins; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users_coins
    ADD CONSTRAINT pk_users_coins PRIMARY KEY (id);


--
-- Name: pk_users_groups; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT pk_users_groups PRIMARY KEY (id);


--
-- Name: pk_users_rating; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users_rating
    ADD CONSTRAINT pk_users_rating PRIMARY KEY (id);


--
-- Name: pk_users_status; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.users_status
    ADD CONSTRAINT pk_users_status PRIMARY KEY (id);


--
-- Name: pk_variants; Type: CONSTRAINT; Schema: public; Owner: proteus
--

ALTER TABLE ONLY public.variants
    ADD CONSTRAINT pk_variants PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

