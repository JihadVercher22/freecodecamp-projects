--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: civilization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilization (
    civilization_id integer NOT NULL,
    name character varying(50) NOT NULL,
    species text,
    personality character varying(70),
    species_rank integer NOT NULL,
    galaxy_id integer,
    superstar_id integer,
    planet_id integer
);


ALTER TABLE public.civilization OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.civilization_civilization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civilization_civilization_id_seq OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.civilization_civilization_id_seq OWNED BY public.civilization.civilization_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    next_closest_galaxy character varying(50) NOT NULL,
    inhabited boolean DEFAULT false NOT NULL,
    superstar_id integer,
    miles_to_next_galaxy numeric(7,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(20),
    galaxy_id integer,
    superstar_id integer,
    planet_id integer,
    nickname text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    color character varying(20),
    surface_conditions character varying(150),
    galaxy_id integer,
    civilization_id integer,
    species text,
    superstar_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    superstar_id integer,
    color character varying(20),
    rotates_planet boolean DEFAULT false,
    species text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: civilization civilization_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization ALTER COLUMN civilization_id SET DEFAULT nextval('public.civilization_civilization_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: civilization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilization VALUES (1, 'Hopi', 'Native Human', 'Extremely friendly. Assists intergalactic refugees', 81, 2, 5, 1);
INSERT INTO public.civilization VALUES (3, 'Indigo', 'Unknown', 'Extremely hostile. No direct contact made', 43, 5, 23, 3);
INSERT INTO public.civilization VALUES (2, 'Andromedon Council', 'Angelic', 'Divine interveners. Extremely peaceful, yet destructively powerful', 2, 2, 623, 12);
INSERT INTO public.civilization VALUES (4, 'Moors', 'Demi-God', 'Travellers of the universe, Civilizing peoples along the way', 14, 4, 820, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Kekoa', 'Khari', true, NULL, 91319.03);
INSERT INTO public.galaxy VALUES (3, 'Valentina', 'Sekou', true, NULL, 22902.00);
INSERT INTO public.galaxy VALUES (4, 'Sekou', 'Bevo', true, NULL, 29801.89);
INSERT INTO public.galaxy VALUES (5, 'Beeta', 'Leeta', true, NULL, 1000.00);
INSERT INTO public.galaxy VALUES (6, 'Leeta', 'Kekoa', true, NULL, 99208.00);
INSERT INTO public.galaxy VALUES (2, 'Khari', 'Valentina', true, 5, 10204.32);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (11, 'OneTunda', 'Green', 1, 1, 9, NULL);
INSERT INTO public.moon VALUES (28, '
Kekoa', 'Blue', 1, 1, 10, NULL);
INSERT INTO public.moon VALUES (2, 'Burook', 'orange', 2, 5, 1, NULL);
INSERT INTO public.moon VALUES (3, 'Enoch', 'Sapphire', 2, 5, 1, NULL);
INSERT INTO public.moon VALUES (10, 'Obatala', 'Purple', 2, 5, 1, NULL);
INSERT INTO public.moon VALUES (15, 'kiko', 'Blue', 3, 2, 6, NULL);
INSERT INTO public.moon VALUES (21, 'Fifteen', 'White', 3, 2, 6, NULL);
INSERT INTO public.moon VALUES (25, 'Fargo', 'Red', 3, 2, 6, NULL);
INSERT INTO public.moon VALUES (20, 'Buh-Bye', 'Purple', 4, 820, 7, NULL);
INSERT INTO public.moon VALUES (12, 'Himothy', 'Blue', 4, 820, 13, NULL);
INSERT INTO public.moon VALUES (16, 'Dudha', 'Blue', 4, 820, 13, NULL);
INSERT INTO public.moon VALUES (27, 'Tita', 'Gold', 4, 820, 13, NULL);
INSERT INTO public.moon VALUES (14, 'Oshun', 'Gold', 2, 5, 12, NULL);
INSERT INTO public.moon VALUES (13, 'Orunla', 'Bronze', 5, 23, 3, NULL);
INSERT INTO public.moon VALUES (17, 'Sheesh', 'Green', 5, 23, 3, NULL);
INSERT INTO public.moon VALUES (24, 'Atten', 'Green', 5, 23, 3, NULL);
INSERT INTO public.moon VALUES (19, 'Hello', 'Gold', 6, 1020, 4, NULL);
INSERT INTO public.moon VALUES (22, 'Yurp', 'White', 6, 1020, 4, NULL);
INSERT INTO public.moon VALUES (23, 'Nurple', 'Purple', 6, 1020, 4, NULL);
INSERT INTO public.moon VALUES (26, 'Rand', 'Blue', 4, 820, 5, NULL);
INSERT INTO public.moon VALUES (1, 'Sheeba', 'purple', 5, 23, 2, NULL);
INSERT INTO public.moon VALUES (18, 'Boof', 'Brown', 5, 23, 2, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Pii', 'Orange, Blue, Brown', 'Bright sunny days, 20 hours of sunlight per 22 hour day, competitive life cycle among inhabitants', 5, NULL, 'unknown', 23);
INSERT INTO public.planet VALUES (3, 'Sko-45', 'Blue, Purple, Green', 'Very extreme weather conditions, highly competitive life cycle among inhabitants', 5, NULL, '
unknown', 23);
INSERT INTO public.planet VALUES (1, 'Ki', 'Green, Blue, Brown', 'Varying weather per region, mostly warm to hot temperatures, light rain', 2, NULL, 'Demi-God', 5);
INSERT INTO public.planet VALUES (4, 'Sploosh', 'Purple, Blue, White', 'Frigid temperatures, no lifeform found', 6, NULL, '', 1020);
INSERT INTO public.planet VALUES (5, 'Anashu', 'Green, Brown, Blue', 'Light weather conditions, moderate life cycle for inhabitants', 4, NULL, 'Humanoid', 820);
INSERT INTO public.planet VALUES (6, 'Silver-0707', 'Shiny Silver', 'Cleanest planet in the universe, Silver-0707 presents a peaceful life cycle for inhabitants', 3, NULL, 'Angelic', 2);
INSERT INTO public.planet VALUES (7, 'Bachi', 'Brown, Gray, Purple', 'Life forms appear to be frozen in time...', 4, NULL, 'Humanoid', 820);
INSERT INTO public.planet VALUES (8, 'Planet X', 'Black', 'Hostile life forms, no contact made', 5, NULL, 'Unknown', 23);
INSERT INTO public.planet VALUES (9, 'Planet O', 'Bright Red', 'Peaceful climates to match the peaceful life forms', 6, NULL, 'Humanoid', 1020);
INSERT INTO public.planet VALUES (10, 'Kekahi', 'Pink, Red, Black', 'Mixture of harsh and peaceful weather conditions', 1, NULL, 'Angelic', 1);
INSERT INTO public.planet VALUES (11, 'Bubus', 'Blue, Black, Bronze', 'Peaceful planet, life forms known to patrol galaxy and enforce justice', 1, NULL, 'Angelic', 1);
INSERT INTO public.planet VALUES (13, 'Remo', 'Blue, White, Brown', 'Exciting life cycle, beings known as "Jokers of the Universe"', 4, NULL, 'Angelic', 820);
INSERT INTO public.planet VALUES (12, 'Damani', 'Purple, Brown, Blue', 'Very peaceful life cycle, beings known as "Poets of the Universe"', 2, NULL, 'Demi-God', 623);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'FRIDAY-DA-13TH', 1, 'Indigo', true, 'Angelic', 1);
INSERT INTO public.star VALUES (6, 'Papi', 5, 'Indigo', false, 'Demi-God', 2);
INSERT INTO public.star VALUES (7, 'OG', 820, 'Royal Blue', true, 'Humanoid', 4);
INSERT INTO public.star VALUES (8, 'MAMI', 2, 'Violet', true, 'Angelic', 3);
INSERT INTO public.star VALUES (9, 'Angie-Glow', 623, 'Violet', false, 'Angelic', 2);
INSERT INTO public.star VALUES (10, 'Agent-23', 23, 'Emerald-Green', true, 'Unknown', 5);
INSERT INTO public.star VALUES (11, 'Miracle', 1020, 'Fuccia', true, 'humanoid', 6);


--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.civilization_civilization_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: civilization civilization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_pkey PRIMARY KEY (civilization_id);


--
-- Name: civilization civilization_species_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_species_key UNIQUE (species);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_superstar_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_superstar_id_key UNIQUE (superstar_id);


--
-- Name: moon moon_nickname_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_nickname_key UNIQUE (nickname);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_civilization_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_civilization_id_key UNIQUE (civilization_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_superstar_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_superstar_id_key UNIQUE (superstar_id);


--
-- Name: civilization civilization_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_superstar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_superstar_id_fkey FOREIGN KEY (superstar_id) REFERENCES public.star(superstar_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

