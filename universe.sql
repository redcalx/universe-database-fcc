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
    name character varying(60) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    galaxy_types character varying(60),
    description text,
    galaxy_groups_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_groups; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_groups (
    name character varying(60) NOT NULL,
    galaxy_groups_id integer NOT NULL,
    description text
);


ALTER TABLE public.galaxy_groups OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years numeric,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    has_life boolean,
    age_in_millions_of_years numeric,
    star_id integer NOT NULL,
    planet_types character varying(60)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    description text,
    number_of_planets integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, NULL, 'Barred Spiral Galaxy', NULL, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, NULL, 'Barred Spiral Galaxy', NULL, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, NULL, 'Spiral Galaxy', NULL, 1);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 1101, NULL, 'Irregular Galaxy', NULL, 1);
INSERT INTO public.galaxy VALUES (5, 'Messier 32', NULL, NULL, 'Eliptical Galaxy', NULL, 1);
INSERT INTO public.galaxy VALUES (6, 'Wolf-Lundmark-Melotte', NULL, NULL, 'Irregular Barred Galaxy', NULL, 1);
INSERT INTO public.galaxy VALUES (7, 'NGC 7317', NULL, NULL, 'Eliptical Galaxy', NULL, 2);
INSERT INTO public.galaxy VALUES (8, 'NGC 92', NULL, NULL, 'Unbarred Spiral Galaxy', NULL, 3);


--
-- Data for Name: galaxy_groups; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_groups VALUES ('Local Group', 1, 'The Local Group is the galaxy group where Milky Way is located.');
INSERT INTO public.galaxy_groups VALUES ('Stephans Quintet', 2, 'Stephans Quintet is a compact group of five galaxies, located in the constellation of Pegasus.');
INSERT INTO public.galaxy_groups VALUES ('Roberts Quartet', 3, 'Roberts Quartet is a compact galaxy group located in the constellation of Phoenix.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4530, 1, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2700, 2, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2700, 2, false);
INSERT INTO public.moon VALUES (4, 'Titan', 4500, 9, true);
INSERT INTO public.moon VALUES (5, 'Phoebe', NULL, 9, false);
INSERT INTO public.moon VALUES (6, 'Charon', NULL, 8, true);
INSERT INTO public.moon VALUES (7, 'Triton', NULL, 11, true);
INSERT INTO public.moon VALUES (8, 'Enceladus', NULL, 9, true);
INSERT INTO public.moon VALUES (9, 'Europa', NULL, 4, true);
INSERT INTO public.moon VALUES (10, 'Io', NULL, 4, true);
INSERT INTO public.moon VALUES (11, 'Ganymede', NULL, 4, true);
INSERT INTO public.moon VALUES (12, 'Proteus', NULL, 11, true);
INSERT INTO public.moon VALUES (13, 'Larissa', NULL, 11, false);
INSERT INTO public.moon VALUES (14, 'Rhea', NULL, 9, true);
INSERT INTO public.moon VALUES (15, 'Hyperion', NULL, 9, false);
INSERT INTO public.moon VALUES (16, 'Callisto', NULL, 4, true);
INSERT INTO public.moon VALUES (17, 'Amalthea', NULL, 4, false);
INSERT INTO public.moon VALUES (18, 'Iapetus', NULL, 9, true);
INSERT INTO public.moon VALUES (19, 'Dione', NULL, 9, true);
INSERT INTO public.moon VALUES (20, 'Nix', NULL, 8, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Venus', false, 4600, 1, 'Rocky');
INSERT INTO public.planet VALUES (1, 'Earth', true, 4500, 1, 'Rocky');
INSERT INTO public.planet VALUES (2, 'Mars', false, 4603, 1, 'Rocky');
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 4603, 1, 'Gas Giant');
INSERT INTO public.planet VALUES (9, 'Saturn', false, 4600, 1, 'Gas Giant');
INSERT INTO public.planet VALUES (11, 'Neptune', false, 4600, 1, 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Samh', false, NULL, 2, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Saffar', false, NULL, 2, 'Gas Giant');
INSERT INTO public.planet VALUES (7, 'Majriti', false, NULL, 2, 'Gas Giant');
INSERT INTO public.planet VALUES (10, 'Mercury', false, 4600, 1, 'Rocky');
INSERT INTO public.planet VALUES (8, 'Pluto', false, 4600, 1, 'Rocky');
INSERT INTO public.planet VALUES (12, 'Ceres', false, 4600, 1, 'Rocky');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4500, NULL, NULL, 8, 1);
INSERT INTO public.star VALUES (2, 'Upsilon Andromedae', 3100, NULL, NULL, 3, 2);
INSERT INTO public.star VALUES (3, 'Alpha Trianguli', 1600, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'Theta Doradus', 1170, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'Tau Ceti', 8000, NULL, NULL, NULL, 6);
INSERT INTO public.star VALUES (6, 'Delta Andromedae', 3200, NULL, NULL, NULL, 2);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy_groups galaxy_group_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_groups
    ADD CONSTRAINT galaxy_group_id UNIQUE (galaxy_groups_id);


--
-- Name: galaxy_groups galaxy_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_groups
    ADD CONSTRAINT galaxy_groups_pkey PRIMARY KEY (galaxy_groups_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (star_id);


--
-- Name: galaxy galaxy_galaxy_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_group_id_fkey FOREIGN KEY (galaxy_groups_id) REFERENCES public.galaxy_groups(galaxy_groups_id);


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

