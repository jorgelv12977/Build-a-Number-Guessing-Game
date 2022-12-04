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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 251, 1);
INSERT INTO public.games VALUES (2, 503, 1);
INSERT INTO public.games VALUES (3, 954, 3);
INSERT INTO public.games VALUES (4, 63, 3);
INSERT INTO public.games VALUES (5, 504, 1);
INSERT INTO public.games VALUES (6, 707, 1);
INSERT INTO public.games VALUES (7, 164, 1);
INSERT INTO public.games VALUES (8, 511, 8);
INSERT INTO public.games VALUES (9, 885, 8);
INSERT INTO public.games VALUES (10, 171, 10);
INSERT INTO public.games VALUES (11, 409, 10);
INSERT INTO public.games VALUES (12, 350, 8);
INSERT INTO public.games VALUES (13, 570, 8);
INSERT INTO public.games VALUES (14, 745, 8);
INSERT INTO public.games VALUES (15, 972, 15);
INSERT INTO public.games VALUES (16, 444, 15);
INSERT INTO public.games VALUES (17, 902, 17);
INSERT INTO public.games VALUES (18, 536, 17);
INSERT INTO public.games VALUES (19, 718, 15);
INSERT INTO public.games VALUES (20, 406, 15);
INSERT INTO public.games VALUES (21, 953, 15);
INSERT INTO public.games VALUES (22, 506, 22);
INSERT INTO public.games VALUES (23, 500, 22);
INSERT INTO public.games VALUES (24, 720, 24);
INSERT INTO public.games VALUES (25, 555, 24);
INSERT INTO public.games VALUES (26, 287, 22);
INSERT INTO public.games VALUES (27, 957, 22);
INSERT INTO public.games VALUES (28, 484, 22);
INSERT INTO public.games VALUES (29, 145, 29);
INSERT INTO public.games VALUES (30, 320, 29);
INSERT INTO public.games VALUES (31, 838, 31);
INSERT INTO public.games VALUES (32, 989, 31);
INSERT INTO public.games VALUES (33, 304, 29);
INSERT INTO public.games VALUES (34, 277, 29);
INSERT INTO public.games VALUES (35, 371, 29);
INSERT INTO public.games VALUES (36, 341, 37);
INSERT INTO public.games VALUES (37, 486, 37);
INSERT INTO public.games VALUES (38, 649, 38);
INSERT INTO public.games VALUES (39, 372, 38);
INSERT INTO public.games VALUES (40, 201, 37);
INSERT INTO public.games VALUES (41, 683, 37);
INSERT INTO public.games VALUES (42, 928, 37);
INSERT INTO public.games VALUES (43, 39, 39);
INSERT INTO public.games VALUES (44, 393, 39);
INSERT INTO public.games VALUES (45, 978, 40);
INSERT INTO public.games VALUES (46, 529, 40);
INSERT INTO public.games VALUES (47, 911, 39);
INSERT INTO public.games VALUES (48, 162, 39);
INSERT INTO public.games VALUES (49, 176, 39);
INSERT INTO public.games VALUES (50, 248, 41);
INSERT INTO public.games VALUES (51, 33, 41);
INSERT INTO public.games VALUES (52, 541, 42);
INSERT INTO public.games VALUES (53, 676, 42);
INSERT INTO public.games VALUES (54, 382, 41);
INSERT INTO public.games VALUES (55, 580, 41);
INSERT INTO public.games VALUES (56, 272, 41);
INSERT INTO public.games VALUES (57, 969, 43);
INSERT INTO public.games VALUES (58, 73, 43);
INSERT INTO public.games VALUES (59, 169, 44);
INSERT INTO public.games VALUES (60, 472, 44);
INSERT INTO public.games VALUES (61, 188, 43);
INSERT INTO public.games VALUES (62, 639, 43);
INSERT INTO public.games VALUES (63, 950, 43);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1670146932621');
INSERT INTO public.users VALUES (3, 'user_1670146932620');
INSERT INTO public.users VALUES (8, 'user_1670146939966');
INSERT INTO public.users VALUES (10, 'user_1670146939965');
INSERT INTO public.users VALUES (15, 'user_1670146948829');
INSERT INTO public.users VALUES (17, 'user_1670146948828');
INSERT INTO public.users VALUES (22, 'user_1670146952309');
INSERT INTO public.users VALUES (24, 'user_1670146952308');
INSERT INTO public.users VALUES (29, 'user_1670146955116');
INSERT INTO public.users VALUES (31, 'user_1670146955115');
INSERT INTO public.users VALUES (36, 'Robert');
INSERT INTO public.users VALUES (37, 'user_1670147098042');
INSERT INTO public.users VALUES (38, 'user_1670147098041');
INSERT INTO public.users VALUES (39, 'user_1670147190080');
INSERT INTO public.users VALUES (40, 'user_1670147190078');
INSERT INTO public.users VALUES (41, 'user_1670147239555');
INSERT INTO public.users VALUES (42, 'user_1670147239554');
INSERT INTO public.users VALUES (43, 'user_1670147247536');
INSERT INTO public.users VALUES (44, 'user_1670147247535');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 63, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 44, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

