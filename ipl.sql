--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 14.3

-- Started on 2022-07-07 22:29:34

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

DROP DATABASE ipl;
--
-- TOC entry 3040 (class 1262 OID 16384)
-- Name: ipl; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE ipl WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru';


ALTER DATABASE ipl OWNER TO admin;

\connect ipl

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
-- TOC entry 5 (class 2615 OID 16387)
-- Name: crm; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA crm;


ALTER SCHEMA crm OWNER TO postgres;

--
-- TOC entry 4 (class 2615 OID 16386)
-- Name: helpdesk; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA helpdesk;


ALTER SCHEMA helpdesk OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16390)
-- Name: clients; Type: TABLE; Schema: crm; Owner: postgres
--

CREATE TABLE crm.clients (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE crm.clients OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16388)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: crm; Owner: postgres
--

CREATE SEQUENCE crm.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE crm.clients_id_seq OWNER TO postgres;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 202
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: crm; Owner: postgres
--

ALTER SEQUENCE crm.clients_id_seq OWNED BY crm.clients.id;


--
-- TOC entry 206 (class 1259 OID 16416)
-- Name: clients_services; Type: TABLE; Schema: crm; Owner: admin
--

CREATE TABLE crm.clients_services (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    service_id bigint NOT NULL
);


ALTER TABLE crm.clients_services OWNER TO admin;

--
-- TOC entry 207 (class 1259 OID 16421)
-- Name: services; Type: TABLE; Schema: crm; Owner: postgres
--

CREATE TABLE crm.services (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE crm.services OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24608)
-- Name: statuses; Type: TABLE; Schema: helpdesk; Owner: postgres
--

CREATE TABLE helpdesk.statuses (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE helpdesk.statuses OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16401)
-- Name: tickets; Type: TABLE; Schema: helpdesk; Owner: postgres
--

CREATE TABLE helpdesk.tickets (
    id integer NOT NULL,
    client_id bigint NOT NULL,
    user_id bigint NOT NULL,
    status_id bigint NOT NULL,
    title character varying(50) NOT NULL,
    description text
);


ALTER TABLE helpdesk.tickets OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16399)
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: helpdesk; Owner: postgres
--

CREATE SEQUENCE helpdesk.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE helpdesk.tickets_id_seq OWNER TO postgres;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 204
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: helpdesk; Owner: postgres
--

ALTER SEQUENCE helpdesk.tickets_id_seq OWNED BY helpdesk.tickets.id;


--
-- TOC entry 208 (class 1259 OID 16429)
-- Name: users; Type: TABLE; Schema: helpdesk; Owner: postgres
--

