--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-06-20 11:09:23

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 16453)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    tipo_documento character varying(50) NOT NULL,
    documento integer NOT NULL,
    primer_nombre character varying(50),
    segundo_nombre character varying(50),
    primer_apellido character varying(50),
    segundo_apellido character varying(50),
    celular character varying(50),
    direccion character varying(50),
    email character varying(50)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16458)
-- Name: fotos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fotos (
    codigo integer NOT NULL,
    ruta character varying(50),
    cod_mantenimiento integer
);


ALTER TABLE public.fotos OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16456)
-- Name: fotos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fotos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fotos_codigo_seq OWNER TO postgres;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 202
-- Name: fotos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fotos_codigo_seq OWNED BY public.fotos.codigo;


--
-- TOC entry 205 (class 1259 OID 16464)
-- Name: mantenimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mantenimientos (
    codigo integer NOT NULL,
    estado character varying(50),
    cod_placa character varying(50),
    fecha date,
    mec_documento integer,
    mec_tipo_documento character varying(50)
);


ALTER TABLE public.mantenimientos OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16462)
-- Name: mantenimientos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mantenimientos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mantenimientos_codigo_seq OWNER TO postgres;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 204
-- Name: mantenimientos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mantenimientos_codigo_seq OWNED BY public.mantenimientos.codigo;


--
-- TOC entry 207 (class 1259 OID 16470)
-- Name: marcas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marcas (
    codigo integer NOT NULL,
    nombre_marca character varying(50)
);


ALTER TABLE public.marcas OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16468)
-- Name: marcas_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marcas_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marcas_codigo_seq OWNER TO postgres;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 206
-- Name: marcas_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marcas_codigo_seq OWNED BY public.marcas.codigo;


--
-- TOC entry 208 (class 1259 OID 16474)
-- Name: mecanicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mecanicos (
    tipo_documento character varying(50) NOT NULL,
    documento integer NOT NULL,
    primer_nombre character varying(50),
    segundo_nombre character varying(50),
    primer_apellido character varying(50),
    segundo_apellido character varying(50),
    celular character varying(50),
    direccion character varying(50),
    email character varying(50),
    estado character(50)
);


ALTER TABLE public.mecanicos OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16444)
-- Name: mechanic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mechanic (
    documento integer NOT NULL,
    celular character varying(255),
    direccion character varying(255),
    email character varying(255),
    estado character varying(255),
    primer_apellido character varying(255),
    primer_nombre character varying(255),
    segundo_apellido character varying(255),
    segundo_nombre character varying(255),
    tipo_documento character varying(255)
);


ALTER TABLE public.mechanic OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16479)
-- Name: repuestos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repuestos (
    codigo integer NOT NULL,
    nombre_repuesto character varying(50),
    precio_unitario numeric,
    unidades_inventario integer,
    porveedor character varying(50)
);


ALTER TABLE public.repuestos OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16477)
-- Name: repuestos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repuestos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repuestos_codigo_seq OWNER TO postgres;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 209
-- Name: repuestos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repuestos_codigo_seq OWNED BY public.repuestos.codigo;


--
-- TOC entry 212 (class 1259 OID 16488)
-- Name: repuestos_x_mantenimentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repuestos_x_mantenimentos (
    codigo integer NOT NULL,
    unidades integer,
    tiempo_estimado integer,
    cod_mantenimiento integer,
    cod_repuesto integer
);


ALTER TABLE public.repuestos_x_mantenimentos OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16486)
-- Name: repuestos_x_mantenimentos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repuestos_x_mantenimentos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repuestos_x_mantenimentos_codigo_seq OWNER TO postgres;

--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 211
-- Name: repuestos_x_mantenimentos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repuestos_x_mantenimentos_codigo_seq OWNED BY public.repuestos_x_mantenimentos.codigo;


--
-- TOC entry 214 (class 1259 OID 16494)
-- Name: servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicios (
    codigo integer NOT NULL,
    nombre_servicio character varying(50),
    precio numeric
);


