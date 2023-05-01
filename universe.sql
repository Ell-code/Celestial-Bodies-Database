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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    index integer,
    distance integer,
    mass numeric(9,2),
    is_sperical boolean,
    has_life boolean NOT NULL,
    description text
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
    size integer,
    index integer,
    distance integer,
    mass numeric(9,2),
    is_sperical boolean,
    has_life boolean NOT NULL,
    description text,
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
    size integer,
    index integer,
    distance integer,
    mass numeric(9,2),
    is_sperical boolean,
    has_life boolean NOT NULL,
    description text,
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
    size integer,
    index integer,
    distance integer,
    mass numeric(9,2),
    is_sperical boolean,
    has_life boolean NOT NULL,
    description text,
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
-- Name: total; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.total (
    total_id integer NOT NULL,
    name character varying(200) NOT NULL,
    galaxy_id integer,
    description text,
    number_of_planets integer NOT NULL
);


ALTER TABLE public.total OWNER TO freecodecamp;

--
-- Name: total_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.total_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.total_system_id_seq OWNER TO freecodecamp;

--
-- Name: total_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.total_system_id_seq OWNED BY public.total.total_id;


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
-- Name: total total_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.total ALTER COLUMN total_id SET DEFAULT nextval('public.total_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 10, 20, 13.50, true, true, 'The galaxy that contains our solar system');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120, 10, 20, 9.80, true, true, 'A spiral galaxy located 2.5 million light-years away');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 80, 10, 20, 10.50, true, true, 'A grand design spiral galaxy located 31 million light-years away');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 150, 10, 20, 12.30, true, true, 'An unbarred spiral galaxy located 28 million light-years away');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 90, 10, 20, 8.50, true, true, 'A spiral galaxy located 3 million light-years away');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 110, 10, 20, 11.20, true, true, 'A grand design spiral galaxy located 21 million light-years away');
INSERT INTO public.galaxy VALUES (7, 'Tadpole', 140, 10, 20, 13.80, true, true, 'A spiral galaxy with a long tail located 420 million light-years away');
INSERT INTO public.galaxy VALUES (8, 'Cartwheel', 130, 10, 20, 14.60, true, true, 'A lenticular galaxy located 500 million light-years away');
INSERT INTO public.galaxy VALUES (9, 'Cigar', 100, 10, 20, 10.10, true, true, 'A barred spiral galaxy located 55 million light-years away');
INSERT INTO public.galaxy VALUES (10, 'M101', 120, 10, 20, 10.90, true, true, 'A spiral galaxy located 21 million light-years away');
INSERT INTO public.galaxy VALUES (11, 'M51', 115, 10, 20, 11.50, true, true, 'A grand design spiral galaxy located 23 million light-years away');
INSERT INTO public.galaxy VALUES (12, 'Barred Spiral', 125, 10, 20, 12.20, true, true, 'A barred spiral galaxy located 35 million light-years away');
INSERT INTO public.galaxy VALUES (13, 'M104', 110, 10, 20, 11.30, true, true, 'A spiral galaxy located 29 million light-years away');
INSERT INTO public.galaxy VALUES (14, 'M83', 130, 10, 20, 12.40, true, true, 'A barred spiral galaxy located 15 million light-years away');
INSERT INTO public.galaxy VALUES (15, 'M77', 120, 10, 20, 12.70, true, true, 'A spiral galaxy located 47 million light-years away');
INSERT INTO public.galaxy VALUES (16, 'Maffei', 100, 10, 20, 11.10, true, true, 'A barred spiral galaxy located 10 million light-years away');
INSERT INTO public.galaxy VALUES (17, 'Maffei 2', 90, 10, 20, 10.50, true, true, 'A barred spiral galaxy located 8 million light-years away');
INSERT INTO public.galaxy VALUES (18, 'Large Magellanic Cloud', 30, 10, 20, 2.50, true, true, 'A irregular galaxy located 160,000 light-years away');
INSERT INTO public.galaxy VALUES (19, 'Small Magellanic Cloud', 35, 10, 20, 3.50, true, true, 'A irregular galaxy located 200,000 light-years away');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 14, 31, 235, 32.57, false, true, 'Earth''s only natural satellite', 21);
INSERT INTO public.moon VALUES (2, 'Phobos', 235, 568, 19, 32.57, false, true, 'A Martian moon', 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 235, 568, 19, 32.57, false, true, 'A Martian moon', 22);
INSERT INTO public.moon VALUES (4, 'Triton', 235, 568, 19, 32.57, false, true, 'A Neptunian moon', 19);
INSERT INTO public.moon VALUES (5, 'Europa', 235, 568, 19, 32.57, false, true, 'A Jovian moon', 16);
INSERT INTO public.moon VALUES (6, 'Ganymede', 235, 568, 19, 32.57, false, true, 'A Jovian moon', 16);
INSERT INTO public.moon VALUES (7, 'Io', 235, 568, 33, 19.00, false, true, 'A Jovian moon', 16);
INSERT INTO public.moon VALUES (8, 'Callisto', 235, 568, 19, 32.57, false, true, 'A Jovian moon', 16);
INSERT INTO public.moon VALUES (9, 'Titan', 235, 568, 19, 32.57, false, true, 'A Saturnian moon', 17);
INSERT INTO public.moon VALUES (10, 'Rhea', 235, 568, 19, 32.57, false, true, 'A Saturnian moon', 17);
INSERT INTO public.moon VALUES (11, 'Iapetus', 235, 568, 20, 32.57, false, true, 'A Saturnian moon', 17);
INSERT INTO public.moon VALUES (12, 'Tethys', 235, 568, 23, 32.57, false, true, 'A Saturnian moon', 17);
INSERT INTO public.moon VALUES (13, 'Dione', 235, 568, 33, 32.57, false, true, 'A Saturnian moon', 17);
INSERT INTO public.moon VALUES (14, 'Enceladus', 235, 568, 55, 32.57, false, true, 'A Saturnian moon', 17);
INSERT INTO public.moon VALUES (15, 'Mimas', 235, 568, 32, 35.21, false, true, 'A Saturnian moon', 17);
INSERT INTO public.moon VALUES (16, 'Hyperion', 235, 568, 32, 36.22, false, true, 'A Saturnian moon', 24);
INSERT INTO public.moon VALUES (17, 'Ijiraq', 235, 568, 56, 32.57, false, true, 'A Saturnian moon', 21);
INSERT INTO public.moon VALUES (18, 'Helene', 235, 568, 32, 69.57, false, true, 'A Saturnian moon', 23);
INSERT INTO public.moon VALUES (19, 'Telesto', 235, 568, 32, 59.57, false, true, 'A Saturnian moon', 14);
INSERT INTO public.moon VALUES (20, 'Calypso', 235, 568, 3, 32.57, false, true, 'A Saturnian moon', 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 1, 235, 568, 32.57, false, true, 'The third planet from the sun', 27);
INSERT INTO public.planet VALUES (14, 'Mars', 2, 235, 568, 32.57, false, true, 'The fourth planet from the sun', 27);
INSERT INTO public.planet VALUES (15, 'Proxima b', 0, 235, 568, 32.57, false, true, 'A planet orbiting Proxima Centauri', 28);
INSERT INTO public.planet VALUES (16, 'Alpha Centauri bb', 0, 235, 568, 32.57, false, true, 'A planet orbiting Alpha Centauri B', 30);
INSERT INTO public.planet VALUES (17, 'Betelgeuse b', 0, 235, 568, 32.57, false, true, 'A planet orbiting Betelgeuse', 31);
INSERT INTO public.planet VALUES (18, 'Jupiter', 67, 235, 568, 32.57, false, true, 'The fifth planet from the sun', 27);
INSERT INTO public.planet VALUES (19, 'Saturn', 62, 235, 568, 32.57, false, true, 'The sixth planet from the sun', 28);
INSERT INTO public.planet VALUES (20, 'Uranus', 27, 235, 568, 32.57, false, true, 'The seventh planet from the sun', 31);
INSERT INTO public.planet VALUES (21, 'Neptune', 14, 235, 568, 32.57, false, true, 'The eighth planet from the sun', 31);
INSERT INTO public.planet VALUES (22, 'Alpha Centauri Ab', 0, 235, 568, 32.57, false, true, 'A planet orbiting Alpha Centauri A', 33);
INSERT INTO public.planet VALUES (23, 'Antares b', 0, 235, 568, 32.57, false, true, 'A planet orbiting Antares', 46);
INSERT INTO public.planet VALUES (24, 'Deneb b', 0, 235, 568, 32.57, false, true, 'A planet orbiting Deneb', 47);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (27, 'Sun', 10, 20, 30, 45.60, true, false, 'A G-type main-sequence star located in the Milky Way galaxy', 1);
INSERT INTO public.star VALUES (28, 'Proxima Centauri', 10, 20, 30, 45.60, true, false, 'A red dwarf star located in the Andromeda galaxy', 2);
INSERT INTO public.star VALUES (29, 'Alpha Centauri A', 10, 20, 30, 45.60, true, false, 'A G-type main-sequence star located in the Andromeda galaxy', 2);
INSERT INTO public.star VALUES (30, 'Alpha Centauri B', 10, 20, 30, 45.60, true, false, 'A K-type main-sequence star located in the Andromeda galaxy', 2);
INSERT INTO public.star VALUES (31, 'Betelgeuse A', 10, 20, 30, 45.60, false, false, 'A red supergiant star located in the Whirlpool galaxy', 3);
INSERT INTO public.star VALUES (32, 'Antares', 10, 20, 30, 45.60, false, false, 'A red supergiant star located in the Sombrero galaxy', 4);
INSERT INTO public.star VALUES (33, 'Deneb', 10, 20, 30, 45.60, false, false, 'A blue supergiant star located in the Triangulum galaxy', 5);
INSERT INTO public.star VALUES (34, 'Vega', 10, 20, 30, 45.60, true, false, 'A white main-sequence star located in the Pinwheel galaxy', 6);
INSERT INTO public.star VALUES (35, 'Sirius', 10, 20, 30, 45.60, true, false, 'A white main-sequence star located in the Tadpole galaxy', 7);
INSERT INTO public.star VALUES (36, 'Arcturus A', 10, 20, 30, 45.60, true, false, 'A orange giant star located in the Cartwheel galaxy', 8);
INSERT INTO public.star VALUES (37, 'Rigel B', 10, 20, 30, 45.60, false, false, 'A blue supergiant star located in the Cigar galaxy', 9);
INSERT INTO public.star VALUES (38, 'Betelgeuse B', 10, 20, 30, 45.60, false, false, 'A red supergiant star located in the M101 galaxy', 10);
INSERT INTO public.star VALUES (39, 'Polaris', 10, 20, 30, 45.60, true, false, 'A yellow supergiant star located in the M51 galaxy', 11);
INSERT INTO public.star VALUES (40, 'Deneb B', 10, 20, 30, 45.60, false, false, 'A blue supergiant star located in the Barred Spiral galaxy', 12);
INSERT INTO public.star VALUES (41, 'Regulus', 10, 20, 30, 45.60, true, false, 'A blue main-sequence star located in the M104 galaxy', 13);
INSERT INTO public.star VALUES (42, 'Canopus', 10, 20, 30, 45.60, true, false, 'A white giant star located in the M83 galaxy', 14);
INSERT INTO public.star VALUES (43, 'Achernar A', 10, 20, 30, 45.60, true, false, 'A blue main-sequence star located in the M77 galaxy', 15);
INSERT INTO public.star VALUES (44, 'Capella', 10, 20, 30, 45.60, true, false, 'A yellow giant star located in the Maffei galaxy', 16);
INSERT INTO public.star VALUES (45, 'Pollux', 10, 20, 30, 45.60, true, false, 'An orange giant star located in the Maffei 2 galaxy', 17);
INSERT INTO public.star VALUES (46, '47 Tucanae', 10, 20, 30, 45.60, false, false, 'A globular cluster located in the Large Magellanic Cloud galaxy', 18);
INSERT INTO public.star VALUES (47, 'NGC 292', 10, 20, 30, 45.60, false, false, 'An open cluster located in the Small Magellanic Cloud galaxy', 19);


--
-- Data for Name: total; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.total VALUES (1, 'Solar System', 1, 'The system that contains our planet Earth', 1);
INSERT INTO public.total VALUES (2, 'Alpha Centauri', 2, 'The nearest star system to Earth', 3);
INSERT INTO public.total VALUES (3, 'Barnard''s Star', 2, 'A red dwarf located 6 light years from Earth', 0);
INSERT INTO public.total VALUES (4, 'Tau Ceti', 2, 'A sun-like star located 12 light years from Earth', 5);
INSERT INTO public.total VALUES (5, 'VY Canis Majoris', 4, 'A red hypergiant located 5,000 light years from Earth', 100);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 19, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 47, true);


--
-- Name: total_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.total_system_id_seq', 1, false);


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
-- Name: total total_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.total
    ADD CONSTRAINT total_name_key UNIQUE (name);


--
-- Name: total total_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.total
    ADD CONSTRAINT total_pkey PRIMARY KEY (total_id);


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
-- Name: total total_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.total
    ADD CONSTRAINT total_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

