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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    discovery_date date,
    name character varying(30) NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_kpsc integer,
    distance_kpsc integer,
    name_origin text,
    magnitude numeric(3,2)
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
    name character varying(30) NOT NULL,
    mean_radius_km integer,
    rotation_kmh integer,
    average_density_gpercm3 numeric(2,1),
    planet_id integer
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
    name character varying(30) NOT NULL,
    min_temperature_celsius integer,
    max_temperature_celsius integer,
    average_density_gpercm3 numeric(2,1),
    has_moons boolean NOT NULL,
    has_atmo boolean NOT NULL,
    star_id integer
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    magnitude numeric(3,2),
    temperature_k integer,
    rotation_kms integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, '1995-07-23', 'Hale Bopp');
INSERT INTO public.comet VALUES (2, '1867-04-03', 'Tempel 1');
INSERT INTO public.comet VALUES (3, '1969-09-20', '67P/Churyumov-Gerasimenko');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 770, 752, 'from the constellation Andromeda where it appears', 3.44);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 61, 8, 'describing its appearance from Earth', NULL);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy M101', 52, 6400, 'named after its appearance', 7.90);
INSERT INTO public.galaxy VALUES (5, 'Sagittarius Dwarf Spheroidal', 3, 21, 'not to be confused with sagittarius Dwarf Irregular Gly', 4.50);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 4, 50, 'The Magellanic Spiral classification was introduced by Gerard de Vaucouleurs', 0.90);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 2, 61, 'Portuguese and Dutch sailors called them the Cape Clouds', 2.70);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 11, 11, 1.9, 1);
INSERT INTO public.moon VALUES (2, 'Miranda', 236, NULL, 1.2, 3);
INSERT INTO public.moon VALUES (3, 'Moon', 1737, 17, 3.3, 2);
INSERT INTO public.moon VALUES (4, 'Deimos', 6, NULL, 1.5, 1);
INSERT INTO public.moon VALUES (5, 'Io', 1821, 271, 3.5, 5);
INSERT INTO public.moon VALUES (6, 'Europa', 1560, NULL, 3.0, 5);
INSERT INTO public.moon VALUES (7, 'Ganimede', 2634, NULL, 1.9, 5);
INSERT INTO public.moon VALUES (8, 'Callisto', 2410, NULL, 1.8, 5);
INSERT INTO public.moon VALUES (9, 'Amalthea', 83, NULL, 0.8, 5);
INSERT INTO public.moon VALUES (10, 'Himalia', 85, NULL, 1.6, 5);
INSERT INTO public.moon VALUES (11, 'Mimas', 198, NULL, 1.1, 6);
INSERT INTO public.moon VALUES (12, 'Enceladus', 252, NULL, 1.6, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 531, NULL, 0.9, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 561, NULL, 1.5, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 763, NULL, 1.2, 6);
INSERT INTO public.moon VALUES (16, 'Ariel', 578, NULL, 1.6, 3);
INSERT INTO public.moon VALUES (17, 'Umbriel', 587, NULL, 1.4, 3);
INSERT INTO public.moon VALUES (18, 'Triton', 1353, NULL, 2.1, 4);
INSERT INTO public.moon VALUES (19, 'Nereid', 170, NULL, NULL, 4);
INSERT INTO public.moon VALUES (20, 'Ophelia', 21, NULL, 1.3, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', -128, 35, 3.9, true, true, 2);
INSERT INTO public.planet VALUES (2, 'Earth', -89, 56, 5.5, true, true, 2);
INSERT INTO public.planet VALUES (3, 'Uranus', -224, -193, 1.3, true, true, 2);
INSERT INTO public.planet VALUES (4, 'Neptune', -218, -201, 1.6, true, true, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', -195, -125, 1.3, true, true, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', -185, -122, 0.7, true, true, 2);
INSERT INTO public.planet VALUES (7, 'Venus', NULL, 463, 5.2, false, true, 2);
INSERT INTO public.planet VALUES (8, 'Mercury', -173, 427, 5.4, false, false, 2);
INSERT INTO public.planet VALUES (9, 'Epsilon Eridani b', NULL, NULL, NULL, false, false, 9);
INSERT INTO public.planet VALUES (10, 'Gamma Cephei b', NULL, NULL, NULL, false, false, 10);
INSERT INTO public.planet VALUES (11, 'Lupus-TR-3b', NULL, NULL, 1.4, false, false, 11);
INSERT INTO public.planet VALUES (12, 'Kappa CrB b', NULL, NULL, NULL, false, false, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 1.42, 9940, 16);
INSERT INTO public.star VALUES (2, 'Sun', 1, 4.83, 5772, 1997);
INSERT INTO public.star VALUES (5, 'VY Canis Majoris', 1, 6.50, 3490, 300);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, NULL, 3042, 0);
INSERT INTO public.star VALUES (7, 'BC Cygni', 1, 9.50, 3605, NULL);
INSERT INTO public.star VALUES (8, 'IRC 10414', 1, NULL, 3300, 29);
INSERT INTO public.star VALUES (9, 'Epsilon Eridani', 1, 3.74, 5084, 2);
INSERT INTO public.star VALUES (10, 'Gamma Cephei', 1, 3.21, 4792, 2);
INSERT INTO public.star VALUES (11, 'Lupus-TR-3', 1, NULL, 5000, NULL);
INSERT INTO public.star VALUES (12, 'Kappa Coronae Borealis', 1, 4.79, 4870, NULL);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 39, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

