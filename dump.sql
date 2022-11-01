--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8 (Ubuntu 13.8-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.8 (Ubuntu 13.8-1.pgdg20.04+1)

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
-- Name: Klubovi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Klubovi" (
    "KlubID" integer NOT NULL,
    "Ime Kluba" text NOT NULL,
    "Godina osnutka Kluba" bigint NOT NULL,
    "Trener" text NOT NULL,
    "Stadion" text NOT NULL,
    "ID_članice" integer NOT NULL
);


ALTER TABLE public."Klubovi" OWNER TO postgres;

--
-- Name: Konfederacije; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Konfederacije" (
    "KonfederacijaID" bigint NOT NULL,
    "Ime Konfederacija" text NOT NULL,
    "Predsjednik Konfederacije" text NOT NULL,
    "Regija" text NOT NULL,
    "Godina osnutka Konfederacije" bigint NOT NULL
);


ALTER TABLE public."Konfederacije" OWNER TO postgres;

--
-- Name: temp_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_table (
    "Ime Konfederacija" text,
    "Predsjednik Konfederacije" text,
    "Regija" text,
    "Godina osnutka Konfederacije" bigint,
    "Ime članice" text,
    "Predsjednik članice" text,
    "Godina osnutka članice" text,
    "Godina pristupanja članice" integer,
    "Ime Kluba" text,
    "Godina osnutka Kluba" bigint,
    "Stadion" text,
    "Trener" text
);


ALTER TABLE public.temp_table OWNER TO postgres;

--
-- Name: Članice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Članice" (
    "ČlanicaID" integer NOT NULL,
    "Ime članice" text NOT NULL,
    "Predsjednik članice" text NOT NULL,
    "Godina osnutka članice" text NOT NULL,
    "fk_KonfederacijaID" bigint NOT NULL,
    "Godina pristupanja članice" integer
);


ALTER TABLE public."Članice" OWNER TO postgres;

--
-- Data for Name: Klubovi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Klubovi" ("KlubID", "Ime Kluba", "Godina osnutka Kluba", "Trener", "Stadion", "ID_članice") FROM stdin;
1	Miramar Rangers	1907	Scott Hales	Farrington Park	10
2	CF Montréal	1992	Wilfried Nancy	Saputo Stadium	11
3	Chicago Fire FC	1997	Ezra Hendrickson	Soldier Field	12
4	Boca Juniors	1905	Hugo Ibarra	La Bombonera	7
5	Santos FC	1912	Orlando Ribeiro	Vila Belmiro	8
6	América de Cali	1927	Alexandre Guimarães	Estadio Olímpico Pascual Guerrero	9
7	Persepolis F.C.	1963	Yahya Golmohammadi	Azadi Stadium	14
8	Kawasaki Frontale	1955	Yoshihiro Warashina	Kawasaki Todoroki Stadium	13
9	CR Belouizdad	1962	Nabil Kouki	20 August 1955 Stadium	4
10	Zamalek SC	1911	Jesualdo Ferreira	Cairo International Stadium	5
11	Wydad AC	1937	Hussein Ammouta	Stade Mohammed V	6
12	Borussia Dortmund	1909	Edin Terzić	Signal Iduna Park	2
13	Eintracht Frankfurt	1899	Oliver Glasner	Deutsche Bank Park	2
14	Villarreal CF	1923	Unai Emery	Ciutat de València	3
15	Sevilla FC	1890	Jorge Sampaoli	Estadio Ramón Sánchez Pizjuán	3
16	NK Osijek	1947	Rene Poms	Stadion Gradski vrt	1
17	HNK Gorica	2009	Igor Angelovski	Gradski stadion Velika Gorica	1
18	Sporting Kansas City	1995	Peter Vermes	Childrens Mercy Park	12
\.


--
-- Data for Name: Konfederacije; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Konfederacije" ("KonfederacijaID", "Ime Konfederacija", "Predsjednik Konfederacije", "Regija", "Godina osnutka Konfederacije") FROM stdin;
2	CAF	Patrice Mostepe	Afrika	1957
3	CONMEBOL	Alejandro Domínguez	Južna Amerika	1916
4	OFC	Lambert Maltock	Oceanija	1966
5	CONCACAF	Victor Montagliani	Sjeverna Amerika	1961
6	AFC	Salman bin Ibrahim Al Khalifa	Azija	1954
1	UEFA	Aleksander_Čeferin	Europa	1954
\.