ALTER TABLE public.servicios OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16492)
-- Name: servicios_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicios_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servicios_codigo_seq OWNER TO postgres;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 213
-- Name: servicios_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicios_codigo_seq OWNED BY public.servicios.codigo;


--
-- TOC entry 216 (class 1259 OID 16503)
-- Name: servicios_x_mantenimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicios_x_mantenimientos (
    codigo integer NOT NULL,
    tiempo_estimado integer,
    cod_servicio integer,
    cod_mantenimiento integer
);


ALTER TABLE public.servicios_x_mantenimientos OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16501)
-- Name: servicios_x_mantenimientos_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicios_x_mantenimientos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servicios_x_mantenimientos_codigo_seq OWNER TO postgres;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 215
-- Name: servicios_x_mantenimientos_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicios_x_mantenimientos_codigo_seq OWNED BY public.servicios_x_mantenimientos.codigo;


--
-- TOC entry 217 (class 1259 OID 16507)
-- Name: vehiculos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehiculos (
    placa character varying(50) NOT NULL,
    color character varying(50),
    cod_marca integer,
    cli_documento integer,
    cli_tipo_documento character varying(50)
);


ALTER TABLE public.vehiculos OWNER TO postgres;

--
-- TOC entry 2905 (class 2604 OID 16461)
-- Name: fotos codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotos ALTER COLUMN codigo SET DEFAULT nextval('public.fotos_codigo_seq'::regclass);


