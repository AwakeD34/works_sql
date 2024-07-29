--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-29 12:26:55

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 24653)
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    release_year integer NOT NULL
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24652)
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.albums_id_seq OWNER TO postgres;

--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 221
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- TOC entry 217 (class 1259 OID 24624)
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24659)
-- Name: artists_albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists_albums (
    artist_id integer NOT NULL,
    album_id integer NOT NULL
);


ALTER TABLE public.artists_albums OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24637)
-- Name: artists_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists_genres (
    artist_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.artists_genres OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24623)
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artists_id_seq OWNER TO postgres;

--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 216
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- TOC entry 219 (class 1259 OID 24631)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24630)
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_id_seq OWNER TO postgres;

--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 218
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- TOC entry 227 (class 1259 OID 24687)
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    release_year integer NOT NULL
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24686)
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.playlists_id_seq OWNER TO postgres;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 226
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- TOC entry 228 (class 1259 OID 24693)
-- Name: playlists_tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists_tracks (
    playlist_id integer NOT NULL,
    track_id integer NOT NULL
);


ALTER TABLE public.playlists_tracks OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24675)
-- Name: tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracks (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    album_id integer NOT NULL
);


ALTER TABLE public.tracks OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24674)
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tracks_id_seq OWNER TO postgres;

--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 224
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracks_id_seq OWNED BY public.tracks.id;


--
-- TOC entry 4669 (class 2604 OID 24656)
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 24627)
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 24634)
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- TOC entry 4671 (class 2604 OID 24690)
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 24678)
-- Name: tracks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks ALTER COLUMN id SET DEFAULT nextval('public.tracks_id_seq'::regclass);


--
-- TOC entry 4844 (class 0 OID 24653)
-- Dependencies: 222
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (id, title, release_year) FROM stdin;
\.


--
-- TOC entry 4839 (class 0 OID 24624)
-- Dependencies: 217
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (id, name) FROM stdin;
\.


--
-- TOC entry 4845 (class 0 OID 24659)
-- Dependencies: 223
-- Data for Name: artists_albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists_albums (artist_id, album_id) FROM stdin;
\.


--
-- TOC entry 4842 (class 0 OID 24637)
-- Dependencies: 220
-- Data for Name: artists_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists_genres (artist_id, genre_id) FROM stdin;
\.


--
-- TOC entry 4841 (class 0 OID 24631)
-- Dependencies: 219
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (id, name) FROM stdin;
\.


--
-- TOC entry 4849 (class 0 OID 24687)
-- Dependencies: 227
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (id, title, release_year) FROM stdin;
\.


--
-- TOC entry 4850 (class 0 OID 24693)
-- Dependencies: 228
-- Data for Name: playlists_tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists_tracks (playlist_id, track_id) FROM stdin;
\.


--
-- TOC entry 4847 (class 0 OID 24675)
-- Dependencies: 225
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracks (id, title, album_id) FROM stdin;
\.


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 221
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_id_seq', 1, false);


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 216
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_id_seq', 1, false);


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 218
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_id_seq', 1, false);


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 226
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlists_id_seq', 1, false);


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 224
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracks_id_seq', 1, false);


--
-- TOC entry 4679 (class 2606 OID 24658)
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- TOC entry 4681 (class 2606 OID 24663)
-- Name: artists_albums artists_albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums
    ADD CONSTRAINT artists_albums_pkey PRIMARY KEY (artist_id, album_id);


--
-- TOC entry 4677 (class 2606 OID 24641)
-- Name: artists_genres artists_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_genres
    ADD CONSTRAINT artists_genres_pkey PRIMARY KEY (artist_id, genre_id);


--
-- TOC entry 4673 (class 2606 OID 24629)
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- TOC entry 4675 (class 2606 OID 24636)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- TOC entry 4685 (class 2606 OID 24692)
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- TOC entry 4687 (class 2606 OID 24697)
-- Name: playlists_tracks playlists_tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_tracks
    ADD CONSTRAINT playlists_tracks_pkey PRIMARY KEY (playlist_id, track_id);


--
-- TOC entry 4683 (class 2606 OID 24680)
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- TOC entry 4690 (class 2606 OID 24669)
-- Name: artists_albums artists_albums_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums
    ADD CONSTRAINT artists_albums_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(id);


--
-- TOC entry 4691 (class 2606 OID 24664)
-- Name: artists_albums artists_albums_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_albums
    ADD CONSTRAINT artists_albums_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- TOC entry 4688 (class 2606 OID 24642)
-- Name: artists_genres artists_genres_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_genres
    ADD CONSTRAINT artists_genres_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- TOC entry 4689 (class 2606 OID 24647)
-- Name: artists_genres artists_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_genres
    ADD CONSTRAINT artists_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- TOC entry 4693 (class 2606 OID 24698)
-- Name: playlists_tracks playlists_tracks_playlist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_tracks
    ADD CONSTRAINT playlists_tracks_playlist_id_fkey FOREIGN KEY (playlist_id) REFERENCES public.playlists(id);


--
-- TOC entry 4694 (class 2606 OID 24703)
-- Name: playlists_tracks playlists_tracks_track_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists_tracks
    ADD CONSTRAINT playlists_tracks_track_id_fkey FOREIGN KEY (track_id) REFERENCES public.tracks(id);


--
-- TOC entry 4692 (class 2606 OID 24681)
-- Name: tracks tracks_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(id);


-- Completed on 2024-07-29 12:26:55

--
-- PostgreSQL database dump complete
--

