--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-08-23 11:00:30 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 41308)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE clientes (
    cd_nomecompleto character varying(100)[] NOT NULL,
    cd_idade numeric(2,1),
    cd_cpf numeric(11,1),
    cd_email integer,
    cd_codigo numeric(100,1)
);


ALTER TABLE clientes OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 41316)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE endereco (
    cd_cep numeric(8,1),
    cd_rua character varying(100),
    cd_numero numeric(5,1),
    cd_complemento character varying(15),
    cd_bairro character varying(20),
    cd_cidade character varying(40),
    cd_estado character varying(2),
    cd_codigo numeric(100,1)
);


ALTER TABLE endereco OWNER TO postgres;

--
-- TOC entry 2142 (class 0 OID 41308)
-- Dependencies: 181
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clientes (cd_nomecompleto, cd_idade, cd_cpf, cd_email, cd_codigo) FROM stdin;
\.


--
-- TOC entry 2143 (class 0 OID 41316)
-- Dependencies: 182
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY endereco (cd_cep, cd_rua, cd_numero, cd_complemento, cd_bairro, cd_cidade, cd_estado, cd_codigo) FROM stdin;
\.


--
-- TOC entry 2023 (class 2606 OID 41324)
-- Name: cd_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT cd_codigo UNIQUE (cd_codigo);


--
-- TOC entry 2025 (class 2606 OID 41332)
-- Name: cd_nomecompleto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT cd_nomecompleto PRIMARY KEY (cd_nomecompleto);


--
-- TOC entry 2026 (class 1259 OID 41330)
-- Name: fki_cd_codigo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cd_codigo ON endereco USING btree (cd_codigo);


--
-- TOC entry 2027 (class 2606 OID 41325)
-- Name: fk_cd_codigo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk_cd_codigo FOREIGN KEY (cd_codigo) REFERENCES clientes(cd_codigo);


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-08-23 11:00:30 BRT

--
-- PostgreSQL database dump complete
--