--
-- TOC entry 2906 (class 2604 OID 16467)
-- Name: mantenimientos codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimientos ALTER COLUMN codigo SET DEFAULT nextval('public.mantenimientos_codigo_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 16473)
-- Name: marcas codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marcas ALTER COLUMN codigo SET DEFAULT nextval('public.marcas_codigo_seq'::regclass);


--
-- TOC entry 2908 (class 2604 OID 16482)
-- Name: repuestos codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repuestos ALTER COLUMN codigo SET DEFAULT nextval('public.repuestos_codigo_seq'::regclass);


--
-- TOC entry 2909 (class 2604 OID 16491)
-- Name: repuestos_x_mantenimentos codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repuestos_x_mantenimentos ALTER COLUMN codigo SET DEFAULT nextval('public.repuestos_x_mantenimentos_codigo_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 16497)
-- Name: servicios codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios ALTER COLUMN codigo SET DEFAULT nextval('public.servicios_codigo_seq'::regclass);


--
-- TOC entry 2911 (class 2604 OID 16506)
-- Name: servicios_x_mantenimientos codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_x_mantenimientos ALTER COLUMN codigo SET DEFAULT nextval('public.servicios_x_mantenimientos_codigo_seq'::regclass);


--
-- TOC entry 3082 (class 0 OID 16453)
-- Dependencies: 201
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (tipo_documento, documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, celular, direccion, email) FROM stdin;
CC	90182734	alexa	en	ramirez	lopez	1289349	Cll 123	abc@gmail.com
\.


--
-- TOC entry 3084 (class 0 OID 16458)
-- Dependencies: 203
-- Data for Name: fotos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fotos (codigo, ruta, cod_mantenimiento) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 16464)
-- Dependencies: 205
-- Data for Name: mantenimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mantenimientos (codigo, estado, cod_placa, fecha, mec_documento, mec_tipo_documento) FROM stdin;
1	Finalizado	qme-1234	2021-06-19	1928347234	CC
\.


--
-- TOC entry 3088 (class 0 OID 16470)
-- Dependencies: 207
-- Data for Name: marcas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marcas (codigo, nombre_marca) FROM stdin;
1	audi
\.


--
-- TOC entry 3089 (class 0 OID 16474)
-- Dependencies: 208
-- Data for Name: mecanicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mecanicos (tipo_documento, documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, celular, direccion, email, estado) FROM stdin;
CC	1928347234	juan	perez	ramirez	lopez	128934789	Cll 123	abc@gmail.com	A                                                 
\.


--
-- TOC entry 3081 (class 0 OID 16444)
-- Dependencies: 200
-- Data for Name: mechanic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mechanic (documento, celular, direccion, email, estado, primer_apellido, primer_nombre, segundo_apellido, segundo_nombre, tipo_documento) FROM stdin;
1019143966	3107608595	Cll 16 #17-25	ing.d4vid@gmail.com	A	piracoca	david	vargas	alejandro	CC
120938472	3107608595	Cll 16 #17-25	ing.d4vid@gmail.com	A	ramirez	alex	robles	alejandro	CC
198273123	3107608595	Cll 16 #17-25	ramir@gmail.com	A	ramirez	rolando	vasquez	v	CC
\.


--
-- TOC entry 3091 (class 0 OID 16479)
-- Dependencies: 210
-- Data for Name: repuestos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repuestos (codigo, nombre_repuesto, precio_unitario, unidades_inventario, porveedor) FROM stdin;
1	escape	10000	3	provv
2	llanta	40000	10	provv
\.


--
-- TOC entry 3093 (class 0 OID 16488)
-- Dependencies: 212
-- Data for Name: repuestos_x_mantenimentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repuestos_x_mantenimentos (codigo, unidades, tiempo_estimado, cod_mantenimiento, cod_repuesto) FROM stdin;
1	1	2	1	1
2	1	2	1	2
\.


--
-- TOC entry 3095 (class 0 OID 16494)
-- Dependencies: 214
-- Data for Name: servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicios (codigo, nombre_servicio, precio) FROM stdin;
1	cambio de aceite	10000
2	alineacion y balanceo	200000
\.


--
-- TOC entry 3097 (class 0 OID 16503)
-- Dependencies: 216
-- Data for Name: servicios_x_mantenimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicios_x_mantenimientos (codigo, tiempo_estimado, cod_servicio, cod_mantenimiento) FROM stdin;
1	4	1	1
2	2	2	1
\.


--
-- TOC entry 3098 (class 0 OID 16507)
-- Dependencies: 217
-- Data for Name: vehiculos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehiculos (placa, color, cod_marca, cli_documento, cli_tipo_documento) FROM stdin;
qme-1234	azul	1	90182734	CC
\.


--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 202
-- Name: fotos_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fotos_codigo_seq', 1, false);


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 204
-- Name: mantenimientos_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mantenimientos_codigo_seq', 1, true);


--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 206
-- Name: marcas_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marcas_codigo_seq', 1, true);


--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 209
-- Name: repuestos_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repuestos_codigo_seq', 2, true);


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 211
-- Name: repuestos_x_mantenimentos_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repuestos_x_mantenimentos_codigo_seq', 2, true);


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 213
-- Name: servicios_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicios_codigo_seq', 2, true);


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 215
-- Name: servicios_x_mantenimientos_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicios_x_mantenimientos_codigo_seq', 2, true);


--
-- TOC entry 2913 (class 2606 OID 16451)
-- Name: mechanic mechanic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mechanic
    ADD CONSTRAINT mechanic_pkey PRIMARY KEY (documento);


--
-- TOC entry 2915 (class 2606 OID 16511)
-- Name: clientes pk_clientos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT pk_clientos PRIMARY KEY (tipo_documento, documento);


--
-- TOC entry 2918 (class 2606 OID 16513)
-- Name: fotos pk_fotos1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT pk_fotos1 PRIMARY KEY (codigo);


--
-- TOC entry 2922 (class 2606 OID 16516)
-- Name: mantenimientos pk_mantenimientos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimientos
    ADD CONSTRAINT pk_mantenimientos PRIMARY KEY (codigo);


--
-- TOC entry 2924 (class 2606 OID 16520)
-- Name: marcas pk_marcas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT pk_marcas PRIMARY KEY (codigo);


--
-- TOC entry 2926 (class 2606 OID 16522)
-- Name: mecanicos pk_mecanicos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mecanicos
    ADD CONSTRAINT pk_mecanicos PRIMARY KEY (tipo_documento, documento);


--
-- TOC entry 2928 (class 2606 OID 16524)
-- Name: repuestos pk_repuestos1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repuestos
    ADD CONSTRAINT pk_repuestos1 PRIMARY KEY (codigo);


--
-- TOC entry 2932 (class 2606 OID 16526)
-- Name: repuestos_x_mantenimentos pk_repuestos_x_mantenimientos1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repuestos_x_mantenimentos
    ADD CONSTRAINT pk_repuestos_x_mantenimientos1 PRIMARY KEY (codigo);


--
-- TOC entry 2934 (class 2606 OID 16530)
-- Name: servicios pk_servicios1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT pk_servicios1 PRIMARY KEY (codigo);


--
-- TOC entry 2938 (class 2606 OID 16532)
-- Name: servicios_x_mantenimientos pk_servicios_x_mantenimiento1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_x_mantenimientos
    ADD CONSTRAINT pk_servicios_x_mantenimiento1 PRIMARY KEY (codigo);


--
-- TOC entry 2942 (class 2606 OID 16536)
-- Name: vehiculos pk_vehiculos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT pk_vehiculos PRIMARY KEY (placa);


--
-- TOC entry 2916 (class 1259 OID 16514)
-- Name: ixfk_fotos_mantenimientos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ixfk_fotos_mantenimientos ON public.fotos USING btree (cod_mantenimiento);


--
-- TOC entry 2919 (class 1259 OID 16517)
-- Name: ixfk_mantenimientos_mecanicos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ixfk_mantenimientos_mecanicos ON public.mantenimientos USING btree (mec_tipo_documento, mec_documento);


--
-- TOC entry 2920 (class 1259 OID 16518)
-- Name: ixfk_mantenimientos_vehiculos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ixfk_mantenimientos_vehiculos ON public.mantenimientos USING btree (cod_placa);


--
-- TOC entry 2929 (class 1259 OID 16527)
-- Name: ixfk_repuestos_x_mantenimentos_mantenimientos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ixfk_repuestos_x_mantenimentos_mantenimientos ON public.repuestos_x_mantenimentos USING btree (cod_mantenimiento);


--
-- TOC entry 2930 (class 1259 OID 16528)
-- Name: ixfk_repuestos_x_mantenimentos_repuestos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ixfk_repuestos_x_mantenimentos_repuestos ON public.repuestos_x_mantenimentos USING btree (cod_repuesto);


--
-- TOC entry 2935 (class 1259 OID 16533)
-- Name: ixfk_servicios_x_mantenimientos_mantenimientos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ixfk_servicios_x_mantenimientos_mantenimientos ON public.servicios_x_mantenimientos USING btree (cod_mantenimiento);


--
-- TOC entry 2936 (class 1259 OID 16534)
-- Name: ixfk_servicios_x_mantenimientos_servicios; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ixfk_servicios_x_mantenimientos_servicios ON public.servicios_x_mantenimientos USING btree (cod_servicio);


--
-- TOC entry 2939 (class 1259 OID 16537)
-- Name: ixfk_vehiculos_clientes; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ixfk_vehiculos_clientes ON public.vehiculos USING btree (cli_tipo_documento, cli_documento);


--
-- TOC entry 2940 (class 1259 OID 16538)
-- Name: ixfk_vehiculos_marcas; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ixfk_vehiculos_marcas ON public.vehiculos USING btree (cod_marca);


--
-- TOC entry 2943 (class 2606 OID 16539)
-- Name: fotos fk_fotos_mantenimientos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT fk_fotos_mantenimientos FOREIGN KEY (cod_mantenimiento) REFERENCES public.mantenimientos(codigo);


--
-- TOC entry 2944 (class 2606 OID 16544)
-- Name: mantenimientos fk_mantenimientos_mecanicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimientos
    ADD CONSTRAINT fk_mantenimientos_mecanicos FOREIGN KEY (mec_tipo_documento, mec_documento) REFERENCES public.mecanicos(tipo_documento, documento);


--
-- TOC entry 2945 (class 2606 OID 16549)
-- Name: mantenimientos fk_mantenimientos_vehiculos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimientos
    ADD CONSTRAINT fk_mantenimientos_vehiculos FOREIGN KEY (cod_placa) REFERENCES public.vehiculos(placa);


--
-- TOC entry 2946 (class 2606 OID 16554)
-- Name: repuestos_x_mantenimentos fk_repuestos_x_mantenimentos_mantenimientos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repuestos_x_mantenimentos
    ADD CONSTRAINT fk_repuestos_x_mantenimentos_mantenimientos FOREIGN KEY (cod_mantenimiento) REFERENCES public.mantenimientos(codigo);


--
-- TOC entry 2947 (class 2606 OID 16559)
-- Name: repuestos_x_mantenimentos fk_repuestos_x_mantenimentos_repuestos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repuestos_x_mantenimentos
    ADD CONSTRAINT fk_repuestos_x_mantenimentos_repuestos FOREIGN KEY (cod_repuesto) REFERENCES public.repuestos(codigo);


--
-- TOC entry 2948 (class 2606 OID 16564)
-- Name: servicios_x_mantenimientos fk_servicios_x_mantenimientos_mantenimientos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_x_mantenimientos
    ADD CONSTRAINT fk_servicios_x_mantenimientos_mantenimientos FOREIGN KEY (cod_mantenimiento) REFERENCES public.mantenimientos(codigo);


--
-- TOC entry 2949 (class 2606 OID 16569)
-- Name: servicios_x_mantenimientos fk_servicios_x_mantenimientos_servicios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_x_mantenimientos
    ADD CONSTRAINT fk_servicios_x_mantenimientos_servicios FOREIGN KEY (cod_servicio) REFERENCES public.servicios(codigo);


--
-- TOC entry 2950 (class 2606 OID 16574)
-- Name: vehiculos fk_vehiculos_marcas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT fk_vehiculos_marcas FOREIGN KEY (cod_marca) REFERENCES public.marcas(codigo);


-- Completed on 2021-06-20 11:09:23

--
-- PostgreSQL database dump complete
--

CREATE VIEW factura AS
select 
	cli.primer_nombre as cliente_primer_nombre,
	cli.segundo_nombre as cliente_segundo_nombre,
	cli.primer_apellido as cliente_primer_apellido,
	cli.segundo_apellido as cliente_segundo_apellido,
	cli.documento as cliente_documento,
	cli.tipo_documento as cliente_tipo_documento,
	cli.celular as cliente_celular,
	cli.direccion as cliente_direccion,
	cli.email as cliente_email,
	mec.primer_nombre as mecanico_primer_nombre,
	mec.segundo_nombre as mecanico_segundo_nombre,
	mec.primer_apellido as mecanico_primer_apellido,
	mec.segundo_apellido as mecanico_segundo_apellido,
	mec.documento as mecanico_documento,
	mec.tipo_documento as mecanico_tipo_documento,
	mec.celular as mecanico_celular,
	mec.direccion as mecanico_direccion,
	mec.email as mecanico_email,
	(select json_agg((SELECT x FROM (SELECT r.nombre_repuesto ,unidades ,r.precio_unitario) AS x )) as repuesto 
	 from repuestos_x_mantenimentos 
	 inner join repuestos r on r.codigo = cod_repuesto
	 where cod_mantenimiento = man.codigo) as repuestos,
	(select json_agg((SELECT x FROM (SELECT s.nombre_servicio ,s.precio mano_de_obra) AS x )) as servicio 
	 from servicios_x_mantenimientos 
	 inner join servicios s on s.codigo = cod_servicio
	 where cod_mantenimiento = man.codigo) as servicios
from mantenimientos man 
inner join mecanicos mec on mec.tipo_documento = man.mec_tipo_documento and mec.documento = man.mec_documento
inner join vehiculos ve on ve.placa = man.cod_placa
inner join clientes cli on cli.tipo_documento = ve.cli_tipo_documento and cli.documento = ve.cli_documento



