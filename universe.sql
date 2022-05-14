--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: astronomers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomers (
    astronomers_id integer NOT NULL,
    name character varying(40) NOT NULL,
    birthyear integer NOT NULL
);


ALTER TABLE public.astronomers OWNER TO freecodecamp;

--
-- Name: astronomers_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomers_id_seq OWNER TO freecodecamp;

--
-- Name: astronomers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomers_id_seq OWNED BY public.astronomers.astronomers_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_years integer NOT NULL,
    is_visible boolean NOT NULL,
    distance_from_earth numeric(4,2) NOT NULL,
    discovered_by text DEFAULT 'Kirbo'::text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_years integer DEFAULT 4 NOT NULL,
    is_visible boolean DEFAULT false NOT NULL,
    distance_from_earth numeric(4,2) DEFAULT 99.99 NOT NULL,
    planet_id integer NOT NULL,
    discovered_by text DEFAULT 'Galileo'::text NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_years integer NOT NULL,
    is_visible boolean NOT NULL,
    distance_from_earth numeric(4,2) NOT NULL,
    star_id integer NOT NULL,
    discovered_by text DEFAULT 'Galileo'::text NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_years integer DEFAULT 16 NOT NULL,
    is_visible boolean DEFAULT false NOT NULL,
    distance_from_earth numeric(4,2) DEFAULT 99.99 NOT NULL,
    galaxy_id integer DEFAULT 1 NOT NULL,
    discovered_by text DEFAULT 'Galileo'::text NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronomers astronomers_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomers ALTER COLUMN astronomers_id SET DEFAULT nextval('public.astronomers_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: astronomers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomers VALUES (1, 'Galileo', 1564);
INSERT INTO public.astronomers VALUES (2, 'Kepler', 1571);
INSERT INTO public.astronomers VALUES (3, 'Hubble', 1889);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13, true, 25.56, 'Galileo');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, true, 2.37, 'Hubble');
INSERT INTO public.galaxy VALUES (3, 'Bode', 15, false, 99.99, 'Bode');
INSERT INTO public.galaxy VALUES (4, 'NGC 4622', 14, false, 99.99, 'NASA');
INSERT INTO public.galaxy VALUES (5, 'Eye of Sauron', 21, false, 99.99, 'NASA');
INSERT INTO public.galaxy VALUES (6, 'Mayall', 66, false, 99.99, 'Nicholas Mayall');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Deimos', 4, true, 77.79, 2, 'Asaph Hall');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 77.49, 2, 'Asaph Hall');
INSERT INTO public.moon VALUES (3, 'Moon', 4, false, 99.99, 3, 'Humanity');
INSERT INTO public.moon VALUES (4, 'Io', 4, false, 99.99, 6, 'Galileo');
INSERT INTO public.moon VALUES (5, 'Europa', 4, false, 99.99, 6, 'Galileo');
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, false, 99.99, 6, 'Galileo');
INSERT INTO public.moon VALUES (7, 'Callisto', 4, false, 99.99, 6, 'Galileo');
INSERT INTO public.moon VALUES (8, 'Amalthea', 4, false, 99.99, 6, 'Galileo');
INSERT INTO public.moon VALUES (9, 'Atlas', 4, false, 99.99, 7, 'Terrile');
INSERT INTO public.moon VALUES (10, 'Pandora', 4, false, 99.99, 7, 'Collins');
INSERT INTO public.moon VALUES (11, 'Ymir', 4, false, 99.99, 7, 'Gladman');
INSERT INTO public.moon VALUES (12, 'Pallene', 4, false, 99.99, 7, 'Gordon');
INSERT INTO public.moon VALUES (13, 'Daphnis', 4, false, 99.99, 7, 'Porco');
INSERT INTO public.moon VALUES (14, 'Pan', 4, false, 99.99, 7, 'Showalter');
INSERT INTO public.moon VALUES (15, 'Bianca', 4, false, 99.99, 9, 'Smith');
INSERT INTO public.moon VALUES (16, 'Belinda', 4, false, 99.99, 9, 'Synnott 2');
INSERT INTO public.moon VALUES (17, 'Portia', 4, false, 99.99, 9, 'Synnott 2');
INSERT INTO public.moon VALUES (18, 'Juliet', 4, false, 99.99, 9, 'Synnott 2');
INSERT INTO public.moon VALUES (19, 'Stephano', 4, false, 99.99, 9, 'Synnott 2');
INSERT INTO public.moon VALUES (20, 'Margaret', 4, false, 99.99, 9, 'Synnott 2');
INSERT INTO public.moon VALUES (21, 'Francisco', 4, false, 99.99, 9, 'Synnott 2');
INSERT INTO public.moon VALUES (22, 'Naiad', 4, false, 99.99, 8, 'Terrile');
INSERT INTO public.moon VALUES (23, 'Galatea', 4, false, 99.99, 8, 'Terrile');
INSERT INTO public.moon VALUES (24, 'Sao', 4, false, 99.99, 8, 'Terrile');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mars', 4, true, 23.33, 2, 'Galileo');
INSERT INTO public.planet VALUES (3, 'Earth', 4, true, 0.00, 2, 'Humanity');
INSERT INTO public.planet VALUES (4, 'Mercury', 4, true, 77.00, 2, 'Galileo');
INSERT INTO public.planet VALUES (5, 'Venus', 4, true, 16.58, 2, 'Galileo');
INSERT INTO public.planet VALUES (6, 'Jupiter', 4, true, 77.33, 2, 'Galileo');
INSERT INTO public.planet VALUES (7, 'Saturn', 4, true, 44.44, 2, 'Galileo');
INSERT INTO public.planet VALUES (8, 'Neptune', 4, true, 88.88, 2, 'Le Verrier');
INSERT INTO public.planet VALUES (9, 'Uranus', 4, true, 78.78, 2, 'Wiliam Herschel');
INSERT INTO public.planet VALUES (10, 'Pluto', 4, true, 79.79, 2, 'Clyde Tombaugh');
INSERT INTO public.planet VALUES (11, 'Ceres', 4, true, 33.33, 2, 'Giuseppe Piazzi');
INSERT INTO public.planet VALUES (12, 'Eris', 4, true, 99.99, 2, 'Trujillo');
INSERT INTO public.planet VALUES (13, 'Haumea', 4, false, 99.99, 2, 'Ortiz');
INSERT INTO public.planet VALUES (14, 'Makemake', 4, false, 99.99, 2, 'Chad Ortiz');
INSERT INTO public.planet VALUES (15, 'Alef', 4, true, 33.33, 2, 'Israel');
INSERT INTO public.planet VALUES (16, 'Sazum', 4, true, 99.99, 2, 'China');
INSERT INTO public.planet VALUES (17, 'Lete', 4, false, 99.99, 2, 'Italy');
INSERT INTO public.planet VALUES (18, 'Meztli', 4, false, 99.99, 2, 'Mexico');
INSERT INTO public.planet VALUES (19, 'Abol', 4, true, 33.33, 2, 'Ethiopia');
INSERT INTO public.planet VALUES (20, 'Sumajmajta', 4, true, 99.99, 2, 'Peru');
INSERT INTO public.planet VALUES (21, 'Caleuche', 4, false, 99.99, 2, 'Chile');
INSERT INTO public.planet VALUES (22, 'Xólotl', 4, false, 99.99, 2, 'Mexico');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 4, true, 14.69, 1, 'Galileo');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 16, false, 99.99, 1, 'NASA');
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 16, false, 99.99, 1, 'NASA');
INSERT INTO public.star VALUES (5, 'Bernard', 16, false, 99.99, 1, 'NASA');
INSERT INTO public.star VALUES (6, 'Wolf 359', 16, false, 99.99, 1, 'NASA');
INSERT INTO public.star VALUES (7, 'Sirius A', 16, false, 99.99, 1, 'NASA');
INSERT INTO public.star VALUES (8, 'Sirius B', 16, false, 99.99, 1, 'NASA');


--
-- Name: astronomers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomers_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 24, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 22, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: astronomers astronomers_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomers
    ADD CONSTRAINT astronomers_name_key UNIQUE (name);


--
-- Name: astronomers astronomers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomers
    ADD CONSTRAINT astronomers_pkey PRIMARY KEY (astronomers_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_id_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_id_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_id_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

