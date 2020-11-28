CREATE DATABASE frege
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
    
\c frege

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Debian 12.5-1.pgdg100+1)
-- Dumped by pg_dump version 12.5 (Debian 12.5-1.pgdg100+1)

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
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id smallint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.languages OWNER TO postgres;

--
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
-- Name: repository_language_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repository_language_file (
    id bigint NOT NULL,
    repository_language_id bigint NOT NULL,
    file_path character varying(500) NOT NULL
);


ALTER TABLE public.repository_language_file OWNER TO postgres;

--
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
-- Name: repository_language_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repository_language_file_id_seq OWNED BY public.repository_language_file.id;


--
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
-- Name: repository_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repository_language_id_seq OWNED BY public.repository_language.id;


--
-- Name: repository_language id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language ALTER COLUMN id SET DEFAULT nextval('public.repository_language_id_seq'::regclass);


--
-- Name: repository_language_file id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language_file ALTER COLUMN id SET DEFAULT nextval('public.repository_language_file_id_seq'::regclass);


--
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
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repositories (repo_id, git_url, repo_url, crawl_time, download_time, commit_hash) FROM stdin;
\.


--
-- Data for Name: repository_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repository_language (id, repository_id, language_id, present, analyzed) FROM stdin;
\.


--
-- Data for Name: repository_language_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repository_language_file (id, repository_language_id, file_path) FROM stdin;
\.


--
-- Name: repository_language_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repository_language_file_id_seq', 1, false);


--
-- Name: repository_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repository_language_id_seq', 1, false);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (repo_id);


--
-- Name: repository_language_file repository_language_file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language_file
    ADD CONSTRAINT repository_language_file_pkey PRIMARY KEY (id);


--
-- Name: repository_language repository_language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language
    ADD CONSTRAINT repository_language_pkey PRIMARY KEY (id);


--
-- Name: fki_languages_repository_language; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_languages_repository_language ON public.repository_language USING btree (language_id);


--
-- Name: fki_repositories_repository_language; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_repositories_repository_language ON public.repository_language USING btree (repository_id);


--
-- Name: fki_repository_language_repository_language_file; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_repository_language_repository_language_file ON public.repository_language_file USING btree (repository_language_id);


--
-- Name: repository_language languages_repository_language; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language
    ADD CONSTRAINT languages_repository_language FOREIGN KEY (language_id) REFERENCES public.languages(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: repository_language repositories_repository_language; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language
    ADD CONSTRAINT repositories_repository_language FOREIGN KEY (repository_id) REFERENCES public.repositories(repo_id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: repository_language_file repository_language_repository_language_file; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repository_language_file
    ADD CONSTRAINT repository_language_repository_language_file FOREIGN KEY (repository_language_id) REFERENCES public.repository_language(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- PostgreSQL database dump complete
--

