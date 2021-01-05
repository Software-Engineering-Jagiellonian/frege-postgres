--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Debian 12.5-1.pgdg100+1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

-- Started on 2021-01-05 15:22:18 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2954 (class 1262 OID 16384)
-- Name: frege; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE frege WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE frege OWNER TO postgres;

\connect frege

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- TOC entry 202 (class 1259 OID 16385)
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id smallint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16388)
-- Name: repositories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repositories (
    repo_id character varying(250) NOT NULL,
    git_url character varying(250) NOT NULL,
    repo_url character varying(250),
    crawl_time timestamp with time zone,
    download_time timestamp with time zone,
    commit_hash character varying(40)
);


ALTER TABLE public.repositories OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16394)
-- Name: repository_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repository_language (
    id bigint NOT NULL,
    repository_id character varying(250),
    language_id smallint,
    present boolean,
    analyzed boolean
);


ALTER TABLE public.repository_language OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16397)
-- Name: repository_language_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repository_language_file (
    id bigint NOT NULL,
    repository_language_id bigint NOT NULL,
    file_path character varying(500) NOT NULL
);


ALTER TABLE public.repository_language_file OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16403)
-- Name: repository_language_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repository_language_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repository_language_file_id_seq OWNER TO postgres;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 206
-- Name: repository_language_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repository_language_file_id_seq OWNED BY public.repository_language_file.id;


--
-- TOC entry 207 (class 1259 OID 16405)
-- Name: repository_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repository_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repository_language_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 207
-- Name: repository_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repository_language_id_seq OWNED BY public.repository_language.id;


--
-- TOC entry 208 (class 1259 OID 16435)
-- Name: repository_statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repository_statistics (
    repo_id character varying(250) NOT NULL,
    forks integer,
    watchers integer,
    updated_at timestamp with time zone,
    created_at timestamp with time zone,
    open_issues bigint,
    closed_issues bigint,
    subscribers_count integer,
    pr_open bigint,
    pr_closed bigint
);


ALTER TABLE public.repository_statistics OWNER TO postgres;

--
-- TOC entry 2797 (class 2604 OID 16407)
-- Name: repository_language id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language ALTER COLUMN id SET DEFAULT nextval('public.repository_language_id_seq'::regclass);


--
-- TOC entry 2798 (class 2604 OID 16408)
-- Name: repository_language_file id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language_file ALTER COLUMN id SET DEFAULT nextval('public.repository_language_file_id_seq'::regclass);


--
-- TOC entry 2942 (class 0 OID 16385)
-- Dependencies: 202
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, name) FROM stdin;
1	C
2	C++
3	C#
4	CSS
5	Java
6	JS
7	PHP
8	Python
9	Ruby
\.


--
-- TOC entry 2943 (class 0 OID 16388)
-- Dependencies: 203
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repositories (repo_id, git_url, repo_url, crawl_time, download_time, commit_hash) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 16394)
-- Dependencies: 204
-- Data for Name: repository_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repository_language (id, repository_id, language_id, present, analyzed) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 16397)
-- Dependencies: 205
-- Data for Name: repository_language_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repository_language_file (id, repository_language_id, file_path) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 16435)
-- Dependencies: 208
-- Data for Name: repository_statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repository_statistics (repo_id, forks, watchers, updated_at, created_at, open_issues, closed_issues, subscribers_count, pr_open, pr_closed) FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 206
-- Name: repository_language_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repository_language_file_id_seq', 1, false);


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 207
-- Name: repository_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repository_language_id_seq', 1, false);


--
-- TOC entry 2800 (class 2606 OID 16410)
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 16412)
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (repo_id);


--
-- TOC entry 2809 (class 2606 OID 16414)
-- Name: repository_language_file repository_language_file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language_file
    ADD CONSTRAINT repository_language_file_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 16416)
-- Name: repository_language repository_language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language
    ADD CONSTRAINT repository_language_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 16439)
-- Name: repository_statistics repository_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_statistics
    ADD CONSTRAINT repository_statistics_pkey PRIMARY KEY (repo_id);


--
-- TOC entry 2803 (class 1259 OID 16417)
-- Name: fki_languages_repository_language; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_languages_repository_language ON public.repository_language USING btree (language_id);


--
-- TOC entry 2804 (class 1259 OID 16418)
-- Name: fki_repositories_repository_language; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_repositories_repository_language ON public.repository_language USING btree (repository_id);


--
-- TOC entry 2807 (class 1259 OID 16419)
-- Name: fki_repository_language_repository_language_file; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_repository_language_repository_language_file ON public.repository_language_file USING btree (repository_language_id);


--
-- TOC entry 2812 (class 2606 OID 16420)
-- Name: repository_language languages_repository_language; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language
    ADD CONSTRAINT languages_repository_language FOREIGN KEY (language_id) REFERENCES public.languages(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 2813 (class 2606 OID 16425)
-- Name: repository_language repositories_repository_language; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language
    ADD CONSTRAINT repositories_repository_language FOREIGN KEY (repository_id) REFERENCES public.repositories(repo_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 2815 (class 2606 OID 16440)
-- Name: repository_statistics repositories_repository_statistics; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_statistics
    ADD CONSTRAINT repositories_repository_statistics FOREIGN KEY (repo_id) REFERENCES public.repositories(repo_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2814 (class 2606 OID 16430)
-- Name: repository_language_file repository_language_repository_language_file; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language_file
    ADD CONSTRAINT repository_language_repository_language_file FOREIGN KEY (repository_language_id) REFERENCES public.repository_language(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


-- Completed on 2021-01-05 15:22:18 CET

--
-- PostgreSQL database dump complete
--

