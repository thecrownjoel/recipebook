--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: recipes; Type: TABLE; Schema: public; Owner: propjoel
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    name character(255),
    ingredients text,
    directions text
);


ALTER TABLE public.recipes OWNER TO propjoel;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: propjoel
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO propjoel;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: propjoel
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: propjoel
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: propjoel
--

COPY public.recipes (id, name, ingredients, directions) FROM stdin;
1	Mushroom Pork Chops                                                                                                                                                                                                                                            	4 pork chops, salt and pepper, garlic salt, 1 onion chopped, 1/2 pound fresh mushrooms, cream of mushroom soup can.	In a large skillet, brown the chops over medium-high heat. Add the onion and mushrooms, and saute for one minute. Pour cream of mushroom soup over chops. Cover skillet, and reduce temperature to medium-low. Simmer 20 to 30 minutes, or until chops are cooked through.
2	KISS Salmon                                                                                                                                                                                                                                                    	2 salmon filets, 1/4 cup bbq sauce, 1/4 cup seedless raspberry jam	Preheat over to 400 degrees. Grease 11x17 inch baking dish. Generously brush the mixture over the salmon.
\.


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: propjoel
--

SELECT pg_catalog.setval('public.recipes_id_seq', 2, true);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: propjoel
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

