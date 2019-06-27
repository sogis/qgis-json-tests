--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

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
-- Name: test; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA test;


ALTER SCHEMA test OWNER TO postgres;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: test_json; Type: TABLE; Schema: test; Owner: an
--

CREATE TABLE test.test_json (
    gid integer NOT NULL,
    json_text json,
    geom public.geometry(Point,2056),
    jsonb_text jsonb,
    jsonb_list jsonb,
    jsonb_key_value jsonb
);


ALTER TABLE test.test_json OWNER TO an;

--
-- Name: COLUMN test_json.json_text; Type: COMMENT; Schema: test; Owner: an
--

COMMENT ON COLUMN test.test_json.json_text IS 'For demonstration of Text Edit widget';


--
-- Name: COLUMN test_json.jsonb_text; Type: COMMENT; Schema: test; Owner: an
--

COMMENT ON COLUMN test.test_json.jsonb_text IS 'For demonstration of Text Edit widget';


--
-- Name: COLUMN test_json.jsonb_list; Type: COMMENT; Schema: test; Owner: an
--

COMMENT ON COLUMN test.test_json.jsonb_list IS 'For demonstration of QGIS List widget';


--
-- Name: COLUMN test_json.jsonb_key_value; Type: COMMENT; Schema: test; Owner: an
--

COMMENT ON COLUMN test.test_json.jsonb_key_value IS 'For demonstration of  Key/Value widget';


--
-- Name: test_json_gid_seq1; Type: SEQUENCE; Schema: test; Owner: an
--

CREATE SEQUENCE test.test_json_gid_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test.test_json_gid_seq1 OWNER TO an;

--
-- Name: test_json_gid_seq1; Type: SEQUENCE OWNED BY; Schema: test; Owner: an
--

ALTER SEQUENCE test.test_json_gid_seq1 OWNED BY test.test_json.gid;


--
-- Name: test_json gid; Type: DEFAULT; Schema: test; Owner: an
--

ALTER TABLE ONLY test.test_json ALTER COLUMN gid SET DEFAULT nextval('test.test_json_gid_seq1'::regclass);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: an
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: test_json; Type: TABLE DATA; Schema: test; Owner: an
--

COPY test.test_json (gid, json_text, geom, jsonb_text, jsonb_list, jsonb_key_value) FROM stdin;
1	[\n{\n"titel": "Regierungsratsbeschluss",\n"offiziellertitel": "Kappel: Revision der Ortsplanung / Genehmigung",\n"textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Entscheide/91-65-E.pdf"\n},\n{\n"titel": "Zonenreglement",\n"offiziellertitel": "Zonenreglement der Einwohnergemeinde 4616 Kappel",\n"textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Reglemente/091_ZR.pdf"\n}\n]	0101000020080800003D373BBED999444193EE2A79C1EA3241	[{"titel": "Regierungsratsbeschluss", "offiziellertitel": "Kappel: Revision der Ortsplanung / Genehmigung", "textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Entscheide/91-65-E.pdf"}, {"titel": "Zonenreglement", "offiziellertitel": "Zonenreglement der Einwohnergemeinde 4616 Kappel", "textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Reglemente/091_ZR.pdf"}]	["Apples", "Cherries", "Bananas", "Strawberries"]	{"Apples": 20, "Bananas": 23, "Cherries": 13, "Strawberries": 7}
2	[\n{\n"titel": "Regierungsratsbeschluss",\n"offiziellertitel": "Kappel: Revision der Ortsplanung / Genehmigung",\n"textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Entscheide/91-65-E.pdf"\n},\n{\n"titel": "Zonenreglement",\n"offiziellertitel": "Zonenreglement der Einwohnergemeinde 4616 Kappel",\n"textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Reglemente/091_ZR.pdf"\n}\n]	010100002008080000FB5F1B51E3994441EF62E83DBDEA3241	[{"titel": "Regierungsratsbeschluss", "offiziellertitel": "Kappel: Revision der Ortsplanung / Genehmigung", "textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Entscheide/91-65-E.pdf"}, {"titel": "Zonenreglement", "offiziellertitel": "Zonenreglement der Einwohnergemeinde 4616 Kappel", "textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Reglemente/091_ZR.pdf"}]	["Oranges", "Cherries", "Bananas"]	{"Bananas": 6, "Oranges": 13, "Cherries": 4}
3	[\n{\n"t_id": 1218,\n"titel": "Regierungsratsbeschluss",\n"textimweb": "91-Kappel/Entscheide/91-65-E.pdf",\n"textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Entscheide/91-65-E.pdf"\n}\n]	010100002008080000CA257649DD99444147D74407B2EA3241	[{"t_id": 1218, "titel": "Regierungsratsbeschluss", "textimweb": "91-Kappel/Entscheide/91-65-E.pdf", "textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Entscheide/91-65-E.pdf"}]	["Avocados"]	{"Avocados": 37}
4	[\n{\n"t_id": 1218,\n"titel": "Regierungsratsbeschluss",\n"textimweb": "91-Kappel/Entscheide/91-65-E.pdf",\n"textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Entscheide/91-65-E.pdf"\n}\n]	010100002008080000FE9F89B7E9994441AF4B510DCCEA3241	[{"t_id": 1218, "titel": "Regierungsratsbeschluss", "textimweb": "91-Kappel/Entscheide/91-65-E.pdf", "textimweb_absolut": "https://geoweb.so.ch/zonenplaene/Zonenplaene_pdf/91-Kappel/Entscheide/91-65-E.pdf"}]	["Cherries", "Figs"]	{"Figs": 16, "Cherries": 11}
\.


--
-- Name: test_json_gid_seq1; Type: SEQUENCE SET; Schema: test; Owner: an
--

SELECT pg_catalog.setval('test.test_json_gid_seq1', 8, true);


--
-- Name: SCHEMA test; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA test TO PUBLIC;


--
-- Name: TABLE test_json; Type: ACL; Schema: test; Owner: an
--

GRANT SELECT ON TABLE test.test_json TO PUBLIC;


--
-- PostgreSQL database dump complete
--