CREATE TABLE helpdesk.users (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE helpdesk.users OWNER TO postgres;

--
-- TOC entry 2878 (class 2604 OID 16393)
-- Name: clients id; Type: DEFAULT; Schema: crm; Owner: postgres
--

ALTER TABLE ONLY crm.clients ALTER COLUMN id SET DEFAULT nextval('crm.clients_id_seq'::regclass);


--
-- TOC entry 2879 (class 2604 OID 16404)
-- Name: tickets id; Type: DEFAULT; Schema: helpdesk; Owner: postgres
--

ALTER TABLE ONLY helpdesk.tickets ALTER COLUMN id SET DEFAULT nextval('helpdesk.tickets_id_seq'::regclass);


--
-- TOC entry 3028 (class 0 OID 16390)
-- Dependencies: 203
-- Data for Name: clients; Type: TABLE DATA; Schema: crm; Owner: postgres
--

INSERT INTO crm.clients (id, name, phone, email, active) VALUES (7, 'Петр', '+375223108745', 'qwe@qwdf.ru', true);
INSERT INTO crm.clients (id, name, phone, email, active) VALUES (8, 'Дмитрий', '+375663338745', 'qwee@qwe.ru', true);
INSERT INTO crm.clients (id, name, phone, email, active) VALUES (9, 'Игорь', '+485663308745', 'qzsdfe@qdfe.ru', true);
INSERT INTO crm.clients (id, name, phone, email, active) VALUES (10, 'Михаил', '+275623108745', 'qdfe@qdfe.ru', false);
INSERT INTO crm.clients (id, name, phone, email, active) VALUES (11, 'Артем', '+975633666745', 'qdf@qwdf.ru', true);
INSERT INTO crm.clients (id, name, phone, email, active) VALUES (12, 'Евгений', '+175663155745', 'qdf@qdfe.ru', false);


--
-- TOC entry 3031 (class 0 OID 16416)
-- Dependencies: 206
-- Data for Name: clients_services; Type: TABLE DATA; Schema: crm; Owner: admin
--

INSERT INTO crm.clients_services (id, client_id, service_id) VALUES (1, 7, 1);


--
-- TOC entry 3032 (class 0 OID 16421)
-- Dependencies: 207
-- Data for Name: services; Type: TABLE DATA; Schema: crm; Owner: postgres
--

INSERT INTO crm.services (id, name) VALUES (1, 'Интернет');


--
-- TOC entry 3034 (class 0 OID 24608)
-- Dependencies: 209
-- Data for Name: statuses; Type: TABLE DATA; Schema: helpdesk; Owner: postgres
--

INSERT INTO helpdesk.statuses (id, name) VALUES (1, 'новый');
INSERT INTO helpdesk.statuses (id, name) VALUES (2, 'в работе');
INSERT INTO helpdesk.statuses (id, name) VALUES (3, 'закрыто');


--
-- TOC entry 3030 (class 0 OID 16401)
-- Dependencies: 205
-- Data for Name: tickets; Type: TABLE DATA; Schema: helpdesk; Owner: postgres
--

INSERT INTO helpdesk.tickets (id, client_id, user_id, status_id, title, description) VALUES (5, 7, 1, 1, 'Ремонт ноутбука', 'Сгорел');
INSERT INTO helpdesk.tickets (id, client_id, user_id, status_id, title, description) VALUES (7, 11, 2, 1, 'Настройка ПК', 'Переустановка Windows');
INSERT INTO helpdesk.tickets (id, client_id, user_id, status_id, title, description) VALUES (8, 12, 2, 3, 'Профилактика ПК', 'Чистка');
INSERT INTO helpdesk.tickets (id, client_id, user_id, status_id, title, description) VALUES (6, 8, 1, 3, 'Ремонт телефона', 'Утопил');


--
-- TOC entry 3033 (class 0 OID 16429)
-- Dependencies: 208
-- Data for Name: users; Type: TABLE DATA; Schema: helpdesk; Owner: postgres
--

INSERT INTO helpdesk.users (id, name) VALUES (1, 'Техник 1');
INSERT INTO helpdesk.users (id, name) VALUES (2, 'Техник 2');


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 202
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: crm; Owner: postgres
--

SELECT pg_catalog.setval('crm.clients_id_seq', 12, true);


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 204
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: helpdesk; Owner: postgres
--

SELECT pg_catalog.setval('helpdesk.tickets_id_seq', 8, true);


--
-- TOC entry 2881 (class 2606 OID 16397)
-- Name: clients clients_email_key; Type: CONSTRAINT; Schema: crm; Owner: postgres
--

ALTER TABLE ONLY crm.clients
    ADD CONSTRAINT clients_email_key UNIQUE (email);


--
-- TOC entry 2883 (class 2606 OID 16395)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: crm; Owner: postgres
--

ALTER TABLE ONLY crm.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 16420)
-- Name: clients_services clients_services_pkey; Type: CONSTRAINT; Schema: crm; Owner: admin
--

ALTER TABLE ONLY crm.clients_services
    ADD CONSTRAINT clients_services_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 16428)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: crm; Owner: postgres
--

ALTER TABLE ONLY crm.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 24615)
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: helpdesk; Owner: postgres
--

ALTER TABLE ONLY helpdesk.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 16409)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: helpdesk; Owner: postgres
--

ALTER TABLE ONLY helpdesk.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 16436)
-- Name: users user_pkey; Type: CONSTRAINT; Schema: helpdesk; Owner: postgres
--

ALTER TABLE ONLY helpdesk.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2884 (class 1259 OID 16398)
-- Name: phone_active_idx; Type: INDEX; Schema: crm; Owner: postgres
--

CREATE INDEX phone_active_idx ON crm.clients USING btree (phone, active);


--
-- TOC entry 2885 (class 1259 OID 16410)
-- Name: client_idx; Type: INDEX; Schema: helpdesk; Owner: postgres
--

CREATE INDEX client_idx ON helpdesk.tickets USING btree (client_id);


--
-- TOC entry 2896 (class 2606 OID 16411)
-- Name: tickets clints_fk; Type: FK CONSTRAINT; Schema: helpdesk; Owner: postgres
--

ALTER TABLE ONLY helpdesk.tickets
    ADD CONSTRAINT clints_fk FOREIGN KEY (client_id) REFERENCES crm.clients(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2022-07-07 22:29:35

--
-- PostgreSQL database dump complete
--