--
-- Data for Name: temp_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_table ("Ime Konfederacija", "Predsjednik Konfederacije", "Regija", "Godina osnutka Konfederacije", "Ime članice", "Predsjednik članice", "Godina osnutka članice", "Godina pristupanja članice", "Ime Kluba", "Godina osnutka Kluba", "Stadion", "Trener") FROM stdin;
OFC	Lambert Maltock	Oceanija	1966	Novi Zeland	Johanna Wood	1891	1948	Miramar Rangers	1907	Farrington Park	Scott Hales
CONCACAF	Victor Montagliani	Sjeverna Amerika	1961	Kanada	Nick Bontis	1912	1948	CF Montréal	1992	Saputo Stadium	Wilfried Nancy
CONCACAF	Victor Montagliani	Sjeverna Amerika	1961	SAD	Cindy Parlow Cone	1913	1914	Chicago Fire FC	1997	Soldier Field	Ezra Hendrickson
CONMEBOL	Alejandro Domínguez	Južna Amerika	1916	Argentina	Claudio Tapia	1893	1912	Boca Juniors	1905	La Bombonera	Hugo Ibarra
CONMEBOL	Alejandro Domínguez	Južna Amerika	1916	Brazil	Ednaldo Rodrigues	1914	1923	Santos FC	1912	Vila Belmiro	Orlando Ribeiro
CONMEBOL	Alejandro Domínguez	Južna Amerika	1916	Kolumbija	Ramón Jesurún	1924	1936	América de Cali	1927	Estadio Olímpico Pascual Guerrero	Alexandre Guimarães
AFC	Salman bin Ibrahim Al Khalifa	Azija	1954	Iran	Mehdi Taj	1920	1948	Persepolis F.C.	1963	Azadi Stadium	Yahya Golmohammadi
AFC	Salman bin Ibrahim Al Khalifa	Azija	1954	Japan	Kozo Tashima	1921	1929	Kawasaki Frontale	1955	Kawasaki Todoroki Stadium	Yoshihiro Warashina
CAF	Patrice Mostepe	Afrika	1957	Alžir	Djahid Zefizaf	1962	1963	CR Belouizdad	1962	20 August 1955 Stadium	Nabil Kouki
CAF	Patrice Mostepe	Afrika	1957	Egipat	Gamal Allam	1921	1923	Zamalek SC	1911	Cairo International Stadium	Jesualdo Ferreira
CAF	Patrice Mostepe	Afrika	1957	Maroko	Fouzi Lekjaa	1956	1960	Wydad AC	1937	Stade Mohammed V	Hussein Ammouta
UEFA	Aleksander_Čeferin	Europa	1954	Njemačka	Bernd Neuendorf	1900	1909	Borussia Dortmund	1909	Signal Iduna Park	Edin Terzić
UEFA	Aleksander_Čeferin	Europa	1954	Njemačka	Bernd Neuendorf	1900	1909	Eintracht Frankfurt	1899	Deutsche Bank Park	Oliver Glasner
UEFA	Aleksander_Čeferin	Europa	1954	Španjolska	Luis Rubiales	1909	1914	Villarreal CF	1923	Ciutat de València	Unai Emery
UEFA	Aleksander_Čeferin	Europa	1954	Španjolska	Luis Rubiales	1909	1914	Sevilla FC	1890	Estadio Ramón Sánchez Pizjuán	Jorge Sampaoli
UEFA	Aleksander_Čeferin	Europa	1954	Hrvatska	Marijan Kustić	1912	1941	NK Osijek	1947	Stadion Gradski vrt	Rene Poms
UEFA	Aleksander_Čeferin	Europa	1954	Hrvatska	Marijan Kustić	1912	1941	HNK Gorica	2009	Gradski stadion Velika Gorica	Igor Angelovski
CONCACAF	Victor Montagliani	Sjeverna Amerika	1961	SAD	Cindy Parlow Cone	1913	1914	Sporting Kansas City	1995	Childrens Mercy Park	Peter Vermes
\.


--
-- Data for Name: Članice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Članice" ("ČlanicaID", "Ime članice", "Predsjednik članice", "Godina osnutka članice", "fk_KonfederacijaID", "Godina pristupanja članice") FROM stdin;
1	Hrvatska	Marijan Kustić	1912	1	1941
2	Njemačka	Bernd Neuendorf	1900	1	1909
3	Španjolska	Luis Rubiales	1909	1	1914
4	Alžir	Djahid Zefizaf	1962	2	1963
5	Egipat	Gamal Allam	1921	2	1923
6	Maroko	Fouzi Lekjaa	1956	2	1960
7	Argentina	Claudio Tapia	1893	3	1912
8	Brazil	Ednaldo Rodrigues	1914	3	1923
9	Kolumbija	Ramón Jesurún	1924	3	1936
10	Novi Zeland	Johanna Wood	1891	4	1948
11	Kanada	Nick Bontis	1912	5	1948
12	SAD	Cindy Parlow Cone	1913	5	1914
13	Japan	Kozo Tashima	1921	6	1929
14	Iran	Mehdi Taj	1920	6	1948
\.


--
-- Name: Klubovi Klubovi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Klubovi"
    ADD CONSTRAINT "Klubovi_pkey" PRIMARY KEY ("KlubID");


--
-- Name: Konfederacije Konfederacije_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Konfederacije"
    ADD CONSTRAINT "Konfederacije_pkey" PRIMARY KEY ("KonfederacijaID");


--
-- Name: Članice Članice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Članice"
    ADD CONSTRAINT "Članice_pkey" PRIMARY KEY ("ČlanicaID");


--
-- Name: Članice fk_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Članice"
    ADD CONSTRAINT fk_id FOREIGN KEY ("fk_KonfederacijaID") REFERENCES public."Konfederacije"("KonfederacijaID");


--
-- Name: Klubovi fk_čl_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Klubovi"
    ADD CONSTRAINT "fk_čl_id" FOREIGN KEY ("ID_članice") REFERENCES public."Članice"("ČlanicaID");


--
-- PostgreSQL database dump complete
--

