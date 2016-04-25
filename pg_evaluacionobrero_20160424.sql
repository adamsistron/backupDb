--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: dblink_pkey_results; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE dblink_pkey_results AS (
	"position" integer,
	colname text
);


ALTER TYPE public.dblink_pkey_results OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bitacora_evaluacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bitacora_evaluacion (
    id_evaluacion_general integer,
    uid character varying(50) NOT NULL,
    fecha timestamp without time zone NOT NULL,
    descripcion_accion text NOT NULL,
    id_bitacora_evaluacion integer NOT NULL,
    id_periodos integer
);


ALTER TABLE public.bitacora_evaluacion OWNER TO postgres;

--
-- Name: TABLE bitacora_evaluacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE bitacora_evaluacion IS 'Registro de las acciones efecuadas sobre una evaluación';


--
-- Name: bitacora_evaluacion_id_bitacora_evaluacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bitacora_evaluacion_id_bitacora_evaluacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bitacora_evaluacion_id_bitacora_evaluacion_seq OWNER TO postgres;

--
-- Name: bitacora_evaluacion_id_bitacora_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bitacora_evaluacion_id_bitacora_evaluacion_seq OWNED BY bitacora_evaluacion.id_bitacora_evaluacion;


--
-- Name: conf; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE conf (
    id_conf integer NOT NULL,
    param text,
    valor date
);


ALTER TABLE public.conf OWNER TO postgres;

--
-- Name: conf_id_conf_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conf_id_conf_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_id_conf_seq OWNER TO postgres;

--
-- Name: conf_id_conf_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conf_id_conf_seq OWNED BY conf.id_conf;


--
-- Name: criterios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE criterios (
    co_criterio integer NOT NULL,
    co_factor smallint NOT NULL,
    nombre text,
    peso_jefe numeric,
    peso_cachilapo numeric,
    orden smallint
);


ALTER TABLE public.criterios OWNER TO postgres;

--
-- Name: criterios_co_criterio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE criterios_co_criterio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criterios_co_criterio_seq OWNER TO postgres;

--
-- Name: criterios_co_criterio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE criterios_co_criterio_seq OWNED BY criterios.co_criterio;


--
-- Name: detalle_respuestas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detalle_respuestas (
    co_detalle_respuestas integer NOT NULL,
    co_criterio smallint,
    id_evaluacion_general integer,
    co_factor smallint
);


ALTER TABLE public.detalle_respuestas OWNER TO postgres;

--
-- Name: detalle_respuestas_co_detalle_respuestas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_respuestas_co_detalle_respuestas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_respuestas_co_detalle_respuestas_seq OWNER TO postgres;

--
-- Name: detalle_respuestas_co_detalle_respuestas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detalle_respuestas_co_detalle_respuestas_seq OWNED BY detalle_respuestas.co_detalle_respuestas;


--
-- Name: estado_evaluacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_evaluacion (
    id_estado_evaluacion integer NOT NULL,
    nb_estado_evaluacion text NOT NULL
);


ALTER TABLE public.estado_evaluacion OWNER TO postgres;

--
-- Name: estado_evaluacion_id_estado_evaluacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_evaluacion_id_estado_evaluacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_evaluacion_id_estado_evaluacion_seq OWNER TO postgres;

--
-- Name: estado_evaluacion_id_estado_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_evaluacion_id_estado_evaluacion_seq OWNED BY estado_evaluacion.id_estado_evaluacion;


--
-- Name: evaluacion_general; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE evaluacion_general (
    id_evaluacion_general integer NOT NULL,
    fe_inicio_evaluacion date,
    total_evaluacion numeric,
    estado integer,
    periodo integer,
    dependencia text,
    ubicacion_fisica text,
    id_evaluador integer,
    id_evaluado integer,
    id_rango integer,
    notificacion boolean,
    bloqueada boolean
);


ALTER TABLE public.evaluacion_general OWNER TO postgres;

--
-- Name: COLUMN evaluacion_general.fe_inicio_evaluacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN evaluacion_general.fe_inicio_evaluacion IS 'Fecha en que inicia el proceso de Evaluación';


--
-- Name: evaluacion_general_id_evaluacion_general_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE evaluacion_general_id_evaluacion_general_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluacion_general_id_evaluacion_general_seq OWNER TO postgres;

--
-- Name: evaluacion_general_id_evaluacion_general_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE evaluacion_general_id_evaluacion_general_seq OWNED BY evaluacion_general.id_evaluacion_general;


--
-- Name: evaluadores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE evaluadores (
    id_evaluador integer NOT NULL,
    cedula character varying(30) NOT NULL,
    periodo integer,
    id_trabajador integer
);


ALTER TABLE public.evaluadores OWNER TO postgres;

--
-- Name: evaluadores_id_evaluadores_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE evaluadores_id_evaluadores_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluadores_id_evaluadores_seq OWNER TO postgres;

--
-- Name: evaluadores_id_evaluadores_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE evaluadores_id_evaluadores_seq OWNED BY evaluadores.id_evaluador;


--
-- Name: evaluados; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE evaluados (
    id_evaluado integer NOT NULL,
    ci_evaluado character varying(30),
    id_evaluador integer,
    periodo integer,
    id_trabajador integer
);


ALTER TABLE public.evaluados OWNER TO postgres;

--
-- Name: TABLE evaluados; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE evaluados IS 'Lista de todos los evaluados en el sistema';


--
-- Name: evaluados_id_evaluado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE evaluados_id_evaluado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluados_id_evaluado_seq OWNER TO postgres;

--
-- Name: evaluados_id_evaluado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE evaluados_id_evaluado_seq OWNED BY evaluados.id_evaluado;


--
-- Name: factores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE factores (
    co_factor integer NOT NULL,
    nombre character varying(40)
);


ALTER TABLE public.factores OWNER TO postgres;

--
-- Name: factores_co_factor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE factores_co_factor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.factores_co_factor_seq OWNER TO postgres;

--
-- Name: factores_co_factor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE factores_co_factor_seq OWNED BY factores.co_factor;


--
-- Name: id_periodo_sec; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_periodo_sec
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999
    CACHE 1;


ALTER TABLE public.id_periodo_sec OWNER TO postgres;

--
-- Name: periodos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE periodos (
    id_periodos integer NOT NULL,
    inicio date NOT NULL,
    fin date NOT NULL
);


ALTER TABLE public.periodos OWNER TO postgres;

--
-- Name: periodos_id_periodos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE periodos_id_periodos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.periodos_id_periodos_seq OWNER TO postgres;

--
-- Name: periodos_id_periodos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE periodos_id_periodos_seq OWNED BY periodos.id_periodos;


--
-- Name: rango; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rango (
    id_rango integer NOT NULL,
    valor_rango smallint NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.rango OWNER TO postgres;

--
-- Name: rango_id_rango_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rango_id_rango_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rango_id_rango_seq OWNER TO postgres;

--
-- Name: rango_id_rango_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rango_id_rango_seq OWNED BY rango.id_rango;


--
-- Name: tmp_v_datos_personales_evaluacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tmp_v_datos_personales_evaluacion (
    id_trabajador integer,
    cedula character varying(30),
    primer_nombre character varying(90),
    segundo_nombre character varying(90),
    primer_apellido character varying(90),
    segundo_apellido character varying(90),
    tipo_personal character varying(60),
    dependencia character varying(130),
    email character varying(60),
    descripcion_cargo character varying(60),
    codigo_nomina integer,
    tipo_cargo character varying(1),
    id_serie_cargo integer,
    serie_cargo character varying(60),
    id_tipo_personal integer,
    unidad_ejecutora character varying(120)
);


ALTER TABLE public.tmp_v_datos_personales_evaluacion OWNER TO postgres;

--
-- Name: id_bitacora_evaluacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora_evaluacion ALTER COLUMN id_bitacora_evaluacion SET DEFAULT nextval('bitacora_evaluacion_id_bitacora_evaluacion_seq'::regclass);


--
-- Name: id_conf; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conf ALTER COLUMN id_conf SET DEFAULT nextval('conf_id_conf_seq'::regclass);


--
-- Name: co_criterio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY criterios ALTER COLUMN co_criterio SET DEFAULT nextval('criterios_co_criterio_seq'::regclass);


--
-- Name: co_detalle_respuestas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_respuestas ALTER COLUMN co_detalle_respuestas SET DEFAULT nextval('detalle_respuestas_co_detalle_respuestas_seq'::regclass);


--
-- Name: id_estado_evaluacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado_evaluacion ALTER COLUMN id_estado_evaluacion SET DEFAULT nextval('estado_evaluacion_id_estado_evaluacion_seq'::regclass);


--
-- Name: id_evaluacion_general; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluacion_general ALTER COLUMN id_evaluacion_general SET DEFAULT nextval('evaluacion_general_id_evaluacion_general_seq'::regclass);


--
-- Name: id_evaluador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluadores ALTER COLUMN id_evaluador SET DEFAULT nextval('evaluadores_id_evaluadores_seq'::regclass);


--
-- Name: id_evaluado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluados ALTER COLUMN id_evaluado SET DEFAULT nextval('evaluados_id_evaluado_seq'::regclass);


--
-- Name: co_factor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factores ALTER COLUMN co_factor SET DEFAULT nextval('factores_co_factor_seq'::regclass);


--
-- Name: id_periodos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY periodos ALTER COLUMN id_periodos SET DEFAULT nextval('periodos_id_periodos_seq'::regclass);


--
-- Name: id_rango; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rango ALTER COLUMN id_rango SET DEFAULT nextval('rango_id_rango_seq'::regclass);


--
-- Data for Name: bitacora_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bitacora_evaluacion (id_evaluacion_general, uid, fecha, descripcion_accion, id_bitacora_evaluacion, id_periodos) FROM stdin;
113	erondon	2013-07-08 10:04:32.099937	Evaluacion creada/iniciada	299	\N
114	ftorres	2013-07-08 10:04:53.724775	Evaluacion creada/iniciada	300	\N
117	ftorres	2013-07-08 10:06:21.788838	Evaluacion creada/iniciada	303	\N
118	jochoa	2013-07-08 10:06:46.149311	Evaluacion creada/iniciada	304	\N
119	ftorres	2013-07-08 10:06:57.998506	Evaluacion creada/iniciada	305	\N
120	jochoa	2013-07-08 10:07:43.324587	Evaluacion creada/iniciada	306	\N
121	ftorres	2013-07-08 10:07:55.505878	Evaluacion creada/iniciada	307	\N
122	jochoa	2013-07-08 10:08:22.643524	Evaluacion creada/iniciada	309	\N
123	ftorres	2013-07-08 10:09:08.260243	Evaluacion creada/iniciada	310	\N
124	jochoa	2013-07-08 10:09:09.266484	Evaluacion creada/iniciada	311	\N
125	jochoa	2013-07-08 10:09:43.020832	Evaluacion creada/iniciada	312	\N
126	jochoa	2013-07-08 10:10:09.49872	Evaluacion creada/iniciada	313	\N
127	jochoa	2013-07-08 10:10:43.789276	Evaluacion creada/iniciada	314	\N
128	jochoa	2013-07-08 10:11:15.822662	Evaluacion creada/iniciada	315	\N
129	jochoa	2013-07-08 10:11:50.602979	Evaluacion creada/iniciada	316	\N
130	ftorres	2013-07-08 10:14:04.72267	Evaluacion creada/iniciada	317	\N
131	ftorres	2013-07-08 10:15:14.318986	Evaluacion creada/iniciada	318	\N
132	ftorres	2013-07-08 10:16:08.366966	Evaluacion creada/iniciada	319	\N
99	jochoa	2013-07-08 10:17:16.267117	Evaluación realizada/modificada	320	\N
133	ftorres	2013-07-08 10:17:50.366789	Evaluacion creada/iniciada	321	\N
134	ftorres	2013-07-08 10:18:50.080799	Evaluacion creada/iniciada	322	\N
135	ftorres	2013-07-08 10:19:52.405837	Evaluacion creada/iniciada	323	\N
136	ftorres	2013-07-08 10:20:30.668729	Evaluacion creada/iniciada	324	\N
137	ftorres	2013-07-08 10:22:08.2237	Evaluacion creada/iniciada	325	\N
138	ltorres	2013-07-08 10:23:33.09962	Evaluacion creada/iniciada	326	\N
139	ftorres	2013-07-08 10:23:41.12643	Evaluacion creada/iniciada	327	\N
77	rsarache	2013-07-01 11:35:09.552839	Evaluacion creada/iniciada	245	\N
78	ajaspe	2013-07-01 15:19:49.905151	Evaluacion creada/iniciada	246	\N
79	ajaspe	2013-07-01 15:30:29.374317	Evaluacion creada/iniciada	247	\N
80	ajaspe	2013-07-01 15:31:08.368818	Evaluacion creada/iniciada	248	\N
81	ajaspe	2013-07-01 15:42:08.628378	Evaluacion creada/iniciada	249	\N
82	ajaspe	2013-07-01 15:42:57.792154	Evaluacion creada/iniciada	250	\N
83	ajaspe	2013-07-01 15:48:28.340124	Evaluacion creada/iniciada	251	\N
84	jjabreu	2013-07-02 17:01:33.242225	Evaluacion creada/iniciada	252	\N
84	jjabreu	2013-07-02 17:52:52.030056	Evaluación realizada/modificada	253	\N
84	jjabreu	2013-07-02 17:53:02.874513	Evaluación enviada a Revision	254	\N
85	jjabreu	2013-07-03 08:38:13.736231	Evaluacion creada/iniciada	255	\N
86	mmunoz	2013-07-03 08:42:33.477086	Evaluacion creada/iniciada	256	\N
85	jjabreu	2013-07-03 08:47:11.858126	Evaluación realizada/modificada	257	\N
85	jjabreu	2013-07-03 08:47:22.541838	Evaluación enviada a Revision	258	\N
87	jjabreu	2013-07-03 08:48:06.060321	Evaluacion creada/iniciada	259	\N
87	jjabreu	2013-07-03 09:11:07.259945	Evaluación realizada/modificada	261	\N
87	jjabreu	2013-07-03 09:11:19.069202	Evaluación enviada a Revision	262	\N
89	jjabreu	2013-07-03 09:13:58.552587	Evaluacion creada/iniciada	263	\N
89	jjabreu	2013-07-03 09:16:43.650676	Evaluación realizada/modificada	264	\N
89	jjabreu	2013-07-03 09:16:56.478671	Evaluación enviada a Revision	265	\N
89	jjabreu	2013-07-03 09:29:10.672024	Evaluación realizada/modificada	266	\N
89	jjabreu	2013-07-03 09:29:18.527727	Evaluación enviada a Revision	267	\N
86	mmunoz	2013-07-03 09:29:45.667251	Evaluación realizada/modificada	268	\N
86	mmunoz	2013-07-03 09:31:10.240333	Evaluación enviada a Revision	269	\N
87	mduran	2013-07-03 09:55:26.088602	Evaluación aprovada por el analista	270	\N
84	mduran	2013-07-03 09:57:09.762296	Evaluación aprovada por el analista	271	\N
85	mduran	2013-07-03 09:58:36.890121	Evaluación aprovada por el analista	272	\N
89	mduran	2013-07-03 10:00:46.261805	Evaluación aprovada por el analista	273	\N
90	npinate	2013-07-04 09:59:29.826451	Evaluacion creada/iniciada	274	\N
91	lsalgueiro	2013-07-04 10:28:57.782739	Evaluacion creada/iniciada	275	\N
91	lsalgueiro	2013-07-04 10:45:10.191058	Evaluación realizada/modificada	276	\N
91	lsalgueiro	2013-07-04 10:46:26.716284	Evaluación realizada/modificada	277	\N
92	lsalgueiro	2013-07-04 10:53:15.090044	Evaluacion creada/iniciada	278	\N
94	ftorres	2013-07-08 09:50:14.452424	Evaluacion creada/iniciada	280	\N
95	ftorres	2013-07-08 09:53:03.111267	Evaluacion creada/iniciada	281	\N
96	jochoa	2013-07-08 09:53:24.433392	Evaluacion creada/iniciada	282	\N
97	jochoa	2013-07-08 09:55:04.252637	Evaluacion creada/iniciada	283	\N
98	jochoa	2013-07-08 09:55:43.556069	Evaluacion creada/iniciada	284	\N
99	jochoa	2013-07-08 09:56:20.390585	Evaluacion creada/iniciada	285	\N
100	jochoa	2013-07-08 09:56:59.404567	Evaluacion creada/iniciada	286	\N
101	ftorres	2013-07-08 09:57:40.088401	Evaluacion creada/iniciada	287	\N
102	ftorres	2013-07-08 09:58:15.438388	Evaluacion creada/iniciada	288	\N
103	jochoa	2013-07-08 09:58:28.911474	Evaluacion creada/iniciada	289	\N
104	ftorres	2013-07-08 09:59:08.733253	Evaluacion creada/iniciada	290	\N
106	jochoa	2013-07-08 09:59:23.217702	Evaluacion creada/iniciada	292	\N
107	ftorres	2013-07-08 09:59:56.09858	Evaluacion creada/iniciada	293	\N
108	ftorres	2013-07-08 10:01:06.405359	Evaluacion creada/iniciada	294	\N
109	ftorres	2013-07-08 10:02:08.980089	Evaluacion creada/iniciada	295	\N
110	ftorres	2013-07-08 10:02:59.719536	Evaluacion creada/iniciada	296	\N
111	ftorres	2013-07-08 10:03:42.960097	Evaluacion creada/iniciada	297	\N
112	jochoa	2013-07-08 10:04:24.926148	Evaluacion creada/iniciada	298	\N
140	ltorres	2013-07-08 10:24:53.572475	Evaluacion creada/iniciada	328	\N
145	ftorres	2013-07-08 10:28:10.75651	Evaluacion creada/iniciada	333	\N
147	ltorres	2013-07-08 10:30:02.316804	Evaluacion creada/iniciada	335	\N
150	ftorres	2013-07-08 10:30:52.753107	Evaluacion creada/iniciada	338	\N
151	ltorres	2013-07-08 10:32:02.063974	Evaluacion creada/iniciada	339	\N
152	ltorres	2013-07-08 10:32:59.039873	Evaluacion creada/iniciada	340	\N
155	ftorres	2013-07-08 10:33:57.657148	Evaluacion creada/iniciada	343	\N
156	ltorres	2013-07-08 10:35:24.758796	Evaluacion creada/iniciada	344	\N
157	ltorres	2013-07-08 10:36:10.28758	Evaluacion creada/iniciada	345	\N
158	egimenez	2013-07-08 10:36:54.426256	Evaluacion creada/iniciada	346	\N
161	egimenez	2013-07-08 10:40:44.759046	Evaluacion creada/iniciada	349	\N
162	ftorres	2013-07-08 10:43:11.584654	Evaluacion creada/iniciada	350	\N
164	egimenez	2013-07-08 10:44:36.761767	Evaluacion creada/iniciada	352	\N
165	ftorres	2013-07-08 10:45:41.405901	Evaluacion creada/iniciada	354	\N
141	egimenez	2013-07-08 10:25:41.818989	Evaluacion creada/iniciada	329	\N
144	ltorres	2013-07-08 10:27:56.794276	Evaluacion creada/iniciada	332	\N
146	egimenez	2013-07-08 10:29:31.348893	Evaluacion creada/iniciada	334	\N
153	ftorres	2013-07-08 10:33:10.093208	Evaluacion creada/iniciada	341	\N
154	egimenez	2013-07-08 10:33:42.028268	Evaluacion creada/iniciada	342	\N
160	ltorres	2013-07-08 10:38:03.169835	Evaluacion creada/iniciada	348	\N
142	ftorres	2013-07-08 10:26:01.773582	Evaluacion creada/iniciada	330	\N
143	ftorres	2013-07-08 10:26:59.294736	Evaluacion creada/iniciada	331	\N
148	ftorres	2013-07-08 10:30:03.985762	Evaluacion creada/iniciada	336	\N
149	egimenez	2013-07-08 10:30:24.511895	Evaluacion creada/iniciada	337	\N
159	ftorres	2013-07-08 10:36:58.86025	Evaluacion creada/iniciada	347	\N
163	ftorres	2013-07-08 10:44:15.860093	Evaluacion creada/iniciada	351	\N
166	egimenez	2013-07-08 10:46:42.226341	Evaluacion creada/iniciada	355	\N
167	ftorres	2013-07-08 10:46:45.78655	Evaluacion creada/iniciada	356	\N
168	ftorres	2013-07-08 10:47:39.91864	Evaluacion creada/iniciada	357	\N
169	ftorres	2013-07-08 10:48:18.627164	Evaluacion creada/iniciada	358	\N
170	ftorres	2013-07-08 10:49:11.942944	Evaluacion creada/iniciada	359	\N
171	ftorres	2013-07-08 10:50:49.568118	Evaluacion creada/iniciada	360	\N
172	egimenez	2013-07-08 10:51:00.080318	Evaluacion creada/iniciada	361	\N
173	ftorres	2013-07-08 10:54:12.433449	Evaluacion creada/iniciada	362	\N
174	ftorres	2013-07-08 10:55:52.652837	Evaluacion creada/iniciada	363	\N
175	rcastillo	2013-07-08 10:56:33.064811	Evaluacion creada/iniciada	364	\N
176	ftorres	2013-07-08 10:58:15.686414	Evaluacion creada/iniciada	365	\N
175	rcastillo	2013-07-08 11:13:39.581133	Evaluación realizada/modificada	371	\N
175	rcastillo	2013-07-08 11:13:55.079648	Evaluación enviada a Revision	372	\N
179	jguevara	2013-07-09 11:53:34.888518	Evaluacion creada/iniciada	377	\N
179	jguevara	2013-07-09 12:00:49.900473	Evaluación realizada/modificada	378	\N
179	jguevara	2013-07-09 12:02:53.763683	Evaluación enviada a Revision	381	\N
179	mduran	2013-07-09 12:27:07.696757	Evaluación aprovada por el analista	382	\N
94	ftorres	2013-07-09 13:50:53.480018	Evaluación realizada/modificada	383	\N
94	ftorres	2013-07-09 13:51:18.148199	Evaluación enviada a Revision	384	\N
182	erondon	2013-07-09 14:05:44.014791	Evaluacion creada/iniciada	386	\N
183	erondon	2013-07-09 14:06:42.859494	Evaluacion creada/iniciada	387	\N
184	erondon	2013-07-09 14:13:02.944897	Evaluacion creada/iniciada	389	\N
185	erondon	2013-07-09 14:14:06.321314	Evaluacion creada/iniciada	390	\N
186	erondon	2013-07-09 14:15:16.25953	Evaluacion creada/iniciada	391	\N
95	ftorres	2013-07-09 14:19:47.055706	Evaluación realizada/modificada	392	\N
95	ftorres	2013-07-09 14:20:29.709539	Evaluación enviada a Revision	393	\N
101	ftorres	2013-07-09 14:27:18.446607	Evaluación realizada/modificada	396	\N
101	ftorres	2013-07-09 14:28:26.511982	Evaluación enviada a Revision	397	\N
188	erondon	2013-07-09 14:57:07.884276	Evaluacion creada/iniciada	398	\N
189	erondon	2013-07-09 14:58:49.572445	Evaluacion creada/iniciada	399	\N
190	erondon	2013-07-09 14:59:34.583695	Evaluacion creada/iniciada	400	\N
102	ftorres	2013-07-09 14:59:39.007894	Evaluación realizada/modificada	401	\N
102	ftorres	2013-07-09 15:05:44.148287	Evaluación enviada a Revision	403	\N
192	lgonzalez	2013-07-09 15:10:19.710492	Evaluacion creada/iniciada	404	\N
104	ftorres	2013-07-09 15:14:49.791379	Evaluación realizada/modificada	406	\N
104	ftorres	2013-07-09 15:15:01.793769	Evaluación enviada a Revision	407	\N
192	lgonzalez	2013-07-09 15:15:10.063525	Evaluación realizada/modificada	408	\N
193	erondon	2013-07-09 15:16:34.740429	Evaluacion creada/iniciada	409	\N
194	erondon	2013-07-09 15:17:26.140807	Evaluacion creada/iniciada	410	\N
195	erondon	2013-07-09 15:18:28.920893	Evaluacion creada/iniciada	411	\N
196	lgonzalez	2013-07-09 15:18:43.876437	Evaluacion creada/iniciada	412	\N
134	ftorres	2013-07-09 15:19:25.015201	Evaluación realizada/modificada	413	\N
134	ftorres	2013-07-09 15:19:35.68407	Evaluación enviada a Revision	414	\N
197	erondon	2013-07-09 15:19:42.093827	Evaluacion creada/iniciada	415	\N
198	erondon	2013-07-09 15:20:41.262832	Evaluacion creada/iniciada	416	\N
196	lgonzalez	2013-07-09 15:22:18.747971	Evaluación realizada/modificada	417	\N
199	erondon	2013-07-09 15:23:30.911674	Evaluacion creada/iniciada	420	\N
138	ltorres	2013-07-09 15:24:37.349827	Evaluación realizada/modificada	423	\N
200	erondon	2013-07-09 15:25:09.00784	Evaluacion creada/iniciada	425	\N
201	erondon	2013-07-09 15:26:20.270308	Evaluacion creada/iniciada	426	\N
136	ftorres	2013-07-09 15:27:15.294593	Evaluación realizada/modificada	427	\N
136	ftorres	2013-07-09 15:27:29.510709	Evaluación enviada a Revision	428	\N
202	erondon	2013-07-09 15:27:35.995105	Evaluacion creada/iniciada	429	\N
86	mduran	2013-07-09 15:28:01.316348	Evaluación aprovada por el analista	430	\N
203	erondon	2013-07-09 15:28:25.385987	Evaluacion creada/iniciada	431	\N
134	mduran	2013-07-09 15:30:09.223852	Evaluación aprovada por el analista	432	\N
136	mduran	2013-07-09 15:31:17.87076	Evaluación aprovada por el analista	433	\N
104	mduran	2013-07-09 15:32:57.923072	Evaluación aprovada por el analista	434	\N
107	ftorres	2013-07-09 15:33:07.129991	Evaluación realizada/modificada	435	\N
204	erondon	2013-07-09 15:33:20.777092	Evaluacion creada/iniciada	436	\N
107	ftorres	2013-07-09 15:34:34.372492	Evaluación enviada a Revision	437	\N
94	mduran	2013-07-09 15:34:51.819646	Evaluación aprovada por el analista	438	\N
205	erondon	2013-07-09 15:35:30.011195	Evaluacion creada/iniciada	439	\N
95	mduran	2013-07-09 15:35:52.44919	Evaluación aprovada por el analista	440	\N
102	mduran	2013-07-09 15:37:28.526443	Evaluación aprovada por el analista	443	\N
109	ftorres	2013-07-09 15:39:49.513328	Evaluación realizada/modificada	447	\N
140	ltorres	2013-07-09 15:50:12.634232	Evaluación realizada/modificada	458	\N
144	ltorres	2013-07-09 16:05:03.076866	Evaluación enviada a Revision	461	\N
206	erondon	2013-07-09 16:07:29.532909	Evaluacion creada/iniciada	462	\N
207	erondon	2013-07-09 16:08:05.668362	Evaluacion creada/iniciada	463	\N
146	egimenez	2013-07-09 16:23:10.845383	Evaluación realizada/modificada	468	\N
146	egimenez	2013-07-09 16:23:25.75588	Evaluación enviada a Revision	469	\N
146	mduran	2013-07-09 16:29:42.989769	Evaluación aprovada por el analista	473	\N
211	erondon	2013-07-09 16:30:17.036326	Evaluacion creada/iniciada	474	\N
212	erondon	2013-07-09 16:31:43.410541	Evaluacion creada/iniciada	476	\N
216	erondon	2013-07-09 16:34:54.698845	Evaluacion creada/iniciada	483	\N
101	mduran	2013-07-09 15:36:39.224027	Evaluación aprovada por el analista	441	\N
107	mduran	2013-07-09 15:38:26.524667	Evaluación aprovada por el analista	445	\N
109	ftorres	2013-07-09 15:40:00.80317	Evaluación enviada a Revision	448	\N
110	ftorres	2013-07-09 15:42:57.488163	Evaluación realizada/modificada	450	\N
111	ftorres	2013-07-09 15:45:15.501606	Evaluación realizada/modificada	452	\N
114	ftorres	2013-07-09 15:47:55.374666	Evaluación realizada/modificada	454	\N
117	ftorres	2013-07-09 15:49:36.788522	Evaluación realizada/modificada	456	\N
140	ltorres	2013-07-09 15:50:23.651354	Evaluación enviada a Revision	459	\N
108	ftorres	2013-07-09 15:36:44.683288	Evaluación realizada/modificada	442	\N
108	ftorres	2013-07-09 15:37:41.936786	Evaluación enviada a Revision	444	\N
108	mduran	2013-07-09 15:39:17.324688	Evaluación aprovada por el analista	446	\N
138	ltorres	2013-07-09 15:41:24.339428	Evaluación enviada a Revision	449	\N
110	ftorres	2013-07-09 15:43:04.543163	Evaluación enviada a Revision	451	\N
111	ftorres	2013-07-09 15:45:23.022844	Evaluación enviada a Revision	453	\N
114	ftorres	2013-07-09 15:48:04.222583	Evaluación enviada a Revision	455	\N
117	ftorres	2013-07-09 15:49:42.80082	Evaluación enviada a Revision	457	\N
144	ltorres	2013-07-09 16:04:39.679004	Evaluación realizada/modificada	460	\N
141	egimenez	2013-07-09 16:13:10.225561	Evaluación realizada/modificada	464	\N
141	egimenez	2013-07-09 16:13:54.561451	Evaluación enviada a Revision	465	\N
208	erondon	2013-07-09 16:21:08.126602	Evaluacion creada/iniciada	466	\N
209	erondon	2013-07-09 16:22:30.440929	Evaluacion creada/iniciada	467	\N
210	erondon	2013-07-09 16:23:28.455337	Evaluacion creada/iniciada	470	\N
147	ltorres	2013-07-09 16:26:38.333648	Evaluación realizada/modificada	471	\N
147	ltorres	2013-07-09 16:26:49.408284	Evaluación enviada a Revision	472	\N
149	egimenez	2013-07-09 16:31:36.635446	Evaluación realizada/modificada	475	\N
149	egimenez	2013-07-09 16:31:50.670322	Evaluación enviada a Revision	477	\N
213	erondon	2013-07-09 16:32:20.682557	Evaluacion creada/iniciada	478	\N
141	mduran	2013-07-09 16:32:35.578218	Evaluación aprovada por el analista	479	\N
214	erondon	2013-07-09 16:33:13.128144	Evaluacion creada/iniciada	480	\N
149	mduran	2013-07-09 16:33:48.046255	Evaluación aprovada por el analista	481	\N
215	erondon	2013-07-09 16:33:55.885948	Evaluacion creada/iniciada	482	\N
110	mduran	2013-07-09 16:35:17.962147	Evaluación aprovada por el analista	484	\N
217	erondon	2013-07-09 16:35:58.977252	Evaluacion creada/iniciada	485	\N
111	mduran	2013-07-09 16:36:14.006103	Evaluación aprovada por el analista	486	\N
218	erondon	2013-07-09 16:36:44.804672	Evaluacion creada/iniciada	487	\N
219	erondon	2013-07-09 16:37:20.617516	Evaluacion creada/iniciada	488	\N
109	mduran	2013-07-09 16:37:31.872292	Evaluación aprovada por el analista	489	\N
220	erondon	2013-07-09 16:37:49.537927	Evaluacion creada/iniciada	490	\N
221	erondon	2013-07-09 16:38:21.404282	Evaluacion creada/iniciada	491	\N
151	ltorres	2013-07-09 16:38:29.442505	Evaluación realizada/modificada	492	\N
151	ltorres	2013-07-09 16:38:43.976574	Evaluación enviada a Revision	493	\N
114	mduran	2013-07-09 16:39:22.952189	Evaluación aprovada por el analista	494	\N
222	erondon	2013-07-09 16:39:34.299052	Evaluacion creada/iniciada	495	\N
223	erondon	2013-07-09 16:40:25.10539	Evaluacion creada/iniciada	496	\N
117	mduran	2013-07-09 16:40:29.530935	Evaluación aprovada por el analista	497	\N
224	erondon	2013-07-09 16:41:09.629522	Evaluacion creada/iniciada	498	\N
225	erondon	2013-07-09 16:41:37.281216	Evaluacion creada/iniciada	499	\N
226	erondon	2013-07-09 16:42:15.699013	Evaluacion creada/iniciada	500	\N
154	egimenez	2013-07-09 16:42:55.765539	Evaluación realizada/modificada	501	\N
227	erondon	2013-07-09 16:43:02.575767	Evaluacion creada/iniciada	502	\N
154	egimenez	2013-07-09 16:43:10.562736	Evaluación enviada a Revision	503	\N
140	mduran	2013-07-09 16:43:31.013259	Evaluación aprovada por el analista	504	\N
228	erondon	2013-07-09 16:43:55.324022	Evaluacion creada/iniciada	505	\N
229	erondon	2013-07-09 16:44:54.652755	Evaluacion creada/iniciada	506	\N
151	mduran	2013-07-09 16:45:04.295566	Evaluación aprovada por el analista	507	\N
230	erondon	2013-07-09 16:45:40.530903	Evaluacion creada/iniciada	508	\N
144	mduran	2013-07-09 16:45:58.810342	Evaluación aprovada por el analista	509	\N
231	erondon	2013-07-09 16:46:57.75826	Evaluacion creada/iniciada	510	\N
138	mduran	2013-07-09 16:47:02.150621	Evaluación aprovada por el analista	511	\N
232	erondon	2013-07-09 16:47:45.533265	Evaluacion creada/iniciada	512	\N
233	erondon	2013-07-09 16:48:14.087842	Evaluacion creada/iniciada	513	\N
113	erondon	2013-07-09 16:54:13.160106	Evaluación realizada/modificada	514	\N
158	egimenez	2013-07-09 17:02:38.341363	Evaluación realizada/modificada	515	\N
158	egimenez	2013-07-09 17:02:51.663883	Evaluación enviada a Revision	516	\N
161	egimenez	2013-07-09 17:08:23.442734	Evaluación realizada/modificada	517	\N
161	egimenez	2013-07-09 17:08:30.097695	Evaluación enviada a Revision	518	\N
164	egimenez	2013-07-09 17:15:52.361313	Evaluación realizada/modificada	519	\N
164	egimenez	2013-07-09 17:16:01.491538	Evaluación enviada a Revision	520	\N
152	ltorres	2013-07-09 17:37:00.71194	Evaluación realizada/modificada	521	\N
152	ltorres	2013-07-09 17:37:06.944761	Evaluación enviada a Revision	522	\N
156	ltorres	2013-07-09 17:47:08.971949	Evaluación realizada/modificada	523	\N
156	ltorres	2013-07-09 17:47:23.700635	Evaluación enviada a Revision	524	\N
157	ltorres	2013-07-09 17:54:26.386026	Evaluación realizada/modificada	525	\N
157	ltorres	2013-07-09 17:54:33.081248	Evaluación enviada a Revision	526	\N
172	egimenez	2013-07-09 18:04:52.902874	Evaluación realizada/modificada	527	\N
172	egimenez	2013-07-09 18:05:02.831877	Evaluación enviada a Revision	528	\N
166	egimenez	2013-07-09 18:10:06.883263	Evaluación realizada/modificada	529	\N
160	ltorres	2013-07-09 18:10:12.66364	Evaluación realizada/modificada	530	\N
166	egimenez	2013-07-09 18:10:17.213822	Evaluación enviada a Revision	531	\N
160	ltorres	2013-07-09 18:10:24.749722	Evaluación enviada a Revision	532	\N
98	jochoa	2013-07-09 19:01:26.395316	Evaluación realizada/modificada	533	\N
100	jochoa	2013-07-09 19:10:01.253493	Evaluación realizada/modificada	534	\N
103	jochoa	2013-07-09 19:15:18.948141	Evaluación realizada/modificada	535	\N
106	jochoa	2013-07-09 19:19:48.616011	Evaluación realizada/modificada	536	\N
112	jochoa	2013-07-09 19:23:43.624113	Evaluación realizada/modificada	537	\N
234	jochoa	2013-07-09 19:25:15.762604	Evaluacion creada/iniciada	538	\N
234	jochoa	2013-07-09 19:27:31.217111	Evaluación realizada/modificada	539	\N
235	jochoa	2013-07-09 19:31:45.083333	Evaluacion creada/iniciada	541	\N
235	jochoa	2013-07-09 19:33:33.892871	Evaluación realizada/modificada	542	\N
236	jochoa	2013-07-09 19:37:05.933005	Evaluacion creada/iniciada	544	\N
236	jochoa	2013-07-09 19:39:44.481617	Evaluación realizada/modificada	545	\N
118	jochoa	2013-07-09 19:41:51.779898	Evaluación realizada/modificada	546	\N
120	jochoa	2013-07-09 19:44:20.954458	Evaluación realizada/modificada	547	\N
122	jochoa	2013-07-09 19:47:52.606453	Evaluación realizada/modificada	548	\N
124	jochoa	2013-07-09 19:50:54.370706	Evaluación realizada/modificada	549	\N
125	jochoa	2013-07-09 19:52:50.235566	Evaluación realizada/modificada	550	\N
126	jochoa	2013-07-09 19:54:46.458063	Evaluación realizada/modificada	551	\N
237	jochoa	2013-07-09 19:55:52.175546	Evaluacion creada/iniciada	552	\N
237	jochoa	2013-07-09 19:57:55.190801	Evaluación realizada/modificada	553	\N
129	jochoa	2013-07-09 20:04:27.289357	Evaluación realizada/modificada	555	\N
128	jochoa	2013-07-09 20:03:09.27897	Evaluación realizada/modificada	554	\N
98	jochoa	2013-07-09 20:06:31.49269	Evaluación enviada a Revision	556	\N
100	jochoa	2013-07-09 20:06:55.373002	Evaluación enviada a Revision	557	\N
103	jochoa	2013-07-09 20:07:18.745233	Evaluación enviada a Revision	558	\N
106	jochoa	2013-07-09 20:07:49.696978	Evaluación enviada a Revision	559	\N
112	jochoa	2013-07-09 20:08:18.003739	Evaluación enviada a Revision	560	\N
234	jochoa	2013-07-09 20:08:47.373041	Evaluación enviada a Revision	561	\N
235	jochoa	2013-07-09 20:10:27.925193	Evaluación enviada a Revision	563	\N
236	jochoa	2013-07-09 20:11:37.48024	Evaluación enviada a Revision	565	\N
118	jochoa	2013-07-09 20:12:25.208527	Evaluación enviada a Revision	566	\N
120	jochoa	2013-07-09 20:12:58.056344	Evaluación enviada a Revision	567	\N
122	jochoa	2013-07-09 20:13:41.955742	Evaluación enviada a Revision	568	\N
124	jochoa	2013-07-09 20:14:18.522935	Evaluación enviada a Revision	569	\N
125	jochoa	2013-07-09 20:14:49.844903	Evaluación enviada a Revision	570	\N
126	jochoa	2013-07-09 20:15:15.918377	Evaluación enviada a Revision	571	\N
237	jochoa	2013-07-09 20:15:41.076396	Evaluación enviada a Revision	572	\N
128	jochoa	2013-07-09 20:16:47.494693	Evaluación enviada a Revision	573	\N
129	jochoa	2013-07-09 20:17:23.231611	Evaluación enviada a Revision	574	\N
156	jalonso	2013-07-10 08:09:33.846517	Evaluación aprovada por el analista	575	\N
156	jalonso	2013-07-10 08:09:41.870021	Evaluación aprovada por el analista	576	\N
156	jalonso	2013-07-10 08:09:50.662263	Evaluación aprovada por el analista	577	\N
156	jalonso	2013-07-10 08:10:01.414647	Evaluación aprovada por el analista	578	\N
156	jalonso	2013-07-10 08:10:21.406504	Evaluación aprovada por el analista	579	\N
156	jalonso	2013-07-10 08:10:42.375428	Evaluación aprovada por el analista	580	\N
156	jalonso	2013-07-10 08:12:03.46465	Evaluación aprovada por el analista	581	\N
157	jalonso	2013-07-10 08:13:20.045305	Evaluación aprovada por el analista	582	\N
157	jalonso	2013-07-10 08:13:27.654601	Evaluación aprovada por el analista	583	\N
119	ftorres	2013-07-10 08:20:33.485451	Evaluación realizada/modificada	584	\N
119	ftorres	2013-07-10 08:20:41.230133	Evaluación enviada a Revision	585	\N
160	jalonso	2013-07-10 08:21:58.250884	Evaluación aprovada por el analista	586	\N
121	ftorres	2013-07-10 08:22:08.816179	Evaluación realizada/modificada	587	\N
121	ftorres	2013-07-10 08:22:16.276222	Evaluación enviada a Revision	588	\N
133	ftorres	2013-07-10 08:23:50.962791	Evaluación realizada/modificada	589	\N
133	ftorres	2013-07-10 08:23:59.057441	Evaluación enviada a Revision	590	\N
152	jalonso	2013-07-10 08:24:36.57741	Evaluación aprovada por el analista	591	\N
152	jalonso	2013-07-10 08:24:43.899269	Evaluación aprovada por el analista	592	\N
123	ftorres	2013-07-10 08:25:31.10127	Evaluación realizada/modificada	593	\N
123	ftorres	2013-07-10 08:25:54.821229	Evaluación enviada a Revision	594	\N
119	jalonso	2013-07-10 08:26:24.671873	Evaluación aprovada por el analista	595	\N
130	ftorres	2013-07-10 08:26:59.940241	Evaluación realizada/modificada	596	\N
130	ftorres	2013-07-10 08:27:08.564155	Evaluación enviada a Revision	597	\N
121	jalonso	2013-07-10 08:27:16.785254	Evaluación aprovada por el analista	598	\N
130	jalonso	2013-07-10 08:28:16.130649	Evaluación aprovada por el analista	599	\N
123	jalonso	2013-07-10 08:29:42.67886	Evaluación aprovada por el analista	600	\N
123	jalonso	2013-07-10 08:29:53.468378	Evaluación aprovada por el analista	601	\N
131	ftorres	2013-07-10 08:30:58.107994	Evaluación realizada/modificada	602	\N
133	jalonso	2013-07-10 08:31:07.527152	Evaluación aprovada por el analista	603	\N
131	ftorres	2013-07-10 08:31:33.306485	Evaluación enviada a Revision	604	\N
172	jalonso	2013-07-10 08:32:30.547534	Evaluación aprovada por el analista	605	\N
131	jalonso	2013-07-10 08:33:24.956271	Evaluación aprovada por el analista	606	\N
154	jalonso	2013-07-10 08:34:26.2544	Evaluación aprovada por el analista	607	\N
238	alugo	2013-07-10 08:34:48.531773	Evaluacion creada/iniciada	608	\N
239	alugo	2013-07-10 08:35:35.772259	Evaluacion creada/iniciada	609	\N
166	jalonso	2013-07-10 08:35:49.172983	Evaluación aprovada por el analista	610	\N
240	alugo	2013-07-10 08:36:26.193761	Evaluacion creada/iniciada	611	\N
135	ftorres	2013-07-10 08:36:34.103106	Evaluación realizada/modificada	612	\N
135	ftorres	2013-07-10 08:36:46.124772	Evaluación enviada a Revision	613	\N
161	jalonso	2013-07-10 08:36:54.344067	Evaluación aprovada por el analista	614	\N
241	alugo	2013-07-10 08:37:21.372343	Evaluacion creada/iniciada	615	\N
158	jalonso	2013-07-10 08:38:03.348506	Evaluación aprovada por el analista	616	\N
137	ftorres	2013-07-10 08:38:29.018477	Evaluación realizada/modificada	617	\N
137	ftorres	2013-07-10 08:38:35.30117	Evaluación enviada a Revision	618	\N
164	jalonso	2013-07-10 08:39:12.751891	Evaluación aprovada por el analista	619	\N
139	ftorres	2013-07-10 08:39:59.274023	Evaluación realizada/modificada	620	\N
139	ftorres	2013-07-10 08:40:06.591526	Evaluación enviada a Revision	621	\N
142	ftorres	2013-07-10 08:41:27.534573	Evaluación realizada/modificada	622	\N
142	ftorres	2013-07-10 08:41:35.061254	Evaluación enviada a Revision	623	\N
238	alugo	2013-07-10 08:41:39.505877	Evaluación realizada/modificada	624	\N
135	jalonso	2013-07-10 08:42:13.131149	Evaluación aprovada por el analista	625	\N
238	alugo	2013-07-10 08:43:15.291719	Evaluación enviada a Revision	626	\N
143	ftorres	2013-07-10 08:43:22.797353	Evaluación realizada/modificada	627	\N
143	ftorres	2013-07-10 08:43:30.696217	Evaluación enviada a Revision	628	\N
145	ftorres	2013-07-10 08:44:41.352174	Evaluación realizada/modificada	629	\N
145	ftorres	2013-07-10 08:44:49.114752	Evaluación enviada a Revision	630	\N
137	jalonso	2013-07-10 08:46:20.921878	Evaluación aprovada por el analista	631	\N
148	ftorres	2013-07-10 08:46:31.849278	Evaluación realizada/modificada	632	\N
148	ftorres	2013-07-10 08:46:43.305036	Evaluación enviada a Revision	633	\N
143	jalonso	2013-07-10 08:47:14.951872	Evaluación aprovada por el analista	634	\N
142	jalonso	2013-07-10 08:48:03.49714	Evaluación aprovada por el analista	635	\N
150	ftorres	2013-07-10 08:48:18.859309	Evaluación realizada/modificada	636	\N
239	alugo	2013-07-10 08:48:27.999764	Evaluación realizada/modificada	637	\N
239	alugo	2013-07-10 08:48:39.095161	Evaluación enviada a Revision	638	\N
148	jalonso	2013-07-10 08:49:20.758989	Evaluación aprovada por el analista	639	\N
150	ftorres	2013-07-10 08:49:34.334702	Evaluación enviada a Revision	640	\N
153	ftorres	2013-07-10 08:50:38.657	Evaluación realizada/modificada	641	\N
153	ftorres	2013-07-10 08:50:48.043898	Evaluación enviada a Revision	642	\N
155	ftorres	2013-07-10 08:52:00.590408	Evaluación realizada/modificada	643	\N
155	ftorres	2013-07-10 08:52:08.89359	Evaluación enviada a Revision	644	\N
159	ftorres	2013-07-10 08:53:02.647269	Evaluación realizada/modificada	645	\N
159	ftorres	2013-07-10 08:53:12.253536	Evaluación enviada a Revision	646	\N
145	jalonso	2013-07-10 08:53:16.944214	Evaluación aprovada por el analista	647	\N
240	alugo	2013-07-10 08:53:27.388752	Evaluación realizada/modificada	648	\N
240	alugo	2013-07-10 08:53:40.691887	Evaluación enviada a Revision	649	\N
162	ftorres	2013-07-10 08:54:40.907107	Evaluación realizada/modificada	650	\N
162	ftorres	2013-07-10 08:54:48.75031	Evaluación enviada a Revision	651	\N
153	jalonso	2013-07-10 08:55:09.096652	Evaluación aprovada por el analista	652	\N
163	ftorres	2013-07-10 08:55:40.832941	Evaluación realizada/modificada	653	\N
163	ftorres	2013-07-10 08:55:48.275532	Evaluación enviada a Revision	654	\N
165	ftorres	2013-07-10 08:57:07.107471	Evaluación realizada/modificada	655	\N
165	ftorres	2013-07-10 08:57:25.822449	Evaluación enviada a Revision	656	\N
162	jalonso	2013-07-10 08:57:49.547444	Evaluación aprovada por el analista	657	\N
167	ftorres	2013-07-10 08:58:26.486679	Evaluación realizada/modificada	658	\N
167	ftorres	2013-07-10 08:58:33.154379	Evaluación enviada a Revision	659	\N
163	jalonso	2013-07-10 08:59:55.315908	Evaluación aprovada por el analista	660	\N
168	ftorres	2013-07-10 09:00:40.922358	Evaluación realizada/modificada	661	\N
168	ftorres	2013-07-10 09:01:13.294306	Evaluación enviada a Revision	662	\N
241	alugo	2013-07-10 09:01:13.375714	Evaluación realizada/modificada	663	\N
241	alugo	2013-07-10 09:01:27.341945	Evaluación enviada a Revision	664	\N
169	ftorres	2013-07-10 09:04:36.95491	Evaluación realizada/modificada	665	\N
169	ftorres	2013-07-10 09:04:44.264259	Evaluación enviada a Revision	666	\N
170	ftorres	2013-07-10 09:06:13.783787	Evaluación realizada/modificada	667	\N
170	ftorres	2013-07-10 09:06:22.278253	Evaluación enviada a Revision	668	\N
239	jalonso	2013-07-10 09:07:04.846122	Evaluación aprovada por el analista	669	\N
168	jalonso	2013-07-10 09:07:41.35563	Evaluación aprovada por el analista	670	\N
165	jalonso	2013-07-10 09:08:20.086314	Evaluación aprovada por el analista	671	\N
96	jochoa	2013-07-10 09:08:26.61875	Evaluación realizada/modificada	672	\N
96	jochoa	2013-07-10 09:08:34.488498	Evaluación enviada a Revision	673	\N
159	jalonso	2013-07-10 09:09:06.19043	Evaluación aprovada por el analista	674	\N
171	ftorres	2013-07-10 09:09:18.261828	Evaluación realizada/modificada	675	\N
171	ftorres	2013-07-10 09:09:25.369372	Evaluación enviada a Revision	676	\N
139	jalonso	2013-07-10 09:10:24.009243	Evaluación aprovada por el analista	677	\N
155	jalonso	2013-07-10 09:11:09.857488	Evaluación aprovada por el analista	678	\N
150	jalonso	2013-07-10 09:12:05.108971	Evaluación aprovada por el analista	679	\N
171	jalonso	2013-07-10 09:12:56.317157	Evaluación aprovada por el analista	680	\N
173	ftorres	2013-07-10 09:13:14.338827	Evaluación realizada/modificada	681	\N
97	jochoa	2013-07-10 09:13:20.785623	Evaluación realizada/modificada	682	\N
173	ftorres	2013-07-10 09:13:24.750166	Evaluación enviada a Revision	683	\N
97	jochoa	2013-07-10 09:13:30.32403	Evaluación enviada a Revision	684	\N
127	jochoa	2013-07-10 09:15:27.8803	Evaluación realizada/modificada	685	\N
127	jochoa	2013-07-10 09:15:34.248059	Evaluación enviada a Revision	686	\N
170	jalonso	2013-07-10 09:16:23.057227	Evaluación aprovada por el analista	687	\N
173	jalonso	2013-07-10 09:17:04.462198	Evaluación aprovada por el analista	688	\N
169	jalonso	2013-07-10 09:17:54.601279	Evaluación aprovada por el analista	689	\N
167	jalonso	2013-07-10 09:18:39.496203	Evaluación aprovada por el analista	690	\N
236	jalonso	2013-07-10 09:21:11.218746	Evaluación aprovada por el analista	691	\N
147	jalonso	2013-07-10 09:22:50.041007	Evaluación aprovada por el analista	692	\N
125	mduran	2013-07-10 09:23:27.922108	Evaluación aprovada por el analista	693	\N
126	mduran	2013-07-10 09:24:31.478466	Evaluación aprovada por el analista	694	\N
128	mduran	2013-07-10 09:26:24.54389	Evaluación aprovada por el analista	695	\N
129	mduran	2013-07-10 09:27:07.537003	Evaluación aprovada por el analista	696	\N
127	mduran	2013-07-10 09:27:48.87921	Evaluación aprovada por el analista	697	\N
112	mduran	2013-07-10 09:28:32.4146	Evaluación aprovada por el analista	698	\N
234	mduran	2013-07-10 09:29:20.532239	Evaluación aprovada por el analista	699	\N
237	mduran	2013-07-10 09:30:22.063989	Evaluación aprovada por el analista	700	\N
241	mduran	2013-07-10 09:31:24.090939	Evaluación aprovada por el analista	701	\N
100	mduran	2013-07-10 09:32:10.837323	Evaluación aprovada por el analista	702	\N
103	mduran	2013-07-10 09:33:18.060446	Evaluación aprovada por el analista	703	\N
97	mduran	2013-07-10 09:34:03.390061	Evaluación aprovada por el analista	704	\N
106	mduran	2013-07-10 09:35:08.151996	Evaluación aprovada por el analista	705	\N
98	mduran	2013-07-10 09:35:59.524365	Evaluación aprovada por el analista	706	\N
96	jalonso	2013-07-10 09:36:13.917454	Evaluación aprovada por el analista	707	\N
235	mduran	2013-07-10 09:37:52.377325	Evaluación aprovada por el analista	708	\N
238	mduran	2013-07-10 09:41:28.769636	Evaluación aprovada por el analista	709	\N
113	erondon	2013-07-10 09:41:50.090603	Evaluación realizada/modificada	710	\N
113	erondon	2013-07-10 09:42:03.377546	Evaluación enviada a Revision	711	\N
118	mduran	2013-07-10 09:44:24.873158	Evaluación aprovada por el analista	714	\N
122	mduran	2013-07-10 09:46:09.197049	Evaluación aprovada por el analista	715	\N
124	mduran	2013-07-10 09:46:47.116629	Evaluación aprovada por el analista	716	\N
240	mduran	2013-07-10 09:47:21.85249	Evaluación aprovada por el analista	717	\N
120	mduran	2013-07-10 09:50:54.51749	Evaluación aprovada por el analista	718	\N
113	mduran	2013-07-10 09:52:08.506734	Evaluación aprovada por el analista	719	\N
174	ftorres	2013-07-10 10:12:17.858521	Evaluación realizada/modificada	720	\N
174	ftorres	2013-07-10 10:12:24.211746	Evaluación enviada a Revision	721	\N
176	ftorres	2013-07-10 10:13:23.40342	Evaluación realizada/modificada	722	\N
176	ftorres	2013-07-10 10:13:30.076104	Evaluación enviada a Revision	723	\N
176	jalonso	2013-07-10 10:36:35.628055	Evaluación aprovada por el analista	724	\N
174	jalonso	2013-07-10 10:38:06.748467	Evaluación aprovada por el analista	725	\N
132	ftorres	2013-07-10 10:48:04.002999	Evaluación realizada/modificada	726	\N
132	ftorres	2013-07-10 10:48:11.173878	Evaluación enviada a Revision	727	\N
242	jochoa	2013-07-10 11:04:14.655897	Evaluación enviada a Revision	731	\N
182	erondon	2013-07-10 11:06:07.431777	Evaluación realizada/modificada	732	\N
182	erondon	2013-07-10 11:06:25.071876	Evaluación enviada a Revision	733	\N
99	jochoa	2013-07-10 10:53:09.96867	Evaluación enviada a Revision	728	\N
242	jochoa	2013-07-10 10:54:08.226943	Evaluacion creada/iniciada	729	\N
242	jochoa	2013-07-10 11:04:00.910387	Evaluación realizada/modificada	730	\N
243	jochoa	2013-07-10 11:06:32.427342	Evaluacion creada/iniciada	734	\N
244	ajaspe	2013-07-10 11:10:12.193866	Evaluacion creada/iniciada	735	\N
245	ajaspe	2013-07-10 11:10:37.498181	Evaluacion creada/iniciada	736	\N
246	ajaspe	2013-07-10 11:11:03.707113	Evaluacion creada/iniciada	737	\N
243	jochoa	2013-07-10 11:19:07.097457	Evaluación realizada/modificada	738	\N
243	jochoa	2013-07-10 11:19:18.606605	Evaluación enviada a Revision	739	\N
247	jochoa	2013-07-10 11:20:44.051318	Evaluacion creada/iniciada	740	\N
247	jochoa	2013-07-10 11:30:38.827371	Evaluación realizada/modificada	741	\N
247	jochoa	2013-07-10 11:30:56.336024	Evaluación enviada a Revision	742	\N
248	jochoa	2013-07-10 11:31:59.813136	Evaluacion creada/iniciada	743	\N
248	jochoa	2013-07-10 11:43:19.074954	Evaluación realizada/modificada	744	\N
248	jochoa	2013-07-10 11:43:29.36575	Evaluación enviada a Revision	745	\N
249	jochoa	2013-07-10 11:44:36.550757	Evaluacion creada/iniciada	746	\N
249	jochoa	2013-07-10 11:49:19.136756	Evaluación realizada/modificada	747	\N
249	jochoa	2013-07-10 11:49:26.715411	Evaluación enviada a Revision	748	\N
250	jochoa	2013-07-10 11:50:55.531029	Evaluacion creada/iniciada	749	\N
183	erondon	2013-07-10 11:57:16.368722	Evaluación realizada/modificada	750	\N
183	erondon	2013-07-10 11:57:36.400648	Evaluación enviada a Revision	751	\N
251	tgalindo	2013-07-10 11:57:44.778956	Evaluacion creada/iniciada	752	\N
250	jochoa	2013-07-10 11:58:13.407685	Evaluación realizada/modificada	753	\N
250	jochoa	2013-07-10 11:58:23.659619	Evaluación enviada a Revision	754	\N
252	jochoa	2013-07-10 11:59:34.220005	Evaluacion creada/iniciada	755	\N
99	mduran	2013-07-10 12:01:04.791188	Evaluación aprovada por el analista	756	\N
251	tgalindo	2013-07-10 12:02:32.560254	Evaluación realizada/modificada	757	\N
251	tgalindo	2013-07-10 12:02:43.230716	Evaluación enviada a Revision	758	\N
249	mduran	2013-07-10 12:03:30.261005	Evaluación aprovada por el analista	759	\N
252	jochoa	2013-07-10 12:04:20.86107	Evaluación realizada/modificada	760	\N
251	mduran	2013-07-10 12:04:25.280413	Evaluación aprovada por el analista	761	\N
252	jochoa	2013-07-10 12:04:33.025293	Evaluación enviada a Revision	762	\N
184	erondon	2013-07-10 12:05:04.178906	Evaluación realizada/modificada	763	\N
184	erondon	2013-07-10 12:05:10.910174	Evaluación enviada a Revision	764	\N
253	jochoa	2013-07-10 12:06:07.320809	Evaluacion creada/iniciada	765	\N
250	mduran	2013-07-10 12:06:43.828735	Evaluación aprovada por el analista	766	\N
252	mduran	2013-07-10 12:07:48.980969	Evaluación aprovada por el analista	767	\N
253	jochoa	2013-07-10 12:09:12.362007	Evaluación realizada/modificada	768	\N
243	mduran	2013-07-10 12:09:27.28313	Evaluación aprovada por el analista	769	\N
253	jochoa	2013-07-10 12:09:28.475176	Evaluación enviada a Revision	770	\N
254	jochoa	2013-07-10 12:10:39.684945	Evaluacion creada/iniciada	771	\N
175	mduran	2013-07-10 12:11:58.658858	Evaluación aprovada por el analista	772	\N
253	mduran	2013-07-10 12:12:38.68887	Evaluación aprovada por el analista	773	\N
248	mduran	2013-07-10 12:13:19.700952	Evaluación aprovada por el analista	774	\N
254	jochoa	2013-07-10 12:13:40.599853	Evaluación realizada/modificada	775	\N
254	jochoa	2013-07-10 12:13:50.280818	Evaluación enviada a Revision	776	\N
247	mduran	2013-07-10 12:14:20.851745	Evaluación aprovada por el analista	777	\N
254	mduran	2013-07-10 12:15:33.301617	Evaluación aprovada por el analista	778	\N
255	jochoa	2013-07-10 12:16:00.296442	Evaluacion creada/iniciada	779	\N
242	mduran	2013-07-10 12:17:30.961167	Evaluación aprovada por el analista	780	\N
255	jochoa	2013-07-10 12:22:45.996899	Evaluación realizada/modificada	781	\N
255	jochoa	2013-07-10 12:22:54.554749	Evaluación enviada a Revision	782	\N
256	jochoa	2013-07-10 12:24:17.942125	Evaluacion creada/iniciada	783	\N
256	jochoa	2013-07-10 12:27:04.177299	Evaluación realizada/modificada	784	\N
256	jochoa	2013-07-10 12:27:13.024755	Evaluación enviada a Revision	785	\N
257	jochoa	2013-07-10 12:27:58.924108	Evaluacion creada/iniciada	786	\N
257	jochoa	2013-07-10 12:34:56.376298	Evaluación realizada/modificada	787	\N
257	jochoa	2013-07-10 12:35:03.916067	Evaluación enviada a Revision	788	\N
258	jochoa	2013-07-10 12:36:09.375393	Evaluacion creada/iniciada	789	\N
258	jochoa	2013-07-10 12:39:01.076103	Evaluación realizada/modificada	790	\N
258	jochoa	2013-07-10 12:39:09.105583	Evaluación enviada a Revision	791	\N
259	jochoa	2013-07-10 12:40:12.533178	Evaluacion creada/iniciada	792	\N
259	jochoa	2013-07-10 12:43:46.482758	Evaluación realizada/modificada	793	\N
259	jochoa	2013-07-10 12:43:57.390259	Evaluación enviada a Revision	794	\N
260	jochoa	2013-07-10 12:45:02.082195	Evaluacion creada/iniciada	795	\N
260	jochoa	2013-07-10 12:47:51.947998	Evaluación realizada/modificada	796	\N
260	jochoa	2013-07-10 12:47:59.122469	Evaluación enviada a Revision	797	\N
261	jochoa	2013-07-10 12:49:00.862845	Evaluacion creada/iniciada	798	\N
261	jochoa	2013-07-10 12:50:33.283786	Evaluación realizada/modificada	799	\N
261	jochoa	2013-07-10 12:50:47.221496	Evaluación enviada a Revision	800	\N
262	jochoa	2013-07-10 12:59:42.30225	Evaluacion creada/iniciada	801	\N
262	jochoa	2013-07-10 13:01:19.50546	Evaluación realizada/modificada	802	\N
183	mduran	2013-07-10 13:02:11.401564	Evaluación aprovada por el analista	803	\N
184	mduran	2013-07-10 13:02:59.363009	Evaluación aprovada por el analista	804	\N
182	mduran	2013-07-10 13:04:12.663591	Evaluación aprovada por el analista	805	\N
132	mduran	2013-07-10 13:04:55.275174	Evaluación aprovada por el analista	806	\N
259	mduran	2013-07-10 13:05:43.881553	Evaluación aprovada por el analista	807	\N
256	mduran	2013-07-10 13:06:27.592168	Evaluación aprovada por el analista	808	\N
257	mduran	2013-07-10 13:07:27.53582	Evaluación aprovada por el analista	809	\N
260	mduran	2013-07-10 13:08:06.193213	Evaluación aprovada por el analista	810	\N
261	mduran	2013-07-10 13:08:56.917444	Evaluación aprovada por el analista	811	\N
258	mduran	2013-07-10 13:09:50.26111	Evaluación aprovada por el analista	812	\N
255	mduran	2013-07-10 13:24:51.538654	Evaluación aprovada por el analista	813	\N
185	erondon	2013-07-10 13:35:35.309277	Evaluación realizada/modificada	814	\N
185	erondon	2013-07-10 13:35:45.117275	Evaluación enviada a Revision	815	\N
190	erondon	2013-07-10 13:53:20.042917	Evaluación realizada/modificada	816	\N
190	erondon	2013-07-10 13:53:30.785252	Evaluación enviada a Revision	817	\N
186	erondon	2013-07-10 13:59:53.823141	Evaluación realizada/modificada	818	\N
186	erondon	2013-07-10 14:00:02.64867	Evaluación enviada a Revision	819	\N
188	erondon	2013-07-10 14:07:45.329141	Evaluación realizada/modificada	820	\N
188	erondon	2013-07-10 14:08:13.398799	Evaluación enviada a Revision	821	\N
189	erondon	2013-07-10 14:12:38.297354	Evaluación enviada a Revision	823	\N
193	erondon	2013-07-10 14:18:58.637557	Evaluación enviada a Revision	825	\N
197	erondon	2013-07-10 14:22:32.772643	Evaluación enviada a Revision	827	\N
233	erondon	2013-07-10 14:30:07.271073	Evaluación enviada a Revision	829	\N
232	erondon	2013-07-10 14:42:12.671879	Evaluación enviada a Revision	831	\N
189	erondon	2013-07-10 14:12:26.854937	Evaluación realizada/modificada	822	\N
193	erondon	2013-07-10 14:18:06.872756	Evaluación realizada/modificada	824	\N
197	erondon	2013-07-10 14:22:26.176373	Evaluación realizada/modificada	826	\N
233	erondon	2013-07-10 14:29:57.168182	Evaluación realizada/modificada	828	\N
232	erondon	2013-07-10 14:41:32.187313	Evaluación realizada/modificada	830	\N
231	erondon	2013-07-10 14:53:27.703878	Evaluación enviada a Revision	833	\N
231	erondon	2013-07-10 14:53:20.682304	Evaluación realizada/modificada	832	\N
218	erondon	2013-07-10 14:57:46.902224	Evaluación realizada/modificada	834	\N
218	erondon	2013-07-10 14:57:55.174514	Evaluación enviada a Revision	835	\N
194	erondon	2013-07-10 15:03:29.153076	Evaluación realizada/modificada	836	\N
194	erondon	2013-07-10 15:03:36.057431	Evaluación enviada a Revision	837	\N
226	erondon	2013-07-10 15:07:57.133777	Evaluación realizada/modificada	838	\N
226	erondon	2013-07-10 15:08:04.631802	Evaluación enviada a Revision	839	\N
205	erondon	2013-07-10 15:13:48.485671	Evaluación realizada/modificada	840	\N
205	erondon	2013-07-10 15:13:55.879768	Evaluación enviada a Revision	841	\N
210	erondon	2013-07-10 15:18:41.108241	Evaluación realizada/modificada	842	\N
210	erondon	2013-07-10 15:18:47.943671	Evaluación enviada a Revision	843	\N
216	erondon	2013-07-10 15:29:30.420894	Evaluación realizada/modificada	844	\N
216	erondon	2013-07-10 15:29:39.840246	Evaluación enviada a Revision	845	\N
195	erondon	2013-07-10 16:47:05.981955	Evaluación realizada/modificada	846	\N
195	erondon	2013-07-10 16:47:11.358158	Evaluación enviada a Revision	847	\N
198	erondon	2013-07-10 16:49:13.595715	Evaluación realizada/modificada	848	\N
198	erondon	2013-07-10 16:49:22.513249	Evaluación enviada a Revision	849	\N
230	erondon	2013-07-10 16:51:12.383964	Evaluación realizada/modificada	850	\N
230	erondon	2013-07-10 16:51:20.803335	Evaluación enviada a Revision	851	\N
199	erondon	2013-07-10 16:53:57.47697	Evaluación realizada/modificada	852	\N
199	erondon	2013-07-10 16:54:04.426794	Evaluación enviada a Revision	853	\N
226	jalonso	2013-07-10 17:03:31.554704	Evaluación aprovada por el analista	854	\N
199	jalonso	2013-07-10 17:04:17.983976	Evaluación aprovada por el analista	855	\N
230	jalonso	2013-07-10 17:04:55.607125	Evaluación aprovada por el analista	856	\N
233	jalonso	2013-07-10 17:05:31.797757	Evaluación aprovada por el analista	857	\N
195	jalonso	2013-07-10 17:06:52.836184	Evaluación aprovada por el analista	858	\N
210	mduran	2013-07-10 17:07:05.508424	Evaluación aprovada por el analista	859	\N
185	mduran	2013-07-10 17:08:59.53483	Evaluación aprovada por el analista	860	\N
198	jalonso	2013-07-10 17:09:04.378167	Evaluación aprovada por el analista	861	\N
216	jalonso	2013-07-10 17:09:52.325755	Evaluación aprovada por el analista	862	\N
190	mduran	2013-07-10 17:10:42.214381	Evaluación aprovada por el analista	863	\N
205	jalonso	2013-07-10 17:10:49.479157	Evaluación aprovada por el analista	864	\N
186	mduran	2013-07-10 17:11:27.107034	Evaluación aprovada por el analista	865	\N
194	jalonso	2013-07-10 17:11:37.439342	Evaluación aprovada por el analista	866	\N
188	mduran	2013-07-10 17:12:08.82439	Evaluación aprovada por el analista	867	\N
218	jalonso	2013-07-10 17:12:17.501203	Evaluación aprovada por el analista	868	\N
189	mduran	2013-07-10 17:12:53.649098	Evaluación aprovada por el analista	869	\N
231	jalonso	2013-07-10 17:13:01.458441	Evaluación aprovada por el analista	870	\N
193	mduran	2013-07-10 17:13:35.29813	Evaluación aprovada por el analista	871	\N
232	jalonso	2013-07-10 17:14:03.628995	Evaluación aprovada por el analista	872	\N
197	mduran	2013-07-10 17:14:18.240763	Evaluación aprovada por el analista	873	\N
152	ltorres	2013-07-11 08:15:06.879895	Evaluación realizada/modificada	874	\N
152	ltorres	2013-07-11 08:16:02.987376	Evaluación enviada a Revision	875	\N
152	jalonso	2013-07-11 09:27:17.026333	Evaluación aprovada por el analista	876	\N
221	erondon	2013-07-11 09:40:37.059665	Evaluación realizada/modificada	877	\N
221	erondon	2013-07-11 09:40:53.456878	Evaluación enviada a Revision	878	\N
219	erondon	2013-07-11 09:57:07.297074	Evaluación realizada/modificada	879	\N
219	erondon	2013-07-11 09:57:23.031119	Evaluación enviada a Revision	880	\N
219	jalonso	2013-07-11 10:00:50.497369	Evaluación aprovada por el analista	881	\N
221	jalonso	2013-07-11 10:01:49.36373	Evaluación aprovada por el analista	882	\N
245	ajaspe	2013-07-11 10:08:05.247342	Evaluación realizada/modificada	883	\N
200	erondon	2013-07-11 10:09:47.569973	Evaluación realizada/modificada	884	\N
200	erondon	2013-07-11 10:09:54.461105	Evaluación enviada a Revision	885	\N
244	ajaspe	2013-07-11 10:13:15.473601	Evaluación realizada/modificada	886	\N
201	erondon	2013-07-11 10:35:19.177776	Evaluación realizada/modificada	887	\N
201	erondon	2013-07-11 10:35:39.915539	Evaluación enviada a Revision	888	\N
263	erondon	2013-07-11 10:36:27.454175	Evaluacion creada/iniciada	889	\N
263	erondon	2013-07-11 10:43:38.000173	Evaluación realizada/modificada	890	\N
263	erondon	2013-07-11 10:43:46.212655	Evaluación enviada a Revision	891	\N
200	ddaboin	2013-07-11 10:44:39.093347	Evaluación aprovada por el analista	892	\N
263	ddaboin	2013-07-11 10:46:33.370452	Evaluación aprovada por el analista	893	\N
263	ddaboin	2013-07-11 10:46:43.069283	Evaluación aprovada por el analista	894	\N
201	ddaboin	2013-07-11 10:48:25.577472	Evaluación aprovada por el analista	895	\N
202	erondon	2013-07-11 10:57:53.395103	Evaluación realizada/modificada	896	\N
202	erondon	2013-07-11 10:58:02.509675	Evaluación enviada a Revision	897	\N
202	jalonso	2013-07-11 11:03:03.574969	Evaluación aprovada por el analista	898	\N
203	erondon	2013-07-11 11:32:17.308175	Evaluación realizada/modificada	899	\N
203	erondon	2013-07-11 11:32:25.245284	Evaluación enviada a Revision	900	\N
203	jalonso	2013-07-11 11:44:46.456591	Evaluación aprovada por el analista	901	\N
204	erondon	2013-07-11 11:47:29.159719	Evaluación realizada/modificada	902	\N
204	erondon	2013-07-11 11:47:35.40369	Evaluación enviada a Revision	903	\N
207	erondon	2013-07-11 11:50:28.95114	Evaluación realizada/modificada	904	\N
207	erondon	2013-07-11 11:50:38.036287	Evaluación enviada a Revision	905	\N
204	jalonso	2013-07-11 11:51:18.254203	Evaluación aprovada por el analista	906	\N
207	jalonso	2013-07-11 11:53:28.730677	Evaluación aprovada por el analista	907	\N
81	ajaspe	2013-07-11 12:00:49.854215	Evaluación realizada/modificada	908	\N
78	ajaspe	2013-07-11 12:06:06.230913	Evaluación realizada/modificada	909	\N
83	ajaspe	2013-07-11 12:22:46.543207	Evaluación realizada/modificada	910	\N
80	ajaspe	2013-07-11 12:30:58.068472	Evaluación realizada/modificada	911	\N
82	ajaspe	2013-07-11 13:05:55.950049	Evaluación realizada/modificada	912	\N
79	ajaspe	2013-07-11 13:08:18.653818	Evaluación realizada/modificada	913	\N
229	erondon	2013-07-11 14:18:31.223498	Evaluación realizada/modificada	914	\N
229	erondon	2013-07-11 14:18:43.489098	Evaluación enviada a Revision	915	\N
209	erondon	2013-07-11 14:30:11.387784	Evaluación realizada/modificada	916	\N
209	erondon	2013-07-11 14:31:49.282022	Evaluación enviada a Revision	917	\N
206	erondon	2013-07-11 14:38:03.987247	Evaluación realizada/modificada	918	\N
206	erondon	2013-07-11 14:38:12.502616	Evaluación enviada a Revision	919	\N
208	erondon	2013-07-11 14:42:46.503302	Evaluación enviada a Revision	921	\N
228	erondon	2013-07-11 14:46:19.379278	Evaluación enviada a Revision	923	\N
211	erondon	2013-07-11 14:49:33.110317	Evaluación enviada a Revision	925	\N
212	erondon	2013-07-11 14:54:03.800842	Evaluación enviada a Revision	927	\N
213	erondon	2013-07-11 14:58:39.057364	Evaluación realizada/modificada	928	\N
229	jalonso	2013-07-11 15:09:58.591684	Evaluación aprovada por el analista	934	\N
228	jalonso	2013-07-11 15:10:41.004936	Evaluación aprovada por el analista	935	\N
212	jalonso	2013-07-11 15:11:50.621817	Evaluación aprovada por el analista	938	\N
225	erondon	2013-07-11 15:13:59.968618	Evaluación realizada/modificada	940	\N
208	erondon	2013-07-11 14:42:38.747613	Evaluación realizada/modificada	920	\N
228	erondon	2013-07-11 14:46:10.583845	Evaluación realizada/modificada	922	\N
213	erondon	2013-07-11 14:59:20.086423	Evaluación enviada a Revision	929	\N
214	erondon	2013-07-11 15:07:43.513925	Evaluación realizada/modificada	930	\N
215	erondon	2013-07-11 15:09:12.204637	Evaluación realizada/modificada	932	\N
211	jalonso	2013-07-11 15:12:35.486112	Evaluación aprovada por el analista	939	\N
209	jalonso	2013-07-11 15:14:06.020959	Evaluación aprovada por el analista	941	\N
211	erondon	2013-07-11 14:49:24.929196	Evaluación realizada/modificada	924	\N
212	erondon	2013-07-11 14:53:42.514036	Evaluación realizada/modificada	926	\N
214	erondon	2013-07-11 15:07:52.747011	Evaluación enviada a Revision	931	\N
215	erondon	2013-07-11 15:09:19.76173	Evaluación enviada a Revision	933	\N
227	erondon	2013-07-11 15:11:12.808852	Evaluación realizada/modificada	936	\N
227	erondon	2013-07-11 15:11:21.974871	Evaluación enviada a Revision	937	\N
225	erondon	2013-07-11 15:14:10.440666	Evaluación enviada a Revision	942	\N
227	jalonso	2013-07-11 15:16:15.751777	Evaluación aprovada por el analista	943	\N
217	erondon	2013-07-11 15:16:54.296681	Evaluación realizada/modificada	944	\N
217	erondon	2013-07-11 15:17:03.537718	Evaluación enviada a Revision	945	\N
220	erondon	2013-07-11 15:19:07.952202	Evaluación realizada/modificada	946	\N
208	jalonso	2013-07-11 15:19:36.765806	Evaluación aprovada por el analista	947	\N
220	erondon	2013-07-11 15:20:11.568039	Evaluación enviada a Revision	948	\N
217	jalonso	2013-07-11 15:21:04.061072	Evaluación aprovada por el analista	949	\N
206	jalonso	2013-07-11 15:21:47.584972	Evaluación aprovada por el analista	950	\N
215	jalonso	2013-07-11 15:22:32.586202	Evaluación aprovada por el analista	951	\N
222	erondon	2013-07-11 15:23:21.836606	Evaluación realizada/modificada	952	\N
222	erondon	2013-07-11 15:23:32.522643	Evaluación enviada a Revision	953	\N
220	jalonso	2013-07-11 15:24:26.576977	Evaluación aprovada por el analista	954	\N
222	jalonso	2013-07-11 15:25:33.341913	Evaluación aprovada por el analista	955	\N
223	erondon	2013-07-11 15:25:52.90673	Evaluación realizada/modificada	956	\N
223	erondon	2013-07-11 15:26:11.632978	Evaluación enviada a Revision	957	\N
214	jalonso	2013-07-11 15:26:42.807595	Evaluación aprovada por el analista	958	\N
223	jalonso	2013-07-11 15:27:40.243391	Evaluación aprovada por el analista	959	\N
224	erondon	2013-07-11 15:27:48.278735	Evaluación realizada/modificada	960	\N
224	erondon	2013-07-11 15:27:56.548467	Evaluación enviada a Revision	961	\N
213	jalonso	2013-07-11 15:30:07.314967	Evaluación aprovada por el analista	962	\N
225	jalonso	2013-07-11 15:32:04.288776	Evaluación aprovada por el analista	963	\N
224	jalonso	2013-07-11 15:34:14.23717	Evaluación aprovada por el analista	964	\N
264	mrojasm	2013-07-11 17:28:18.115926	Evaluacion creada/iniciada	965	\N
265	jpinto	2013-07-12 10:39:39.834681	Evaluacion creada/iniciada	966	\N
265	jpinto	2013-07-12 10:45:10.59812	Evaluación realizada/modificada	967	\N
266	ncastillo	2013-07-12 12:11:08.45927	Evaluacion creada/iniciada	968	\N
196	lgonzalez	2013-07-12 12:17:25.943737	Evaluación realizada/modificada	969	\N
196	lgonzalez	2013-07-12 12:18:04.170022	Evaluación enviada a Revision	970	\N
192	lgonzalez	2013-07-12 12:19:01.251387	Evaluación enviada a Revision	971	\N
266	ncastillo	2013-07-12 12:22:46.519393	Evaluación realizada/modificada	972	\N
266	ncastillo	2013-07-12 12:23:01.892105	Evaluación enviada a Revision	973	\N
196	jalonso	2013-07-12 13:19:39.348982	Evaluación aprovada por el analista	974	\N
192	jalonso	2013-07-12 13:20:18.045034	Evaluación aprovada por el analista	975	\N
266	jalonso	2013-07-12 13:21:19.519602	Evaluación aprovada por el analista	976	\N
267	npinate	2013-07-12 15:06:54.773859	Evaluacion creada/iniciada	977	\N
268	npinate	2013-07-12 15:13:36.655733	Evaluacion creada/iniciada	978	\N
269	npinate	2013-07-12 15:14:30.319902	Evaluacion creada/iniciada	979	\N
265	jpinto	2013-07-12 17:08:15.470036	Evaluación realizada/modificada	980	\N
265	jpinto	2013-07-12 17:08:23.449386	Evaluación enviada a Revision	981	\N
265	jalonso	2013-07-12 17:20:00.475959	Evaluación aprovada por el analista	982	\N
270	gcostanzo	2013-07-13 11:14:28.840188	Evaluacion creada/iniciada	983	\N
271	jggarciac	2013-07-15 09:00:56.864097	Evaluacion creada/iniciada	984	\N
271	jggarciac	2013-07-15 09:05:32.031088	Evaluación realizada/modificada	985	\N
271	jggarciac	2013-07-15 09:05:52.213986	Evaluación enviada a Revision	986	\N
264	mrojasm	2013-07-15 09:19:38.319095	Evaluación realizada/modificada	987	\N
264	mrojasm	2013-07-15 09:19:48.688839	Evaluación enviada a Revision	988	\N
272	ysegura	2013-07-15 09:35:05.122323	Evaluacion creada/iniciada	989	\N
273	ysegura	2013-07-15 09:35:38.654711	Evaluacion creada/iniciada	990	\N
274	ysegura	2013-07-15 09:35:57.612341	Evaluacion creada/iniciada	991	\N
275	eortega	2013-07-15 09:53:20.108002	Evaluacion creada/iniciada	992	\N
272	ysegura	2013-07-15 09:57:10.499087	Evaluación realizada/modificada	993	\N
272	ysegura	2013-07-15 09:57:26.533442	Evaluación enviada a Revision	994	\N
273	ysegura	2013-07-15 10:06:52.12097	Evaluación realizada/modificada	995	\N
273	ysegura	2013-07-15 10:07:05.693999	Evaluación enviada a Revision	996	\N
274	ysegura	2013-07-15 10:09:33.33113	Evaluación realizada/modificada	997	\N
274	ysegura	2013-07-15 10:10:08.753648	Evaluación enviada a Revision	998	\N
264	jalonso	2013-07-15 10:12:43.498584	Evaluación aprovada por el analista	999	\N
271	jalonso	2013-07-15 10:18:33.642494	Evaluación aprovada por el analista	1000	\N
262	jochoa	2013-07-15 11:02:42.859117	Evaluación enviada a Revision	1001	\N
276	omolina	2013-07-15 11:08:37.477585	Evaluacion creada/iniciada	1002	\N
262	jalonso	2013-07-15 11:14:39.558185	Evaluación aprovada por el analista	1003	\N
277	lsalgueiro	2013-07-15 11:49:19.661493	Evaluacion creada/iniciada	1004	\N
278	lsalgueiro	2013-07-15 11:57:54.620153	Evaluacion creada/iniciada	1005	\N
279	lsalgueiro	2013-07-15 12:04:25.652634	Evaluacion creada/iniciada	1006	\N
280	lsalgueiro	2013-07-15 12:09:41.848408	Evaluacion creada/iniciada	1007	\N
281	lsalgueiro	2013-07-15 12:15:39.250773	Evaluacion creada/iniciada	1008	\N
282	lsalgueiro	2013-07-15 13:24:04.521942	Evaluacion creada/iniciada	1009	\N
283	lsalgueiro	2013-07-15 13:28:40.570339	Evaluacion creada/iniciada	1010	\N
284	lsalgueiro	2013-07-15 13:32:45.978812	Evaluacion creada/iniciada	1011	\N
285	lsalgueiro	2013-07-15 13:36:56.007436	Evaluacion creada/iniciada	1012	\N
286	lsalgueiro	2013-07-15 13:49:55.067838	Evaluacion creada/iniciada	1013	\N
287	lsalgueiro	2013-07-15 13:56:36.90025	Evaluacion creada/iniciada	1014	\N
288	lsalgueiro	2013-07-15 14:04:50.309193	Evaluacion creada/iniciada	1015	\N
289	lsalgueiro	2013-07-15 14:09:45.65278	Evaluacion creada/iniciada	1016	\N
290	lsalgueiro	2013-07-15 14:15:15.048378	Evaluacion creada/iniciada	1017	\N
78	ajaspe	2013-07-15 15:41:44.676354	Evaluación enviada a Revision	1018	\N
79	ajaspe	2013-07-15 15:42:35.590794	Evaluación enviada a Revision	1019	\N
80	ajaspe	2013-07-15 15:42:59.682834	Evaluación enviada a Revision	1020	\N
245	ajaspe	2013-07-15 15:43:26.437058	Evaluación enviada a Revision	1021	\N
244	ajaspe	2013-07-15 15:43:52.315094	Evaluación enviada a Revision	1022	\N
81	ajaspe	2013-07-15 15:44:16.303916	Evaluación enviada a Revision	1023	\N
82	ajaspe	2013-07-15 15:45:12.803086	Evaluación enviada a Revision	1024	\N
83	ajaspe	2013-07-15 15:45:51.956151	Evaluación enviada a Revision	1025	\N
275	eortega	2013-07-15 16:01:35.654702	Evaluación realizada/modificada	1026	\N
291	erondon	2013-07-15 16:05:11.363395	Evaluacion creada/iniciada	1028	\N
291	erondon	2013-07-15 16:09:01.14723	Evaluación enviada a Revision	1030	\N
82	mduran	2013-07-15 16:20:34.844396	Evaluación aprovada por el analista	1035	\N
80	mduran	2013-07-15 16:21:28.846207	Evaluación aprovada por el analista	1036	\N
245	mduran	2013-07-15 16:24:26.620585	Evaluación aprovada por el analista	1042	\N
269	npinate	2013-07-15 16:39:33.441075	Evaluación enviada a Revision	1047	\N
273	jalonso	2013-07-15 17:25:51.476843	Evaluación aprovada por el analista	1050	\N
292	npinate	2013-07-15 17:54:39.122222	Evaluación enviada a Revision	1061	\N
275	eortega	2013-07-15 16:01:43.877873	Evaluación enviada a Revision	1027	\N
291	erondon	2013-07-15 16:08:53.542151	Evaluación realizada/modificada	1029	\N
267	npinate	2013-07-15 16:13:10.681791	Evaluación realizada/modificada	1031	\N
267	npinate	2013-07-15 16:13:27.263721	Evaluación enviada a Revision	1032	\N
291	mduran	2013-07-15 16:18:11.277809	Evaluación aprovada por el analista	1033	\N
81	mduran	2013-07-15 16:18:53.912193	Evaluación aprovada por el analista	1034	\N
244	mduran	2013-07-15 16:22:12.585021	Evaluación aprovada por el analista	1037	\N
83	mduran	2013-07-15 16:22:46.69115	Evaluación aprovada por el analista	1038	\N
270	gcostanzo	2013-07-15 16:22:47.120813	Evaluación realizada/modificada	1039	\N
270	gcostanzo	2013-07-15 16:23:10.783109	Evaluación enviada a Revision	1040	\N
79	mduran	2013-07-15 16:23:56.534852	Evaluación aprovada por el analista	1041	\N
78	mduran	2013-07-15 16:24:56.268645	Evaluación aprovada por el analista	1043	\N
268	npinate	2013-07-15 16:27:07.151541	Evaluación realizada/modificada	1044	\N
268	npinate	2013-07-15 16:27:13.923431	Evaluación enviada a Revision	1045	\N
269	npinate	2013-07-15 16:39:26.936497	Evaluación realizada/modificada	1046	\N
272	jalonso	2013-07-15 17:23:22.740973	Evaluación aprovada por el analista	1048	\N
274	jalonso	2013-07-15 17:23:59.656977	Evaluación aprovada por el analista	1049	\N
267	npinate	2013-07-15 17:27:40.563862	Evaluación realizada/modificada	1051	\N
267	npinate	2013-07-15 17:27:48.644496	Evaluación enviada a Revision	1052	\N
90	npinate	2013-07-15 17:32:34.704275	Evaluación realizada/modificada	1053	\N
90	npinate	2013-07-15 17:32:41.645636	Evaluación enviada a Revision	1054	\N
268	npinate	2013-07-15 17:35:44.632058	Evaluación realizada/modificada	1055	\N
268	npinate	2013-07-15 17:35:50.832483	Evaluación enviada a Revision	1056	\N
269	npinate	2013-07-15 17:37:23.314553	Evaluación realizada/modificada	1057	\N
269	npinate	2013-07-15 17:37:46.524872	Evaluación enviada a Revision	1058	\N
292	npinate	2013-07-15 17:50:50.160413	Evaluacion creada/iniciada	1059	\N
292	npinate	2013-07-15 17:54:32.479041	Evaluación realizada/modificada	1060	\N
268	jalonso	2013-07-15 18:16:44.172738	Evaluación aprovada por el analista	1062	\N
90	jalonso	2013-07-15 18:17:46.674637	Evaluación aprovada por el analista	1063	\N
269	jalonso	2013-07-15 18:18:43.099069	Evaluación aprovada por el analista	1064	\N
267	jalonso	2013-07-15 18:21:11.911741	Evaluación aprovada por el analista	1065	\N
295	zhernandez	2013-07-15 18:48:04.325496	Evaluacion creada/iniciada	1068	\N
77	rsarache	2013-07-16 09:05:27.873787	Evaluación realizada/modificada	1069	\N
77	rsarache	2013-07-16 09:05:53.775356	Evaluación enviada a Revision	1070	\N
276	omolina	2013-07-16 09:07:05.122625	Evaluación realizada/modificada	1071	\N
276	omolina	2013-07-16 09:07:22.357497	Evaluación enviada a Revision	1072	\N
296	rsarache	2013-07-16 09:08:26.859293	Evaluacion creada/iniciada	1073	\N
296	rsarache	2013-07-16 09:13:00.19897	Evaluación realizada/modificada	1074	\N
296	rsarache	2013-07-16 09:13:45.208636	Evaluación enviada a Revision	1075	\N
297	rsarache	2013-07-16 09:14:28.052856	Evaluacion creada/iniciada	1076	\N
77	jalonso	2013-07-16 09:15:08.755478	Evaluación aprovada por el analista	1077	\N
297	rsarache	2013-07-16 09:19:45.042165	Evaluación realizada/modificada	1078	\N
297	rsarache	2013-07-16 09:20:01.330359	Evaluación enviada a Revision	1079	\N
298	rsarache	2013-07-16 09:20:58.769303	Evaluacion creada/iniciada	1080	\N
298	rsarache	2013-07-16 09:29:36.099407	Evaluación realizada/modificada	1081	\N
298	rsarache	2013-07-16 09:29:45.612075	Evaluación enviada a Revision	1082	\N
299	rsarache	2013-07-16 09:30:37.684528	Evaluacion creada/iniciada	1083	\N
299	rsarache	2013-07-16 09:36:02.670871	Evaluación realizada/modificada	1084	\N
299	rsarache	2013-07-16 09:36:11.206815	Evaluación enviada a Revision	1085	\N
300	rsarache	2013-07-16 09:36:54.768951	Evaluacion creada/iniciada	1086	\N
300	rsarache	2013-07-16 09:43:29.726032	Evaluación realizada/modificada	1087	\N
300	rsarache	2013-07-16 09:43:39.6482	Evaluación enviada a Revision	1088	\N
301	rsarache	2013-07-16 09:44:23.957045	Evaluacion creada/iniciada	1089	\N
301	rsarache	2013-07-16 10:50:52.380381	Evaluación realizada/modificada	1090	\N
301	rsarache	2013-07-16 10:51:38.738272	Evaluación enviada a Revision	1091	\N
302	rsarache	2013-07-16 11:22:04.058522	Evaluacion creada/iniciada	1092	\N
303	rsarache	2013-07-16 11:23:14.874541	Evaluacion creada/iniciada	1093	\N
304	rsarache	2013-07-16 11:24:38.873662	Evaluacion creada/iniciada	1094	\N
305	rsarache	2013-07-16 11:25:06.103391	Evaluacion creada/iniciada	1095	\N
302	rsarache	2013-07-16 11:27:30.020335	Evaluación realizada/modificada	1096	\N
302	rsarache	2013-07-16 11:28:32.428882	Evaluación enviada a Revision	1097	\N
303	rsarache	2013-07-16 11:31:04.946173	Evaluación realizada/modificada	1098	\N
303	rsarache	2013-07-16 11:31:13.511658	Evaluación enviada a Revision	1099	\N
304	rsarache	2013-07-16 11:35:51.367971	Evaluación realizada/modificada	1100	\N
304	rsarache	2013-07-16 11:35:59.184105	Evaluación enviada a Revision	1101	\N
305	rsarache	2013-07-16 11:37:43.876109	Evaluación realizada/modificada	1102	\N
305	rsarache	2013-07-16 11:37:52.381149	Evaluación enviada a Revision	1103	\N
306	nojeda	2013-07-16 14:33:16.226318	Evaluacion creada/iniciada	1104	\N
309	jochoa	2013-07-16 14:40:03.381371	Evaluacion creada/iniciada	1105	\N
310	jochoa	2013-07-16 14:41:35.762741	Evaluacion creada/iniciada	1106	\N
311	jochoa	2013-07-16 14:42:02.362277	Evaluacion creada/iniciada	1107	\N
312	npinate	2013-07-16 14:42:41.271202	Evaluacion creada/iniciada	1108	\N
310	jochoa	2013-07-16 14:44:48.454664	Evaluación realizada/modificada	1109	\N
310	jochoa	2013-07-16 14:44:57.370767	Evaluación enviada a Revision	1110	\N
312	npinate	2013-07-16 14:47:27.065661	Evaluación realizada/modificada	1111	\N
312	npinate	2013-07-16 14:47:38.689926	Evaluación enviada a Revision	1112	\N
309	jochoa	2013-07-16 14:52:13.821571	Evaluación realizada/modificada	1113	\N
309	jochoa	2013-07-16 14:52:21.62314	Evaluación enviada a Revision	1114	\N
311	jochoa	2013-07-16 15:08:49.656589	Evaluación realizada/modificada	1115	\N
311	jochoa	2013-07-16 15:08:59.748919	Evaluación enviada a Revision	1116	\N
313	rsarache	2013-07-16 15:19:21.245665	Evaluacion creada/iniciada	1117	\N
313	rsarache	2013-07-16 15:21:19.606838	Evaluación realizada/modificada	1118	\N
313	rsarache	2013-07-16 15:21:27.823971	Evaluación enviada a Revision	1119	\N
314	mgarcia	2013-07-16 17:17:44.030425	Evaluación enviada a Revision	1130	\N
295	zhernandez	2013-07-16 17:18:49.076545	Evaluación enviada a Revision	1132	\N
275	jalonso	2013-07-17 07:43:07.582366	Evaluación aprovada por el analista	1133	\N
297	jalonso	2013-07-17 07:44:10.327308	Evaluación aprovada por el analista	1134	\N
296	jalonso	2013-07-17 07:45:30.057493	Evaluación aprovada por el analista	1135	\N
276	jalonso	2013-07-17 07:56:19.177192	Evaluación aprovada por el analista	1145	\N
304	jalonso	2013-07-17 07:57:29.927301	Evaluación aprovada por el analista	1146	\N
301	jalonso	2013-07-17 07:59:49.147799	Evaluación aprovada por el analista	1149	\N
314	mgarcia	2013-07-16 17:09:23.812859	Evaluacion creada/iniciada	1125	\N
314	mgarcia	2013-07-16 17:17:25.330846	Evaluación realizada/modificada	1129	\N
295	zhernandez	2013-07-16 17:18:33.226524	Evaluación realizada/modificada	1131	\N
312	jalonso	2013-07-17 07:47:07.382715	Evaluación aprovada por el analista	1137	\N
270	jalonso	2013-07-17 07:50:10.268763	Evaluación aprovada por el analista	1139	\N
305	jalonso	2013-07-17 07:53:17.166445	Evaluación aprovada por el analista	1142	\N
313	jalonso	2013-07-17 07:54:53.263501	Evaluación aprovada por el analista	1144	\N
302	jalonso	2013-07-17 07:59:12.595187	Evaluación aprovada por el analista	1148	\N
300	jalonso	2013-07-17 08:02:09.564357	Evaluación aprovada por el analista	1150	\N
314	mgarcia	2013-07-16 17:12:58.284033	Evaluación realizada/modificada	1126	\N
292	jalonso	2013-07-17 07:46:07.305111	Evaluación aprovada por el analista	1136	\N
295	jalonso	2013-07-17 07:48:20.61411	Evaluación aprovada por el analista	1138	\N
298	jalonso	2013-07-17 07:54:00.811447	Evaluación aprovada por el analista	1143	\N
303	jalonso	2013-07-17 07:58:22.578618	Evaluación aprovada por el analista	1147	\N
313	rsarache	2013-07-17 09:29:09.879708	Evaluación realizada/modificada	1151	\N
313	rsarache	2013-07-17 09:29:21.5162	Evaluación enviada a Revision	1152	\N
299	jalonso	2013-07-17 09:36:18.769654	Evaluación aprovada por el analista	1153	\N
313	jalonso	2013-07-17 09:40:55.504044	Evaluación aprovada por el analista	1154	\N
314	jalonso	2013-07-17 09:50:43.632397	Evaluación aprovada por el analista	1155	\N
299	rsarache	2013-07-17 09:51:57.404667	Evaluación realizada/modificada	1156	\N
299	rsarache	2013-07-17 09:52:09.70508	Evaluación enviada a Revision	1157	\N
304	rsarache	2013-07-17 09:54:36.270562	Evaluación realizada/modificada	1158	\N
304	rsarache	2013-07-17 09:54:48.525749	Evaluación enviada a Revision	1159	\N
305	rsarache	2013-07-17 09:57:13.454216	Evaluación realizada/modificada	1160	\N
305	rsarache	2013-07-17 09:57:26.494975	Evaluación enviada a Revision	1161	\N
305	jalonso	2013-07-17 11:08:25.647524	Evaluación aprovada por el analista	1162	\N
304	mduran	2013-07-17 11:31:43.991538	Evaluación aprovada por el analista	1163	\N
299	mduran	2013-07-17 11:32:25.418548	Evaluación aprovada por el analista	1164	\N
314	mgarcia	2013-07-17 13:50:28.718282	Evaluación enviada a Revision	1165	\N
314	mgarcia	2013-07-17 13:53:45.326521	Evaluación realizada/modificada	1166	\N
314	mgarcia	2013-07-17 13:53:48.899786	Evaluación enviada a Revision	1167	\N
314	jalonso	2013-07-17 13:54:36.10873	Evaluación aprovada por el analista	1168	\N
91	lsalgueiro	2013-07-17 14:58:37.138704	Evaluación enviada a Revision	1169	\N
310	jochoa	2013-07-17 15:14:23.720174	Evaluación enviada a Revision	1170	\N
309	jochoa	2013-07-17 15:15:50.844229	Evaluación realizada/modificada	1171	\N
309	jochoa	2013-07-17 15:15:57.604913	Evaluación enviada a Revision	1172	\N
311	jochoa	2013-07-17 15:17:12.203603	Evaluación realizada/modificada	1173	\N
311	jochoa	2013-07-17 15:17:27.766354	Evaluación enviada a Revision	1174	\N
92	lsalgueiro	2013-07-17 15:41:45.594763	Evaluación realizada/modificada	1175	\N
92	lsalgueiro	2013-07-17 15:41:53.815077	Evaluación enviada a Revision	1176	\N
277	lsalgueiro	2013-07-17 15:50:58.743178	Evaluación realizada/modificada	1177	\N
277	lsalgueiro	2013-07-17 15:55:59.791144	Evaluación enviada a Revision	1178	\N
278	lsalgueiro	2013-07-17 16:00:03.226624	Evaluación realizada/modificada	1179	\N
278	lsalgueiro	2013-07-17 16:00:11.038326	Evaluación enviada a Revision	1180	\N
279	lsalgueiro	2013-07-17 16:10:48.969877	Evaluación realizada/modificada	1181	\N
279	lsalgueiro	2013-07-17 16:10:56.046773	Evaluación enviada a Revision	1182	\N
91	lsalgueiro	2013-07-17 16:11:53.93924	Evaluación realizada/modificada	1183	\N
91	lsalgueiro	2013-07-17 16:12:01.083389	Evaluación enviada a Revision	1184	\N
280	lsalgueiro	2013-07-17 16:17:23.387265	Evaluación realizada/modificada	1185	\N
280	lsalgueiro	2013-07-17 16:17:34.862163	Evaluación enviada a Revision	1186	\N
311	jalonso	2013-07-17 16:29:35.260336	Evaluación aprovada por el analista	1187	\N
309	jalonso	2013-07-17 16:30:21.782448	Evaluación aprovada por el analista	1188	\N
281	lsalgueiro	2013-07-17 16:32:52.741929	Evaluación realizada/modificada	1189	\N
281	lsalgueiro	2013-07-17 16:33:17.643435	Evaluación enviada a Revision	1190	\N
92	mduran	2013-07-17 17:19:25.945814	Evaluación aprovada por el analista	1191	\N
91	mduran	2013-07-17 17:20:14.332817	Evaluación aprovada por el analista	1192	\N
310	ddaboin	2013-07-18 08:15:40.631285	Evaluación aprovada por el analista	1193	\N
282	lsalgueiro	2013-07-18 08:15:58.655501	Evaluación realizada/modificada	1194	\N
282	lsalgueiro	2013-07-18 08:16:13.067198	Evaluación enviada a Revision	1195	\N
289	lsalgueiro	2013-07-18 08:20:22.319278	Evaluación realizada/modificada	1196	\N
289	lsalgueiro	2013-07-18 08:20:31.3368	Evaluación enviada a Revision	1197	\N
283	lsalgueiro	2013-07-18 08:30:23.416175	Evaluación realizada/modificada	1198	\N
283	lsalgueiro	2013-07-18 08:30:31.010324	Evaluación enviada a Revision	1199	\N
306	nojeda	2013-07-18 08:36:58.765179	Evaluación realizada/modificada	1200	\N
284	lsalgueiro	2013-07-18 08:44:36.413914	Evaluación realizada/modificada	1201	\N
284	lsalgueiro	2013-07-18 08:44:56.35617	Evaluación enviada a Revision	1202	\N
285	lsalgueiro	2013-07-18 08:49:00.27234	Evaluación realizada/modificada	1203	\N
285	lsalgueiro	2013-07-18 08:49:06.951914	Evaluación enviada a Revision	1204	\N
286	lsalgueiro	2013-07-18 08:51:29.77628	Evaluación realizada/modificada	1205	\N
286	lsalgueiro	2013-07-18 08:51:44.972466	Evaluación enviada a Revision	1206	\N
287	lsalgueiro	2013-07-18 08:53:22.817762	Evaluación realizada/modificada	1207	\N
287	lsalgueiro	2013-07-18 08:53:30.690457	Evaluación enviada a Revision	1208	\N
306	nojeda	2013-07-18 08:55:11.564486	Evaluación enviada a Revision	1209	\N
315	nojeda	2013-07-18 08:55:51.379213	Evaluacion creada/iniciada	1210	\N
288	lsalgueiro	2013-07-18 08:56:57.899548	Evaluación realizada/modificada	1211	\N
288	lsalgueiro	2013-07-18 08:57:16.546668	Evaluación enviada a Revision	1212	\N
315	nojeda	2013-07-18 09:01:53.620299	Evaluación realizada/modificada	1213	\N
315	nojeda	2013-07-18 09:02:03.895355	Evaluación enviada a Revision	1214	\N
290	lsalgueiro	2013-07-18 09:03:17.947663	Evaluación realizada/modificada	1215	\N
290	lsalgueiro	2013-07-18 09:03:40.219032	Evaluación enviada a Revision	1216	\N
306	jalonso	2013-07-18 09:08:58.256946	Evaluación aprovada por el analista	1217	\N
316	zhernandez	2013-07-18 11:42:19.563875	Evaluacion creada/iniciada	1218	\N
316	zhernandez	2013-07-18 11:47:12.578271	Evaluación realizada/modificada	1219	\N
316	zhernandez	2013-07-18 11:48:22.527787	Evaluación enviada a Revision	1220	\N
317	zhernandez	2013-07-18 11:49:47.674933	Evaluacion creada/iniciada	1221	\N
317	zhernandez	2013-07-18 11:51:42.346638	Evaluación realizada/modificada	1222	\N
317	zhernandez	2013-07-18 11:51:50.596572	Evaluación enviada a Revision	1223	\N
316	mduran	2013-07-18 12:07:58.621752	Evaluación aprovada por el analista	1224	\N
317	mduran	2013-07-18 12:09:07.622958	Evaluación aprovada por el analista	1225	\N
318	nojeda	2013-07-19 08:39:37.161731	Evaluacion creada/iniciada	1226	\N
318	nojeda	2013-07-19 08:58:53.360257	Evaluación realizada/modificada	1227	\N
318	nojeda	2013-07-19 08:59:01.491492	Evaluación enviada a Revision	1228	\N
319	nojeda	2013-07-19 08:59:44.972199	Evaluacion creada/iniciada	1229	\N
319	nojeda	2013-07-19 09:10:23.956354	Evaluación realizada/modificada	1230	\N
319	nojeda	2013-07-19 09:10:36.332223	Evaluación enviada a Revision	1231	\N
320	hconstant	2013-07-19 19:11:31.848952	Evaluacion creada/iniciada	1232	\N
320	hconstant	2013-07-19 19:14:22.494458	Evaluación realizada/modificada	1233	\N
320	hconstant	2013-07-19 19:14:44.173809	Evaluación enviada a Revision	1234	\N
321	hconstant	2013-07-19 19:15:18.927859	Evaluacion creada/iniciada	1235	\N
322	hconstant	2013-07-19 19:16:17.299648	Evaluacion creada/iniciada	1236	\N
321	hconstant	2013-07-19 19:18:50.407579	Evaluación realizada/modificada	1237	\N
322	hconstant	2013-07-19 19:22:03.412951	Evaluación realizada/modificada	1239	\N
321	hconstant	2013-07-19 19:18:57.292288	Evaluación enviada a Revision	1238	\N
322	hconstant	2013-07-19 19:22:13.817529	Evaluación enviada a Revision	1240	\N
322	jalonso	2013-07-22 07:56:40.892507	Evaluación aprovada por el analista	1241	\N
321	jalonso	2013-07-22 07:57:35.417792	Evaluación aprovada por el analista	1242	\N
277	jalonso	2013-07-22 07:58:57.688023	Evaluación aprovada por el analista	1243	\N
280	jalonso	2013-07-22 07:59:51.516435	Evaluación aprovada por el analista	1244	\N
286	jalonso	2013-07-22 08:00:52.967079	Evaluación aprovada por el analista	1245	\N
289	jalonso	2013-07-22 08:01:36.061126	Evaluación aprovada por el analista	1246	\N
285	jalonso	2013-07-22 08:02:33.285965	Evaluación aprovada por el analista	1247	\N
288	jalonso	2013-07-22 08:03:37.530849	Evaluación aprovada por el analista	1248	\N
290	jalonso	2013-07-22 08:04:28.223377	Evaluación aprovada por el analista	1249	\N
315	jalonso	2013-07-22 08:05:25.048669	Evaluación aprovada por el analista	1250	\N
320	jalonso	2013-07-22 08:06:37.985745	Evaluación aprovada por el analista	1251	\N
318	jalonso	2013-07-22 08:08:01.026227	Evaluación aprovada por el analista	1252	\N
319	jalonso	2013-07-22 08:09:14.489932	Evaluación aprovada por el analista	1253	\N
282	jalonso	2013-07-22 08:10:07.338322	Evaluación aprovada por el analista	1254	\N
279	jalonso	2013-07-22 08:11:01.991339	Evaluación aprovada por el analista	1255	\N
281	jalonso	2013-07-22 08:11:52.316092	Evaluación aprovada por el analista	1256	\N
287	jalonso	2013-07-22 08:12:53.600016	Evaluación aprovada por el analista	1257	\N
284	jalonso	2013-07-22 08:13:54.671677	Evaluación aprovada por el analista	1258	\N
283	jalonso	2013-07-22 08:14:45.510968	Evaluación aprovada por el analista	1259	\N
278	jalonso	2013-07-22 08:18:07.326423	Evaluación aprovada por el analista	1260	\N
246	ajaspe	2013-07-22 15:17:11.065011	Evaluación realizada/modificada	1261	\N
246	ajaspe	2013-07-22 15:17:19.925772	Evaluación enviada a Revision	1262	\N
246	jalonso	2013-07-22 15:48:16.939071	Evaluación aprovada por el analista	1263	\N
91	lsalgueiro	2013-07-25 16:41:09.878996	Evaluación realizada/modificada	1264	\N
91	lsalgueiro	2013-07-25 16:41:17.865763	Evaluación enviada a Revision	1265	\N
91	jalonso	2013-07-26 07:43:36.942517	Evaluación aprovada por el analista	1266	\N
259	jochoa	2013-07-30 10:08:36.632014	Evaluación realizada/modificada	1267	\N
259	jochoa	2013-07-30 10:08:49.69904	Evaluación enviada a Revision	1268	\N
259	mduran	2013-07-30 10:25:16.925923	Evaluación aprovada por el analista	1269	\N
318	nojeda	2013-08-05 09:52:16.772606	Evaluación realizada/modificada	1270	\N
318	nojeda	2013-08-05 09:52:26.109393	Evaluación enviada a Revision	1271	\N
318	mduran	2013-08-05 09:55:31.792328	Evaluación aprovada por el analista	1272	\N
318	nojeda	2013-08-05 10:09:04.859213	Evaluación realizada/modificada	1273	\N
318	nojeda	2013-08-05 10:09:14.327742	Evaluación enviada a Revision	1274	\N
318	mduran	2013-08-05 10:10:56.380619	Evaluación aprovada por el analista	1275	\N
331	jbuitrago	2013-09-23 08:18:26.658402	Evaluacion creada/iniciada	1298	\N
333	kguevara	2013-10-29 14:36:30.757841	Evaluacion creada/iniciada	1301	\N
335	rsarache	2013-10-29 15:11:31.600797	Evaluacion creada/iniciada	1302	\N
336	lsalgueiro	2013-10-29 15:11:40.084377	Evaluacion creada/iniciada	1303	\N
336	lsalgueiro	2013-10-29 15:18:53.47791	Evaluación realizada/modificada	1304	\N
337	rsarache	2013-10-29 15:25:14.789711	Evaluacion creada/iniciada	1305	\N
338	rsarache	2013-10-29 15:25:55.551159	Evaluacion creada/iniciada	1306	\N
339	rsarache	2013-10-29 15:26:35.43679	Evaluacion creada/iniciada	1307	\N
340	rsarache	2013-10-29 15:26:57.327173	Evaluacion creada/iniciada	1308	\N
341	rsarache	2013-10-29 15:27:18.243595	Evaluacion creada/iniciada	1309	\N
342	rsarache	2013-10-29 15:28:58.770696	Evaluacion creada/iniciada	1310	\N
343	rsarache	2013-10-29 15:29:19.877286	Evaluacion creada/iniciada	1311	\N
345	rsarache	2013-10-29 15:30:18.578188	Evaluacion creada/iniciada	1313	\N
346	rsarache	2013-10-29 15:30:52.018891	Evaluacion creada/iniciada	1314	\N
347	rsarache	2013-10-29 15:31:27.595143	Evaluacion creada/iniciada	1315	\N
348	rsarache	2013-10-29 15:31:52.262796	Evaluacion creada/iniciada	1316	\N
349	rsarache	2013-10-29 15:32:15.275061	Evaluacion creada/iniciada	1317	\N
350	rsarache	2013-10-29 15:32:36.577103	Evaluacion creada/iniciada	1318	\N
351	rsarache	2013-10-29 15:32:58.717507	Evaluacion creada/iniciada	1319	\N
352	rsarache	2013-10-29 15:33:21.474147	Evaluacion creada/iniciada	1320	\N
353	rsarache	2013-10-29 15:33:43.421556	Evaluacion creada/iniciada	1321	\N
354	rsarache	2013-10-29 15:34:09.914832	Evaluacion creada/iniciada	1322	\N
355	rsarache	2013-10-29 15:34:33.269334	Evaluacion creada/iniciada	1323	\N
356	rsarache	2013-10-29 15:34:59.746019	Evaluacion creada/iniciada	1324	\N
357	rsarache	2013-10-29 15:35:21.604797	Evaluacion creada/iniciada	1325	\N
358	rsarache	2013-10-29 15:35:43.565669	Evaluacion creada/iniciada	1326	\N
359	rsarache	2013-10-29 15:36:04.894369	Evaluacion creada/iniciada	1327	\N
360	rsarache	2013-10-29 15:36:26.744571	Evaluacion creada/iniciada	1328	\N
361	rsarache	2013-10-29 15:36:48.363679	Evaluacion creada/iniciada	1329	\N
362	rsarache	2013-10-29 15:37:11.78023	Evaluacion creada/iniciada	1330	\N
363	rsarache	2013-10-29 15:37:35.491882	Evaluacion creada/iniciada	1331	\N
364	rsarache	2013-10-29 15:38:01.069573	Evaluacion creada/iniciada	1332	\N
365	rsarache	2013-10-29 15:38:25.323273	Evaluacion creada/iniciada	1333	\N
366	rsarache	2013-10-29 15:38:49.905711	Evaluacion creada/iniciada	1334	\N
367	rsarache	2013-10-29 15:39:13.779048	Evaluacion creada/iniciada	1335	\N
368	rsarache	2013-10-29 15:39:40.945907	Evaluacion creada/iniciada	1336	\N
369	rsarache	2013-10-29 15:40:06.102961	Evaluacion creada/iniciada	1337	\N
370	rsarache	2013-10-29 15:40:36.213361	Evaluacion creada/iniciada	1338	\N
371	rsarache	2013-10-29 15:41:05.654792	Evaluacion creada/iniciada	1339	\N
372	rsarache	2013-10-29 15:41:34.440254	Evaluacion creada/iniciada	1340	\N
373	rsarache	2013-10-29 15:41:59.533646	Evaluacion creada/iniciada	1341	\N
374	rsarache	2013-10-29 15:42:21.40886	Evaluacion creada/iniciada	1342	\N
375	rsarache	2013-10-29 15:42:44.413027	Evaluacion creada/iniciada	1343	\N
376	rsarache	2013-10-29 15:43:07.142015	Evaluacion creada/iniciada	1344	\N
377	rsarache	2013-10-29 15:43:29.162838	Evaluacion creada/iniciada	1345	\N
378	rsarache	2013-10-29 15:43:52.772465	Evaluacion creada/iniciada	1346	\N
379	rsarache	2013-10-29 15:44:17.127552	Evaluacion creada/iniciada	1347	\N
380	rsarache	2013-10-29 15:44:40.374444	Evaluacion creada/iniciada	1348	\N
381	rsarache	2013-10-29 15:45:07.316497	Evaluacion creada/iniciada	1349	\N
382	rsarache	2013-10-29 15:45:29.818337	Evaluacion creada/iniciada	1350	\N
383	rsarache	2013-10-29 15:45:52.321068	Evaluacion creada/iniciada	1351	\N
384	rsarache	2013-10-29 15:46:14.544995	Evaluacion creada/iniciada	1352	\N
386	rsarache	2013-10-29 15:47:11.836195	Evaluacion creada/iniciada	1354	\N
387	rsarache	2013-10-29 15:47:35.777021	Evaluacion creada/iniciada	1355	\N
388	rsarache	2013-10-29 15:47:59.326836	Evaluacion creada/iniciada	1356	\N
391	rsarache	2013-10-29 15:49:17.091319	Evaluacion creada/iniciada	1359	\N
394	rsarache	2013-10-29 15:50:58.201238	Evaluacion creada/iniciada	1362	\N
397	rsarache	2013-10-29 15:52:32.490774	Evaluacion creada/iniciada	1365	\N
400	rsarache	2013-10-29 15:54:55.89535	Evaluacion creada/iniciada	1368	\N
403	rsarache	2013-10-29 15:56:14.204199	Evaluacion creada/iniciada	1371	\N
406	rsarache	2013-10-29 15:58:00.317687	Evaluacion creada/iniciada	1374	\N
409	rsarache	2013-10-29 15:59:44.957804	Evaluacion creada/iniciada	1377	\N
412	rsarache	2013-10-29 16:01:40.147884	Evaluacion creada/iniciada	1380	\N
415	rsarache	2013-10-29 16:03:07.013807	Evaluacion creada/iniciada	1383	\N
418	rsarache	2013-10-29 16:04:47.835178	Evaluacion creada/iniciada	1386	\N
420	rsarache	2013-10-29 16:05:40.217019	Evaluacion creada/iniciada	1388	\N
423	rsarache	2013-10-29 16:07:05.455428	Evaluacion creada/iniciada	1391	\N
426	rsarache	2013-10-29 16:08:36.692022	Evaluacion creada/iniciada	1394	\N
429	rsarache	2013-10-29 16:09:56.355766	Evaluacion creada/iniciada	1397	\N
389	rsarache	2013-10-29 15:48:26.92954	Evaluacion creada/iniciada	1357	\N
392	rsarache	2013-10-29 15:49:50.210765	Evaluacion creada/iniciada	1360	\N
395	rsarache	2013-10-29 15:51:28.09126	Evaluacion creada/iniciada	1363	\N
398	rsarache	2013-10-29 15:52:57.509448	Evaluacion creada/iniciada	1366	\N
401	rsarache	2013-10-29 15:55:22.261651	Evaluacion creada/iniciada	1369	\N
404	rsarache	2013-10-29 15:56:40.396843	Evaluacion creada/iniciada	1372	\N
407	rsarache	2013-10-29 15:58:25.961758	Evaluacion creada/iniciada	1375	\N
410	rsarache	2013-10-29 16:00:30.456713	Evaluacion creada/iniciada	1378	\N
413	rsarache	2013-10-29 16:02:05.906366	Evaluacion creada/iniciada	1381	\N
416	rsarache	2013-10-29 16:03:56.032194	Evaluacion creada/iniciada	1384	\N
421	rsarache	2013-10-29 16:06:08.291627	Evaluacion creada/iniciada	1389	\N
424	rsarache	2013-10-29 16:07:32.842942	Evaluacion creada/iniciada	1392	\N
427	rsarache	2013-10-29 16:09:03.58971	Evaluacion creada/iniciada	1395	\N
430	rsarache	2013-10-29 16:10:25.410946	Evaluacion creada/iniciada	1398	\N
390	rsarache	2013-10-29 15:48:55.738427	Evaluacion creada/iniciada	1358	\N
393	rsarache	2013-10-29 15:50:24.501095	Evaluacion creada/iniciada	1361	\N
396	rsarache	2013-10-29 15:51:58.29101	Evaluacion creada/iniciada	1364	\N
399	rsarache	2013-10-29 15:54:30.763923	Evaluacion creada/iniciada	1367	\N
402	rsarache	2013-10-29 15:55:47.0281	Evaluacion creada/iniciada	1370	\N
405	rsarache	2013-10-29 15:57:17.090849	Evaluacion creada/iniciada	1373	\N
408	rsarache	2013-10-29 15:58:57.69988	Evaluacion creada/iniciada	1376	\N
411	rsarache	2013-10-29 16:01:06.364	Evaluacion creada/iniciada	1379	\N
414	rsarache	2013-10-29 16:02:37.926033	Evaluacion creada/iniciada	1382	\N
417	rsarache	2013-10-29 16:04:21.884026	Evaluacion creada/iniciada	1385	\N
422	rsarache	2013-10-29 16:06:34.065028	Evaluacion creada/iniciada	1390	\N
425	rsarache	2013-10-29 16:07:58.819718	Evaluacion creada/iniciada	1393	\N
428	rsarache	2013-10-29 16:09:25.724825	Evaluacion creada/iniciada	1396	\N
431	rsarache	2013-10-29 16:10:59.46617	Evaluacion creada/iniciada	1399	\N
432	rsarache	2013-10-29 16:11:37.904558	Evaluacion creada/iniciada	1400	\N
433	rsarache	2013-10-29 16:12:04.488102	Evaluacion creada/iniciada	1401	\N
434	rsarache	2013-10-29 16:12:36.248114	Evaluacion creada/iniciada	1402	\N
435	rsarache	2013-10-29 16:13:24.015144	Evaluacion creada/iniciada	1403	\N
436	rsarache	2013-10-29 16:13:58.735957	Evaluacion creada/iniciada	1404	\N
437	rsarache	2013-10-29 16:14:23.23166	Evaluacion creada/iniciada	1405	\N
438	rsarache	2013-10-29 16:14:50.385438	Evaluacion creada/iniciada	1406	\N
439	rsarache	2013-10-29 16:15:14.25748	Evaluacion creada/iniciada	1407	\N
440	rsarache	2013-10-29 16:15:39.243409	Evaluacion creada/iniciada	1408	\N
441	rsarache	2013-10-29 16:16:02.115835	Evaluacion creada/iniciada	1409	\N
442	rsarache	2013-10-29 16:16:25.994829	Evaluacion creada/iniciada	1410	\N
443	rsarache	2013-10-29 16:16:47.502313	Evaluacion creada/iniciada	1411	\N
444	rsarache	2013-10-29 16:17:08.947535	Evaluacion creada/iniciada	1412	\N
445	rsarache	2013-10-29 16:17:34.777705	Evaluacion creada/iniciada	1413	\N
446	rsarache	2013-10-29 16:17:58.013609	Evaluacion creada/iniciada	1414	\N
447	ajaspe	2013-10-30 11:13:37.963837	Evaluacion creada/iniciada	1415	\N
448	ajaspe	2013-10-30 11:13:59.927502	Evaluacion creada/iniciada	1416	\N
449	ajaspe	2013-10-30 11:15:44.828613	Evaluacion creada/iniciada	1417	\N
450	ajaspe	2013-10-30 11:16:13.864337	Evaluacion creada/iniciada	1418	\N
451	ajaspe	2013-10-30 11:16:32.849752	Evaluacion creada/iniciada	1419	\N
452	ajaspe	2013-10-30 11:16:52.561341	Evaluacion creada/iniciada	1420	\N
453	ajaspe	2013-10-30 11:17:13.698845	Evaluacion creada/iniciada	1421	\N
336	lsalgueiro	2013-10-30 17:07:36.816278	Evaluación realizada/modificada	1422	\N
455	omolina	2013-10-31 10:46:07.734778	Evaluacion creada/iniciada	1424	\N
456	lsalgueiro	2013-10-31 11:18:11.264453	Evaluacion creada/iniciada	1425	\N
336	lsalgueiro	2013-10-31 11:29:43.750996	Evaluación enviada a Revision	1426	\N
457	lsalgueiro	2013-10-31 13:37:01.393629	Evaluacion creada/iniciada	1427	\N
458	lsalgueiro	2013-10-31 14:26:05.938323	Evaluacion creada/iniciada	1428	\N
458	agarrido	2013-10-31 15:02:29.524361	Evaluación realizada/modificada	1429	\N
458	lsalgueiro	2013-10-31 15:20:34.355822	Evaluación enviada a Revision	1430	\N
458	agarrido	2013-10-31 15:31:30.279394	Evaluación realizada/modificada	1431	\N
458	agarrido	2013-10-31 15:31:38.76845	Evaluación enviada a Revision	1432	\N
457	lsalgueiro	2013-10-31 15:32:28.729703	Evaluación realizada/modificada	1433	\N
457	lsalgueiro	2013-10-31 15:32:47.689228	Evaluación enviada a Revision	1434	\N
336	lsalgueiro	2013-10-31 15:38:05.964227	Evaluación realizada/modificada	1435	\N
336	lsalgueiro	2013-10-31 15:38:16.131902	Evaluación enviada a Revision	1436	\N
458	lsalgueiro	2013-10-31 15:39:10.926934	Evaluación realizada/modificada	1437	\N
458	lsalgueiro	2013-10-31 15:39:34.859706	Evaluación enviada a Revision	1438	\N
459	lsalgueiro	2013-10-31 15:41:00.875817	Evaluacion creada/iniciada	1439	\N
336	jalonso	2013-10-31 16:04:26.351326	Evaluación aprovada por el analista	1440	\N
458	jalonso	2013-10-31 16:05:02.407993	Evaluación aprovada por el analista	1441	\N
459	lsalgueiro	2013-10-31 16:50:38.949682	Evaluación realizada/modificada	1442	\N
459	lsalgueiro	2013-10-31 16:51:40.181247	Evaluación enviada a Revision	1443	\N
456	lsalgueiro	2013-10-31 16:54:31.427208	Evaluación realizada/modificada	1444	\N
456	lsalgueiro	2013-10-31 16:54:47.950132	Evaluación enviada a Revision	1445	\N
457	lsalgueiro	2013-10-31 17:05:34.956091	Evaluación realizada/modificada	1446	\N
457	lsalgueiro	2013-10-31 17:05:44.377144	Evaluación enviada a Revision	1447	\N
455	omolina	2013-10-31 17:14:28.625714	Evaluación realizada/modificada	1448	\N
455	omolina	2013-10-31 17:15:03.325744	Evaluación enviada a Revision	1449	\N
460	lsalgueiro	2013-10-31 17:16:22.247013	Evaluacion creada/iniciada	1450	\N
460	lsalgueiro	2013-10-31 17:19:05.386275	Evaluación realizada/modificada	1451	\N
460	lsalgueiro	2013-10-31 17:19:21.117268	Evaluación enviada a Revision	1452	\N
461	lsalgueiro	2013-10-31 17:20:36.426739	Evaluacion creada/iniciada	1453	\N
461	lsalgueiro	2013-10-31 17:39:47.762441	Evaluación realizada/modificada	1454	\N
461	lsalgueiro	2013-10-31 17:40:24.466477	Evaluación enviada a Revision	1455	\N
462	lsalgueiro	2013-10-31 17:46:18.862214	Evaluacion creada/iniciada	1456	\N
462	lsalgueiro	2013-10-31 17:49:18.94515	Evaluación realizada/modificada	1457	\N
462	lsalgueiro	2013-10-31 17:49:29.791663	Evaluación enviada a Revision	1458	\N
463	lsalgueiro	2013-10-31 17:53:46.736614	Evaluacion creada/iniciada	1459	\N
464	lsalgueiro	2013-10-31 17:54:12.187412	Evaluacion creada/iniciada	1460	\N
463	lsalgueiro	2013-10-31 17:56:13.872123	Evaluación realizada/modificada	1461	\N
463	lsalgueiro	2013-10-31 17:56:23.312173	Evaluación enviada a Revision	1462	\N
464	lsalgueiro	2013-10-31 17:58:37.140675	Evaluación realizada/modificada	1463	\N
464	lsalgueiro	2013-10-31 17:58:45.404605	Evaluación enviada a Revision	1464	\N
465	lsalgueiro	2013-10-31 18:00:00.621606	Evaluacion creada/iniciada	1465	\N
466	lsalgueiro	2013-10-31 18:00:44.710076	Evaluacion creada/iniciada	1466	\N
467	lsalgueiro	2013-10-31 18:11:55.001648	Evaluacion creada/iniciada	1467	\N
468	lsalgueiro	2013-10-31 18:13:15.383662	Evaluacion creada/iniciada	1468	\N
469	lsalgueiro	2013-10-31 18:13:46.053622	Evaluacion creada/iniciada	1469	\N
470	lsalgueiro	2013-10-31 18:14:29.130612	Evaluacion creada/iniciada	1470	\N
471	lsalgueiro	2013-10-31 18:16:08.554656	Evaluacion creada/iniciada	1471	\N
465	lsalgueiro	2013-10-31 18:19:01.392017	Evaluación realizada/modificada	1472	\N
465	lsalgueiro	2013-10-31 18:19:10.570016	Evaluación enviada a Revision	1473	\N
466	lsalgueiro	2013-10-31 18:21:48.262051	Evaluación realizada/modificada	1474	\N
466	lsalgueiro	2013-10-31 18:22:04.119268	Evaluación enviada a Revision	1475	\N
467	lsalgueiro	2013-10-31 18:24:05.534588	Evaluación realizada/modificada	1476	\N
467	lsalgueiro	2013-10-31 18:24:13.609016	Evaluación enviada a Revision	1477	\N
468	lsalgueiro	2013-10-31 18:26:24.795039	Evaluación realizada/modificada	1478	\N
468	lsalgueiro	2013-10-31 18:26:44.392261	Evaluación enviada a Revision	1479	\N
469	lsalgueiro	2013-10-31 18:30:20.649873	Evaluación enviada a Revision	1481	\N
470	lsalgueiro	2013-10-31 18:33:47.111959	Evaluación enviada a Revision	1483	\N
471	lsalgueiro	2013-10-31 18:36:02.380445	Evaluación enviada a Revision	1485	\N
472	lsalgueiro	2013-10-31 18:55:50.318034	Evaluación enviada a Revision	1490	\N
461	jalonso	2013-11-01 13:51:04.83297	Evaluación aprovada por el analista	1492	\N
470	jalonso	2013-11-01 13:53:39.957505	Evaluación aprovada por el analista	1495	\N
462	jalonso	2013-11-01 14:04:18.201133	Evaluación aprovada por el analista	1503	\N
469	lsalgueiro	2013-10-31 18:30:01.107712	Evaluación realizada/modificada	1480	\N
470	lsalgueiro	2013-10-31 18:33:38.33414	Evaluación realizada/modificada	1482	\N
471	lsalgueiro	2013-10-31 18:35:49.890763	Evaluación realizada/modificada	1484	\N
456	lsalgueiro	2013-10-31 18:51:51.170689	Evaluación enviada a Revision	1487	\N
472	lsalgueiro	2013-10-31 18:52:54.627093	Evaluacion creada/iniciada	1488	\N
472	lsalgueiro	2013-10-31 18:55:41.084653	Evaluación realizada/modificada	1489	\N
471	jalonso	2013-11-01 13:52:50.574742	Evaluación aprovada por el analista	1494	\N
467	jalonso	2013-11-01 13:55:13.72484	Evaluación aprovada por el analista	1496	\N
465	jalonso	2013-11-01 13:59:28.477622	Evaluación aprovada por el analista	1498	\N
466	jalonso	2013-11-01 14:00:17.274833	Evaluación aprovada por el analista	1499	\N
460	jalonso	2013-11-01 14:02:26.913032	Evaluación aprovada por el analista	1500	\N
468	jalonso	2013-11-01 14:03:42.543408	Evaluación aprovada por el analista	1502	\N
456	jalonso	2013-11-01 14:05:03.998233	Evaluación aprovada por el analista	1504	\N
458	lsalgueiro	2013-11-04 09:40:51.199936	Evaluación realizada/modificada	1510	\N
458	mduran	2013-11-04 09:46:17.434945	Evaluación aprovada por el analista	1512	\N
476	jesequera	2013-11-04 10:45:48.524063	Evaluacion creada/iniciada	1514	\N
479	jesequera	2013-11-04 10:49:31.304843	Evaluacion creada/iniciada	1517	\N
482	jesequera	2013-11-04 10:52:26.385604	Evaluacion creada/iniciada	1520	\N
485	jesequera	2013-11-04 10:54:04.138431	Evaluacion creada/iniciada	1523	\N
488	jesequera	2013-11-04 10:55:20.520952	Evaluacion creada/iniciada	1526	\N
475	jesequera	2013-11-04 11:02:14.506843	Evaluación realizada/modificada	1527	\N
475	jesequera	2013-11-04 11:03:16.999142	Evaluación enviada a Revision	1528	\N
476	jesequera	2013-11-04 11:07:02.591321	Evaluación realizada/modificada	1529	\N
476	jesequera	2013-11-04 11:07:12.14646	Evaluación enviada a Revision	1530	\N
479	jesequera	2013-11-04 11:15:49.667623	Evaluación realizada/modificada	1533	\N
479	jesequera	2013-11-04 11:24:56.555356	Evaluación realizada/modificada	1540	\N
354	rsarache	2013-11-04 11:25:03.599994	Evaluación enviada a Revision	1541	\N
479	jesequera	2013-11-04 11:37:06.38126	Evaluación realizada/modificada	1544	\N
480	jesequera	2013-11-04 11:42:13.643618	Evaluación realizada/modificada	1546	\N
480	jesequera	2013-11-04 11:44:07.803252	Evaluación enviada a Revision	1549	\N
489	npinate	2013-11-04 11:53:38.296294	Evaluación enviada a Revision	1553	\N
481	jesequera	2013-11-04 11:54:33.019994	Evaluación enviada a Revision	1556	\N
490	npinate	2013-11-04 12:01:54.783834	Evaluación realizada/modificada	1557	\N
456	lsalgueiro	2013-10-31 18:51:42.649863	Evaluación realizada/modificada	1486	\N
473	nlorenzo	2013-11-01 10:25:21.70362	Evaluacion creada/iniciada	1491	\N
457	jalonso	2013-11-01 13:52:13.499136	Evaluación aprovada por el analista	1493	\N
464	jalonso	2013-11-01 13:57:36.385719	Evaluación aprovada por el analista	1497	\N
472	jalonso	2013-11-01 14:03:01.278747	Evaluación aprovada por el analista	1501	\N
469	jalonso	2013-11-01 14:06:22.037619	Evaluación aprovada por el analista	1505	\N
459	jalonso	2013-11-01 14:07:10.608195	Evaluación aprovada por el analista	1506	\N
463	jalonso	2013-11-01 14:08:03.298445	Evaluación aprovada por el analista	1507	\N
458	lsalgueiro	2013-11-04 09:41:17.079724	Evaluación enviada a Revision	1511	\N
475	jesequera	2013-11-04 10:43:52.503035	Evaluacion creada/iniciada	1513	\N
477	jesequera	2013-11-04 10:46:18.133717	Evaluacion creada/iniciada	1515	\N
480	jesequera	2013-11-04 10:50:21.360095	Evaluacion creada/iniciada	1518	\N
481	jesequera	2013-11-04 10:51:19.790356	Evaluacion creada/iniciada	1519	\N
483	jesequera	2013-11-04 10:52:56.687305	Evaluacion creada/iniciada	1521	\N
484	jesequera	2013-11-04 10:53:35.104748	Evaluacion creada/iniciada	1522	\N
486	jesequera	2013-11-04 10:54:35.7485	Evaluacion creada/iniciada	1524	\N
487	jesequera	2013-11-04 10:54:58.741012	Evaluacion creada/iniciada	1525	\N
479	jesequera	2013-11-04 11:13:44.645426	Evaluación realizada/modificada	1531	\N
479	jesequera	2013-11-04 11:14:33.474061	Evaluación realizada/modificada	1532	\N
441	rsarache	2013-11-04 11:18:08.387495	Evaluación realizada/modificada	1534	\N
441	rsarache	2013-11-04 11:18:19.075555	Evaluación enviada a Revision	1535	\N
479	jesequera	2013-11-04 11:19:15.060795	Evaluación realizada/modificada	1536	\N
479	jesequera	2013-11-04 11:20:55.436987	Evaluación realizada/modificada	1537	\N
479	jesequera	2013-11-04 11:24:18.657605	Evaluación realizada/modificada	1538	\N
354	rsarache	2013-11-04 11:24:55.092479	Evaluación realizada/modificada	1539	\N
479	jesequera	2013-11-04 11:25:40.170295	Evaluación realizada/modificada	1542	\N
479	jesequera	2013-11-04 11:26:17.712487	Evaluación realizada/modificada	1543	\N
479	jesequera	2013-11-04 11:37:30.756014	Evaluación enviada a Revision	1545	\N
480	jesequera	2013-11-04 11:42:47.142186	Evaluación realizada/modificada	1547	\N
480	jesequera	2013-11-04 11:43:53.282705	Evaluación realizada/modificada	1548	\N
489	npinate	2013-11-04 11:45:29.293081	Evaluacion creada/iniciada	1550	\N
489	npinate	2013-11-04 11:53:29.280289	Evaluación realizada/modificada	1551	\N
481	jesequera	2013-11-04 11:53:33.290094	Evaluación realizada/modificada	1552	\N
481	jesequera	2013-11-04 11:54:00.862532	Evaluación realizada/modificada	1554	\N
490	npinate	2013-11-04 11:54:20.608444	Evaluacion creada/iniciada	1555	\N
490	npinate	2013-11-04 12:02:02.567683	Evaluación enviada a Revision	1558	\N
482	jesequera	2013-11-04 12:02:29.898035	Evaluación realizada/modificada	1559	\N
491	npinate	2013-11-04 12:02:53.778277	Evaluacion creada/iniciada	1560	\N
482	jesequera	2013-11-04 12:02:55.487608	Evaluación enviada a Revision	1561	\N
485	jesequera	2013-11-04 12:05:00.074322	Evaluación realizada/modificada	1562	\N
485	jesequera	2013-11-04 12:05:16.464217	Evaluación enviada a Revision	1563	\N
486	jesequera	2013-11-04 12:07:00.72057	Evaluación realizada/modificada	1564	\N
486	jesequera	2013-11-04 12:07:12.797178	Evaluación enviada a Revision	1565	\N
487	jesequera	2013-11-04 12:08:43.444888	Evaluación realizada/modificada	1566	\N
487	jesequera	2013-11-04 12:08:59.331323	Evaluación enviada a Revision	1567	\N
488	jesequera	2013-11-04 12:10:59.554723	Evaluación realizada/modificada	1568	\N
488	jesequera	2013-11-04 12:11:12.336785	Evaluación enviada a Revision	1569	\N
491	npinate	2013-11-04 12:11:26.892903	Evaluación realizada/modificada	1570	\N
491	npinate	2013-11-04 12:11:51.008604	Evaluación enviada a Revision	1571	\N
477	jesequera	2013-11-04 12:12:25.281373	Evaluación realizada/modificada	1572	\N
492	npinate	2013-11-04 12:12:35.088287	Evaluacion creada/iniciada	1573	\N
477	jesequera	2013-11-04 12:12:39.123418	Evaluación enviada a Revision	1574	\N
483	jesequera	2013-11-04 12:14:24.964238	Evaluación realizada/modificada	1575	\N
483	jesequera	2013-11-04 12:14:37.057279	Evaluación enviada a Revision	1576	\N
484	jesequera	2013-11-04 12:15:50.408269	Evaluación realizada/modificada	1577	\N
484	jesequera	2013-11-04 12:15:55.422513	Evaluación realizada/modificada	1578	\N
484	jesequera	2013-11-04 12:16:14.940141	Evaluación enviada a Revision	1579	\N
492	npinate	2013-11-04 12:16:40.305382	Evaluación realizada/modificada	1580	\N
492	npinate	2013-11-04 12:17:09.204429	Evaluación enviada a Revision	1581	\N
493	npinate	2013-11-04 12:17:46.895495	Evaluacion creada/iniciada	1582	\N
493	npinate	2013-11-04 12:20:12.244646	Evaluación realizada/modificada	1583	\N
493	npinate	2013-11-04 12:20:20.187839	Evaluación enviada a Revision	1584	\N
494	npinate	2013-11-04 12:21:14.510423	Evaluacion creada/iniciada	1585	\N
494	npinate	2013-11-04 12:25:40.584362	Evaluación realizada/modificada	1586	\N
494	npinate	2013-11-04 12:25:49.300824	Evaluación enviada a Revision	1587	\N
370	rsarache	2013-11-04 13:43:38.392741	Evaluación realizada/modificada	1589	\N
370	rsarache	2013-11-04 13:43:47.937222	Evaluación enviada a Revision	1590	\N
395	rsarache	2013-11-04 14:00:23.28826	Evaluación realizada/modificada	1591	\N
395	rsarache	2013-11-04 14:00:32.355969	Evaluación enviada a Revision	1592	\N
353	rsarache	2013-11-04 14:07:55.468969	Evaluación realizada/modificada	1593	\N
353	rsarache	2013-11-04 14:08:03.363366	Evaluación enviada a Revision	1594	\N
346	rsarache	2013-11-04 14:17:39.625437	Evaluación realizada/modificada	1595	\N
346	rsarache	2013-11-04 14:17:46.953156	Evaluación enviada a Revision	1596	\N
351	rsarache	2013-11-04 14:22:37.82697	Evaluación realizada/modificada	1597	\N
351	rsarache	2013-11-04 14:22:49.579761	Evaluación enviada a Revision	1598	\N
346	mduran	2013-11-04 14:46:02.587944	Evaluación aprovada por el analista	1599	\N
353	mduran	2013-11-04 14:46:53.185421	Evaluación aprovada por el analista	1600	\N
492	mduran	2013-11-04 14:47:56.96604	Evaluación aprovada por el analista	1601	\N
493	mduran	2013-11-04 14:48:53.263746	Evaluación aprovada por el analista	1602	\N
365	rsarache	2013-11-04 14:50:27.957825	Evaluación realizada/modificada	1603	\N
365	rsarache	2013-11-04 14:50:36.879206	Evaluación enviada a Revision	1604	\N
489	mduran	2013-11-04 14:51:19.430987	Evaluación aprovada por el analista	1605	\N
494	mduran	2013-11-04 14:52:21.391079	Evaluación aprovada por el analista	1606	\N
476	mduran	2013-11-04 14:54:55.054349	Evaluación aprovada por el analista	1607	\N
373	rsarache	2013-11-04 15:01:25.243637	Evaluación realizada/modificada	1608	\N
373	rsarache	2013-11-04 15:01:32.835954	Evaluación enviada a Revision	1609	\N
496	rsarache	2013-11-04 15:21:18.795576	Evaluación enviada a Revision	1612	\N
396	rsarache	2013-11-04 15:29:25.372154	Evaluación realizada/modificada	1613	\N
396	rsarache	2013-11-04 15:29:33.642409	Evaluación enviada a Revision	1614	\N
483	mduran	2013-11-04 15:32:11.373127	Evaluación aprovada por el analista	1615	\N
396	mduran	2013-11-04 15:33:13.885722	Evaluación aprovada por el analista	1616	\N
490	mduran	2013-11-04 15:57:14.022013	Evaluación aprovada por el analista	1626	\N
491	mduran	2013-11-04 15:58:55.504415	Evaluación aprovada por el analista	1627	\N
446	rsarache	2013-11-04 16:15:07.399084	Evaluación enviada a Revision	1630	\N
476	jesequera	2013-11-04 16:20:01.965546	Evaluación enviada a Revision	1632	\N
497	erondon	2013-11-04 16:27:47.047219	Evaluación realizada/modificada	1634	\N
499	erondon	2013-11-04 16:29:35.759253	Evaluacion creada/iniciada	1635	\N
501	erondon	2013-11-04 16:31:23.82331	Evaluacion creada/iniciada	1637	\N
504	erondon	2013-11-04 16:33:36.113252	Evaluacion creada/iniciada	1642	\N
505	erondon	2013-11-04 16:33:58.479639	Evaluacion creada/iniciada	1643	\N
506	erondon	2013-11-04 16:34:22.381228	Evaluacion creada/iniciada	1644	\N
509	erondon	2013-11-04 16:36:46.542138	Evaluacion creada/iniciada	1647	\N
512	erondon	2013-11-04 16:38:10.880458	Evaluacion creada/iniciada	1650	\N
515	erondon	2013-11-04 16:39:37.240425	Evaluacion creada/iniciada	1653	\N
518	erondon	2013-11-04 16:41:02.913031	Evaluacion creada/iniciada	1656	\N
521	erondon	2013-11-04 16:42:31.366956	Evaluacion creada/iniciada	1659	\N
436	rsarache	2013-11-04 16:43:50.038422	Evaluación realizada/modificada	1662	\N
524	erondon	2013-11-04 16:43:59.269284	Evaluacion creada/iniciada	1664	\N
526	erondon	2013-11-04 16:44:55.857339	Evaluacion creada/iniciada	1666	\N
529	erondon	2013-11-04 16:46:04.934149	Evaluacion creada/iniciada	1669	\N
532	erondon	2013-11-04 16:47:27.959389	Evaluacion creada/iniciada	1672	\N
535	erondon	2013-11-04 16:48:50.938798	Evaluacion creada/iniciada	1675	\N
538	erondon	2013-11-04 16:50:54.076656	Evaluacion creada/iniciada	1678	\N
541	erondon	2013-11-04 16:52:12.109942	Evaluacion creada/iniciada	1681	\N
546	erondon	2013-11-04 16:55:05.351455	Evaluacion creada/iniciada	1686	\N
548	erondon	2013-11-04 16:56:04.122339	Evaluacion creada/iniciada	1690	\N
497	erondon	2013-11-04 16:59:39.144018	Evaluación realizada/modificada	1692	\N
540	erondon	2013-11-04 17:07:36.556018	Evaluación realizada/modificada	1697	\N
532	erondon	2013-11-04 17:12:29.595069	Evaluación realizada/modificada	1700	\N
536	erondon	2013-11-04 17:15:45.235929	Evaluación realizada/modificada	1702	\N
534	erondon	2013-11-04 17:22:55.024187	Evaluación realizada/modificada	1706	\N
539	erondon	2013-11-04 17:39:51.824114	Evaluación realizada/modificada	1714	\N
393	rsarache	2013-11-04 17:54:20.440095	Evaluación enviada a Revision	1718	\N
342	rsarache	2013-11-04 17:57:17.356281	Evaluación realizada/modificada	1719	\N
439	rsarache	2013-11-04 18:15:51.84356	Evaluación enviada a Revision	1724	\N
369	rsarache	2013-11-04 18:22:36.90846	Evaluación realizada/modificada	1725	\N
367	rsarache	2013-11-04 18:46:40.111931	Evaluación enviada a Revision	1730	\N
352	rsarache	2013-11-04 18:53:43.150371	Evaluación realizada/modificada	1731	\N
496	rsarache	2013-11-04 15:03:16.454572	Evaluacion creada/iniciada	1610	\N
440	rsarache	2013-11-04 15:51:25.169982	Evaluación realizada/modificada	1620	\N
440	rsarache	2013-11-04 15:51:32.573482	Evaluación enviada a Revision	1621	\N
498	rsarache	2013-11-04 15:52:26.327344	Evaluacion creada/iniciada	1623	\N
354	mduran	2013-11-04 15:55:22.325047	Evaluación aprovada por el analista	1625	\N
440	mduran	2013-11-04 16:00:39.877798	Evaluación aprovada por el analista	1628	\N
476	jesequera	2013-11-04 16:19:46.389704	Evaluación realizada/modificada	1631	\N
497	erondon	2013-11-04 16:23:15.662612	Evaluación realizada/modificada	1633	\N
502	erondon	2013-11-04 16:31:48.48424	Evaluacion creada/iniciada	1638	\N
356	rsarache	2013-11-04 16:32:35.929662	Evaluación realizada/modificada	1640	\N
508	erondon	2013-11-04 16:36:18.985764	Evaluacion creada/iniciada	1646	\N
511	erondon	2013-11-04 16:37:41.986836	Evaluacion creada/iniciada	1649	\N
514	erondon	2013-11-04 16:39:02.9098	Evaluacion creada/iniciada	1652	\N
517	erondon	2013-11-04 16:40:30.690873	Evaluacion creada/iniciada	1655	\N
520	erondon	2013-11-04 16:42:06.299657	Evaluacion creada/iniciada	1658	\N
523	erondon	2013-11-04 16:43:26.669747	Evaluacion creada/iniciada	1661	\N
525	erondon	2013-11-04 16:44:27.422339	Evaluacion creada/iniciada	1665	\N
527	erondon	2013-11-04 16:45:20.839183	Evaluacion creada/iniciada	1667	\N
530	erondon	2013-11-04 16:46:33.617347	Evaluacion creada/iniciada	1670	\N
533	erondon	2013-11-04 16:48:00.883559	Evaluacion creada/iniciada	1673	\N
536	erondon	2013-11-04 16:49:36.137546	Evaluacion creada/iniciada	1676	\N
539	erondon	2013-11-04 16:51:21.588875	Evaluacion creada/iniciada	1679	\N
542	erondon	2013-11-04 16:53:07.371772	Evaluacion creada/iniciada	1682	\N
543	erondon	2013-11-04 16:53:40.187285	Evaluacion creada/iniciada	1683	\N
545	erondon	2013-11-04 16:54:33.872493	Evaluacion creada/iniciada	1685	\N
547	erondon	2013-11-04 16:55:39.10688	Evaluacion creada/iniciada	1688	\N
497	erondon	2013-11-04 16:58:18.232736	Evaluación realizada/modificada	1691	\N
400	rsarache	2013-11-04 17:05:05.268536	Evaluación realizada/modificada	1694	\N
544	erondon	2013-11-04 17:05:37.848392	Evaluación realizada/modificada	1696	\N
532	erondon	2013-11-04 17:11:50.713692	Evaluación realizada/modificada	1699	\N
536	erondon	2013-11-04 17:14:58.698591	Evaluación realizada/modificada	1701	\N
515	erondon	2013-11-04 17:19:57.871158	Evaluación realizada/modificada	1704	\N
517	erondon	2013-11-04 17:27:13.752577	Evaluación realizada/modificada	1708	\N
527	erondon	2013-11-04 17:33:33.865971	Evaluación realizada/modificada	1710	\N
539	erondon	2013-11-04 17:38:16.591278	Evaluación realizada/modificada	1712	\N
511	erondon	2013-11-04 17:44:19.177013	Evaluación realizada/modificada	1716	\N
342	rsarache	2013-11-04 17:57:25.068296	Evaluación enviada a Revision	1720	\N
417	rsarache	2013-11-04 18:06:09.792342	Evaluación realizada/modificada	1721	\N
369	rsarache	2013-11-04 18:22:43.957457	Evaluación enviada a Revision	1726	\N
361	rsarache	2013-11-04 18:33:06.148749	Evaluación realizada/modificada	1727	\N
352	rsarache	2013-11-04 18:53:50.907641	Evaluación enviada a Revision	1732	\N
496	rsarache	2013-11-04 15:21:08.497243	Evaluación realizada/modificada	1611	\N
497	erondon	2013-11-04 15:44:06.637555	Evaluacion creada/iniciada	1617	\N
365	mduran	2013-11-04 15:49:08.090553	Evaluación aprovada por el analista	1618	\N
496	mduran	2013-11-04 15:51:17.257816	Evaluación aprovada por el analista	1619	\N
373	mduran	2013-11-04 15:52:20.742126	Evaluación aprovada por el analista	1622	\N
395	mduran	2013-11-04 15:54:14.757164	Evaluación aprovada por el analista	1624	\N
446	rsarache	2013-11-04 16:14:54.310955	Evaluación realizada/modificada	1629	\N
500	erondon	2013-11-04 16:30:51.484863	Evaluacion creada/iniciada	1636	\N
503	erondon	2013-11-04 16:32:11.571551	Evaluacion creada/iniciada	1639	\N
356	rsarache	2013-11-04 16:32:47.11726	Evaluación enviada a Revision	1641	\N
507	erondon	2013-11-04 16:35:47.77492	Evaluacion creada/iniciada	1645	\N
510	erondon	2013-11-04 16:37:19.022128	Evaluacion creada/iniciada	1648	\N
513	erondon	2013-11-04 16:38:35.114908	Evaluacion creada/iniciada	1651	\N
516	erondon	2013-11-04 16:40:05.140274	Evaluacion creada/iniciada	1654	\N
519	erondon	2013-11-04 16:41:36.534248	Evaluacion creada/iniciada	1657	\N
522	erondon	2013-11-04 16:42:58.04586	Evaluacion creada/iniciada	1660	\N
436	rsarache	2013-11-04 16:43:57.469678	Evaluación enviada a Revision	1663	\N
528	erondon	2013-11-04 16:45:43.950562	Evaluacion creada/iniciada	1668	\N
531	erondon	2013-11-04 16:47:01.65342	Evaluacion creada/iniciada	1671	\N
534	erondon	2013-11-04 16:48:25.694493	Evaluacion creada/iniciada	1674	\N
537	erondon	2013-11-04 16:50:26.556107	Evaluacion creada/iniciada	1677	\N
540	erondon	2013-11-04 16:51:47.437692	Evaluacion creada/iniciada	1680	\N
544	erondon	2013-11-04 16:54:05.607025	Evaluacion creada/iniciada	1684	\N
402	rsarache	2013-11-04 16:55:32.689165	Evaluación realizada/modificada	1687	\N
402	rsarache	2013-11-04 16:55:40.764739	Evaluación enviada a Revision	1689	\N
497	erondon	2013-11-04 17:02:25.68111	Evaluación realizada/modificada	1693	\N
400	rsarache	2013-11-04 17:05:13.097759	Evaluación enviada a Revision	1695	\N
532	erondon	2013-11-04 17:11:03.688947	Evaluación realizada/modificada	1698	\N
536	erondon	2013-11-04 17:16:28.471924	Evaluación realizada/modificada	1703	\N
515	erondon	2013-11-04 17:20:49.780219	Evaluación realizada/modificada	1705	\N
517	erondon	2013-11-04 17:25:31.59511	Evaluación realizada/modificada	1707	\N
517	erondon	2013-11-04 17:29:00.751679	Evaluación realizada/modificada	1709	\N
499	erondon	2013-11-04 17:35:34.569415	Evaluación realizada/modificada	1711	\N
539	erondon	2013-11-04 17:38:56.545345	Evaluación realizada/modificada	1713	\N
528	erondon	2013-11-04 17:42:17.004301	Evaluación realizada/modificada	1715	\N
393	rsarache	2013-11-04 17:54:12.717307	Evaluación realizada/modificada	1717	\N
417	rsarache	2013-11-04 18:06:19.051186	Evaluación enviada a Revision	1722	\N
439	rsarache	2013-11-04 18:15:43.979045	Evaluación realizada/modificada	1723	\N
361	rsarache	2013-11-04 18:33:14.475238	Evaluación enviada a Revision	1728	\N
367	rsarache	2013-11-04 18:46:32.411944	Evaluación realizada/modificada	1729	\N
363	rsarache	2013-11-04 18:59:13.707252	Evaluación realizada/modificada	1733	\N
363	rsarache	2013-11-04 18:59:23.300917	Evaluación enviada a Revision	1734	\N
337	rsarache	2013-11-04 19:01:56.018837	Evaluación realizada/modificada	1735	\N
337	rsarache	2013-11-04 19:02:12.674415	Evaluación enviada a Revision	1736	\N
430	rsarache	2013-11-04 19:11:07.926408	Evaluación realizada/modificada	1737	\N
430	rsarache	2013-11-04 19:11:27.518413	Evaluación enviada a Revision	1738	\N
416	rsarache	2013-11-05 08:19:56.688121	Evaluación realizada/modificada	1739	\N
416	rsarache	2013-11-05 08:20:04.316687	Evaluación enviada a Revision	1740	\N
399	rsarache	2013-11-05 08:30:05.186443	Evaluación realizada/modificada	1741	\N
399	rsarache	2013-11-05 08:30:12.725898	Evaluación enviada a Revision	1742	\N
355	rsarache	2013-11-05 08:39:39.035372	Evaluación realizada/modificada	1743	\N
355	rsarache	2013-11-05 08:39:47.424384	Evaluación enviada a Revision	1744	\N
348	rsarache	2013-11-05 08:45:17.866239	Evaluación realizada/modificada	1745	\N
348	rsarache	2013-11-05 08:45:25.982839	Evaluación enviada a Revision	1746	\N
445	rsarache	2013-11-05 08:51:12.089992	Evaluación realizada/modificada	1747	\N
445	rsarache	2013-11-05 08:51:19.662627	Evaluación enviada a Revision	1748	\N
345	rsarache	2013-11-05 09:00:25.355068	Evaluación realizada/modificada	1749	\N
345	rsarache	2013-11-05 09:00:35.931721	Evaluación enviada a Revision	1750	\N
444	rsarache	2013-11-05 09:09:07.415332	Evaluación realizada/modificada	1751	\N
444	rsarache	2013-11-05 09:09:14.98265	Evaluación enviada a Revision	1752	\N
404	rsarache	2013-11-05 09:15:29.621155	Evaluación realizada/modificada	1753	\N
404	rsarache	2013-11-05 09:15:42.627791	Evaluación enviada a Revision	1754	\N
331	jbuitrago	2013-11-05 10:04:38.999637	Evaluación realizada/modificada	1755	\N
360	rsarache	2013-11-05 10:27:21.017284	Evaluación realizada/modificada	1756	\N
360	rsarache	2013-11-05 10:27:30.619759	Evaluación enviada a Revision	1757	\N
428	rsarache	2013-11-05 10:42:51.72015	Evaluación realizada/modificada	1758	\N
428	rsarache	2013-11-05 10:43:06.962126	Evaluación enviada a Revision	1759	\N
549	rsarache	2013-11-05 10:45:38.873286	Evaluacion creada/iniciada	1760	\N
549	rsarache	2013-11-05 10:49:01.698018	Evaluación realizada/modificada	1761	\N
549	rsarache	2013-11-05 10:49:20.556639	Evaluación enviada a Revision	1762	\N
433	rsarache	2013-11-05 10:57:08.056606	Evaluación realizada/modificada	1763	\N
433	rsarache	2013-11-05 10:57:15.773732	Evaluación enviada a Revision	1764	\N
397	rsarache	2013-11-05 11:01:57.848122	Evaluación realizada/modificada	1765	\N
397	rsarache	2013-11-05 11:02:05.128988	Evaluación enviada a Revision	1766	\N
343	rsarache	2013-11-05 11:06:26.082821	Evaluación realizada/modificada	1767	\N
343	rsarache	2013-11-05 11:06:35.991343	Evaluación enviada a Revision	1768	\N
438	rsarache	2013-11-05 11:15:06.696571	Evaluación realizada/modificada	1769	\N
438	rsarache	2013-11-05 11:15:15.528235	Evaluación enviada a Revision	1770	\N
341	rsarache	2013-11-05 11:17:46.225192	Evaluación realizada/modificada	1771	\N
341	rsarache	2013-11-05 11:18:02.336083	Evaluación enviada a Revision	1772	\N
394	rsarache	2013-11-05 11:22:24.054106	Evaluación realizada/modificada	1773	\N
394	rsarache	2013-11-05 11:22:41.099201	Evaluación enviada a Revision	1774	\N
405	rsarache	2013-11-05 11:32:19.890534	Evaluación realizada/modificada	1775	\N
405	rsarache	2013-11-05 11:32:30.54257	Evaluación enviada a Revision	1776	\N
384	rsarache	2013-11-05 11:40:02.227415	Evaluación realizada/modificada	1777	\N
384	rsarache	2013-11-05 11:40:11.099579	Evaluación enviada a Revision	1778	\N
412	rsarache	2013-11-05 11:47:05.184116	Evaluación realizada/modificada	1779	\N
412	rsarache	2013-11-05 11:47:12.37243	Evaluación enviada a Revision	1780	\N
359	rsarache	2013-11-05 11:58:24.214103	Evaluación realizada/modificada	1781	\N
359	rsarache	2013-11-05 11:58:33.130111	Evaluación enviada a Revision	1782	\N
388	rsarache	2013-11-05 12:08:33.423789	Evaluación realizada/modificada	1783	\N
388	rsarache	2013-11-05 12:08:41.728351	Evaluación enviada a Revision	1784	\N
410	rsarache	2013-11-05 12:10:40.819946	Evaluación enviada a Revision	1787	\N
393	mduran	2013-11-05 13:19:44.596393	Evaluación aprovada por el analista	1789	\N
400	mduran	2013-11-05 13:20:28.0333	Evaluación aprovada por el analista	1790	\N
397	mduran	2013-11-05 13:23:46.873694	Evaluación aprovada por el analista	1793	\N
433	mduran	2013-11-05 13:26:17.437297	Evaluación aprovada por el analista	1796	\N
375	rsarache	2013-11-05 13:34:11.159159	Evaluación enviada a Revision	1799	\N
427	rsarache	2013-11-05 13:40:28.822243	Evaluación enviada a Revision	1803	\N
381	rsarache	2013-11-05 13:42:43.738921	Evaluación realizada/modificada	1804	\N
414	rsarache	2013-11-05 13:45:08.180459	Evaluación realizada/modificada	1807	\N
411	rsarache	2013-11-05 13:54:07.094773	Evaluación realizada/modificada	1813	\N
422	rsarache	2013-11-05 14:00:50.286213	Evaluación enviada a Revision	1818	\N
403	rsarache	2013-11-05 14:10:39.742442	Evaluación enviada a Revision	1822	\N
386	rsarache	2013-11-05 14:12:25.791776	Evaluación realizada/modificada	1824	\N
533	erondon	2013-11-05 14:40:04.576038	Evaluación realizada/modificada	1838	\N
509	erondon	2013-11-05 14:50:00.544518	Evaluación realizada/modificada	1842	\N
501	erondon	2013-11-05 14:59:52.656031	Evaluación realizada/modificada	1852	\N
422	mduran	2013-11-05 15:03:46.713616	Evaluación aprovada por el analista	1855	\N
411	mduran	2013-11-05 15:04:52.239672	Evaluación aprovada por el analista	1856	\N
425	mduran	2013-11-05 15:06:02.12162	Evaluación aprovada por el analista	1858	\N
504	erondon	2013-11-05 15:07:10.996933	Evaluación realizada/modificada	1860	\N
437	mduran	2013-11-05 15:08:22.248202	Evaluación aprovada por el analista	1861	\N
388	mduran	2013-11-05 15:10:48.436217	Evaluación aprovada por el analista	1864	\N
516	erondon	2013-11-05 15:11:37.266358	Evaluación realizada/modificada	1866	\N
384	mduran	2013-11-05 15:11:58.915531	Evaluación aprovada por el analista	1867	\N
375	mduran	2013-11-05 15:12:47.411852	Evaluación aprovada por el analista	1868	\N
356	mduran	2013-11-05 15:20:18.930249	Evaluación aprovada por el analista	1880	\N
438	mduran	2013-11-05 15:24:40.500191	Evaluación aprovada por el analista	1884	\N
426	mduran	2013-11-05 15:27:58.845563	Evaluación aprovada por el analista	1885	\N
341	mduran	2013-11-05 15:28:53.380888	Evaluación aprovada por el analista	1886	\N
452	ajaspe	2013-11-05 15:31:39.90374	Evaluación realizada/modificada	1887	\N
348	mduran	2013-11-05 15:38:47.104058	Evaluación aprovada por el analista	1888	\N
399	mduran	2013-11-05 15:41:32.907862	Evaluación aprovada por el analista	1891	\N
405	mduran	2013-11-05 15:42:56.597591	Evaluación aprovada por el analista	1893	\N
542	erondon	2013-11-05 15:50:23.00261	Evaluación realizada/modificada	1899	\N
554	rsarache	2013-11-05 16:00:36.375532	Evaluacion creada/iniciada	1904	\N
389	rsarache	2013-11-06 06:41:56.409683	Evaluación enviada a Revision	1909	\N
377	rsarache	2013-11-06 06:46:13.246291	Evaluación realizada/modificada	1910	\N
379	rsarache	2013-11-06 07:22:49.324925	Evaluación enviada a Revision	1915	\N
364	rsarache	2013-11-06 07:33:25.37899	Evaluación enviada a Revision	1917	\N
410	rsarache	2013-11-05 12:10:32.828217	Evaluación realizada/modificada	1786	\N
416	mduran	2013-11-05 13:23:06.046217	Evaluación aprovada por el analista	1792	\N
342	mduran	2013-11-05 13:24:34.962675	Evaluación aprovada por el analista	1794	\N
343	mduran	2013-11-05 13:27:23.543131	Evaluación aprovada por el analista	1797	\N
362	rsarache	2013-11-05 13:36:26.825113	Evaluación realizada/modificada	1800	\N
551	ncastillo	2013-11-05 13:42:49.142137	Evaluacion creada/iniciada	1805	\N
426	rsarache	2013-11-05 13:52:38.817048	Evaluación realizada/modificada	1811	\N
426	rsarache	2013-11-05 13:52:46.950852	Evaluación enviada a Revision	1812	\N
411	rsarache	2013-11-05 13:54:16.073311	Evaluación enviada a Revision	1814	\N
425	rsarache	2013-11-05 13:55:54.325168	Evaluación realizada/modificada	1815	\N
376	rsarache	2013-11-05 14:04:04.017676	Evaluación realizada/modificada	1819	\N
386	rsarache	2013-11-05 14:12:34.915354	Evaluación enviada a Revision	1825	\N
338	rsarache	2013-11-05 14:14:18.879932	Evaluación realizada/modificada	1826	\N
421	rsarache	2013-11-05 14:19:43.159402	Evaluación enviada a Revision	1833	\N
500	erondon	2013-11-05 14:34:53.412586	Evaluación realizada/modificada	1837	\N
533	erondon	2013-11-05 14:41:01.814272	Evaluación realizada/modificada	1839	\N
548	erondon	2013-11-05 14:54:16.758279	Evaluación realizada/modificada	1844	\N
430	mduran	2013-11-05 14:55:51.242537	Evaluación aprovada por el analista	1845	\N
376	mduran	2013-11-05 14:58:05.826193	Evaluación aprovada por el analista	1848	\N
501	erondon	2013-11-05 14:59:05.197136	Evaluación realizada/modificada	1850	\N
403	mduran	2013-11-05 14:59:29.500013	Evaluación aprovada por el analista	1851	\N
506	erondon	2013-11-05 15:02:22.362371	Evaluación realizada/modificada	1854	\N
421	mduran	2013-11-05 15:06:56.583027	Evaluación aprovada por el analista	1859	\N
436	mduran	2013-11-05 15:09:39.407139	Evaluación aprovada por el analista	1862	\N
516	erondon	2013-11-05 15:11:05.350327	Evaluación realizada/modificada	1865	\N
367	mduran	2013-11-05 15:13:24.828105	Evaluación aprovada por el analista	1869	\N
402	mduran	2013-11-05 15:14:12.593904	Evaluación aprovada por el analista	1871	\N
516	erondon	2013-11-05 15:14:31.495549	Evaluación realizada/modificada	1872	\N
361	mduran	2013-11-05 15:15:11.415829	Evaluación aprovada por el analista	1873	\N
360	mduran	2013-11-05 15:15:51.90779	Evaluación aprovada por el analista	1875	\N
359	mduran	2013-11-05 15:16:27.907072	Evaluación aprovada por el analista	1876	\N
427	mduran	2013-11-05 15:19:00.683124	Evaluación aprovada por el analista	1878	\N
439	mduran	2013-11-05 15:20:56.098633	Evaluación aprovada por el analista	1881	\N
345	mduran	2013-11-05 15:40:39.603607	Evaluación aprovada por el analista	1890	\N
404	mduran	2013-11-05 15:43:41.923033	Evaluación aprovada por el analista	1894	\N
355	mduran	2013-11-05 15:46:02.087258	Evaluación aprovada por el analista	1896	\N
521	erondon	2013-11-05 15:47:06.28901	Evaluación realizada/modificada	1897	\N
512	erondon	2013-11-05 15:55:47.495279	Evaluación realizada/modificada	1900	\N
553	rsarache	2013-11-05 15:59:56.074844	Evaluacion creada/iniciada	1902	\N
382	rsarache	2013-11-06 06:38:13.071238	Evaluación realizada/modificada	1906	\N
377	rsarache	2013-11-06 06:46:21.567402	Evaluación enviada a Revision	1911	\N
555	rsarache	2013-11-06 07:01:52.350771	Evaluación realizada/modificada	1912	\N
337	mduran	2013-11-05 13:18:51.026858	Evaluación aprovada por el analista	1788	\N
363	mduran	2013-11-05 13:21:17.140228	Evaluación aprovada por el analista	1791	\N
549	mduran	2013-11-05 13:25:29.064349	Evaluación aprovada por el analista	1795	\N
375	rsarache	2013-11-05 13:34:03.64557	Evaluación realizada/modificada	1798	\N
362	rsarache	2013-11-05 13:36:33.974798	Evaluación enviada a Revision	1801	\N
427	rsarache	2013-11-05 13:40:19.656277	Evaluación realizada/modificada	1802	\N
381	rsarache	2013-11-05 13:43:00.213895	Evaluación enviada a Revision	1806	\N
414	rsarache	2013-11-05 13:45:17.85366	Evaluación enviada a Revision	1808	\N
425	rsarache	2013-11-05 13:56:03.41888	Evaluación enviada a Revision	1816	\N
422	rsarache	2013-11-05 14:00:40.533926	Evaluación realizada/modificada	1817	\N
376	rsarache	2013-11-05 14:04:19.565467	Evaluación enviada a Revision	1820	\N
403	rsarache	2013-11-05 14:10:31.343846	Evaluación realizada/modificada	1821	\N
546	erondon	2013-11-05 14:11:14.432901	Evaluación realizada/modificada	1823	\N
338	rsarache	2013-11-05 14:14:29.458099	Evaluación enviada a Revision	1827	\N
546	erondon	2013-11-05 14:14:55.547576	Evaluación realizada/modificada	1828	\N
546	erondon	2013-11-05 14:16:34.230806	Evaluación realizada/modificada	1829	\N
437	rsarache	2013-11-05 14:17:14.629062	Evaluación realizada/modificada	1830	\N
437	rsarache	2013-11-05 14:17:31.410391	Evaluación enviada a Revision	1831	\N
421	rsarache	2013-11-05 14:19:34.433259	Evaluación realizada/modificada	1832	\N
546	erondon	2013-11-05 14:24:24.802124	Evaluación realizada/modificada	1834	\N
378	rsarache	2013-11-05 14:26:00.807804	Evaluación realizada/modificada	1835	\N
378	rsarache	2013-11-05 14:26:11.025789	Evaluación enviada a Revision	1836	\N
533	erondon	2013-11-05 14:41:58.42433	Evaluación realizada/modificada	1840	\N
509	erondon	2013-11-05 14:45:22.966463	Evaluación realizada/modificada	1841	\N
547	erondon	2013-11-05 14:52:43.686727	Evaluación realizada/modificada	1843	\N
545	erondon	2013-11-05 14:56:34.448407	Evaluación realizada/modificada	1846	\N
338	mduran	2013-11-05 14:57:07.87438	Evaluación aprovada por el analista	1847	\N
362	mduran	2013-11-05 14:58:50.858967	Evaluación aprovada por el analista	1849	\N
386	mduran	2013-11-05 15:00:16.057094	Evaluación aprovada por el analista	1853	\N
526	erondon	2013-11-05 15:04:54.263053	Evaluación realizada/modificada	1857	\N
516	erondon	2013-11-05 15:10:25.811042	Evaluación realizada/modificada	1863	\N
516	erondon	2013-11-05 15:13:32.992586	Evaluación realizada/modificada	1870	\N
516	erondon	2013-11-05 15:15:24.108167	Evaluación realizada/modificada	1874	\N
369	mduran	2013-11-05 15:17:18.577229	Evaluación aprovada por el analista	1877	\N
414	mduran	2013-11-05 15:19:39.652717	Evaluación aprovada por el analista	1879	\N
412	mduran	2013-11-05 15:21:31.551343	Evaluación aprovada por el analista	1882	\N
378	mduran	2013-11-05 15:24:02.7036	Evaluación aprovada por el analista	1883	\N
445	mduran	2013-11-05 15:39:49.210045	Evaluación aprovada por el analista	1889	\N
446	mduran	2013-11-05 15:42:05.709046	Evaluación aprovada por el analista	1892	\N
444	mduran	2013-11-05 15:44:37.207079	Evaluación aprovada por el analista	1895	\N
521	erondon	2013-11-05 15:47:39.380511	Evaluación realizada/modificada	1898	\N
507	erondon	2013-11-05 15:58:54.706041	Evaluación realizada/modificada	1901	\N
514	erondon	2013-11-05 16:00:07.07888	Evaluación realizada/modificada	1903	\N
555	rsarache	2013-11-05 16:01:19.102728	Evaluacion creada/iniciada	1905	\N
382	rsarache	2013-11-06 06:38:22.353168	Evaluación enviada a Revision	1907	\N
389	rsarache	2013-11-06 06:41:48.317907	Evaluación realizada/modificada	1908	\N
555	rsarache	2013-11-06 07:02:00.786508	Evaluación enviada a Revision	1913	\N
379	rsarache	2013-11-06 07:22:40.46824	Evaluación realizada/modificada	1914	\N
364	rsarache	2013-11-06 07:33:17.580888	Evaluación realizada/modificada	1916	\N
372	rsarache	2013-11-06 07:47:12.004789	Evaluación realizada/modificada	1918	\N
372	rsarache	2013-11-06 07:47:37.500042	Evaluación enviada a Revision	1919	\N
413	rsarache	2013-11-06 07:55:59.091561	Evaluación realizada/modificada	1920	\N
413	rsarache	2013-11-06 07:56:19.387873	Evaluación enviada a Revision	1921	\N
554	rsarache	2013-11-06 08:04:35.19488	Evaluación realizada/modificada	1922	\N
554	rsarache	2013-11-06 08:05:13.811208	Evaluación enviada a Revision	1923	\N
555	mduran	2013-11-06 08:11:58.442123	Evaluación aprovada por el analista	1924	\N
377	mduran	2013-11-06 08:14:03.081027	Evaluación aprovada por el analista	1925	\N
389	mduran	2013-11-06 08:15:33.234403	Evaluación aprovada por el analista	1926	\N
372	mduran	2013-11-06 08:16:19.779878	Evaluación aprovada por el analista	1927	\N
350	rsarache	2013-11-06 08:16:46.29436	Evaluación realizada/modificada	1928	\N
350	rsarache	2013-11-06 08:17:26.036843	Evaluación enviada a Revision	1929	\N
413	mduran	2013-11-06 08:17:33.333432	Evaluación aprovada por el analista	1930	\N
418	rsarache	2013-11-06 09:06:59.867955	Evaluación realizada/modificada	1931	\N
418	rsarache	2013-11-06 09:07:30.73418	Evaluación enviada a Revision	1932	\N
498	rsarache	2013-11-06 09:14:05.16604	Evaluación realizada/modificada	1933	\N
498	rsarache	2013-11-06 09:14:22.238623	Evaluación enviada a Revision	1934	\N
423	rsarache	2013-11-06 09:17:49.572536	Evaluación realizada/modificada	1935	\N
423	rsarache	2013-11-06 09:17:59.496448	Evaluación enviada a Revision	1936	\N
380	rsarache	2013-11-06 09:23:49.081989	Evaluación realizada/modificada	1937	\N
380	rsarache	2013-11-06 09:23:56.817381	Evaluación enviada a Revision	1938	\N
556	lgonzalez	2013-11-06 10:20:03.496639	Evaluacion creada/iniciada	1939	\N
556	lgonzalez	2013-11-06 10:30:23.240927	Evaluación realizada/modificada	1940	\N
556	lgonzalez	2013-11-06 10:33:01.725977	Evaluación realizada/modificada	1941	\N
556	lgonzalez	2013-11-06 10:35:05.457791	Evaluación realizada/modificada	1942	\N
557	lgonzalez	2013-11-06 10:39:04.101318	Evaluacion creada/iniciada	1943	\N
557	lgonzalez	2013-11-06 10:44:10.973426	Evaluación realizada/modificada	1944	\N
335	rsarache	2013-11-06 10:46:11.381758	Evaluación realizada/modificada	1945	\N
335	rsarache	2013-11-06 10:46:20.841024	Evaluación enviada a Revision	1946	\N
407	rsarache	2013-11-06 10:48:23.157271	Evaluación realizada/modificada	1947	\N
407	rsarache	2013-11-06 10:48:36.929817	Evaluación enviada a Revision	1948	\N
558	mmedina	2013-11-06 10:49:13.178054	Evaluacion creada/iniciada	1949	\N
339	rsarache	2013-11-06 10:50:36.022941	Evaluación realizada/modificada	1950	\N
339	rsarache	2013-11-06 10:50:59.179761	Evaluación enviada a Revision	1951	\N
558	mmedina	2013-11-06 10:54:05.931765	Evaluación realizada/modificada	1952	\N
398	rsarache	2013-11-06 10:54:30.088905	Evaluación realizada/modificada	1953	\N
398	rsarache	2013-11-06 10:54:46.715802	Evaluación enviada a Revision	1954	\N
558	mmedina	2013-11-06 10:55:38.20442	Evaluación enviada a Revision	1955	\N
374	rsarache	2013-11-06 10:56:38.020604	Evaluación realizada/modificada	1956	\N
497	erondon	2013-11-06 11:07:24.092631	Evaluación enviada a Revision	1960	\N
500	erondon	2013-11-06 11:08:05.560543	Evaluación enviada a Revision	1961	\N
501	erondon	2013-11-06 11:08:36.575102	Evaluación enviada a Revision	1962	\N
368	rsarache	2013-11-06 11:09:30.634007	Evaluación enviada a Revision	1964	\N
503	erondon	2013-11-06 11:27:14.389721	Evaluación realizada/modificada	1974	\N
503	erondon	2013-11-06 11:27:36.428153	Evaluación enviada a Revision	1975	\N
504	erondon	2013-11-06 11:29:00.492987	Evaluación enviada a Revision	1976	\N
415	rsarache	2013-11-06 11:29:33.249358	Evaluación realizada/modificada	1977	\N
415	rsarache	2013-11-06 11:29:53.33708	Evaluación enviada a Revision	1978	\N
501	mduran	2013-11-06 11:45:39.557165	Evaluación aprovada por el analista	1980	\N
503	mduran	2013-11-06 11:47:47.154197	Evaluación aprovada por el analista	1983	\N
409	rsarache	2013-11-06 11:48:33.481235	Evaluación realizada/modificada	1985	\N
497	mduran	2013-11-06 11:49:58.872819	Evaluación aprovada por el analista	1990	\N
500	mduran	2013-11-06 11:55:35.172493	Evaluación aprovada por el analista	1992	\N
335	mduran	2013-11-06 11:57:45.292401	Evaluación aprovada por el analista	1994	\N
409	mduran	2013-11-06 11:59:53.827625	Evaluación aprovada por el analista	1997	\N
505	erondon	2013-11-06 12:03:12.016102	Evaluación enviada a Revision	2000	\N
508	erondon	2013-11-06 12:08:14.126478	Evaluación realizada/modificada	2003	\N
508	erondon	2013-11-06 12:08:37.754062	Evaluación enviada a Revision	2004	\N
509	erondon	2013-11-06 12:09:48.40863	Evaluación enviada a Revision	2005	\N
499	erondon	2013-11-06 12:11:07.606131	Evaluación enviada a Revision	2006	\N
510	erondon	2013-11-06 12:13:20.746584	Evaluación realizada/modificada	2010	\N
561	fpavone	2013-11-06 12:13:39.153529	Evaluación realizada/modificada	2011	\N
561	fpavone	2013-11-06 12:15:04.235242	Evaluación realizada/modificada	2013	\N
560	fpavone	2013-11-06 12:18:18.103632	Evaluación realizada/modificada	2017	\N
560	fpavone	2013-11-06 12:18:38.249832	Evaluación enviada a Revision	2018	\N
512	erondon	2013-11-06 12:22:29.38509	Evaluación enviada a Revision	2019	\N
515	erondon	2013-11-06 12:22:52.505843	Evaluación enviada a Revision	2020	\N
517	erondon	2013-11-06 12:23:27.159182	Evaluación enviada a Revision	2021	\N
511	erondon	2013-11-06 12:24:01.540643	Evaluación enviada a Revision	2022	\N
516	erondon	2013-11-06 12:24:27.017077	Evaluación enviada a Revision	2023	\N
521	erondon	2013-11-06 12:25:07.568501	Evaluación enviada a Revision	2024	\N
528	erondon	2013-11-06 12:25:38.420008	Evaluación enviada a Revision	2025	\N
539	erondon	2013-11-06 12:29:02.087309	Evaluación enviada a Revision	2026	\N
448	ajaspe	2013-11-06 13:09:17.529864	Evaluación realizada/modificada	2027	\N
368	mduran	2013-11-06 13:16:02.223454	Evaluación aprovada por el analista	2028	\N
515	mduran	2013-11-06 13:17:14.905245	Evaluación aprovada por el analista	2029	\N
398	mduran	2013-11-06 13:22:22.672042	Evaluación aprovada por el analista	2033	\N
339	mduran	2013-11-06 13:23:11.602547	Evaluación aprovada por el analista	2034	\N
380	mduran	2013-11-06 13:24:46.367425	Evaluación aprovada por el analista	2035	\N
382	mduran	2013-11-06 13:26:55.407613	Evaluación aprovada por el analista	2036	\N
498	mduran	2013-11-06 13:28:05.591933	Evaluación aprovada por el analista	2037	\N
418	mduran	2013-11-06 13:32:24.319088	Evaluación aprovada por el analista	2039	\N
519	erondon	2013-11-06 13:51:53.302233	Evaluación realizada/modificada	2048	\N
543	erondon	2013-11-06 14:01:23.526769	Evaluación realizada/modificada	2058	\N
543	erondon	2013-11-06 14:01:37.962275	Evaluación enviada a Revision	2059	\N
534	erondon	2013-11-06 14:02:52.958024	Evaluación enviada a Revision	2060	\N
562	egelvis	2013-11-06 14:07:48.250688	Evaluacion creada/iniciada	2063	\N
366	rsarache	2013-11-06 14:15:53.044104	Evaluación realizada/modificada	2071	\N
366	rsarache	2013-11-06 14:16:08.724706	Evaluación enviada a Revision	2072	\N
523	erondon	2013-11-06 14:18:58.173662	Evaluación realizada/modificada	2073	\N
562	egelvis	2013-11-06 14:23:21.416557	Evaluación enviada a Revision	2080	\N
533	erondon	2013-11-06 14:24:34.045429	Evaluación enviada a Revision	2083	\N
535	erondon	2013-11-06 14:27:35.344298	Evaluación realizada/modificada	2086	\N
535	erondon	2013-11-06 14:27:50.303459	Evaluación enviada a Revision	2087	\N
415	mduran	2013-11-06 14:29:17.465384	Evaluación aprovada por el analista	2088	\N
434	rsarache	2013-11-06 14:31:53.524582	Evaluación realizada/modificada	2091	\N
390	mduran	2013-11-06 14:32:44.82576	Evaluación aprovada por el analista	2093	\N
562	mduran	2013-11-06 14:33:50.399913	Evaluación aprovada por el analista	2094	\N
347	mduran	2013-11-06 14:38:53.874392	Evaluación aprovada por el analista	2097	\N
434	mduran	2013-11-06 14:42:12.063996	Evaluación aprovada por el analista	2102	\N
506	mduran	2013-11-06 14:45:29.048635	Evaluación aprovada por el analista	2103	\N
512	mduran	2013-11-06 14:46:45.551709	Evaluación aprovada por el analista	2106	\N
540	erondon	2013-11-06 14:57:50.561176	Evaluación enviada a Revision	2111	\N
357	rsarache	2013-11-06 14:58:23.200037	Evaluación enviada a Revision	2113	\N
537	erondon	2013-11-06 15:00:44.464061	Evaluación realizada/modificada	2115	\N
537	erondon	2013-11-06 15:00:59.738301	Evaluación enviada a Revision	2116	\N
530	erondon	2013-11-06 15:10:46.736052	Evaluación realizada/modificada	2124	\N
530	erondon	2013-11-06 15:11:36.493624	Evaluación realizada/modificada	2125	\N
530	erondon	2013-11-06 15:11:50.432993	Evaluación enviada a Revision	2126	\N
374	rsarache	2013-11-06 10:56:57.815675	Evaluación enviada a Revision	1957	\N
401	rsarache	2013-11-06 11:03:57.173185	Evaluación realizada/modificada	1958	\N
401	rsarache	2013-11-06 11:04:12.609701	Evaluación enviada a Revision	1959	\N
559	rsarache	2013-11-06 11:12:08.119871	Evaluacion creada/iniciada	1965	\N
503	erondon	2013-11-06 11:26:32.97955	Evaluación realizada/modificada	1973	\N
558	mduran	2013-11-06 11:47:05.992228	Evaluación aprovada por el analista	1982	\N
409	rsarache	2013-11-06 11:48:50.213265	Evaluación enviada a Revision	1986	\N
504	mduran	2013-11-06 11:48:57.207753	Evaluación aprovada por el analista	1987	\N
505	erondon	2013-11-06 11:49:15.317168	Evaluación realizada/modificada	1988	\N
505	erondon	2013-11-06 11:49:56.769068	Evaluación realizada/modificada	1989	\N
490	mduran	2013-11-06 11:56:19.110515	Evaluación aprovada por el analista	1993	\N
401	mduran	2013-11-06 11:59:11.36646	Evaluación aprovada por el analista	1996	\N
507	erondon	2013-11-06 12:05:34.104564	Evaluación enviada a Revision	2002	\N
368	rsarache	2013-11-06 11:09:11.868463	Evaluación realizada/modificada	1963	\N
340	rsarache	2013-11-06 11:16:39.949801	Evaluación realizada/modificada	1966	\N
340	rsarache	2013-11-06 11:16:54.46525	Evaluación enviada a Revision	1967	\N
502	erondon	2013-11-06 11:19:14.045843	Evaluación realizada/modificada	1968	\N
358	rsarache	2013-11-06 11:20:55.199928	Evaluación realizada/modificada	1969	\N
358	rsarache	2013-11-06 11:21:13.166123	Evaluación enviada a Revision	1970	\N
502	erondon	2013-11-06 11:21:37.037727	Evaluación realizada/modificada	1971	\N
502	erondon	2013-11-06 11:22:10.716086	Evaluación enviada a Revision	1972	\N
505	erondon	2013-11-06 11:31:57.193044	Evaluación realizada/modificada	1979	\N
502	mduran	2013-11-06 11:46:22.996633	Evaluación aprovada por el analista	1981	\N
490	npinate	2013-11-06 11:48:16.750164	Evaluación realizada/modificada	1984	\N
490	npinate	2013-11-06 11:53:29.411956	Evaluación enviada a Revision	1991	\N
374	mduran	2013-11-06 11:58:28.629237	Evaluación aprovada por el analista	1995	\N
407	mduran	2013-11-06 12:01:35.566075	Evaluación aprovada por el analista	1998	\N
505	erondon	2013-11-06 12:01:50.220858	Evaluación realizada/modificada	1999	\N
506	erondon	2013-11-06 12:04:07.811646	Evaluación enviada a Revision	2001	\N
560	fpavone	2013-11-06 12:11:09.943164	Evaluacion creada/iniciada	2007	\N
514	erondon	2013-11-06 12:11:34.411374	Evaluación enviada a Revision	2008	\N
561	fpavone	2013-11-06 12:11:44.38539	Evaluacion creada/iniciada	2009	\N
510	erondon	2013-11-06 12:15:03.175864	Evaluación realizada/modificada	2012	\N
510	erondon	2013-11-06 12:15:17.145095	Evaluación enviada a Revision	2014	\N
561	fpavone	2013-11-06 12:16:10.531009	Evaluación realizada/modificada	2015	\N
561	fpavone	2013-11-06 12:16:34.217697	Evaluación enviada a Revision	2016	\N
560	mduran	2013-11-06 13:18:55.758387	Evaluación aprovada por el analista	2030	\N
507	mduran	2013-11-06 13:20:28.056892	Evaluación aprovada por el analista	2031	\N
509	mduran	2013-11-06 13:21:25.85793	Evaluación aprovada por el analista	2032	\N
554	mduran	2013-11-06 13:29:18.377923	Evaluación aprovada por el analista	2038	\N
347	rsarache	2013-11-06 13:39:57.776612	Evaluación realizada/modificada	2040	\N
347	rsarache	2013-11-06 13:40:28.02256	Evaluación enviada a Revision	2041	\N
527	erondon	2013-11-06 13:44:19.722375	Evaluación enviada a Revision	2042	\N
547	erondon	2013-11-06 13:45:07.287383	Evaluación enviada a Revision	2043	\N
513	erondon	2013-11-06 13:47:05.313406	Evaluación realizada/modificada	2044	\N
513	erondon	2013-11-06 13:47:19.011265	Evaluación enviada a Revision	2045	\N
518	erondon	2013-11-06 13:49:46.994506	Evaluación realizada/modificada	2046	\N
518	erondon	2013-11-06 13:50:07.989259	Evaluación enviada a Revision	2047	\N
519	erondon	2013-11-06 13:53:14.729028	Evaluación realizada/modificada	2049	\N
519	erondon	2013-11-06 13:53:30.153075	Evaluación enviada a Revision	2050	\N
442	rsarache	2013-11-06 13:54:38.786928	Evaluación realizada/modificada	2051	\N
442	rsarache	2013-11-06 13:54:58.747685	Evaluación enviada a Revision	2052	\N
546	erondon	2013-11-06 13:55:24.429946	Evaluación enviada a Revision	2053	\N
541	erondon	2013-11-06 13:57:57.639453	Evaluación realizada/modificada	2054	\N
541	erondon	2013-11-06 13:58:14.530539	Evaluación enviada a Revision	2055	\N
520	erondon	2013-11-06 13:59:51.241546	Evaluación realizada/modificada	2056	\N
520	erondon	2013-11-06 14:00:04.649529	Evaluación enviada a Revision	2057	\N
532	erondon	2013-11-06 14:05:59.781468	Evaluación realizada/modificada	2061	\N
532	erondon	2013-11-06 14:06:23.964768	Evaluación enviada a Revision	2062	\N
522	erondon	2013-11-06 14:11:51.252019	Evaluación realizada/modificada	2064	\N
522	erondon	2013-11-06 14:12:06.127283	Evaluación enviada a Revision	2065	\N
548	erondon	2013-11-06 14:12:40.855609	Evaluación enviada a Revision	2066	\N
545	erondon	2013-11-06 14:13:10.46382	Evaluación enviada a Revision	2067	\N
526	erondon	2013-11-06 14:13:36.757203	Evaluación enviada a Revision	2068	\N
524	erondon	2013-11-06 14:15:39.25833	Evaluación realizada/modificada	2069	\N
524	erondon	2013-11-06 14:15:52.977904	Evaluación enviada a Revision	2070	\N
523	erondon	2013-11-06 14:19:33.025712	Evaluación realizada/modificada	2074	\N
523	erondon	2013-11-06 14:19:44.772359	Evaluación enviada a Revision	2075	\N
525	erondon	2013-11-06 14:22:45.163074	Evaluación realizada/modificada	2076	\N
525	erondon	2013-11-06 14:22:59.491525	Evaluación enviada a Revision	2077	\N
562	egelvis	2013-11-06 14:23:04.121634	Evaluación realizada/modificada	2078	\N
390	rsarache	2013-11-06 14:23:04.929577	Evaluación realizada/modificada	2079	\N
390	rsarache	2013-11-06 14:23:22.433881	Evaluación enviada a Revision	2081	\N
536	erondon	2013-11-06 14:24:00.869598	Evaluación enviada a Revision	2082	\N
563	egelvis	2013-11-06 14:26:38.513631	Evaluacion creada/iniciada	2084	\N
535	erondon	2013-11-06 14:27:06.939925	Evaluación realizada/modificada	2085	\N
366	mduran	2013-11-06 14:30:26.059128	Evaluación aprovada por el analista	2089	\N
442	mduran	2013-11-06 14:31:39.143656	Evaluación aprovada por el analista	2090	\N
434	rsarache	2013-11-06 14:32:21.750334	Evaluación enviada a Revision	2092	\N
423	mduran	2013-11-06 14:34:42.373425	Evaluación aprovada por el analista	2095	\N
520	mduran	2013-11-06 14:36:26.587067	Evaluación aprovada por el analista	2096	\N
563	egelvis	2013-11-06 14:39:36.734194	Evaluación realizada/modificada	2098	\N
358	mduran	2013-11-06 14:40:13.849445	Evaluación aprovada por el analista	2099	\N
563	egelvis	2013-11-06 14:40:35.140654	Evaluación enviada a Revision	2100	\N
548	mduran	2013-11-06 14:41:21.599868	Evaluación aprovada por el analista	2101	\N
543	mduran	2013-11-06 14:46:06.733788	Evaluación aprovada por el analista	2104	\N
544	erondon	2013-11-06 14:46:14.332216	Evaluación enviada a Revision	2105	\N
561	mduran	2013-11-06 14:47:27.285131	Evaluación aprovada por el analista	2107	\N
525	mduran	2013-11-06 14:48:09.477674	Evaluación aprovada por el analista	2108	\N
505	mduran	2013-11-06 14:48:53.863556	Evaluación aprovada por el analista	2109	\N
542	erondon	2013-11-06 14:53:03.286892	Evaluación enviada a Revision	2110	\N
357	rsarache	2013-11-06 14:57:56.291791	Evaluación realizada/modificada	2112	\N
537	erondon	2013-11-06 14:59:59.437108	Evaluación realizada/modificada	2114	\N
529	erondon	2013-11-06 15:03:25.719489	Evaluación realizada/modificada	2117	\N
529	erondon	2013-11-06 15:04:06.209596	Evaluación realizada/modificada	2118	\N
529	erondon	2013-11-06 15:04:20.861919	Evaluación enviada a Revision	2119	\N
383	rsarache	2013-11-06 15:05:20.605631	Evaluación realizada/modificada	2120	\N
383	rsarache	2013-11-06 15:05:35.827855	Evaluación enviada a Revision	2121	\N
531	erondon	2013-11-06 15:08:19.621881	Evaluación realizada/modificada	2122	\N
531	erondon	2013-11-06 15:08:37.040485	Evaluación enviada a Revision	2123	\N
538	erondon	2013-11-06 15:16:48.667074	Evaluación realizada/modificada	2127	\N
424	rsarache	2013-11-06 15:29:45.985627	Evaluación realizada/modificada	2130	\N
424	rsarache	2013-11-06 15:30:13.820641	Evaluación enviada a Revision	2131	\N
538	erondon	2013-11-06 15:17:19.036025	Evaluación realizada/modificada	2128	\N
538	erondon	2013-11-06 15:17:44.916444	Evaluación enviada a Revision	2129	\N
391	rsarache	2013-11-06 15:40:44.659597	Evaluación realizada/modificada	2132	\N
391	rsarache	2013-11-06 15:41:00.452307	Evaluación enviada a Revision	2133	\N
546	mduran	2013-11-06 16:02:12.355237	Evaluación aprovada por el analista	2136	\N
564	rsarache	2013-11-06 16:12:40.370412	Evaluacion creada/iniciada	2137	\N
564	rsarache	2013-11-06 16:14:02.754719	Evaluación realizada/modificada	2138	\N
564	rsarache	2013-11-06 16:14:22.332512	Evaluación enviada a Revision	2139	\N
565	isolorzano	2013-11-06 16:17:31.033673	Evaluacion creada/iniciada	2140	\N
435	rsarache	2013-11-06 16:22:45.188439	Evaluación realizada/modificada	2141	\N
435	rsarache	2013-11-06 16:23:04.870388	Evaluación enviada a Revision	2142	\N
565	isolorzano	2013-11-06 16:23:30.07621	Evaluación realizada/modificada	2143	\N
565	isolorzano	2013-11-06 16:23:53.624106	Evaluación enviada a Revision	2144	\N
566	rsarache	2013-11-06 16:24:23.197084	Evaluacion creada/iniciada	2145	\N
567	bmartinez	2013-11-06 17:10:39.505659	Evaluacion creada/iniciada	2146	\N
568	bmartinez	2013-11-06 17:11:47.969884	Evaluacion creada/iniciada	2147	\N
569	bmartinez	2013-11-06 17:13:15.277472	Evaluacion creada/iniciada	2148	\N
570	bmartinez	2013-11-06 17:13:54.483344	Evaluacion creada/iniciada	2149	\N
571	bmartinez	2013-11-06 17:14:23.485201	Evaluacion creada/iniciada	2150	\N
572	bmartinez	2013-11-06 17:15:00.68897	Evaluacion creada/iniciada	2151	\N
573	bmartinez	2013-11-06 17:15:47.637233	Evaluacion creada/iniciada	2152	\N
574	bmartinez	2013-11-06 17:16:30.294456	Evaluacion creada/iniciada	2153	\N
567	bmartinez	2013-11-06 17:22:44.240211	Evaluación realizada/modificada	2154	\N
567	bmartinez	2013-11-06 17:23:07.101663	Evaluación enviada a Revision	2155	\N
573	bmartinez	2013-11-06 17:24:48.844559	Evaluación realizada/modificada	2156	\N
573	bmartinez	2013-11-06 17:24:51.931572	Evaluación realizada/modificada	2157	\N
573	bmartinez	2013-11-06 17:25:06.266923	Evaluación enviada a Revision	2158	\N
572	bmartinez	2013-11-06 17:26:48.600493	Evaluación realizada/modificada	2159	\N
572	bmartinez	2013-11-06 17:26:57.271759	Evaluación enviada a Revision	2160	\N
570	bmartinez	2013-11-06 17:28:14.032425	Evaluación realizada/modificada	2161	\N
570	bmartinez	2013-11-06 17:28:39.904319	Evaluación realizada/modificada	2162	\N
570	bmartinez	2013-11-06 17:28:46.782051	Evaluación enviada a Revision	2163	\N
574	bmartinez	2013-11-06 17:32:31.188035	Evaluación realizada/modificada	2164	\N
574	bmartinez	2013-11-06 17:32:40.420468	Evaluación enviada a Revision	2165	\N
569	bmartinez	2013-11-06 17:35:34.805503	Evaluación realizada/modificada	2166	\N
569	bmartinez	2013-11-06 17:35:43.440548	Evaluación enviada a Revision	2167	\N
568	bmartinez	2013-11-06 17:38:39.532805	Evaluación realizada/modificada	2168	\N
568	bmartinez	2013-11-06 17:39:00.272304	Evaluación enviada a Revision	2169	\N
571	bmartinez	2013-11-06 17:44:05.759353	Evaluación realizada/modificada	2170	\N
571	bmartinez	2013-11-06 17:44:22.642955	Evaluación enviada a Revision	2171	\N
333	kguevara	2013-11-06 18:14:50.112798	Evaluación realizada/modificada	2172	\N
333	kguevara	2013-11-06 18:18:02.959249	Evaluación enviada a Revision	2173	\N
575	rcastillo	2013-11-06 18:34:09.9053	Evaluacion creada/iniciada	2174	\N
576	eortega	2013-11-06 18:41:06.959017	Evaluacion creada/iniciada	2175	\N
575	rcastillo	2013-11-06 18:47:04.815773	Evaluación realizada/modificada	2176	\N
575	rcastillo	2013-11-06 18:47:18.155783	Evaluación enviada a Revision	2177	\N
576	eortega	2013-11-06 18:51:06.381802	Evaluación realizada/modificada	2178	\N
473	nlorenzo	2013-11-06 20:49:36.217658	Evaluación realizada/modificada	2179	\N
473	nlorenzo	2013-11-06 20:49:49.671426	Evaluación enviada a Revision	2180	\N
577	nlorenzo	2013-11-06 20:50:32.497117	Evaluacion creada/iniciada	2181	\N
577	nlorenzo	2013-11-06 20:53:58.238335	Evaluación realizada/modificada	2182	\N
577	nlorenzo	2013-11-06 20:54:03.126524	Evaluación realizada/modificada	2183	\N
577	nlorenzo	2013-11-06 20:54:06.982484	Evaluación realizada/modificada	2184	\N
577	nlorenzo	2013-11-06 20:54:17.834251	Evaluación enviada a Revision	2185	\N
578	nlorenzo	2013-11-06 20:55:35.035961	Evaluacion creada/iniciada	2186	\N
578	nlorenzo	2013-11-06 20:58:21.018945	Evaluación realizada/modificada	2187	\N
578	nlorenzo	2013-11-06 20:58:33.357114	Evaluación enviada a Revision	2188	\N
578	nlorenzo	2013-11-06 20:58:49.293323	Evaluación realizada/modificada	2189	\N
578	nlorenzo	2013-11-06 20:58:59.079489	Evaluación enviada a Revision	2190	\N
559	rsarache	2013-11-07 07:20:51.878138	Evaluación realizada/modificada	2191	\N
559	rsarache	2013-11-07 07:21:10.433339	Evaluación enviada a Revision	2192	\N
563	mduran	2013-11-07 08:01:41.037191	Evaluación aprovada por el analista	2193	\N
455	mduran	2013-11-07 08:03:06.606023	Evaluación aprovada por el analista	2194	\N
579	jggarciac	2013-11-07 08:36:34.421049	Evaluacion creada/iniciada	2195	\N
580	jggarciac	2013-11-07 08:41:38.240718	Evaluacion creada/iniciada	2196	\N
581	jggarciac	2013-11-07 08:44:19.006228	Evaluacion creada/iniciada	2197	\N
579	jggarciac	2013-11-07 08:51:21.154336	Evaluación realizada/modificada	2198	\N
408	rsarache	2013-11-07 08:52:02.57615	Evaluación realizada/modificada	2199	\N
408	rsarache	2013-11-07 08:52:20.994278	Evaluación enviada a Revision	2200	\N
580	jggarciac	2013-11-07 08:58:58.465123	Evaluación realizada/modificada	2201	\N
349	rsarache	2013-11-07 09:02:16.14325	Evaluación realizada/modificada	2202	\N
349	rsarache	2013-11-07 09:02:25.230167	Evaluación enviada a Revision	2203	\N
580	jggarciac	2013-11-07 09:04:10.527713	Evaluación realizada/modificada	2204	\N
371	rsarache	2013-11-07 09:09:27.318597	Evaluación realizada/modificada	2205	\N
581	jggarciac	2013-11-07 09:09:31.089629	Evaluación realizada/modificada	2206	\N
371	rsarache	2013-11-07 09:09:35.429864	Evaluación enviada a Revision	2207	\N
580	jggarciac	2013-11-07 09:10:56.613524	Evaluación realizada/modificada	2208	\N
473	mduran	2013-11-07 09:11:33.721704	Evaluación aprovada por el analista	2209	\N
566	rsarache	2013-11-07 09:20:35.688971	Evaluación realizada/modificada	2210	\N
566	rsarache	2013-11-07 09:20:56.862869	Evaluación enviada a Revision	2211	\N
577	mduran	2013-11-07 09:22:56.580435	Evaluación aprovada por el analista	2212	\N
429	rsarache	2013-11-07 09:26:46.462159	Evaluación realizada/modificada	2213	\N
429	rsarache	2013-11-07 09:26:54.756132	Evaluación enviada a Revision	2214	\N
561	mduran	2013-11-07 09:29:01.944984	Evaluación enviada a Revision	2215	\N
579	jggarciac	2013-11-07 09:37:59.704193	Evaluación enviada a Revision	2216	\N
580	jggarciac	2013-11-07 09:38:54.890353	Evaluación enviada a Revision	2217	\N
581	jggarciac	2013-11-07 09:40:15.280172	Evaluación enviada a Revision	2218	\N
581	mduran	2013-11-07 09:57:04.75847	Evaluación aprovada por el analista	2219	\N
580	mduran	2013-11-07 09:57:55.572046	Evaluación aprovada por el analista	2220	\N
579	mduran	2013-11-07 09:58:48.261592	Evaluación aprovada por el analista	2221	\N
578	mduran	2013-11-07 10:07:16.069066	Evaluación aprovada por el analista	2222	\N
582	mmunoz	2013-11-07 10:09:03.624627	Evaluacion creada/iniciada	2223	\N
497	erondon	2013-11-07 10:09:52.960388	Evaluación realizada/modificada	2224	\N
567	mduran	2013-11-07 10:22:34.468144	Evaluación denegada por el analista	2228	\N
571	mduran	2013-11-07 10:26:32.956152	Evaluación denegada por el analista	2232	\N
500	erondon	2013-11-07 10:30:06.46886	Evaluación realizada/modificada	2236	\N
452	ajaspe	2013-11-07 10:32:23.303592	Evaluación realizada/modificada	2242	\N
503	erondon	2013-11-07 10:33:29.55363	Evaluación realizada/modificada	2245	\N
532	erondon	2013-11-07 10:38:58.798472	Evaluación realizada/modificada	2248	\N
532	erondon	2013-11-07 10:39:11.741373	Evaluación enviada a Revision	2249	\N
536	erondon	2013-11-07 10:46:20.904344	Evaluación enviada a Revision	2257	\N
512	erondon	2013-11-07 10:49:25.702918	Evaluación realizada/modificada	2260	\N
453	ajaspe	2013-11-07 10:52:44.944429	Evaluación realizada/modificada	2263	\N
512	erondon	2013-11-07 10:53:03.420096	Evaluación enviada a Revision	2265	\N
583	ysegura	2013-11-07 11:06:42.763617	Evaluación realizada/modificada	2277	\N
583	ysegura	2013-11-07 11:07:07.136013	Evaluación enviada a Revision	2278	\N
584	ysegura	2013-11-07 11:09:16.98148	Evaluacion creada/iniciada	2281	\N
584	ysegura	2013-11-07 11:11:46.903587	Evaluación enviada a Revision	2285	\N
447	ajaspe	2013-11-07 11:14:01.520785	Evaluación realizada/modificada	2289	\N
533	erondon	2013-11-07 11:14:35.461839	Evaluación enviada a Revision	2292	\N
547	erondon	2013-11-07 11:15:06.439343	Evaluación enviada a Revision	2293	\N
548	erondon	2013-11-07 11:15:46.096171	Evaluación enviada a Revision	2294	\N
511	erondon	2013-11-07 11:17:17.661163	Evaluación enviada a Revision	2297	\N
545	erondon	2013-11-07 11:18:18.361409	Evaluación enviada a Revision	2299	\N
520	erondon	2013-11-07 11:20:27.664573	Evaluación enviada a Revision	2300	\N
541	erondon	2013-11-07 11:21:03.615404	Evaluación enviada a Revision	2301	\N
387	rsarache	2013-11-07 11:22:40.575131	Evaluación enviada a Revision	2303	\N
584	jalonso	2013-11-07 11:25:53.3942	Evaluación aprovada por el analista	2309	\N
505	erondon	2013-11-07 11:37:08.426767	Evaluación enviada a Revision	2316	\N
535	erondon	2013-11-07 11:43:22.077174	Evaluación realizada/modificada	2318	\N
535	erondon	2013-11-07 11:43:39.327389	Evaluación enviada a Revision	2319	\N
539	erondon	2013-11-07 11:47:05.646796	Evaluación enviada a Revision	2320	\N
497	erondon	2013-11-07 10:10:29.356374	Evaluación realizada/modificada	2225	\N
553	rsarache	2013-11-07 10:16:34.447608	Evaluación enviada a Revision	2227	\N
568	mduran	2013-11-07 10:23:35.692833	Evaluación denegada por el analista	2229	\N
573	mduran	2013-11-07 10:27:18.399284	Evaluación denegada por el analista	2233	\N
574	mduran	2013-11-07 10:27:58.956517	Evaluación denegada por el analista	2234	\N
452	ajaspe	2013-11-07 10:31:07.708755	Evaluación realizada/modificada	2239	\N
500	erondon	2013-11-07 10:31:18.242857	Evaluación enviada a Revision	2240	\N
513	erondon	2013-11-07 10:35:57.915071	Evaluación realizada/modificada	2247	\N
406	rsarache	2013-11-07 10:40:24.39645	Evaluación enviada a Revision	2251	\N
449	ajaspe	2013-11-07 10:44:39.138802	Evaluación realizada/modificada	2255	\N
453	ajaspe	2013-11-07 10:51:55.699375	Evaluación realizada/modificada	2261	\N
512	erondon	2013-11-07 10:52:07.352187	Evaluación realizada/modificada	2262	\N
540	erondon	2013-11-07 10:55:05.46347	Evaluación realizada/modificada	2266	\N
447	ajaspe	2013-11-07 10:57:03.459202	Evaluación realizada/modificada	2268	\N
544	erondon	2013-11-07 10:58:31.461443	Evaluación enviada a Revision	2270	\N
583	ysegura	2013-11-07 11:01:32.131446	Evaluacion creada/iniciada	2272	\N
538	erondon	2013-11-07 11:03:00.826175	Evaluación enviada a Revision	2274	\N
583	ysegura	2013-11-07 11:06:03.437172	Evaluación realizada/modificada	2276	\N
522	erondon	2013-11-07 11:09:10.836027	Evaluación realizada/modificada	2280	\N
522	erondon	2013-11-07 11:10:28.530856	Evaluación realizada/modificada	2282	\N
584	ysegura	2013-11-07 11:11:21.735702	Evaluación realizada/modificada	2283	\N
522	erondon	2013-11-07 11:11:36.407115	Evaluación enviada a Revision	2284	\N
504	erondon	2013-11-07 11:12:22.576591	Evaluación enviada a Revision	2286	\N
506	erondon	2013-11-07 11:12:54.992587	Evaluación enviada a Revision	2287	\N
585	ysegura	2013-11-07 11:14:03.812908	Evaluacion creada/iniciada	2290	\N
515	erondon	2013-11-07 11:14:08.783445	Evaluación enviada a Revision	2291	\N
585	ysegura	2013-11-07 11:16:02.184872	Evaluación realizada/modificada	2295	\N
509	erondon	2013-11-07 11:17:44.116644	Evaluación enviada a Revision	2298	\N
387	rsarache	2013-11-07 11:22:28.589034	Evaluación realizada/modificada	2302	\N
450	ajaspe	2013-11-07 11:24:20.616147	Evaluación realizada/modificada	2305	\N
583	jalonso	2013-11-07 11:25:09.713369	Evaluación aprovada por el analista	2306	\N
517	erondon	2013-11-07 11:25:20.387352	Evaluación enviada a Revision	2307	\N
534	erondon	2013-11-07 11:25:50.740856	Evaluación enviada a Revision	2308	\N
585	jalonso	2013-11-07 11:26:42.895329	Evaluación aprovada por el analista	2310	\N
443	rsarache	2013-11-07 11:31:52.178123	Evaluación realizada/modificada	2313	\N
443	rsarache	2013-11-07 11:32:10.308998	Evaluación enviada a Revision	2314	\N
451	ajaspe	2013-11-07 11:37:05.603044	Evaluación realizada/modificada	2315	\N
553	rsarache	2013-11-07 10:16:25.678658	Evaluación realizada/modificada	2226	\N
569	mduran	2013-11-07 10:24:25.802735	Evaluación denegada por el analista	2230	\N
570	mduran	2013-11-07 10:25:19.283707	Evaluación denegada por el analista	2231	\N
497	erondon	2013-11-07 10:29:00.705492	Evaluación enviada a Revision	2235	\N
452	ajaspe	2013-11-07 10:30:37.485637	Evaluación realizada/modificada	2237	\N
500	erondon	2013-11-07 10:30:52.745587	Evaluación realizada/modificada	2238	\N
452	ajaspe	2013-11-07 10:31:46.594602	Evaluación realizada/modificada	2241	\N
503	erondon	2013-11-07 10:32:43.663932	Evaluación realizada/modificada	2243	\N
565	mduran	2013-11-07 10:32:53.559444	Evaluación aprovada por el analista	2244	\N
503	erondon	2013-11-07 10:33:42.066892	Evaluación enviada a Revision	2246	\N
406	rsarache	2013-11-07 10:40:01.571724	Evaluación realizada/modificada	2250	\N
536	erondon	2013-11-07 10:40:46.583579	Evaluación realizada/modificada	2252	\N
432	rsarache	2013-11-07 10:43:41.276296	Evaluación realizada/modificada	2253	\N
432	rsarache	2013-11-07 10:43:55.162361	Evaluación enviada a Revision	2254	\N
449	ajaspe	2013-11-07 10:45:17.421976	Evaluación realizada/modificada	2256	\N
512	erondon	2013-11-07 10:48:13.431851	Evaluación realizada/modificada	2258	\N
512	erondon	2013-11-07 10:48:58.728005	Evaluación realizada/modificada	2259	\N
512	erondon	2013-11-07 10:52:51.35263	Evaluación realizada/modificada	2264	\N
540	erondon	2013-11-07 10:55:33.439685	Evaluación enviada a Revision	2267	\N
544	erondon	2013-11-07 10:57:16.43017	Evaluación realizada/modificada	2269	\N
538	erondon	2013-11-07 11:01:11.402157	Evaluación realizada/modificada	2271	\N
538	erondon	2013-11-07 11:01:54.41035	Evaluación realizada/modificada	2273	\N
583	ysegura	2013-11-07 11:04:52.320539	Evaluación realizada/modificada	2275	\N
453	ajaspe	2013-11-07 11:07:38.615888	Evaluación realizada/modificada	2279	\N
507	erondon	2013-11-07 11:13:28.090649	Evaluación enviada a Revision	2288	\N
585	ysegura	2013-11-07 11:16:19.225206	Evaluación enviada a Revision	2296	\N
543	erondon	2013-11-07 11:23:02.681788	Evaluación enviada a Revision	2304	\N
505	erondon	2013-11-07 11:29:34.207141	Evaluación realizada/modificada	2311	\N
443	rsarache	2013-11-07 11:30:24.313369	Evaluación realizada/modificada	2312	\N
535	erondon	2013-11-07 11:42:47.865839	Evaluación realizada/modificada	2317	\N
524	erondon	2013-11-07 12:30:03.370332	Evaluación realizada/modificada	2321	\N
524	erondon	2013-11-07 12:30:42.775514	Evaluación enviada a Revision	2322	\N
575	mduran	2013-11-07 13:23:23.612448	Evaluación aprovada por el analista	2323	\N
501	erondon	2013-11-07 13:35:17.112082	Evaluación realizada/modificada	2324	\N
501	erondon	2013-11-07 13:36:03.270804	Evaluación realizada/modificada	2325	\N
501	erondon	2013-11-07 13:36:31.931	Evaluación realizada/modificada	2326	\N
501	erondon	2013-11-07 13:38:20.69131	Evaluación enviada a Revision	2327	\N
431	rsarache	2013-11-07 13:53:35.692055	Evaluación realizada/modificada	2328	\N
431	rsarache	2013-11-07 13:53:52.243296	Evaluación enviada a Revision	2329	\N
538	mduran	2013-11-07 14:15:58.60236	Evaluación aprovada por el analista	2330	\N
582	mmunoz	2013-11-07 14:18:55.191222	Evaluación realizada/modificada	2331	\N
582	mmunoz	2013-11-07 14:19:59.315668	Evaluación realizada/modificada	2332	\N
582	mmunoz	2013-11-07 14:26:11.681569	Evaluación realizada/modificada	2333	\N
582	mmunoz	2013-11-07 14:28:06.82721	Evaluación realizada/modificada	2334	\N
582	mmunoz	2013-11-07 14:28:31.873018	Evaluación enviada a Revision	2335	\N
502	erondon	2013-11-07 14:28:52.856304	Evaluación realizada/modificada	2336	\N
502	erondon	2013-11-07 14:29:13.034554	Evaluación enviada a Revision	2337	\N
524	mduran	2013-11-07 14:30:16.074691	Evaluación aprovada por el analista	2338	\N
508	erondon	2013-11-07 14:31:02.55961	Evaluación enviada a Revision	2339	\N
536	mduran	2013-11-07 14:31:18.467277	Evaluación aprovada por el analista	2340	\N
514	erondon	2013-11-07 14:31:39.856578	Evaluación enviada a Revision	2341	\N
535	mduran	2013-11-07 14:32:08.87649	Evaluación aprovada por el analista	2342	\N
532	mduran	2013-11-07 14:32:49.698193	Evaluación aprovada por el analista	2343	\N
526	erondon	2013-11-07 14:32:58.986778	Evaluación enviada a Revision	2344	\N
527	erondon	2013-11-07 14:33:45.306186	Evaluación enviada a Revision	2345	\N
502	mduran	2013-11-07 14:34:45.17013	Evaluación aprovada por el analista	2346	\N
528	erondon	2013-11-07 14:35:13.77806	Evaluación enviada a Revision	2347	\N
544	mduran	2013-11-07 14:36:15.743144	Evaluación aprovada por el analista	2348	\N
501	mduran	2013-11-07 14:39:07.454885	Evaluación aprovada por el analista	2349	\N
529	erondon	2013-11-07 14:39:50.817737	Evaluación enviada a Revision	2350	\N
516	erondon	2013-11-07 14:40:25.099241	Evaluación enviada a Revision	2351	\N
521	erondon	2013-11-07 14:41:47.67249	Evaluación enviada a Revision	2352	\N
582	mduran	2013-11-07 14:55:27.016115	Evaluación aprovada por el analista	2353	\N
525	erondon	2013-11-07 15:07:56.403946	Evaluación enviada a Revision	2354	\N
510	erondon	2013-11-07 15:08:38.718942	Evaluación enviada a Revision	2355	\N
523	erondon	2013-11-07 15:10:13.09922	Evaluación realizada/modificada	2356	\N
523	erondon	2013-11-07 15:11:18.992492	Evaluación enviada a Revision	2357	\N
531	erondon	2013-11-07 15:13:33.848723	Evaluación enviada a Revision	2358	\N
542	erondon	2013-11-07 15:14:20.781091	Evaluación enviada a Revision	2359	\N
523	mduran	2013-11-07 15:24:03.003209	Evaluación aprovada por el analista	2360	\N
556	lgonzalez	2013-11-07 15:26:24.58406	Evaluación enviada a Revision	2361	\N
497	mduran	2013-11-07 15:26:45.407684	Evaluación aprovada por el analista	2362	\N
557	lgonzalez	2013-11-07 15:27:21.755375	Evaluación enviada a Revision	2363	\N
512	mduran	2013-11-07 15:27:37.527438	Evaluación aprovada por el analista	2364	\N
499	erondon	2013-11-07 15:28:58.630288	Evaluación enviada a Revision	2365	\N
530	erondon	2013-11-07 15:29:50.201419	Evaluación enviada a Revision	2366	\N
500	mduran	2013-11-07 15:30:09.209896	Evaluación aprovada por el analista	2367	\N
572	bmartinez	2013-11-07 15:39:24.189114	Evaluación enviada a Revision	2368	\N
561	mduran	2013-11-07 15:41:40.433555	Evaluación aprovada por el analista	2369	\N
540	mduran	2013-11-07 15:43:37.424644	Evaluación aprovada por el analista	2370	\N
503	mduran	2013-11-07 15:47:25.731919	Evaluación aprovada por el analista	2371	\N
505	mduran	2013-11-07 15:49:40.869978	Evaluación aprovada por el analista	2372	\N
548	mduran	2013-11-07 15:51:45.200971	Evaluación aprovada por el analista	2373	\N
548	mduran	2013-11-07 15:51:53.783189	Evaluación aprovada por el analista	2374	\N
557	mduran	2013-11-07 15:53:57.160711	Evaluación aprovada por el analista	2375	\N
556	mduran	2013-11-07 15:54:42.228031	Evaluación aprovada por el analista	2376	\N
520	mduran	2013-11-07 15:55:33.869249	Evaluación aprovada por el analista	2377	\N
507	mduran	2013-11-07 15:56:23.83543	Evaluación aprovada por el analista	2378	\N
542	mduran	2013-11-07 16:00:01.235047	Evaluación aprovada por el analista	2379	\N
499	mduran	2013-11-07 16:01:03.166334	Evaluación aprovada por el analista	2380	\N
541	mduran	2013-11-07 16:03:43.176005	Evaluación aprovada por el analista	2382	\N
517	mduran	2013-11-07 16:02:17.571598	Evaluación aprovada por el analista	2381	\N
526	mduran	2013-11-07 16:04:23.754851	Evaluación aprovada por el analista	2383	\N
511	mduran	2013-11-07 16:05:22.335916	Evaluación aprovada por el analista	2384	\N
530	mduran	2013-11-07 16:06:32.609978	Evaluación aprovada por el analista	2385	\N
527	mduran	2013-11-07 16:07:08.545939	Evaluación aprovada por el analista	2386	\N
533	mduran	2013-11-07 16:10:12.447906	Evaluación aprovada por el analista	2387	\N
516	mduran	2013-11-07 16:10:56.77248	Evaluación aprovada por el analista	2388	\N
514	mduran	2013-11-07 16:11:33.323642	Evaluación aprovada por el analista	2389	\N
545	mduran	2013-11-07 16:12:09.921115	Evaluación aprovada por el analista	2390	\N
534	mduran	2013-11-07 16:12:53.250097	Evaluación aprovada por el analista	2391	\N
521	mduran	2013-11-07 16:14:00.951768	Evaluación aprovada por el analista	2392	\N
539	mduran	2013-11-07 16:14:38.464277	Evaluación aprovada por el analista	2393	\N
504	mduran	2013-11-07 16:15:23.085897	Evaluación aprovada por el analista	2394	\N
566	mduran	2013-11-07 16:16:04.855587	Evaluación aprovada por el analista	2395	\N
574	bmartinez	2013-11-07 16:16:28.619955	Evaluación realizada/modificada	2396	\N
574	bmartinez	2013-11-07 16:16:43.437511	Evaluación enviada a Revision	2397	\N
522	mduran	2013-11-07 16:16:47.407936	Evaluación aprovada por el analista	2398	\N
570	bmartinez	2013-11-07 16:19:05.92119	Evaluación realizada/modificada	2399	\N
570	bmartinez	2013-11-07 16:19:19.08017	Evaluación enviada a Revision	2400	\N
573	bmartinez	2013-11-07 16:22:09.380656	Evaluación realizada/modificada	2401	\N
573	bmartinez	2013-11-07 16:22:19.013868	Evaluación enviada a Revision	2402	\N
547	mduran	2013-11-07 16:22:29.996423	Evaluación aprovada por el analista	2403	\N
529	mduran	2013-11-07 16:23:08.157289	Evaluación aprovada por el analista	2404	\N
543	mduran	2013-11-07 16:23:50.689583	Evaluación aprovada por el analista	2405	\N
510	mduran	2013-11-07 16:26:31.471629	Evaluación aprovada por el analista	2406	\N
528	mduran	2013-11-07 16:27:16.847702	Evaluación aprovada por el analista	2407	\N
571	bmartinez	2013-11-07 16:28:04.333945	Evaluación realizada/modificada	2408	\N
525	mduran	2013-11-07 16:28:08.79842	Evaluación aprovada por el analista	2409	\N
571	bmartinez	2013-11-07 16:28:52.862511	Evaluación enviada a Revision	2410	\N
506	mduran	2013-11-07 16:29:53.922356	Evaluación aprovada por el analista	2411	\N
508	mduran	2013-11-07 16:30:38.237199	Evaluación aprovada por el analista	2412	\N
531	mduran	2013-11-07 16:31:20.20249	Evaluación aprovada por el analista	2413	\N
333	mduran	2013-11-07 16:36:05.768274	Evaluación aprovada por el analista	2414	\N
586	hconstant	2013-11-07 16:38:18.41905	Evaluacion creada/iniciada	2415	\N
519	erondon	2013-11-07 16:41:45.641507	Evaluación enviada a Revision	2416	\N
537	erondon	2013-11-07 16:50:26.07904	Evaluación enviada a Revision	2417	\N
568	bmartinez	2013-11-07 16:51:32.793513	Evaluación realizada/modificada	2418	\N
568	bmartinez	2013-11-07 16:52:00.912353	Evaluación enviada a Revision	2419	\N
513	erondon	2013-11-07 16:52:07.154997	Evaluación enviada a Revision	2420	\N
518	erondon	2013-11-07 16:52:40.237678	Evaluación enviada a Revision	2421	\N
569	bmartinez	2013-11-07 16:53:18.858481	Evaluación realizada/modificada	2422	\N
569	bmartinez	2013-11-07 16:53:33.898593	Evaluación enviada a Revision	2423	\N
567	bmartinez	2013-11-07 16:56:34.724398	Evaluación realizada/modificada	2424	\N
567	bmartinez	2013-11-07 16:57:05.046553	Evaluación enviada a Revision	2425	\N
586	hconstant	2013-11-07 16:58:45.931454	Evaluación realizada/modificada	2426	\N
586	hconstant	2013-11-07 17:00:38.532712	Evaluación enviada a Revision	2427	\N
574	mduran	2013-11-07 17:03:06.850889	Evaluación aprovada por el analista	2428	\N
537	mduran	2013-11-07 17:03:48.349396	Evaluación aprovada por el analista	2429	\N
515	mduran	2013-11-07 17:16:08.872404	Evaluación aprovada por el analista	2430	\N
515	mduran	2013-11-07 17:16:20.890866	Evaluación aprovada por el analista	2431	\N
572	bmartinez	2013-11-08 08:34:02.243145	Evaluación realizada/modificada	2432	\N
586	mduran	2013-11-08 08:46:10.165285	Evaluación aprovada por el analista	2433	\N
570	mduran	2013-11-08 09:00:29.742839	Evaluación aprovada por el analista	2434	\N
571	mduran	2013-11-08 09:01:48.338659	Evaluación aprovada por el analista	2435	\N
573	mduran	2013-11-08 09:02:54.470781	Evaluación aprovada por el analista	2436	\N
519	mduran	2013-11-08 09:04:15.454505	Evaluación aprovada por el analista	2437	\N
513	mduran	2013-11-08 09:05:10.929946	Evaluación aprovada por el analista	2438	\N
518	mduran	2013-11-08 09:05:47.984785	Evaluación aprovada por el analista	2439	\N
509	mduran	2013-11-08 09:24:09.100812	Evaluación aprovada por el analista	2440	\N
567	mduran	2013-11-08 09:28:07.652975	Evaluación aprovada por el analista	2441	\N
568	mduran	2013-11-08 09:39:35.491254	Evaluación aprovada por el analista	2442	\N
569	mduran	2013-11-08 09:43:01.2416	Evaluación aprovada por el analista	2443	\N
447	ajaspe	2013-11-08 09:53:12.477731	Evaluación realizada/modificada	2444	\N
447	ajaspe	2013-11-08 09:54:38.963703	Evaluación realizada/modificada	2445	\N
420	rsarache	2013-11-08 11:13:11.876321	Evaluación realizada/modificada	2446	\N
420	rsarache	2013-11-08 11:15:38.9762	Evaluación realizada/modificada	2447	\N
420	rsarache	2013-11-08 11:16:27.517677	Evaluación enviada a Revision	2448	\N
475	jesequera	2013-11-08 11:53:52.873431	Evaluación realizada/modificada	2449	\N
475	jesequera	2013-11-08 11:54:29.080887	Evaluación realizada/modificada	2450	\N
475	jesequera	2013-11-08 11:54:53.470364	Evaluación enviada a Revision	2451	\N
476	jesequera	2013-11-08 11:55:36.63135	Evaluación realizada/modificada	2452	\N
476	jesequera	2013-11-08 11:57:05.670271	Evaluación realizada/modificada	2453	\N
476	jesequera	2013-11-08 11:57:59.201344	Evaluación realizada/modificada	2454	\N
476	jesequera	2013-11-08 11:59:15.939803	Evaluación realizada/modificada	2455	\N
476	jesequera	2013-11-08 11:59:36.56018	Evaluación enviada a Revision	2456	\N
477	jesequera	2013-11-08 12:11:00.405705	Evaluación enviada a Revision	2457	\N
479	jesequera	2013-11-08 12:13:48.230904	Evaluación realizada/modificada	2458	\N
479	jesequera	2013-11-08 12:14:00.539964	Evaluación enviada a Revision	2459	\N
480	jesequera	2013-11-08 12:17:33.711052	Evaluación realizada/modificada	2460	\N
480	jesequera	2013-11-08 12:17:47.196168	Evaluación enviada a Revision	2461	\N
481	jesequera	2013-11-08 12:19:18.284067	Evaluación realizada/modificada	2462	\N
481	jesequera	2013-11-08 12:19:44.45752	Evaluación enviada a Revision	2463	\N
482	jesequera	2013-11-08 12:20:15.296272	Evaluación enviada a Revision	2464	\N
484	jesequera	2013-11-08 12:23:09.140848	Evaluación realizada/modificada	2465	\N
484	jesequera	2013-11-08 12:23:43.855316	Evaluación realizada/modificada	2466	\N
484	jesequera	2013-11-08 12:24:06.597004	Evaluación realizada/modificada	2467	\N
484	jesequera	2013-11-08 12:25:00.334805	Evaluación enviada a Revision	2468	\N
486	jesequera	2013-11-08 12:27:30.730121	Evaluación enviada a Revision	2471	\N
487	jesequera	2013-11-08 12:28:09.089097	Evaluación enviada a Revision	2472	\N
493	npinate	2013-11-08 12:34:11.42965	Evaluación realizada/modificada	2476	\N
483	jesequera	2013-11-08 12:36:11.725343	Evaluación realizada/modificada	2481	\N
489	npinate	2013-11-08 12:40:04.372437	Evaluación realizada/modificada	2485	\N
489	npinate	2013-11-08 12:40:19.609426	Evaluación enviada a Revision	2486	\N
452	ajaspe	2013-11-08 12:44:28.851207	Evaluación enviada a Revision	2490	\N
449	ajaspe	2013-11-08 12:46:52.363146	Evaluación enviada a Revision	2491	\N
453	ajaspe	2013-11-08 12:47:12.162094	Evaluación enviada a Revision	2492	\N
447	ajaspe	2013-11-08 12:47:32.723783	Evaluación enviada a Revision	2493	\N
448	ajaspe	2013-11-08 12:48:07.466394	Evaluación enviada a Revision	2494	\N
587	ajaspe	2013-11-08 12:48:29.575887	Evaluación enviada a Revision	2495	\N
451	ajaspe	2013-11-08 12:49:07.35593	Evaluación enviada a Revision	2496	\N
450	ajaspe	2013-11-08 12:49:24.748643	Evaluación enviada a Revision	2497	\N
588	ajaspe	2013-11-08 12:49:54.857981	Evaluación enviada a Revision	2498	\N
493	mduran	2013-11-08 14:28:59.3424	Evaluación aprovada por el analista	2501	\N
485	jesequera	2013-11-08 12:26:27.158101	Evaluación enviada a Revision	2469	\N
486	jesequera	2013-11-08 12:27:18.570623	Evaluación realizada/modificada	2470	\N
483	jesequera	2013-11-08 12:34:35.06066	Evaluación realizada/modificada	2477	\N
489	npinate	2013-11-08 12:35:53.356703	Evaluación realizada/modificada	2480	\N
587	ajaspe	2013-11-08 12:38:05.395429	Evaluacion creada/iniciada	2484	\N
588	ajaspe	2013-11-08 12:41:40.529322	Evaluacion creada/iniciada	2488	\N
588	ajaspe	2013-11-08 12:43:52.259326	Evaluación realizada/modificada	2489	\N
349	mduran	2013-11-08 14:24:35.209273	Evaluación aprovada por el analista	2499	\N
492	mduran	2013-11-08 14:28:15.299417	Evaluación aprovada por el analista	2500	\N
489	npinate	2013-11-08 14:34:17.030326	Evaluación realizada/modificada	2502	\N
489	npinate	2013-11-08 14:34:30.543397	Evaluación enviada a Revision	2503	\N
488	jesequera	2013-11-08 12:28:45.836427	Evaluación enviada a Revision	2473	\N
492	npinate	2013-11-08 12:31:22.80948	Evaluación realizada/modificada	2474	\N
492	npinate	2013-11-08 12:32:00.301955	Evaluación enviada a Revision	2475	\N
493	npinate	2013-11-08 12:34:37.26528	Evaluación enviada a Revision	2478	\N
483	jesequera	2013-11-08 12:35:35.826553	Evaluación realizada/modificada	2479	\N
483	jesequera	2013-11-08 12:36:34.467628	Evaluación realizada/modificada	2482	\N
483	jesequera	2013-11-08 12:36:48.287208	Evaluación enviada a Revision	2483	\N
587	ajaspe	2013-11-08 12:40:52.709959	Evaluación realizada/modificada	2487	\N
450	mduran	2013-11-08 15:15:30.251662	Evaluación aprovada por el analista	2504	\N
489	mduran	2013-11-08 15:16:15.960623	Evaluación aprovada por el analista	2505	\N
487	mduran	2013-11-08 15:17:05.499724	Evaluación aprovada por el analista	2506	\N
486	mduran	2013-11-08 15:17:51.063111	Evaluación aprovada por el analista	2507	\N
484	mduran	2013-11-08 15:18:32.614908	Evaluación aprovada por el analista	2508	\N
488	mduran	2013-11-08 15:19:19.051089	Evaluación aprovada por el analista	2509	\N
485	mduran	2013-11-08 15:19:55.059316	Evaluación aprovada por el analista	2510	\N
477	mduran	2013-11-08 15:20:41.820317	Evaluación aprovada por el analista	2511	\N
476	mduran	2013-11-08 15:21:31.094277	Evaluación aprovada por el analista	2512	\N
480	mduran	2013-11-08 15:22:17.798626	Evaluación aprovada por el analista	2513	\N
479	mduran	2013-11-08 15:23:07.524197	Evaluación aprovada por el analista	2514	\N
475	mduran	2013-11-08 15:23:54.945751	Evaluación aprovada por el analista	2515	\N
452	mduran	2013-11-08 15:25:06.498788	Evaluación aprovada por el analista	2516	\N
449	mduran	2013-11-08 15:25:51.956486	Evaluación aprovada por el analista	2517	\N
453	mduran	2013-11-08 15:26:44.520988	Evaluación aprovada por el analista	2518	\N
447	mduran	2013-11-08 15:28:04.718714	Evaluación aprovada por el analista	2519	\N
448	mduran	2013-11-08 15:29:15.012986	Evaluación aprovada por el analista	2520	\N
482	mduran	2013-11-08 15:31:01.054827	Evaluación aprovada por el analista	2521	\N
483	mduran	2013-11-08 15:31:57.059873	Evaluación aprovada por el analista	2522	\N
587	mduran	2013-11-08 15:32:51.661064	Evaluación aprovada por el analista	2523	\N
481	mduran	2013-11-08 15:33:43.561767	Evaluación aprovada por el analista	2524	\N
451	mduran	2013-11-08 15:34:47.663919	Evaluación aprovada por el analista	2525	\N
588	mduran	2013-11-08 15:35:53.391693	Evaluación aprovada por el analista	2526	\N
551	ncastillo	2013-11-08 15:38:09.704528	Evaluación realizada/modificada	2527	\N
551	ncastillo	2013-11-08 15:38:23.681439	Evaluación enviada a Revision	2528	\N
567	bmartinez	2013-11-08 15:52:59.302583	Evaluación realizada/modificada	2529	\N
567	bmartinez	2013-11-08 15:53:11.720247	Evaluación enviada a Revision	2530	\N
568	bmartinez	2013-11-08 15:54:53.587229	Evaluación realizada/modificada	2531	\N
568	bmartinez	2013-11-08 15:55:08.351659	Evaluación enviada a Revision	2532	\N
569	bmartinez	2013-11-08 15:57:26.454364	Evaluación realizada/modificada	2533	\N
569	bmartinez	2013-11-08 15:57:41.163268	Evaluación enviada a Revision	2534	\N
572	bmartinez	2013-11-08 15:59:19.907355	Evaluación realizada/modificada	2535	\N
572	bmartinez	2013-11-08 15:59:28.807704	Evaluación enviada a Revision	2536	\N
589	gcortes	2013-11-08 16:01:21.597872	Evaluacion creada/iniciada	2537	\N
589	gcortes	2013-11-08 16:14:37.932416	Evaluación realizada/modificada	2538	\N
589	gcortes	2013-11-08 16:15:59.717655	Evaluación enviada a Revision	2539	\N
590	gcortes	2013-11-08 16:22:17.50549	Evaluacion creada/iniciada	2540	\N
576	eortega	2013-11-08 16:30:16.224805	Evaluación realizada/modificada	2541	\N
576	eortega	2013-11-08 16:30:23.985658	Evaluación enviada a Revision	2542	\N
590	gcortes	2013-11-08 16:38:51.747068	Evaluación realizada/modificada	2543	\N
590	gcortes	2013-11-08 16:39:15.469982	Evaluación enviada a Revision	2544	\N
551	mduran	2013-11-08 16:45:32.234876	Evaluación aprovada por el analista	2545	\N
591	mgarcia	2013-11-08 16:48:40.581137	Evaluacion creada/iniciada	2546	\N
591	mgarcia	2013-11-08 16:49:47.881014	Evaluación realizada/modificada	2547	\N
591	mgarcia	2013-11-08 16:50:06.56596	Evaluación enviada a Revision	2548	\N
553	mduran	2013-11-08 16:54:08.32897	Evaluación aprovada por el analista	2549	\N
592	jmreyes	2013-11-08 16:55:39.64331	Evaluacion creada/iniciada	2550	\N
576	mduran	2013-11-08 17:03:33.721925	Evaluación aprovada por el analista	2551	\N
371	mduran	2013-11-08 17:05:22.612493	Evaluación aprovada por el analista	2552	\N
592	jmreyes	2013-11-08 17:08:41.715693	Evaluación realizada/modificada	2553	\N
381	mduran	2013-11-08 17:16:23.224659	Evaluación aprovada por el analista	2554	\N
364	mduran	2013-11-08 17:16:58.786182	Evaluación aprovada por el analista	2555	\N
379	mduran	2013-11-08 17:18:54.74153	Evaluación aprovada por el analista	2557	\N
571	bmartinez	2013-11-08 17:19:35.627376	Evaluación realizada/modificada	2558	\N
590	mduran	2013-11-08 17:20:00.842912	Evaluación aprovada por el analista	2559	\N
590	mduran	2013-11-08 17:20:11.926789	Evaluación aprovada por el analista	2560	\N
350	mduran	2013-11-08 17:21:30.87649	Evaluación aprovada por el analista	2561	\N
571	bmartinez	2013-11-08 17:22:15.401238	Evaluación enviada a Revision	2562	\N
435	mduran	2013-11-08 17:22:57.773621	Evaluación aprovada por el analista	2563	\N
340	mduran	2013-11-08 17:24:07.904485	Evaluación aprovada por el analista	2564	\N
591	mduran	2013-11-08 17:25:32.4503	Evaluación aprovada por el analista	2565	\N
394	mduran	2013-11-08 17:27:05.5054	Evaluación aprovada por el analista	2568	\N
431	mduran	2013-11-08 17:27:45.473141	Evaluación aprovada por el analista	2569	\N
443	mduran	2013-11-08 17:28:54.313873	Evaluación aprovada por el analista	2570	\N
567	mduran	2013-11-08 17:29:36.511522	Evaluación aprovada por el analista	2571	\N
441	mduran	2013-11-08 17:30:32.696906	Evaluación aprovada por el analista	2572	\N
370	mduran	2013-11-08 17:31:15.63393	Evaluación aprovada por el analista	2573	\N
357	mduran	2013-11-08 17:31:53.810681	Evaluación aprovada por el analista	2574	\N
406	mduran	2013-11-08 17:32:37.815761	Evaluación aprovada por el analista	2575	\N
351	mduran	2013-11-08 17:33:21.852416	Evaluación aprovada por el analista	2576	\N
387	mduran	2013-11-08 17:34:14.357872	Evaluación aprovada por el analista	2577	\N
383	mduran	2013-11-08 17:34:56.29068	Evaluación aprovada por el analista	2578	\N
391	mduran	2013-11-08 17:35:36.028171	Evaluación aprovada por el analista	2579	\N
564	mduran	2013-11-08 17:36:12.348858	Evaluación aprovada por el analista	2580	\N
352	mduran	2013-11-08 17:38:19.69229	Evaluación aprovada por el analista	2583	\N
559	mduran	2013-11-08 17:41:57.421819	Evaluación aprovada por el analista	2588	\N
432	mduran	2013-11-08 17:44:01.02583	Evaluación aprovada por el analista	2591	\N
594	jmreyes	2013-11-08 17:44:29.15941	Evaluacion creada/iniciada	2592	\N
568	mduran	2013-11-08 17:47:10.825194	Evaluación aprovada por el analista	2596	\N
589	mduran	2013-11-08 17:48:09.472421	Evaluación aprovada por el analista	2597	\N
595	mmedina	2013-11-08 18:08:41.260225	Evaluación realizada/modificada	2600	\N
594	jmreyes	2013-11-08 18:15:00.946899	Evaluación realizada/modificada	2603	\N
594	jmreyes	2013-11-08 18:18:19.273165	Evaluación realizada/modificada	2606	\N
592	jmreyes	2013-11-08 18:21:43.498068	Evaluación realizada/modificada	2607	\N
598	jalonso	2013-11-09 14:57:36.044097	Evaluación aprovada por el analista	2614	\N
598	jalonso	2013-11-09 14:59:08.849276	Evaluación aprovada por el analista	2617	\N
572	mduran	2013-11-08 17:36:51.02168	Evaluación aprovada por el analista	2581	\N
410	mduran	2013-11-08 17:38:57.217718	Evaluación aprovada por el analista	2584	\N
417	mduran	2013-11-08 17:42:42.509139	Evaluación aprovada por el analista	2589	\N
429	mduran	2013-11-08 17:45:42.193604	Evaluación aprovada por el analista	2594	\N
408	mduran	2013-11-08 17:46:30.292161	Evaluación aprovada por el analista	2595	\N
595	mmedina	2013-11-08 18:09:41.358555	Evaluación enviada a Revision	2601	\N
594	jmreyes	2013-11-08 18:17:19.307808	Evaluación realizada/modificada	2605	\N
598	gcortes	2013-11-08 21:03:30.015289	Evaluacion creada/iniciada	2608	\N
598	gcortes	2013-11-08 21:12:25.38926	Evaluación realizada/modificada	2609	\N
598	gcortes	2013-11-08 21:12:42.222926	Evaluación enviada a Revision	2610	\N
598	jalonso	2013-11-09 14:57:12.959552	Evaluación aprovada por el analista	2612	\N
598	jalonso	2013-11-09 14:58:06.372951	Evaluación aprovada por el analista	2615	\N
571	mduran	2013-11-08 17:37:33.906075	Evaluación aprovada por el analista	2582	\N
424	mduran	2013-11-08 17:39:36.345807	Evaluación aprovada por el analista	2585	\N
420	mduran	2013-11-08 17:41:13.513608	Evaluación aprovada por el analista	2587	\N
569	mduran	2013-11-08 17:43:24.05536	Evaluación aprovada por el analista	2590	\N
428	mduran	2013-11-08 17:45:00.194518	Evaluación aprovada por el analista	2593	\N
595	mmedina	2013-11-08 18:05:32.952832	Evaluacion creada/iniciada	2599	\N
594	jmreyes	2013-11-08 18:11:50.50404	Evaluación realizada/modificada	2602	\N
594	jmreyes	2013-11-08 18:15:55.818863	Evaluación realizada/modificada	2604	\N
595	jalonso	2013-11-09 14:56:31.035682	Evaluación aprovada por el analista	2611	\N
598	jalonso	2013-11-09 14:57:23.209744	Evaluación aprovada por el analista	2613	\N
598	jalonso	2013-11-09 14:58:53.841557	Evaluación aprovada por el analista	2616	\N
598	jalonso	2013-11-09 15:01:16.274622	Evaluación aprovada por el analista	2618	\N
599	jmreyes	2013-11-11 08:28:25.207567	Evaluacion creada/iniciada	2619	\N
592	jmreyes	2013-11-11 10:14:11.494381	Evaluación enviada a Revision	2622	\N
594	jmreyes	2013-11-11 10:20:27.742492	Evaluación enviada a Revision	2623	\N
599	jmreyes	2013-11-11 10:28:46.913914	Evaluación realizada/modificada	2624	\N
599	jmreyes	2013-11-11 10:29:04.46767	Evaluación enviada a Revision	2625	\N
599	mduran	2013-11-11 11:08:47.758771	Evaluación aprovada por el analista	2626	\N
592	mduran	2013-11-11 11:11:19.784051	Evaluación aprovada por el analista	2627	\N
594	mduran	2013-11-11 11:12:25.920648	Evaluación aprovada por el analista	2628	\N
352	rsarache	2013-11-11 11:17:47.061602	Evaluación realizada/modificada	2630	\N
352	rsarache	2013-11-11 11:18:18.670824	Evaluación realizada/modificada	2632	\N
352	rsarache	2013-11-11 11:18:26.398609	Evaluación enviada a Revision	2633	\N
392	rsarache	2013-11-11 11:32:56.21879	Evaluación realizada/modificada	2634	\N
392	rsarache	2013-11-11 11:33:13.778096	Evaluación enviada a Revision	2635	\N
600	hconstant	2013-11-11 13:59:09.46384	Evaluacion creada/iniciada	2636	\N
600	hconstant	2013-11-11 14:02:46.489512	Evaluación realizada/modificada	2637	\N
600	hconstant	2013-11-11 14:03:02.458061	Evaluación enviada a Revision	2638	\N
601	hconstant	2013-11-11 14:03:35.159854	Evaluacion creada/iniciada	2639	\N
601	hconstant	2013-11-11 14:04:17.737098	Evaluación realizada/modificada	2640	\N
601	hconstant	2013-11-11 14:04:32.586411	Evaluación enviada a Revision	2641	\N
600	mduran	2013-11-11 14:07:13.922262	Evaluación aprovada por el analista	2642	\N
392	mduran	2013-11-11 14:08:01.437587	Evaluación aprovada por el analista	2643	\N
601	mduran	2013-11-11 14:08:37.628064	Evaluación aprovada por el analista	2644	\N
352	mduran	2013-11-11 14:09:26.379528	Evaluación aprovada por el analista	2645	\N
602	sperezb	2013-11-11 14:23:59.862418	Evaluacion creada/iniciada	2646	\N
602	sperezb	2013-11-11 14:26:36.742249	Evaluación realizada/modificada	2647	\N
602	sperezb	2013-11-11 15:03:36.899677	Evaluación realizada/modificada	2648	\N
603	sperezb	2013-11-11 15:11:00.690167	Evaluacion creada/iniciada	2649	\N
603	sperezb	2013-11-11 15:15:35.067699	Evaluación realizada/modificada	2650	\N
603	sperezb	2013-11-11 15:17:04.231622	Evaluación realizada/modificada	2651	\N
603	sperezb	2013-11-11 16:34:12.389507	Evaluación realizada/modificada	2652	\N
604	fsuarez	2013-11-11 16:34:13.372717	Evaluacion creada/iniciada	2653	\N
604	fsuarez	2013-11-11 16:42:45.009557	Evaluación realizada/modificada	2654	\N
604	fsuarez	2013-11-11 16:43:05.092183	Evaluación enviada a Revision	2655	\N
604	mduran	2013-11-12 14:34:34.286003	Evaluación aprovada por el analista	2656	\N
605	npinate	2013-11-12 15:49:09.218012	Evaluacion creada/iniciada	2657	\N
605	npinate	2013-11-12 15:52:10.343968	Evaluación realizada/modificada	2658	\N
605	npinate	2013-11-12 15:52:33.490384	Evaluación enviada a Revision	2659	\N
605	mduran	2013-11-12 15:57:16.42339	Evaluación aprovada por el analista	2660	\N
331	jbuitrago	2013-11-12 16:29:39.464446	Evaluación enviada a Revision	2661	\N
331	mduran	2013-11-12 16:36:44.823163	Evaluación aprovada por el analista	2662	\N
606	sperezb	2013-11-13 08:20:36.274317	Evaluacion creada/iniciada	2663	\N
606	sperezb	2013-11-13 08:34:23.976955	Evaluación realizada/modificada	2664	\N
606	sperezb	2013-11-13 08:43:01.224774	Evaluación realizada/modificada	2665	\N
606	sperezb	2013-11-13 08:55:36.260688	Evaluación realizada/modificada	2666	\N
606	sperezb	2013-11-13 08:57:25.428151	Evaluación realizada/modificada	2667	\N
606	sperezb	2013-11-13 08:57:56.05904	Evaluación enviada a Revision	2668	\N
607	sperezb	2013-11-13 10:27:19.674683	Evaluacion creada/iniciada	2669	\N
607	sperezb	2013-11-13 10:45:54.278768	Evaluación realizada/modificada	2670	\N
607	sperezb	2013-11-13 10:50:35.901535	Evaluación enviada a Revision	2671	\N
608	sperezb	2013-11-13 10:54:35.234018	Evaluacion creada/iniciada	2672	\N
608	sperezb	2013-11-13 11:04:52.354435	Evaluación realizada/modificada	2673	\N
608	sperezb	2013-11-13 11:06:13.991689	Evaluación enviada a Revision	2674	\N
608	mduran	2013-11-13 11:44:43.906669	Evaluación aprovada por el analista	2675	\N
608	mduran	2013-11-13 11:44:53.504291	Evaluación aprovada por el analista	2676	\N
608	mduran	2013-11-13 11:45:03.910271	Evaluación aprovada por el analista	2677	\N
607	mduran	2013-11-13 11:46:38.657783	Evaluación aprovada por el analista	2678	\N
606	mduran	2013-11-13 11:50:22.010109	Evaluación aprovada por el analista	2679	\N
389	rsarache	2013-11-14 09:47:09.159217	Evaluación realizada/modificada	2680	\N
389	rsarache	2013-11-14 09:47:25.187482	Evaluación enviada a Revision	2681	\N
564	rsarache	2013-11-14 09:48:48.669581	Evaluación realizada/modificada	2682	\N
564	rsarache	2013-11-14 09:49:03.332206	Evaluación enviada a Revision	2683	\N
389	mduran	2013-11-14 10:14:21.746419	Evaluación aprovada por el analista	2684	\N
564	mduran	2013-11-14 10:15:06.423189	Evaluación aprovada por el analista	2685	\N
603	jalonso	2013-11-15 10:05:25.226677	Evaluación enviada a Revision	2686	\N
603	jalonso	2013-11-15 10:05:47.04729	Evaluación aprovada por el analista	2687	\N
603	jalonso	2013-11-15 10:05:56.912574	Evaluación aprovada por el analista	2688	\N
603	jalonso	2013-11-15 10:06:05.720666	Evaluación aprovada por el analista	2689	\N
602	jalonso	2013-11-15 10:06:37.832882	Evaluación enviada a Revision	2690	\N
602	jalonso	2013-11-15 10:07:05.205943	Evaluación aprovada por el analista	2691	\N
609	gcortes	2013-11-19 15:34:33.837353	Evaluacion creada/iniciada	2692	\N
609	gcortes	2013-11-19 15:39:58.10493	Evaluación realizada/modificada	2693	\N
609	mduran	2013-11-19 15:47:15.340898	Evaluación enviada a Revision	2694	\N
609	mduran	2013-11-19 15:49:51.041661	Evaluación aprovada por el analista	2695	\N
498	rsarache	2013-11-22 11:40:51.941765	Evaluación realizada/modificada	2696	\N
498	rsarache	2013-11-22 11:41:29.195559	Evaluación realizada/modificada	2697	\N
498	rsarache	2013-11-22 11:41:43.224567	Evaluación enviada a Revision	2698	\N
498	mduran	2013-11-22 11:44:50.879399	Evaluación aprovada por el analista	2699	\N
610	agarrido	2013-12-15 14:01:11.293099	Evaluacion creada/iniciada	2700	\N
\.


--
-- Name: bitacora_evaluacion_id_bitacora_evaluacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bitacora_evaluacion_id_bitacora_evaluacion_seq', 2700, true);


--
-- Data for Name: conf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conf (id_conf, param, valor) FROM stdin;
1	periodo	2013-07-01
\.


--
-- Name: conf_id_conf_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('conf_id_conf_seq', 1, true);


--
-- Data for Name: criterios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY criterios (co_criterio, co_factor, nombre, peso_jefe, peso_cachilapo, orden) FROM stdin;
5	1	Ejecuta los trabajos asignados sin errores ni omisiones, supera los parámetros logrando resultados por encima de lo esperado.	5	12.5	4
6	1	Siempre ejecuta su trabajo con exactitud, claridad y cuidado logrando frecuentemente resultados por encima de lo esperado.	4	10	5
7	2	Frecuentemente presenta problemas para cumplir con el volumen asignado del trabajo.	2	5	1
8	2	Realiza su trabajo en forma muy lenta, lo que impide cumplir con el volumen asignado.	1	2.5	2
10	2	Cumple con el volumen exigido por el puesto de trabajo y a menudo sobrepasa lo exigido.	4	10	4
11	2	Cumple con el volumen exigido por el puesto de trabajo.	3	7.5	5
12	3	Cumple con los reglamentos y procedimientos establecidos por el organismo.	3	7.5	1
13	3	En muchas ocasiones incumple con los reglamentos y procedimientos establecidos.	2	5	2
4	1	El trabajo ejecutado se ajusta parcialmente a los resultados esperados, comete errores y omisiones que le obliga a  hacer correcciones.	2	5	3
9	2	Realiza su trabajo con rapidez, alcanzando siempre mayor producción de lo que le es asignado.	5	12.5	3
14	3	No cumple con los reglamentos y procedimientos establecidos por el organismo.	1	2.5	3
16	3	Cumple con los reglamentos y procedimientos establecidos y estimula a los compañeros a acatar la normativa.	4	10	5
17	4	En muchas ocasiones incumple con las normas y procedimientos de seguridad establecidas.	2	5	1
18	4	No cumple con las normas y procedimientos de seguridad establecidos por el organismo.	1	2.5	2
19	4	Cumple con las normas y procedimientos establecidos, constituye un ejemplo para sus compañeros y aporta ideas para evitar accidentes.	5	12.5	3
20	4	Cumple con las normas y procedimientos establecidos y constituye un ejemplo para sus compañeros.	4	10	4
21	4	Cumple con las normas y procedimientos establecidos por el organismo.	3	7.5	5
22	5	Siempre manifiesta esmero y dedicación en la ejecución de las tareas asignadas y   en algunas oportunidades sugiere mejoras en el trabajo.	4	10	1
23	5	Manifiesta esmero y dedicación en la ejecución de las tareas asignadas.	3	7.5	2
24	5	Sólo ocasionalmente manifiesta interés por el trabajo.	2	5	3
25	5	Nunca manifiesta interés por el trabajo.	1	2.5	4
26	5	Siempre manifiesta esmero y dedicación en la ejecución de las tareas y logra mejorar su trabajo.	5	12.5	5
27	6	Nunca esta dispuesto a colaborar y a menudo es hostil con sus compañeros de trabajo y su supervisor.	1	2.5	1
28	6	Siempre trabaja en armonía y estimula la colaboración entre los otros compañeros.	5	12.5	2
29	6	Siempre trabaja en armonía con otros y presta colaboración en forma espontánea.	4	10	3
30	6	Trabaja en armonía con otros y presta colaboración cuando es solicitada.	3	7.5	4
31	6	No se muestra dispuesto a colaborar, salvo en situaciones de mucha presión, presentando en  ocasiones conflictos con sus compañeros.	2	5	5
32	7	No es cuidadoso en el manejo y mantenimiento de los equipos, herramientas y maquinarias asignados.	1	2.5	1
33	7	Siempre es cuidadoso en el manejo de los equipos, herramientas y maquinarias asignado y realiza el mantenimiento en forma oportuna.	4	10	2
35	7	En ocasiones es descuidado en el manejo y mantenimiento de los equipos,  herramientas y maquinarias asignadas.	2	5	4
36	7	Es cuidadoso en el manejo de los equipos, herramientas y maquinarias asignadas. Difícilmente incurre en fallas que puedan causar daños o problemas significativos	3	7.5	5
37	8	Atiende al público en forma cortés, diligente y satisfactoria, de acuerdo a la exigencia del puesto de trabajo.	3	7.5	1
38	8	Ocasionalmente se dirige al público de manera inadecuada. En algunas oportunidades su conducta genera demoras injustificadas en la prestación del servicio.	2	5	2
39	8	Es descortés y negligente. Su comportamiento genera demoras injustificadas y quejas reiteradas.	1	2.5	3
40	8	Atiende al público en forma cortés, diligente, suministrando respuestas oportunas y satisfactorias. Ocasionalmente facilita la solución de problemas.	4	10	4
42	9	No es obedecido por el personal supervisado, lo que impide dar cumplimiento a las normas y objetivos.	3	0	1
43	9	Siempre logra rápida obediencia ante cualquier situación.	12	0	2
44	9	Es obedecido, logrando dar cumplimiento a las normas y objetivos.	9	0	3
45	9	A veces no es obedecido o solo lograr hacerse obedecer mediante fuertes discusiones.	6	0	4
46	9	Logra constantemente obediencias, obteniendo prontas respuestas y gran colaboración por parte de los subordinados.	15	0	5
47	10	Siempre responde ante situaciones de manera rápida, oportuna y efectiva. No requiere supervisión.	12	0	1
48	10	No decide ante las situaciones previstas o imprevistas.	3	0	2
49	10	Responde ante situaciones de manera oportuna, rápida y efectiva, consultándolo esporádicamente.	9	0	3
50	10	Ocasionalmente responde ante las situaciones de manera oportuna y realiza frecuentes consultas innecesarias.	6	0	4
51	10	Resuelve todos los problemas que se presentan. No requiere de supervisión y aporta ideas para evitar futuros problemas.	15	0	5
56	11	Siempre asigna y organiza las actividades al personal de forma racional y metódica logrando frecuentemente resultados por encima de lo esperado.	12	0	5
62	12	Imparte en forma clara y precisa las instrucciones, logrando los resultados esperados.	9	0	4
3	1	Ejecuta las tareas asignadas con exactitud, claridad y cuidado, evitando errores y omisiones.	3	7.5	2
2	1	Constantemente comete errores y omisiones a pesar de las reiteradas correcciones, no alcanza los resultados esperados.	1	2.5	1
15	3	Cumple  siempre con los reglamentos y procedimientos establecidos, estimula a los compañeros a acatarlos y aporta ideas y soluciones.	5	12.5	4
34	7	Siempre es cuidadoso en el manejo de los equipos, herramientas y maquinarias, nunca incurre en fallas debido a que realiza adecuadamente tanto el mantenimiento preventivo como correctivo.	5	12.5	3
41	8	Siempre atiende al público en forma cortés, diligente, suministrando respuestas oportunas y satisfactorias. Facilita la solución de problemas mediante la orientación y suministro de información adecuada.	5	12.5	5
52	11	En ocasiones no logra organizar y asignar el trabajo en forma metódica y racional.	6	0	1
53	11	No logra organizar y asignar el trabajo en forma metódica y racional.	3	0	2
54	11	Asigna y organiza las actividades al personal de forma racional y metódica facilitando el logro de los objetivos.	9	0	3
55	11	Siempre asigna y organiza las actividades al personal de forma racional y metódica logrando resultados por encima de lo esperado, aun en situaciones difíciles.	15	0	4
59	12	No imparte instrucciones en forma clara y precisa por lo que nunca es comprendido por sus subordinados.	3	0	1
60	12	Siempre es comprendido por sus subordinados al impartir las instrucciones sin necesidad de repetirlas, logrando con frecuencia resultados por encima de lo esperado.	12	0	2
61	12	En ocasiones presenta dificultad para ser atendido por sus subordinados, por lo que repite las instrucciones impartidas.	6	0	3
63	12	Siempre es comprendido en forma rápida por sus subordinados al impartir las instrucciones sin necesidad de repetir. Logra óptimos resultados, escucha a los subordinados para el intercambio de ideas.	15	0	5
\.


--
-- Name: criterios_co_criterio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('criterios_co_criterio_seq', 63, true);


--
-- Data for Name: detalle_respuestas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detalle_respuestas (co_detalle_respuestas, co_criterio, id_evaluacion_general, co_factor) FROM stdin;
436	30	84	6
437	12	84	3
438	34	84	7
439	10	84	2
440	37	84	8
441	19	84	4
442	6	84	1
443	23	84	5
624	29	179	6
625	12	179	3
626	33	179	7
627	11	179	2
444	30	85	6
445	12	85	3
446	34	85	7
447	11	85	2
448	37	85	8
449	19	85	4
450	2	85	1
451	22	85	5
452	30	87	6
453	12	87	3
454	34	87	7
455	10	87	2
628	37	179	8
629	21	179	4
630	3	179	1
631	26	179	5
456	37	87	8
457	20	87	4
458	3	87	1
459	22	87	5
468	30	89	6
469	16	89	3
470	32	89	7
471	9	89	2
548	28	99	6
549	15	99	3
550	33	99	7
551	10	99	2
552	40	99	8
553	21	99	4
554	6	99	1
555	22	99	5
472	37	89	8
473	19	89	4
474	6	89	1
475	22	89	5
476	29	86	6
477	15	86	3
478	34	86	7
479	11	86	2
648	29	94	6
649	16	94	3
650	33	94	7
651	10	94	2
480	40	86	8
481	21	86	4
482	6	86	1
483	26	86	5
652	37	94	8
653	21	94	4
654	3	94	1
655	26	94	5
664	28	95	6
665	12	95	3
666	33	95	7
667	11	95	2
668	37	95	8
669	21	95	4
670	3	95	1
671	22	95	5
592	29	175	6
593	16	175	3
594	33	175	7
595	9	175	2
596	41	175	8
597	20	175	4
598	6	175	1
599	26	175	5
680	30	101	6
681	12	101	3
682	33	101	7
683	11	101	2
684	37	101	8
685	21	101	4
686	3	101	1
687	23	101	5
688	30	102	6
689	12	102	3
690	33	102	7
691	11	102	2
692	37	102	8
693	21	102	4
694	5	102	1
695	23	102	5
704	29	104	6
705	12	104	3
706	33	104	7
707	7	104	2
708	37	104	8
709	21	104	4
710	4	104	1
711	24	104	5
712	29	192	6
713	16	192	3
714	34	192	7
715	10	192	2
716	40	192	8
717	20	192	4
718	5	192	1
719	22	192	5
720	30	134	6
721	12	134	3
722	33	134	7
723	11	134	2
724	38	134	8
725	21	134	4
726	4	134	1
727	24	134	5
736	28	138	6
737	16	138	3
738	36	138	7
739	11	138	2
740	40	138	8
741	21	138	4
742	3	138	1
743	22	138	5
752	30	107	6
753	12	107	3
754	33	107	7
755	10	107	2
756	37	107	8
757	21	107	4
758	5	107	1
759	23	107	5
744	30	136	6
745	12	136	3
746	33	136	7
747	11	136	2
748	37	136	8
749	21	136	4
750	4	136	1
751	23	136	5
760	29	108	6
761	12	108	3
762	33	108	7
763	10	108	2
764	37	108	8
765	21	108	4
766	5	108	1
767	23	108	5
768	30	109	6
769	12	109	3
770	33	109	7
771	11	109	2
772	38	109	8
773	21	109	4
774	3	109	1
775	23	109	5
776	30	110	6
777	12	110	3
778	33	110	7
779	11	110	2
780	37	110	8
781	21	110	4
782	4	110	1
783	23	110	5
784	30	111	6
785	12	111	3
786	33	111	7
787	11	111	2
788	37	111	8
789	21	111	4
790	4	111	1
791	23	111	5
792	29	114	6
793	12	114	3
794	33	114	7
795	11	114	2
796	37	114	8
797	21	114	4
798	6	114	1
799	23	114	5
800	29	117	6
801	12	117	3
802	33	117	7
803	11	117	2
804	37	117	8
805	21	117	4
806	6	117	1
807	23	117	5
808	28	140	6
809	12	140	3
810	36	140	7
811	11	140	2
812	37	140	8
813	21	140	4
814	3	140	1
815	23	140	5
816	29	144	6
817	12	144	3
818	33	144	7
819	11	144	2
820	40	144	8
821	21	144	4
822	3	144	1
823	22	144	5
824	29	141	6
825	15	141	3
826	36	141	7
827	11	141	2
828	41	141	8
829	3	141	1
830	21	141	4
831	23	141	5
832	30	146	6
833	12	146	3
834	33	146	7
835	9	146	2
836	41	146	8
837	20	146	4
838	3	146	1
839	22	146	5
840	29	147	6
841	15	147	3
842	33	147	7
843	9	147	2
844	41	147	8
845	19	147	4
846	5	147	1
847	26	147	5
848	28	149	6
849	16	149	3
850	33	149	7
851	9	149	2
852	41	149	8
853	20	149	4
854	3	149	1
855	22	149	5
856	30	151	6
857	16	151	3
858	33	151	7
859	11	151	2
860	41	151	8
861	19	151	4
862	3	151	1
863	22	151	5
864	31	154	6
865	12	154	3
866	36	154	7
867	8	154	2
868	37	154	8
869	21	154	4
870	3	154	1
871	24	154	5
880	30	158	6
881	12	158	3
882	36	158	7
883	11	158	2
884	37	158	8
885	21	158	4
886	3	158	1
887	24	158	5
888	29	161	6
889	15	161	3
890	33	161	7
891	9	161	2
892	41	161	8
893	21	161	4
894	6	161	1
895	22	161	5
896	30	164	6
897	12	164	3
898	33	164	7
899	11	164	2
900	37	164	8
901	21	164	4
902	3	164	1
903	26	164	5
912	29	156	6
913	12	156	3
914	33	156	7
915	11	156	2
916	40	156	8
917	21	156	4
918	3	156	1
919	22	156	5
920	30	157	6
921	12	157	3
922	36	157	7
923	11	157	2
924	37	157	8
925	21	157	4
926	3	157	1
927	23	157	5
928	29	172	6
929	12	172	3
930	36	172	7
931	9	172	2
932	41	172	8
933	21	172	4
934	6	172	1
935	22	172	5
936	28	166	6
937	12	166	3
938	36	166	7
939	11	166	2
940	41	166	8
941	21	166	4
942	3	166	1
943	22	166	5
944	29	160	6
945	16	160	3
946	33	160	7
947	10	160	2
948	40	160	8
949	5	160	1
950	20	160	4
951	22	160	5
952	28	98	6
953	12	98	3
954	36	98	7
955	10	98	2
956	37	98	8
957	21	98	4
958	3	98	1
959	26	98	5
960	30	100	6
961	12	100	3
962	36	100	7
963	11	100	2
964	37	100	8
965	21	100	4
966	3	100	1
967	23	100	5
968	30	103	6
969	12	103	3
970	36	103	7
971	11	103	2
972	37	103	8
973	21	103	4
974	3	103	1
975	24	103	5
976	30	106	6
977	12	106	3
978	36	106	7
979	11	106	2
980	37	106	8
981	21	106	4
982	3	106	1
983	23	106	5
984	29	112	6
985	12	112	3
986	34	112	7
987	9	112	2
988	41	112	8
989	21	112	4
990	6	112	1
991	22	112	5
992	28	234	6
993	12	234	3
994	36	234	7
995	11	234	2
996	37	234	8
997	21	234	4
998	6	234	1
999	23	234	5
1008	28	235	6
1009	12	235	3
1010	36	235	7
1011	11	235	2
1012	37	235	8
1013	21	235	4
1014	3	235	1
1015	23	235	5
1024	30	236	6
1025	12	236	3
1026	36	236	7
1027	11	236	2
1028	40	236	8
1029	21	236	4
1030	3	236	1
1031	23	236	5
1032	30	118	6
1033	12	118	3
1034	36	118	7
1035	11	118	2
1036	37	118	8
1037	21	118	4
1038	3	118	1
1039	24	118	5
1040	29	120	6
1041	16	120	3
1042	34	120	7
1043	10	120	2
1044	41	120	8
1045	20	120	4
1046	6	120	1
1047	26	120	5
1048	28	122	6
1049	12	122	3
1050	36	122	7
1051	11	122	2
1052	37	122	8
1053	21	122	4
1054	3	122	1
1055	23	122	5
1056	30	124	6
1057	12	124	3
1058	36	124	7
1059	11	124	2
1060	37	124	8
1061	21	124	4
1062	3	124	1
1063	23	124	5
1064	29	125	6
1065	12	125	3
1066	36	125	7
1067	9	125	2
1068	37	125	8
1069	20	125	4
1070	6	125	1
1071	26	125	5
1072	28	126	6
1073	16	126	3
1074	36	126	7
1075	10	126	2
1076	37	126	8
1077	20	126	4
1078	3	126	1
1079	26	126	5
1080	29	237	6
1081	16	237	3
1082	36	237	7
1083	10	237	2
1084	37	237	8
1085	20	237	4
1086	3	237	1
1087	26	237	5
1088	30	128	6
1089	12	128	3
1090	36	128	7
1091	11	128	2
1092	37	128	8
1093	21	128	4
1094	3	128	1
1095	23	128	5
1096	30	129	6
1097	12	129	3
1098	36	129	7
1099	11	129	2
1100	37	129	8
1101	21	129	4
1102	3	129	1
1103	23	129	5
1104	30	119	6
1105	12	119	3
1106	33	119	7
1107	11	119	2
1108	37	119	8
1109	21	119	4
1110	5	119	1
1111	23	119	5
1112	30	121	6
1113	12	121	3
1114	33	121	7
1115	11	121	2
1116	37	121	8
1117	21	121	4
1118	3	121	1
1119	23	121	5
1120	30	133	6
1121	12	133	3
1122	33	133	7
1123	11	133	2
1124	37	133	8
1125	21	133	4
1126	3	133	1
1127	23	133	5
1128	30	123	6
1129	12	123	3
1130	33	123	7
1131	11	123	2
1132	38	123	8
1133	21	123	4
1134	3	123	1
1135	23	123	5
1136	30	130	6
1137	12	130	3
1138	33	130	7
1139	11	130	2
1140	37	130	8
1141	21	130	4
1142	3	130	1
1143	23	130	5
1144	30	131	6
1145	12	131	3
1146	33	131	7
1147	11	131	2
1148	38	131	8
1149	21	131	4
1150	4	131	1
1151	23	131	5
1152	30	135	6
1153	12	135	3
1154	33	135	7
1155	11	135	2
1156	37	135	8
1157	21	135	4
1158	3	135	1
1159	23	135	5
1176	30	142	6
1177	12	142	3
1178	33	142	7
1179	11	142	2
1180	37	142	8
1181	21	142	4
1182	3	142	1
1183	23	142	5
1192	30	143	6
1193	12	143	3
1194	33	143	7
1195	11	143	2
1196	37	143	8
1197	21	143	4
1198	3	143	1
1199	23	143	5
1200	30	145	6
1201	12	145	3
1202	33	145	7
1203	11	145	2
1204	37	145	8
1205	21	145	4
1206	3	145	1
1207	23	145	5
1160	30	137	6
1161	12	137	3
1162	33	137	7
1163	11	137	2
1164	37	137	8
1165	21	137	4
1166	3	137	1
1167	23	137	5
1168	30	139	6
1169	12	139	3
1170	33	139	7
1171	11	139	2
1172	37	139	8
1173	21	139	4
1174	3	139	1
1175	23	139	5
1184	29	238	6
1185	15	238	3
1186	33	238	7
1187	10	238	2
1188	41	238	8
1189	19	238	4
1190	6	238	1
1191	23	238	5
1208	30	148	6
1209	12	148	3
1210	33	148	7
1211	11	148	2
1212	37	148	8
1213	21	148	4
1214	3	148	1
1215	23	148	5
1216	30	150	6
1217	12	150	3
1218	33	150	7
1219	11	150	2
1220	37	150	8
1221	21	150	4
1222	3	150	1
1223	23	150	5
1224	29	239	6
1225	12	239	3
1226	33	239	7
1227	11	239	2
1228	37	239	8
1229	21	239	4
1230	3	239	1
1231	23	239	5
1232	30	153	6
1233	12	153	3
1234	33	153	7
1235	11	153	2
1236	37	153	8
1237	21	153	4
1238	3	153	1
1239	23	153	5
1240	30	155	6
1241	12	155	3
1242	33	155	7
1243	11	155	2
1244	37	155	8
1245	21	155	4
1246	3	155	1
1247	23	155	5
1248	30	159	6
1249	12	159	3
1250	33	159	7
1251	11	159	2
1252	37	159	8
1253	21	159	4
1254	3	159	1
1255	23	159	5
1256	30	240	6
1257	12	240	3
1258	33	240	7
1259	11	240	2
1260	37	240	8
1261	21	240	4
1262	4	240	1
1263	23	240	5
1264	30	162	6
1265	12	162	3
1266	33	162	7
1267	11	162	2
1268	37	162	8
1269	21	162	4
1270	3	162	1
1271	23	162	5
1272	30	163	6
1273	12	163	3
1274	33	163	7
1275	11	163	2
1276	37	163	8
1277	21	163	4
1278	3	163	1
1279	23	163	5
1280	30	165	6
1281	12	165	3
1282	33	165	7
1283	11	165	2
1284	37	165	8
1285	21	165	4
1286	3	165	1
1287	23	165	5
1288	30	167	6
1289	12	167	3
1290	33	167	7
1291	11	167	2
1292	37	167	8
1293	21	167	4
1294	3	167	1
1295	23	167	5
1296	30	168	6
1297	12	168	3
1298	33	168	7
1299	11	168	2
1300	37	168	8
1301	21	168	4
1302	3	168	1
1303	23	168	5
1304	30	241	6
1305	12	241	3
1306	33	241	7
1307	11	241	2
1308	37	241	8
1309	21	241	4
1310	3	241	1
1311	23	241	5
1312	30	169	6
1313	12	169	3
1314	33	169	7
1315	11	169	2
1316	37	169	8
1317	21	169	4
1318	3	169	1
1319	23	169	5
1320	30	170	6
1321	12	170	3
1322	33	170	7
1323	11	170	2
1324	37	170	8
1325	21	170	4
1326	3	170	1
1327	23	170	5
1328	29	96	6
1329	56	96	11
1330	15	96	3
1331	34	96	7
1332	43	96	9
1333	60	96	12
1334	10	96	2
1335	37	96	8
1336	20	96	4
1337	6	96	1
1338	47	96	10
1339	26	96	5
1340	29	171	6
1341	12	171	3
1342	33	171	7
1343	11	171	2
1344	37	171	8
1345	21	171	4
1346	5	171	1
1347	23	171	5
1348	30	173	6
1349	12	173	3
1350	33	173	7
1351	11	173	2
1352	37	173	8
1353	21	173	4
1354	3	173	1
1355	23	173	5
1356	29	97	6
1357	56	97	11
1358	15	97	3
1359	34	97	7
1360	43	97	9
1361	62	97	12
1362	10	97	2
1363	37	97	8
1364	20	97	4
1365	5	97	1
1366	47	97	10
1367	22	97	5
1368	29	127	6
1369	15	127	3
1370	36	127	7
1371	10	127	2
1372	41	127	8
1373	20	127	4
1374	6	127	1
1375	26	127	5
1416	28	182	6
1417	12	182	3
1418	36	182	7
1419	11	182	2
1420	37	182	8
1421	21	182	4
1422	3	182	1
1423	26	182	5
1432	28	247	6
1433	16	247	3
1434	33	247	7
1435	10	247	2
1436	40	247	8
1437	21	247	4
1438	5	247	1
1439	23	247	5
1376	29	113	6
1377	16	113	3
1378	36	113	7
1379	11	113	2
1380	40	113	8
1381	21	113	4
1382	3	113	1
1383	23	113	5
1384	30	174	6
1385	12	174	3
1386	33	174	7
1387	11	174	2
1388	37	174	8
1389	3	174	1
1390	21	174	4
1391	23	174	5
1392	30	176	6
1393	12	176	3
1394	33	176	7
1395	11	176	2
1396	37	176	8
1397	21	176	4
1398	3	176	1
1399	23	176	5
1400	30	132	6
1401	12	132	3
1402	33	132	7
1403	11	132	2
1404	37	132	8
1405	3	132	1
1406	21	132	4
1407	23	132	5
1408	29	242	6
1409	15	242	3
1410	36	242	7
1411	10	242	2
1412	41	242	8
1413	20	242	4
1414	5	242	1
1415	26	242	5
1424	30	243	6
1425	16	243	3
1426	33	243	7
1427	11	243	2
1428	37	243	8
1429	20	243	4
1430	5	243	1
1431	26	243	5
1440	29	248	6
1441	15	248	3
1442	34	248	7
1443	10	248	2
1444	40	248	8
1445	4	248	1
1446	21	248	4
1447	26	248	5
1448	28	249	6
1449	16	249	3
1450	33	249	7
1451	11	249	2
1452	40	249	8
1453	20	249	4
1454	5	249	1
1455	23	249	5
1456	28	183	6
1457	16	183	3
1458	36	183	7
1459	9	183	2
1460	40	183	8
1461	21	183	4
1462	3	183	1
1463	26	183	5
1464	28	250	6
1465	12	250	3
1466	33	250	7
1467	11	250	2
1468	37	250	8
1469	21	250	4
1470	3	250	1
1471	26	250	5
1472	29	251	6
1473	56	251	11
1474	15	251	3
1475	33	251	7
1476	44	251	9
1477	60	251	12
1478	10	251	2
1479	41	251	8
1480	20	251	4
1481	5	251	1
1482	47	251	10
1483	22	251	5
1484	28	252	6
1485	12	252	3
1486	33	252	7
1487	11	252	2
1488	37	252	8
1489	21	252	4
1490	3	252	1
1491	26	252	5
1492	30	184	6
1493	12	184	3
1494	36	184	7
1495	11	184	2
1496	37	184	8
1497	21	184	4
1498	3	184	1
1499	26	184	5
1500	30	253	6
1501	12	253	3
1502	34	253	7
1503	10	253	2
1504	40	253	8
1505	20	253	4
1506	5	253	1
1507	26	253	5
1508	28	254	6
1509	16	254	3
1510	36	254	7
1511	10	254	2
1512	37	254	8
1513	20	254	4
1514	3	254	1
1515	26	254	5
1516	28	255	6
1517	15	255	3
1518	33	255	7
1519	11	255	2
1520	41	255	8
1521	19	255	4
1522	3	255	1
1523	26	255	5
1524	30	256	6
1525	12	256	3
1526	33	256	7
1527	10	256	2
1528	37	256	8
1529	21	256	4
1530	6	256	1
1531	23	256	5
1532	29	257	6
1533	16	257	3
1534	33	257	7
1535	11	257	2
1536	37	257	8
1537	21	257	4
1538	4	257	1
1539	24	257	5
1540	30	258	6
1541	12	258	3
1542	36	258	7
1543	10	258	2
1544	40	258	8
1545	21	258	4
1546	5	258	1
1547	23	258	5
5344	30	371	6
5345	16	371	3
5346	36	371	7
5347	11	371	2
5348	37	371	8
5349	21	371	4
5350	3	371	1
5351	26	371	5
1556	28	260	6
1557	16	260	3
1558	33	260	7
1559	10	260	2
1560	41	260	8
1561	21	260	4
1562	6	260	1
1563	26	260	5
1564	28	261	6
1565	12	261	3
1566	33	261	7
1567	11	261	2
1568	37	261	8
1569	21	261	4
1570	6	261	1
1571	26	261	5
1572	30	262	6
1573	12	262	3
1574	36	262	7
1575	11	262	2
1576	37	262	8
1577	21	262	4
1578	6	262	1
1579	23	262	5
1592	30	190	6
1593	12	190	3
1594	36	190	7
1595	11	190	2
1596	38	190	8
1597	17	190	4
1598	4	190	1
1599	23	190	5
1580	29	185	6
1581	54	185	11
1582	15	185	3
1583	36	185	7
1584	43	185	9
1585	62	185	12
1586	10	185	2
1587	37	185	8
1588	20	185	4
1589	5	185	1
1590	49	185	10
1591	26	185	5
1600	28	186	6
1601	12	186	3
1602	36	186	7
1603	11	186	2
1604	40	186	8
1605	3	186	1
1606	20	186	4
1607	26	186	5
1608	28	188	6
1609	54	188	11
1610	12	188	3
1611	33	188	7
1612	46	188	9
1613	11	188	2
1614	62	188	12
1615	40	188	8
1616	3	188	1
1617	21	188	4
1618	49	188	10
1619	26	188	5
1620	29	189	6
1621	12	189	3
1622	33	189	7
1623	11	189	2
1624	37	189	8
1625	21	189	4
1626	3	189	1
1627	26	189	5
1628	30	193	6
1629	12	193	3
1630	36	193	7
1631	11	193	2
1632	41	193	8
1633	21	193	4
1634	3	193	1
1635	26	193	5
1636	30	197	6
1637	12	197	3
1638	33	197	7
1639	11	197	2
1640	41	197	8
1641	21	197	4
1642	3	197	1
1643	26	197	5
1644	28	233	6
1645	12	233	3
1646	36	233	7
1647	11	233	2
1648	37	233	8
1649	20	233	4
1650	5	233	1
1651	26	233	5
1652	28	232	6
1653	12	232	3
1654	33	232	7
1655	11	232	2
1656	37	232	8
1657	21	232	4
1658	3	232	1
1659	23	232	5
1660	30	231	6
1661	12	231	3
1662	36	231	7
1663	11	231	2
1664	37	231	8
1665	21	231	4
1666	3	231	1
1667	23	231	5
1668	29	218	6
1669	15	218	3
1670	33	218	7
1671	10	218	2
1672	40	218	8
1673	20	218	4
1674	5	218	1
1675	22	218	5
1676	29	194	6
1677	12	194	3
1678	34	194	7
1679	9	194	2
1680	40	194	8
1681	21	194	4
1682	6	194	1
1683	23	194	5
1684	28	226	6
1685	54	226	11
1686	12	226	3
1687	36	226	7
1688	44	226	9
1689	62	226	12
1690	11	226	2
1691	41	226	8
1692	20	226	4
1693	5	226	1
1694	47	226	10
1695	26	226	5
1696	29	205	6
1697	56	205	11
1698	16	205	3
1699	36	205	7
1700	44	205	9
1701	62	205	12
1702	10	205	2
1703	40	205	8
1704	19	205	4
1705	3	205	1
1706	49	205	10
1707	26	205	5
1708	29	210	6
1709	56	210	11
1710	16	210	3
1711	36	210	7
1712	44	210	9
1713	62	210	12
1714	10	210	2
1715	41	210	8
1716	19	210	4
1717	6	210	1
1718	49	210	10
1719	26	210	5
1720	28	216	6
1721	54	216	11
1722	12	216	3
1723	33	216	7
1724	44	216	9
1725	62	216	12
1726	10	216	2
1727	40	216	8
1728	21	216	4
1729	3	216	1
1730	49	216	10
1731	22	216	5
1732	28	195	6
1733	12	195	3
1734	36	195	7
1735	11	195	2
1736	37	195	8
1737	20	195	4
1738	6	195	1
1739	26	195	5
1740	28	198	6
1741	12	198	3
1742	36	198	7
1743	11	198	2
1744	37	198	8
1745	20	198	4
1746	3	198	1
1747	23	198	5
1748	29	230	6
1749	12	230	3
1750	36	230	7
1751	11	230	2
1752	37	230	8
1753	20	230	4
1754	3	230	1
1755	26	230	5
1756	30	199	6
1757	16	199	3
1758	36	199	7
1759	11	199	2
1760	41	199	8
1761	20	199	4
1762	3	199	1
1763	23	199	5
1764	30	152	6
1765	12	152	3
1766	36	152	7
1767	11	152	2
1768	40	152	8
1769	3	152	1
1770	21	152	4
1771	23	152	5
1772	28	221	6
1773	12	221	3
1774	36	221	7
1775	9	221	2
1776	37	221	8
1777	21	221	4
1778	3	221	1
1779	26	221	5
1780	30	219	6
1781	12	219	3
1782	36	219	7
1783	11	219	2
1784	37	219	8
1785	3	219	1
1786	21	219	4
1787	23	219	5
1788	29	245	6
1789	12	245	3
1790	36	245	7
1791	11	245	2
1792	37	245	8
1793	21	245	4
1794	4	245	1
1795	23	245	5
1796	28	200	6
1797	12	200	3
1798	33	200	7
1799	11	200	2
1800	37	200	8
1801	6	200	1
1802	20	200	4
1803	23	200	5
1804	30	244	6
1805	12	244	3
1806	36	244	7
1807	11	244	2
1808	37	244	8
1809	21	244	4
1810	4	244	1
1811	23	244	5
1812	30	201	6
1813	12	201	3
1814	33	201	7
1815	11	201	2
1816	37	201	8
1817	21	201	4
1818	6	201	1
1819	23	201	5
1820	29	263	6
1821	54	263	11
1822	12	263	3
1823	33	263	7
1824	46	263	9
1825	62	263	12
1826	10	263	2
1827	41	263	8
1828	19	263	4
1829	3	263	1
1830	49	263	10
1831	22	263	5
1832	30	202	6
1833	12	202	3
1834	36	202	7
1835	11	202	2
1836	41	202	8
1837	21	202	4
1838	3	202	1
1839	23	202	5
1840	30	203	6
1841	12	203	3
1842	33	203	7
1843	11	203	2
1844	40	203	8
1845	20	203	4
1846	3	203	1
1847	23	203	5
1888	28	204	6
1889	12	204	3
1890	36	204	7
1891	9	204	2
1892	37	204	8
1893	20	204	4
1894	6	204	1
1895	23	204	5
1896	28	207	6
1897	12	207	3
1898	33	207	7
1899	11	207	2
1900	41	207	8
1901	21	207	4
1902	3	207	1
1903	23	207	5
1912	30	81	6
1913	12	81	3
1914	34	81	7
1915	11	81	2
1916	37	81	8
1917	21	81	4
1918	3	81	1
1919	23	81	5
1920	30	78	6
1921	12	78	3
1922	33	78	7
1923	11	78	2
1924	37	78	8
1925	21	78	4
1926	3	78	1
1927	23	78	5
1928	30	83	6
1929	12	83	3
1930	34	83	7
1931	11	83	2
1932	37	83	8
1933	21	83	4
1934	3	83	1
1935	26	83	5
1936	30	80	6
1937	12	80	3
1938	34	80	7
1939	11	80	2
1940	37	80	8
1941	21	80	4
1942	3	80	1
1943	23	80	5
1944	30	82	6
1945	16	82	3
1946	33	82	7
1947	9	82	2
1948	37	82	8
1949	20	82	4
1950	3	82	1
1951	23	82	5
1952	30	79	6
1953	12	79	3
1954	34	79	7
1955	11	79	2
1956	37	79	8
1957	21	79	4
1958	3	79	1
1959	26	79	5
1960	28	229	6
1961	12	229	3
1962	33	229	7
1963	10	229	2
1964	37	229	8
1965	20	229	4
1966	5	229	1
1967	23	229	5
2000	28	211	6
2001	15	211	3
2002	33	211	7
2003	11	211	2
2004	37	211	8
2005	19	211	4
2006	6	211	1
2007	23	211	5
2008	29	212	6
2009	12	212	3
2010	33	212	7
2011	9	212	2
2012	37	212	8
2013	20	212	4
2014	6	212	1
2015	26	212	5
2040	30	227	6
2041	16	227	3
2042	36	227	7
2043	11	227	2
2044	37	227	8
2045	20	227	4
2046	6	227	1
2047	23	227	5
2064	30	220	6
2065	12	220	3
2066	36	220	7
2067	11	220	2
2068	41	220	8
2069	21	220	4
2070	3	220	1
2071	23	220	5
2080	29	223	6
2081	12	223	3
2082	33	223	7
2083	9	223	2
2084	41	223	8
2085	20	223	4
2086	6	223	1
2087	22	223	5
1968	30	209	6
1969	12	209	3
1970	36	209	7
1971	10	209	2
1972	37	209	8
1973	21	209	4
1974	6	209	1
1975	26	209	5
1976	30	206	6
1977	12	206	3
1978	36	206	7
1979	11	206	2
1980	37	206	8
1981	21	206	4
1982	3	206	1
1983	23	206	5
1984	28	208	6
1985	16	208	3
1986	36	208	7
1987	11	208	2
1988	37	208	8
1989	20	208	4
1990	3	208	1
1991	23	208	5
1992	28	228	6
1993	15	228	3
1994	33	228	7
1995	11	228	2
1996	37	228	8
1997	20	228	4
1998	6	228	1
1999	23	228	5
2024	30	214	6
2025	16	214	3
2026	33	214	7
2027	11	214	2
2028	37	214	8
2029	20	214	4
2030	3	214	1
2031	23	214	5
2032	29	215	6
2033	16	215	3
2034	36	215	7
2035	11	215	2
2036	37	215	8
2037	21	215	4
2038	6	215	1
2039	23	215	5
2056	28	217	6
2057	16	217	3
2058	33	217	7
2059	9	217	2
2060	40	217	8
2061	21	217	4
2062	6	217	1
2063	26	217	5
2088	28	224	6
2089	12	224	3
2090	33	224	7
2091	11	224	2
2092	40	224	8
2093	20	224	4
2094	3	224	1
2095	23	224	5
2016	28	213	6
2017	16	213	3
2018	36	213	7
2019	11	213	2
2020	37	213	8
2021	21	213	4
2022	3	213	1
2023	26	213	5
2048	28	225	6
2049	12	225	3
2050	36	225	7
2051	10	225	2
2052	41	225	8
2053	20	225	4
2054	3	225	1
2055	23	225	5
2072	30	222	6
2073	16	222	3
2074	36	222	7
2075	11	222	2
2076	37	222	8
2077	20	222	4
2078	3	222	1
2079	23	222	5
2104	30	196	6
2105	12	196	3
2106	33	196	7
2107	9	196	2
2108	37	196	8
2109	3	196	1
2110	21	196	4
2111	23	196	5
2112	29	266	6
2113	12	266	3
2114	36	266	7
2115	11	266	2
2116	37	266	8
2117	21	266	4
2118	3	266	1
2119	23	266	5
2120	28	265	6
2121	15	265	3
2122	36	265	7
2123	10	265	2
2124	41	265	8
2125	6	265	1
2126	20	265	4
2127	26	265	5
2128	28	271	6
2129	16	271	3
2130	33	271	7
2131	11	271	2
2132	40	271	8
2133	5	271	1
2134	20	271	4
2135	26	271	5
2136	30	264	6
2137	12	264	3
2138	36	264	7
2139	11	264	2
2140	38	264	8
2141	21	264	4
2142	4	264	1
2143	24	264	5
2144	29	272	6
2145	16	272	3
2146	36	272	7
2147	11	272	2
2148	40	272	8
2149	21	272	4
2150	6	272	1
2151	26	272	5
2152	29	273	6
2153	56	273	11
2154	12	273	3
2155	33	273	7
2156	46	273	9
2157	62	273	12
2158	10	273	2
2159	37	273	8
2160	21	273	4
2161	6	273	1
2162	51	273	10
2163	22	273	5
2164	29	274	6
2165	12	274	3
2166	33	274	7
2167	11	274	2
2168	37	274	8
2169	21	274	4
2170	6	274	1
2171	22	274	5
2196	29	275	6
2197	54	275	11
2198	16	275	3
2199	34	275	7
2200	44	275	9
2201	63	275	12
2202	11	275	2
2203	40	275	8
2204	21	275	4
2205	4	275	1
2206	49	275	10
2207	22	275	5
2208	29	291	6
2209	12	291	3
2210	36	291	7
2211	10	291	2
2212	37	291	8
2213	20	291	4
2214	6	291	1
2215	23	291	5
2224	29	270	6
2225	12	270	3
2226	33	270	7
2227	10	270	2
2228	41	270	8
2229	21	270	4
2230	3	270	1
2231	23	270	5
2252	28	267	6
2253	16	267	3
2254	33	267	7
2255	10	267	2
2256	41	267	8
2257	5	267	1
2258	21	267	4
2259	26	267	5
2260	28	90	6
2261	16	90	3
2262	33	90	7
2263	11	90	2
2264	37	90	8
2265	21	90	4
2266	3	90	1
2267	26	90	5
2268	28	268	6
2269	54	268	11
2270	12	268	3
2271	33	268	7
2272	44	268	9
2273	9	268	2
2274	62	268	12
2275	40	268	8
2276	5	268	1
2277	20	268	4
2278	49	268	10
2279	26	268	5
2280	29	269	6
2281	12	269	3
2282	33	269	7
2283	10	269	2
2284	41	269	8
2285	20	269	4
2286	3	269	1
2287	26	269	5
2288	30	292	6
2289	15	292	3
2290	33	292	7
2291	11	292	2
2292	40	292	8
2293	21	292	4
2294	3	292	1
2295	23	292	5
2296	30	77	6
2297	12	77	3
2298	36	77	7
2299	11	77	2
2300	41	77	8
2301	21	77	4
2302	3	77	1
2303	23	77	5
2304	28	276	6
2305	16	276	3
2306	36	276	7
2307	10	276	2
2308	40	276	8
2309	21	276	4
2310	6	276	1
2311	26	276	5
2312	30	296	6
2313	12	296	3
2314	33	296	7
2315	11	296	2
2316	37	296	8
2317	20	296	4
2318	3	296	1
2319	23	296	5
2320	30	297	6
2321	12	297	3
2322	33	297	7
2323	11	297	2
2324	37	297	8
2325	21	297	4
2326	3	297	1
2327	24	297	5
2328	29	298	6
2329	15	298	3
2330	36	298	7
2331	10	298	2
2332	37	298	8
2333	20	298	4
2334	6	298	1
2335	22	298	5
2344	30	300	6
2345	12	300	3
2346	33	300	7
2347	11	300	2
2348	37	300	8
2349	21	300	4
2350	4	300	1
2351	23	300	5
2352	30	301	6
2353	12	301	3
2354	36	301	7
2355	11	301	2
2356	41	301	8
2357	3	301	1
2358	21	301	4
2359	23	301	5
2360	30	302	6
2361	12	302	3
2362	36	302	7
2363	11	302	2
2364	37	302	8
2365	21	302	4
2366	3	302	1
2367	23	302	5
2368	30	303	6
2369	12	303	3
2370	36	303	7
2371	11	303	2
2372	37	303	8
2373	21	303	4
2374	3	303	1
2375	23	303	5
2392	29	310	6
2393	16	310	3
2394	34	310	7
2395	10	310	2
2396	41	310	8
2397	19	310	4
2398	6	310	1
2399	26	310	5
2400	30	312	6
2401	16	312	3
2402	33	312	7
2403	10	312	2
2404	37	312	8
2405	21	312	4
2406	3	312	1
2407	26	312	5
5352	29	581	6
5353	12	581	3
5354	36	581	7
5355	10	581	2
5356	37	581	8
5357	21	581	4
5358	5	581	1
5359	23	581	5
5368	30	566	6
5369	16	566	3
5370	36	566	7
5371	9	566	2
2484	29	295	6
2485	12	295	3
2486	33	295	7
2487	10	295	2
2488	37	295	8
2489	21	295	4
2490	3	295	1
2491	26	295	5
2492	30	313	6
2493	12	313	3
2494	36	313	7
2495	9	313	2
2496	41	313	8
2497	5	313	1
2498	21	313	4
2499	22	313	5
2500	30	299	6
2501	12	299	3
2502	33	299	7
2503	10	299	2
2504	37	299	8
2505	21	299	4
2506	5	299	1
2507	22	299	5
2508	29	304	6
2509	12	304	3
2510	36	304	7
2511	9	304	2
2512	37	304	8
2513	21	304	4
2514	6	304	1
2515	22	304	5
2516	29	305	6
2517	12	305	3
2518	36	305	7
2519	10	305	2
2520	37	305	8
2521	21	305	4
2522	5	305	1
2523	23	305	5
2524	30	314	6
2525	16	314	3
2526	33	314	7
2527	9	314	2
2528	40	314	8
2529	5	314	1
2530	20	314	4
2531	26	314	5
2532	28	309	6
2533	12	309	3
2534	33	309	7
2535	11	309	2
2536	41	309	8
2537	5	309	1
2538	21	309	4
2539	26	309	5
2540	28	311	6
2541	12	311	3
2542	33	311	7
2543	11	311	2
2544	41	311	8
2545	21	311	4
2546	5	311	1
2547	26	311	5
2548	28	92	6
2549	16	92	3
2550	33	92	7
2551	10	92	2
2552	37	92	8
2553	20	92	4
2554	3	92	1
2555	23	92	5
2556	29	277	6
2557	16	277	3
2558	33	277	7
2559	10	277	2
2560	40	277	8
2561	20	277	4
2562	5	277	1
2563	26	277	5
2564	28	278	6
2565	12	278	3
2566	33	278	7
2567	11	278	2
2568	40	278	8
2569	3	278	1
2570	20	278	4
2571	26	278	5
2588	30	280	6
2589	12	280	3
2590	33	280	7
2591	11	280	2
2592	37	280	8
2593	21	280	4
2594	3	280	1
2595	26	280	5
2572	29	279	6
2573	16	279	3
2574	36	279	7
2575	10	279	2
2576	40	279	8
2577	21	279	4
2578	5	279	1
2579	26	279	5
2596	29	281	6
2597	16	281	3
2598	33	281	7
2599	10	281	2
2600	37	281	8
2601	21	281	4
2602	3	281	1
2603	26	281	5
5360	28	580	6
5361	12	580	3
5362	36	580	7
5363	11	580	2
5364	37	580	8
5365	21	580	4
5366	3	580	1
5367	26	580	5
2612	29	282	6
2613	16	282	3
2614	33	282	7
2615	10	282	2
2616	40	282	8
2617	20	282	4
2618	5	282	1
2619	26	282	5
2620	29	289	6
2621	16	289	3
2622	36	289	7
2623	10	289	2
2624	41	289	8
2625	3	289	1
2626	20	289	4
2627	26	289	5
2628	29	283	6
2629	12	283	3
2630	33	283	7
2631	11	283	2
2632	37	283	8
2633	3	283	1
2634	21	283	4
2635	23	283	5
2636	29	306	6
2637	16	306	3
2638	33	306	7
2639	10	306	2
2640	41	306	8
2641	21	306	4
2642	3	306	1
2643	23	306	5
2644	28	284	6
2645	12	284	3
2646	33	284	7
2647	10	284	2
2648	40	284	8
2649	21	284	4
2650	3	284	1
2651	26	284	5
2652	28	285	6
2653	12	285	3
2654	33	285	7
2655	11	285	2
2656	40	285	8
2657	21	285	4
2658	3	285	1
2659	23	285	5
2660	28	286	6
2661	12	286	3
2662	36	286	7
2663	10	286	2
2664	37	286	8
2665	21	286	4
2666	3	286	1
2667	26	286	5
2668	28	287	6
2669	16	287	3
2670	33	287	7
2671	10	287	2
2672	37	287	8
2673	21	287	4
2674	3	287	1
2675	26	287	5
2676	30	288	6
2677	12	288	3
2678	33	288	7
2679	11	288	2
2680	37	288	8
2681	21	288	4
2682	3	288	1
2683	23	288	5
2684	30	315	6
2685	16	315	3
2686	33	315	7
2687	10	315	2
2688	41	315	8
2689	21	315	4
2690	5	315	1
2691	23	315	5
2692	29	290	6
2693	16	290	3
2694	33	290	7
2695	11	290	2
2696	37	290	8
2697	21	290	4
2698	3	290	1
2699	23	290	5
2700	29	316	6
2701	12	316	3
2702	33	316	7
2703	10	316	2
2704	37	316	8
2705	21	316	4
2706	3	316	1
2707	26	316	5
2708	29	317	6
2709	12	317	3
2710	33	317	7
2711	10	317	2
2712	37	317	8
2713	21	317	4
2714	3	317	1
2715	26	317	5
5372	37	566	8
5373	20	566	4
5374	6	566	1
5375	26	566	5
2728	29	319	6
2729	16	319	3
2730	34	319	7
2731	9	319	2
2732	41	319	8
2733	19	319	4
2734	6	319	1
2735	26	319	5
2736	30	320	6
2737	12	320	3
2738	36	320	7
2739	11	320	2
2740	37	320	8
2741	21	320	4
2742	3	320	1
2743	23	320	5
2744	29	321	6
2745	12	321	3
2746	36	321	7
2747	11	321	2
2748	37	321	8
2749	21	321	4
2750	3	321	1
2751	23	321	5
2752	31	322	6
2753	12	322	3
2754	33	322	7
2755	11	322	2
2756	37	322	8
2757	21	322	4
2758	3	322	1
2759	23	322	5
2760	30	246	6
2761	12	246	3
2762	36	246	7
2763	11	246	2
2764	37	246	8
2765	21	246	4
2766	4	246	1
2767	23	246	5
2768	30	91	6
2769	16	91	3
2770	33	91	7
2771	10	91	2
2772	37	91	8
2773	3	91	1
2774	21	91	4
2775	23	91	5
2776	30	259	6
2777	12	259	3
2778	33	259	7
2779	11	259	2
2780	37	259	8
2781	4	259	1
2782	21	259	4
2783	23	259	5
2796	28	318	6
2797	55	318	11
2798	15	318	3
2799	34	318	7
2800	46	318	9
2801	9	318	2
2802	63	318	12
2803	41	318	8
2804	19	318	4
2805	5	318	1
2806	51	318	10
2807	26	318	5
2892	28	336	6
2893	12	336	3
2894	33	336	7
2895	10	336	2
2896	40	336	8
2897	3	336	1
2898	21	336	4
2899	26	336	5
2908	28	459	6
2909	15	459	3
2910	34	459	7
2911	9	459	2
2912	41	459	8
2913	19	459	4
2914	6	459	1
2915	22	459	5
2924	28	457	6
2925	12	457	3
2926	36	457	7
2927	10	457	2
2928	37	457	8
2929	21	457	4
2930	3	457	1
2931	26	457	5
2932	28	455	6
2933	15	455	3
2934	33	455	7
2935	9	455	2
2936	41	455	8
2937	6	455	1
2938	19	455	4
2939	26	455	5
2940	28	460	6
2941	16	460	3
2942	33	460	7
2943	10	460	2
2944	40	460	8
2945	20	460	4
2946	3	460	1
2947	26	460	5
2948	30	461	6
2949	16	461	3
2950	33	461	7
2951	11	461	2
2952	37	461	8
2953	21	461	4
2954	3	461	1
2955	26	461	5
2956	28	462	6
2957	12	462	3
2958	33	462	7
2959	10	462	2
2960	40	462	8
2961	21	462	4
2962	3	462	1
2963	26	462	5
2964	28	463	6
2965	12	463	3
2966	33	463	7
2967	10	463	2
2968	40	463	8
2969	21	463	4
2970	3	463	1
2971	26	463	5
2972	28	464	6
2973	15	464	3
2974	34	464	7
2975	9	464	2
2976	41	464	8
2977	19	464	4
2978	6	464	1
2979	22	464	5
2980	28	465	6
2981	12	465	3
2982	33	465	7
2983	10	465	2
2984	40	465	8
2985	21	465	4
2986	3	465	1
2987	26	465	5
2988	28	466	6
2989	12	466	3
2990	33	466	7
2991	10	466	2
2992	40	466	8
2993	21	466	4
2994	3	466	1
2995	26	466	5
2996	28	467	6
2997	12	467	3
2998	33	467	7
2999	10	467	2
3000	40	467	8
3001	20	467	4
3002	3	467	1
3003	23	467	5
3004	28	468	6
3005	12	468	3
3006	33	468	7
3007	10	468	2
3008	40	468	8
3009	21	468	4
3010	3	468	1
3011	26	468	5
3012	28	469	6
3013	15	469	3
3014	33	469	7
3015	10	469	2
3016	40	469	8
3017	21	469	4
3018	3	469	1
3019	26	469	5
3020	28	470	6
3021	12	470	3
3022	33	470	7
3023	10	470	2
3024	40	470	8
3025	21	470	4
3026	3	470	1
3027	26	470	5
3028	28	471	6
3029	12	471	3
3030	33	471	7
3031	10	471	2
3032	40	471	8
3033	21	471	4
3034	3	471	1
3035	26	471	5
3036	29	456	6
3037	12	456	3
3038	33	456	7
3039	10	456	2
3040	41	456	8
3041	19	456	4
3042	3	456	1
3043	23	456	5
3044	28	472	6
3045	12	472	3
3046	33	472	7
3047	11	472	2
3048	40	472	8
3049	20	472	4
3050	3	472	1
3051	23	472	5
3060	30	458	6
3061	15	458	3
3062	36	458	7
3063	10	458	2
3064	41	458	8
3065	20	458	4
3066	5	458	1
3067	23	458	5
5376	29	429	6
5377	12	429	3
5378	36	429	7
5379	9	429	2
5380	41	429	8
5381	21	429	4
5382	3	429	1
5383	26	429	5
5916	30	586	6
5917	16	586	3
5918	36	586	7
5919	10	586	2
5920	40	586	8
5921	20	586	4
5922	5	586	1
5923	22	586	5
3108	29	441	6
3109	15	441	3
3110	34	441	7
3111	9	441	2
3112	41	441	8
3113	19	441	4
3114	5	441	1
3115	26	441	5
3140	29	354	6
3141	15	354	3
3142	33	354	7
3143	9	354	2
3144	41	354	8
3145	19	354	4
3146	5	354	1
3147	26	354	5
3240	28	482	6
3241	16	482	3
3242	36	482	7
3243	9	482	2
3244	41	482	8
3245	20	482	4
3246	5	482	1
3247	26	482	5
3248	28	485	6
3249	12	485	3
3250	36	485	7
3251	9	485	2
3252	41	485	8
3253	20	485	4
3254	5	485	1
3255	26	485	5
3288	28	477	6
3289	12	477	3
3290	36	477	7
3291	9	477	2
3292	41	477	8
3293	20	477	4
3294	5	477	1
3295	26	477	5
3336	28	494	6
3337	16	494	3
3338	33	494	7
3339	10	494	2
3340	40	494	8
3341	21	494	4
3342	6	494	1
3343	23	494	5
3344	30	370	6
3345	15	370	3
3346	33	370	7
3347	11	370	2
3348	41	370	8
3349	19	370	4
3350	5	370	1
3351	26	370	5
3376	29	351	6
3377	15	351	3
3378	34	351	7
3379	10	351	2
3380	40	351	8
3381	19	351	4
3382	6	351	1
3383	26	351	5
3392	30	373	6
3393	16	373	3
3394	36	373	7
3395	9	373	2
3396	41	373	8
3397	20	373	4
3398	3	373	1
3399	26	373	5
5448	29	452	6
5449	15	452	3
5450	34	452	7
5451	9	452	2
5452	37	452	8
5453	20	452	4
5454	6	452	1
5455	26	452	5
5464	28	503	6
5465	12	503	3
5466	36	503	7
5467	11	503	2
5468	40	503	8
5469	21	503	4
5470	3	503	1
5471	23	503	5
5480	29	532	6
5481	12	532	3
5482	33	532	7
5483	11	532	2
5484	37	532	8
5485	20	532	4
5486	3	532	1
5487	23	532	5
3264	28	487	6
3265	12	487	3
3266	36	487	7
3267	9	487	2
3268	41	487	8
3269	20	487	4
3270	5	487	1
3271	26	487	5
3280	28	491	6
3281	12	491	3
3282	33	491	7
3283	10	491	2
3284	40	491	8
3285	21	491	4
3286	6	491	1
3287	26	491	5
3352	30	395	6
3353	12	395	3
3354	33	395	7
3355	9	395	2
3356	37	395	8
3357	21	395	4
3358	3	395	1
3359	23	395	5
3360	29	353	6
3361	16	353	3
3362	33	353	7
3363	10	353	2
3364	37	353	8
3365	21	353	4
3366	5	353	1
3367	23	353	5
3368	30	346	6
3369	12	346	3
3370	34	346	7
3371	11	346	2
3372	37	346	8
3373	21	346	4
3374	6	346	1
3375	23	346	5
3384	29	365	6
3385	16	365	3
3386	34	365	7
3387	9	365	2
3388	41	365	8
3389	21	365	4
3390	3	365	1
3391	26	365	5
5392	28	497	6
5393	12	497	3
5394	36	497	7
5395	11	497	2
5396	37	497	8
5397	20	497	4
5398	3	497	1
5399	23	497	5
5472	30	513	6
5473	12	513	3
5474	33	513	7
5475	10	513	2
5476	37	513	8
5477	21	513	4
5478	3	513	1
5479	26	513	5
5584	28	540	6
5585	12	540	3
5586	36	540	7
5587	11	540	2
5588	37	540	8
5589	21	540	4
5590	3	540	1
5591	23	540	5
5972	28	475	6
5973	16	475	3
5974	33	475	7
5975	9	475	2
5976	40	475	8
5977	21	475	4
5978	5	475	1
5979	26	475	5
6012	28	479	6
6013	16	479	3
6014	36	479	7
6015	9	479	2
6016	41	479	8
6017	21	479	4
6018	5	479	1
6019	26	479	5
6052	28	484	6
6053	15	484	3
6054	36	484	7
6055	9	484	2
6056	41	484	8
6057	20	484	4
6058	5	484	1
6059	23	484	5
6076	29	493	6
6077	15	493	3
6078	33	493	7
6079	9	493	2
6080	40	493	8
6081	19	493	4
6082	5	493	1
6083	26	493	5
3272	28	488	6
3273	12	488	3
3274	36	488	7
3275	9	488	2
3276	41	488	8
3277	20	488	4
3278	5	488	1
3279	26	488	5
5400	30	553	6
5401	12	553	3
5402	36	553	7
5403	11	553	2
5404	37	553	8
5405	21	553	4
5406	3	553	1
5407	23	553	5
3400	30	496	6
3401	12	496	3
3402	36	496	7
3403	11	496	2
3404	40	496	8
3405	21	496	4
3406	6	496	1
3407	23	496	5
3408	28	396	6
3409	12	396	3
3410	36	396	7
3411	9	396	2
3412	41	396	8
3413	21	396	4
3414	5	396	1
3415	26	396	5
3416	30	440	6
3417	12	440	3
3418	33	440	7
3419	9	440	2
3420	37	440	8
3421	21	440	4
3422	3	440	1
3423	26	440	5
3424	29	446	6
3425	12	446	3
3426	33	446	7
3427	11	446	2
3428	40	446	8
3429	19	446	4
3430	3	446	1
3431	23	446	5
3456	28	356	6
3457	16	356	3
3458	34	356	7
3459	11	356	2
3460	37	356	8
3461	20	356	4
3462	5	356	1
3463	23	356	5
3464	30	436	6
3465	16	436	3
3466	36	436	7
3467	9	436	2
3468	41	436	8
3469	20	436	4
3470	5	436	1
3471	26	436	5
3472	29	402	6
3473	16	402	3
3474	36	402	7
3475	10	402	2
3476	41	402	8
3477	20	402	4
3478	5	402	1
3479	22	402	5
3504	30	400	6
3505	15	400	3
3506	33	400	7
3507	9	400	2
3508	37	400	8
3509	21	400	4
3510	3	400	1
3511	23	400	5
3584	29	515	6
3585	16	515	3
3586	33	515	7
3587	10	515	2
3588	41	515	8
3589	20	515	4
3590	6	515	1
3591	26	515	5
3592	29	534	6
3593	16	534	3
3594	33	534	7
3595	10	534	2
3596	41	534	8
3597	20	534	4
3598	6	534	1
3599	26	534	5
3624	29	517	6
3625	54	517	11
3626	16	517	3
3627	33	517	7
3628	46	517	9
3629	63	517	12
3630	10	517	2
3631	41	517	8
3632	20	517	4
3633	6	517	1
3634	49	517	10
3635	26	517	5
3636	29	527	6
3637	54	527	11
3638	16	527	3
3639	33	527	7
3640	46	527	9
3641	63	527	12
3642	10	527	2
3643	37	527	8
3644	20	527	4
3645	6	527	1
3646	49	527	10
3647	26	527	5
3648	29	499	6
3649	54	499	11
3650	16	499	3
3651	33	499	7
3652	46	499	9
3653	63	499	12
3654	10	499	2
3655	37	499	8
3656	20	499	4
3657	6	499	1
3658	49	499	10
3659	26	499	5
5424	28	500	6
5425	12	500	3
5426	36	500	7
5427	11	500	2
5428	40	500	8
5429	21	500	4
5430	3	500	1
5431	23	500	5
3696	29	528	6
3697	54	528	11
3698	16	528	3
3699	33	528	7
3700	46	528	9
3701	63	528	12
3702	10	528	2
3703	41	528	8
3704	20	528	4
3705	6	528	1
3706	49	528	10
3707	26	528	5
3720	29	393	6
3721	15	393	3
3722	36	393	7
3723	9	393	2
3724	41	393	8
3725	19	393	4
3726	3	393	1
3727	23	393	5
3744	30	439	6
3745	15	439	3
3746	33	439	7
3747	11	439	2
3748	37	439	8
3749	21	439	4
3750	6	439	1
3751	26	439	5
3768	30	367	6
3769	15	367	3
3770	36	367	7
3771	11	367	2
3772	41	367	8
3773	19	367	4
3774	3	367	1
3775	23	367	5
3792	29	337	6
3793	15	337	3
3794	33	337	7
3795	11	337	2
3796	41	337	8
3797	21	337	4
3798	3	337	1
3799	23	337	5
3832	30	348	6
3833	15	348	3
3834	36	348	7
3835	11	348	2
3836	40	348	8
3837	20	348	4
3838	3	348	1
3839	26	348	5
5488	30	406	6
5489	16	406	3
5490	36	406	7
5491	10	406	2
5492	41	406	8
5493	21	406	4
5494	6	406	1
5495	26	406	5
5496	30	536	6
5497	12	536	3
5498	36	536	7
5499	11	536	2
5500	37	536	8
5501	21	536	4
5502	3	536	1
5503	26	536	5
5504	30	432	6
5505	16	432	3
5506	36	432	7
5507	10	432	2
5508	41	432	8
5509	21	432	4
5510	6	432	1
5511	26	432	5
5520	30	449	6
5521	16	449	3
5522	34	449	7
5523	10	449	2
5524	37	449	8
5525	21	449	4
5526	6	449	1
5527	23	449	5
5576	28	512	6
5577	12	512	3
5578	36	512	7
5579	11	512	2
5580	37	512	8
5581	20	512	4
5582	3	512	1
5583	23	512	5
5940	29	447	6
5941	15	447	3
5942	34	447	7
5943	10	447	2
5944	37	447	8
5945	5	447	1
5946	19	447	4
5947	22	447	5
3684	29	539	6
3685	56	539	11
3686	16	539	3
3687	33	539	7
3688	46	539	9
3689	63	539	12
3690	10	539	2
3691	41	539	8
3692	20	539	4
3693	6	539	1
3694	49	539	10
3695	26	539	5
3708	29	511	6
3709	54	511	11
3710	16	511	3
3711	33	511	7
3712	46	511	9
3713	63	511	12
3714	10	511	2
3715	41	511	8
3716	20	511	4
3717	6	511	1
3718	49	511	10
3719	26	511	5
3728	29	342	6
3729	12	342	3
3730	33	342	7
3731	11	342	2
3732	40	342	8
3733	21	342	4
3734	3	342	1
3735	22	342	5
3736	29	417	6
3737	15	417	3
3738	33	417	7
3739	10	417	2
3740	41	417	8
3741	19	417	4
3742	5	417	1
3743	22	417	5
3752	30	369	6
3753	16	369	3
3754	36	369	7
3755	10	369	2
3756	41	369	8
3757	20	369	4
3758	6	369	1
3759	22	369	5
3760	29	361	6
3761	16	361	3
3762	33	361	7
3763	11	361	2
3764	41	361	8
3765	21	361	4
3766	3	361	1
3767	22	361	5
3784	29	363	6
3785	15	363	3
3786	33	363	7
3787	11	363	2
3788	41	363	8
3789	21	363	4
3790	3	363	1
3791	23	363	5
3800	29	430	6
3801	15	430	3
3802	34	430	7
3803	10	430	2
3804	40	430	8
3805	19	430	4
3806	6	430	1
3807	23	430	5
3808	29	416	6
3809	15	416	3
3810	36	416	7
3811	9	416	2
3812	38	416	8
3813	19	416	4
3814	5	416	1
3815	26	416	5
3816	28	399	6
3817	16	399	3
3818	36	399	7
3819	9	399	2
3820	40	399	8
3821	20	399	4
3822	3	399	1
3823	22	399	5
3824	29	355	6
3825	16	355	3
3826	36	355	7
3827	11	355	2
3828	37	355	8
3829	20	355	4
3830	3	355	1
3831	26	355	5
3840	29	445	6
3841	15	445	3
3842	36	445	7
3843	11	445	2
3844	41	445	8
3845	19	445	4
3846	5	445	1
3847	22	445	5
3848	28	345	6
3849	15	345	3
3850	36	345	7
3851	11	345	2
3852	40	345	8
3853	20	345	4
3854	6	345	1
3855	22	345	5
3856	29	444	6
3857	15	444	3
3858	36	444	7
3859	10	444	2
3860	40	444	8
3861	19	444	4
3862	6	444	1
3863	26	444	5
3864	30	404	6
3865	15	404	3
3866	36	404	7
3867	10	404	2
3868	41	404	8
3869	21	404	4
3870	5	404	1
3871	26	404	5
3872	29	331	6
3873	12	331	3
3874	36	331	7
3875	11	331	2
3876	41	331	8
3877	21	331	4
3878	3	331	1
3879	22	331	5
3880	30	360	6
3881	15	360	3
3882	33	360	7
3883	9	360	2
3884	40	360	8
3885	20	360	4
3886	6	360	1
3887	23	360	5
3888	29	428	6
3889	16	428	3
3890	34	428	7
3891	10	428	2
3892	41	428	8
3893	19	428	4
3894	6	428	1
3895	26	428	5
3896	29	549	6
3897	12	549	3
3898	33	549	7
3899	11	549	2
3900	40	549	8
3901	21	549	4
3902	3	549	1
3903	22	549	5
3904	30	433	6
3905	12	433	3
3906	33	433	7
3907	9	433	2
3908	37	433	8
3909	19	433	4
3910	3	433	1
3911	26	433	5
3912	30	397	6
3913	12	397	3
3914	33	397	7
3915	11	397	2
3916	41	397	8
3917	20	397	4
3918	3	397	1
3919	23	397	5
3920	29	343	6
3921	12	343	3
3922	33	343	7
3923	7	343	2
3924	40	343	8
3925	21	343	4
3926	3	343	1
3927	23	343	5
3928	29	438	6
3929	12	438	3
3930	33	438	7
3931	9	438	2
3932	41	438	8
3933	21	438	4
3934	3	438	1
3935	26	438	5
3968	29	412	6
3969	15	412	3
3970	33	412	7
3971	11	412	2
3972	40	412	8
3973	21	412	4
3974	3	412	1
3975	22	412	5
3984	28	388	6
3985	12	388	3
3986	33	388	7
3987	9	388	2
3988	37	388	8
3989	20	388	4
3990	4	388	1
3991	23	388	5
3992	29	410	6
3993	15	410	3
3994	33	410	7
3995	10	410	2
3996	41	410	8
3997	20	410	4
3998	5	410	1
3999	22	410	5
4008	30	362	6
4009	12	362	3
4010	36	362	7
4011	11	362	2
4012	37	362	8
4013	21	362	4
4014	3	362	1
4015	23	362	5
4024	29	381	6
4025	15	381	3
4026	33	381	7
4027	9	381	2
4028	41	381	8
4029	19	381	4
4030	5	381	1
4031	26	381	5
4032	29	414	6
4033	12	414	3
4034	33	414	7
4035	11	414	2
4036	40	414	8
4037	21	414	4
4038	3	414	1
4039	22	414	5
4052	30	426	6
4053	12	426	3
4054	36	426	7
4055	11	426	2
4056	41	426	8
4057	21	426	4
4058	3	426	1
4059	23	426	5
4060	29	411	6
4061	12	411	3
4062	33	411	7
4063	11	411	2
4064	40	411	8
4065	21	411	4
4066	3	411	1
4067	22	411	5
4068	29	425	6
4069	12	425	3
4070	33	425	7
4071	11	425	2
4072	40	425	8
4073	21	425	4
4074	3	425	1
4075	22	425	5
4084	29	376	6
4085	12	376	3
4086	33	376	7
4087	11	376	2
4088	40	376	8
4089	21	376	4
4090	3	376	1
4091	22	376	5
4108	29	386	6
4109	12	386	3
4110	33	386	7
4111	11	386	2
4112	40	386	8
4113	21	386	4
4114	3	386	1
4115	22	386	5
4116	29	338	6
4117	12	338	3
4118	33	338	7
4119	11	338	2
4120	40	338	8
4121	21	338	4
4122	3	338	1
4123	22	338	5
5676	28	522	6
5677	12	522	3
5678	36	522	7
5679	11	522	2
5680	37	522	8
5681	20	522	4
5682	3	522	1
5683	23	522	5
5684	29	584	6
5685	15	584	3
5686	33	584	7
5687	11	584	2
5688	37	584	8
5689	21	584	4
5690	5	584	1
5691	26	584	5
5700	28	585	6
5701	15	585	3
5702	33	585	7
5703	11	585	2
5704	37	585	8
5705	21	585	4
5706	5	585	1
5707	23	585	5
5708	30	387	6
5709	15	387	3
5710	36	387	7
5711	11	387	2
5712	40	387	8
5713	21	387	4
5714	3	387	1
5715	26	387	5
5716	30	450	6
5717	16	450	3
5718	34	450	7
5719	10	450	2
5720	37	450	8
5721	21	450	4
5722	6	450	1
5723	23	450	5
5740	30	443	6
5741	16	443	3
5742	33	443	7
5743	11	443	2
5744	41	443	8
5745	21	443	4
5746	3	443	1
5747	23	443	5
5748	30	451	6
5749	12	451	3
5750	36	451	7
5751	11	451	2
5752	37	451	8
5753	21	451	4
5754	3	451	1
5755	23	451	5
6028	28	481	6
6029	16	481	3
6030	36	481	7
6031	9	481	2
6032	41	481	8
6033	21	481	4
6034	5	481	1
6035	26	481	5
3936	29	341	6
3937	12	341	3
3938	33	341	7
3939	11	341	2
3940	41	341	8
3941	21	341	4
3942	3	341	1
3943	22	341	5
3944	29	394	6
3945	15	394	3
3946	33	394	7
3947	9	394	2
3948	41	394	8
3949	19	394	4
3950	6	394	1
3951	26	394	5
3952	28	405	6
3953	16	405	3
3954	36	405	7
3955	9	405	2
3956	40	405	8
3957	21	405	4
3958	5	405	1
3959	22	405	5
3960	30	384	6
3961	16	384	3
3962	33	384	7
3963	11	384	2
3964	41	384	8
3965	21	384	4
3966	6	384	1
3967	22	384	5
3976	29	359	6
3977	12	359	3
3978	34	359	7
3979	9	359	2
3980	37	359	8
3981	20	359	4
3982	3	359	1
3983	23	359	5
4000	29	375	6
4001	15	375	3
4002	33	375	7
4003	10	375	2
4004	41	375	8
4005	20	375	4
4006	3	375	1
4007	26	375	5
4016	29	427	6
4017	16	427	3
4018	36	427	7
4019	10	427	2
4020	41	427	8
4021	21	427	4
4022	3	427	1
4023	26	427	5
4076	30	422	6
4077	15	422	3
4078	33	422	7
4079	9	422	2
4080	41	422	8
4081	20	422	4
4082	5	422	1
4083	23	422	5
4092	29	403	6
4093	16	403	3
4094	33	403	7
4095	9	403	2
4096	41	403	8
4097	21	403	4
4098	5	403	1
4099	22	403	5
4140	29	437	6
4141	12	437	3
4142	33	437	7
4143	11	437	2
4144	40	437	8
4145	21	437	4
4146	3	437	1
4147	22	437	5
4148	29	421	6
4149	12	421	3
4150	33	421	7
4151	11	421	2
4152	40	421	8
4153	21	421	4
4154	3	421	1
4155	22	421	5
4156	29	546	6
4157	12	546	3
4158	36	546	7
4159	11	546	2
4160	40	546	8
4161	21	546	4
4162	3	546	1
4163	23	546	5
4164	30	378	6
4165	12	378	3
4166	33	378	7
4167	9	378	2
4168	37	378	8
4169	21	378	4
4170	3	378	1
4171	23	378	5
4196	28	533	6
4197	16	533	3
4198	33	533	7
4199	10	533	2
4200	40	533	8
4201	21	533	4
4202	6	533	1
4203	23	533	5
4212	28	509	6
4213	12	509	3
4214	33	509	7
4215	10	509	2
4216	40	509	8
4217	20	509	4
4218	6	509	1
4219	23	509	5
4220	28	547	6
4221	16	547	3
4222	33	547	7
4223	10	547	2
4224	40	547	8
4225	21	547	4
4226	6	547	1
4227	23	547	5
4228	28	548	6
4229	16	548	3
4230	33	548	7
4231	10	548	2
4232	40	548	8
4233	21	548	4
4234	6	548	1
4235	23	548	5
4236	28	545	6
4237	16	545	3
4238	33	545	7
4239	10	545	2
4240	40	545	8
4241	21	545	4
4242	6	545	1
4243	23	545	5
4260	28	506	6
4261	16	506	3
4262	33	506	7
4263	10	506	2
4264	40	506	8
4265	21	506	4
4266	6	506	1
4267	23	506	5
4268	28	526	6
4269	16	526	3
4270	33	526	7
4271	10	526	2
4272	40	526	8
4273	21	526	4
4274	6	526	1
4275	23	526	5
4276	28	504	6
4277	16	504	3
4278	33	504	7
4279	10	504	2
4280	40	504	8
4281	21	504	4
4282	6	504	1
4283	23	504	5
5600	28	544	6
5601	12	544	3
5602	36	544	7
5603	11	544	2
5604	37	544	8
5605	21	544	4
5606	3	544	1
5607	23	544	5
5616	30	538	6
5617	12	538	3
5618	36	538	7
5619	10	538	2
5620	37	538	8
5621	21	538	4
5622	3	538	1
5623	26	538	5
5660	30	453	6
5661	16	453	3
5662	33	453	7
5663	11	453	2
5664	37	453	8
5665	21	453	4
5666	5	453	1
5667	23	453	5
5724	28	505	6
5725	12	505	3
5726	33	505	7
5727	11	505	2
5728	37	505	8
5729	21	505	4
5730	3	505	1
5731	23	505	5
5772	28	524	6
5773	12	524	3
5774	36	524	7
5775	11	524	2
5776	37	524	8
5777	21	524	4
5778	6	524	1
5779	23	524	5
5956	29	420	6
5957	16	420	3
5958	33	420	7
5959	10	420	2
5960	37	420	8
5961	5	420	1
5962	21	420	4
5963	22	420	5
6004	28	476	6
6005	16	476	3
6006	33	476	7
6007	9	476	2
6008	41	476	8
6009	20	476	4
6010	5	476	1
6011	23	476	5
6020	28	480	6
6021	16	480	3
6022	36	480	7
6023	9	480	2
6024	41	480	8
6025	21	480	4
6026	5	480	1
6027	26	480	5
6060	28	486	6
6061	15	486	3
6062	36	486	7
6063	9	486	2
6064	41	486	8
6065	20	486	4
6066	5	486	1
6067	23	486	5
5648	29	583	6
5649	56	583	11
5650	12	583	3
5651	34	583	7
5652	46	583	9
5653	63	583	12
5654	10	583	2
5655	40	583	8
5656	21	583	4
5657	5	583	1
5658	51	583	10
5659	23	583	5
5764	28	535	6
5765	12	535	3
5766	36	535	7
5767	11	535	2
4344	28	516	6
4345	54	516	11
4346	16	516	3
4347	33	516	7
4348	46	516	9
4349	60	516	12
4350	10	516	2
4351	41	516	8
4352	21	516	4
4353	6	516	1
4354	49	516	10
4355	26	516	5
5768	37	535	8
5769	21	535	4
5770	3	535	1
5771	23	535	5
4380	28	521	6
4381	16	521	3
4382	36	521	7
4383	10	521	2
4384	40	521	8
4385	20	521	4
4386	6	521	1
4387	26	521	5
6068	28	492	6
6069	16	492	3
6070	33	492	7
6071	9	492	2
6072	40	492	8
6073	20	492	4
6074	5	492	1
6075	26	492	5
4388	28	542	6
4389	16	542	3
4390	33	542	7
4391	10	542	2
4392	40	542	8
4393	21	542	4
4394	6	542	1
4395	23	542	5
4404	28	507	6
4405	16	507	3
4406	33	507	7
4407	10	507	2
4408	40	507	8
4409	21	507	4
4410	6	507	1
4411	23	507	5
4412	28	514	6
4413	16	514	3
4414	33	514	7
4415	10	514	2
4416	40	514	8
4417	21	514	4
4418	6	514	1
4419	23	514	5
4428	30	382	6
4429	16	382	3
4430	36	382	7
4431	10	382	2
4432	41	382	8
4433	21	382	4
4434	5	382	1
4435	26	382	5
4444	30	377	6
4445	15	377	3
4446	36	377	7
4447	10	377	2
4448	40	377	8
4449	20	377	4
4450	5	377	1
4451	23	377	5
4452	28	555	6
4453	16	555	3
4454	36	555	7
4455	10	555	2
4456	41	555	8
4457	20	555	4
4458	6	555	1
4459	26	555	5
4460	29	379	6
4461	15	379	3
4462	36	379	7
4463	10	379	2
4464	41	379	8
4465	19	379	4
4466	5	379	1
4467	22	379	5
4468	28	364	6
4469	56	364	11
4470	15	364	3
4471	36	364	7
4472	46	364	9
4473	60	364	12
4474	9	364	2
4475	41	364	8
4476	19	364	4
4477	6	364	1
4478	47	364	10
4479	22	364	5
4480	29	372	6
4481	16	372	3
4482	36	372	7
4483	10	372	2
4484	41	372	8
4485	20	372	4
4486	5	372	1
4487	26	372	5
4488	30	413	6
4489	56	413	11
4490	15	413	3
4491	36	413	7
4492	46	413	9
4493	62	413	12
4494	10	413	2
4495	40	413	8
4496	20	413	4
4497	6	413	1
4498	51	413	10
4499	26	413	5
4500	30	554	6
4501	12	554	3
4502	33	554	7
4503	10	554	2
4504	40	554	8
4505	20	554	4
4506	6	554	1
4507	26	554	5
4508	28	350	6
4509	15	350	3
4510	33	350	7
4511	11	350	2
4512	41	350	8
4513	19	350	4
4514	5	350	1
4515	26	350	5
4516	29	418	6
4517	12	418	3
4518	36	418	7
4519	10	418	2
4520	41	418	8
4521	20	418	4
4522	6	418	1
4523	22	418	5
4532	29	423	6
4533	12	423	3
4534	33	423	7
4535	11	423	2
4536	40	423	8
4537	21	423	4
4538	3	423	1
4539	22	423	5
4540	30	380	6
4541	16	380	3
4542	36	380	7
4543	11	380	2
4544	37	380	8
4545	20	380	4
4546	3	380	1
4547	26	380	5
4564	29	556	6
4565	16	556	3
4566	33	556	7
4567	10	556	2
4568	41	556	8
4569	20	556	4
4570	5	556	1
4571	22	556	5
4572	29	557	6
4573	12	557	3
4574	34	557	7
4575	9	557	2
4576	37	557	8
4577	21	557	4
4578	5	557	1
4579	26	557	5
4580	29	335	6
4581	12	335	3
4582	34	335	7
4583	11	335	2
4584	40	335	8
4585	21	335	4
4586	3	335	1
4587	23	335	5
4588	29	407	6
4589	12	407	3
4590	34	407	7
4591	11	407	2
4592	40	407	8
4593	21	407	4
4594	3	407	1
4595	23	407	5
4604	29	558	6
4605	15	558	3
4606	34	558	7
4607	11	558	2
4608	37	558	8
4609	20	558	4
4610	3	558	1
4611	23	558	5
4628	30	401	6
4629	12	401	3
4630	36	401	7
4631	11	401	2
4632	41	401	8
4633	21	401	4
4634	3	401	1
4635	26	401	5
5836	29	582	6
5837	15	582	3
5838	34	582	7
5839	11	582	2
5840	40	582	8
5841	21	582	4
5842	6	582	1
5843	26	582	5
5844	28	502	6
5845	12	502	3
5846	33	502	7
5847	11	502	2
5848	37	502	8
5849	21	502	4
5850	3	502	1
5851	23	502	5
6116	28	483	6
6117	16	483	3
6118	36	483	7
6119	9	483	2
6120	41	483	8
6121	20	483	4
6122	5	483	1
6123	26	483	5
6132	30	587	6
6133	12	587	3
6134	36	587	7
6135	11	587	2
6136	37	587	8
6137	21	587	4
6138	3	587	1
6139	23	587	5
6164	29	567	6
6165	16	567	3
6166	36	567	7
6167	10	567	2
6168	40	567	8
6169	21	567	4
6170	3	567	1
6171	22	567	5
6188	30	572	6
6189	12	572	3
6190	33	572	7
6191	11	572	2
6192	37	572	8
6193	21	572	4
6194	3	572	1
6195	23	572	5
6344	29	352	6
6345	15	352	3
6346	33	352	7
6347	11	352	2
6348	41	352	8
6349	21	352	4
6350	3	352	1
6351	22	352	5
6476	29	607	6
6477	12	607	3
6478	33	607	7
6479	11	607	2
6480	41	607	8
6481	3	607	1
6482	21	607	4
6483	23	607	5
6484	28	608	6
6485	12	608	3
6486	33	608	7
6487	9	608	2
6488	40	608	8
6489	21	608	4
6490	3	608	1
6491	22	608	5
6492	29	389	6
6493	15	389	3
6494	36	389	7
6495	9	389	2
6496	41	389	8
6497	19	389	4
6498	5	389	1
6499	22	389	5
6500	29	564	6
6501	15	564	3
6502	36	564	7
6503	9	564	2
6504	41	564	8
6505	19	564	4
6506	5	564	1
6507	22	564	5
6508	30	609	6
6509	16	609	3
6510	34	609	7
6511	9	609	2
6512	40	609	8
6513	3	609	1
6514	21	609	4
6515	26	609	5
4596	29	339	6
4597	12	339	3
4598	34	339	7
4599	11	339	2
4600	40	339	8
4601	21	339	4
4602	3	339	1
4603	23	339	5
4612	30	398	6
4613	15	398	3
4614	33	398	7
4615	9	398	2
4616	37	398	8
4617	20	398	4
4618	5	398	1
4619	23	398	5
4636	29	368	6
4637	15	368	3
4638	36	368	7
4639	9	368	2
4640	40	368	8
4641	21	368	4
4642	5	368	1
4643	23	368	5
4644	29	340	6
4645	15	340	3
4646	33	340	7
4647	9	340	2
4648	41	340	8
4649	19	340	4
4650	5	340	1
4651	26	340	5
4660	29	358	6
4661	12	358	3
4662	33	358	7
4663	11	358	2
4664	41	358	8
4665	21	358	4
4666	3	358	1
4667	22	358	5
5804	30	431	6
5805	16	431	3
5806	36	431	7
5807	11	431	2
5808	41	431	8
5809	20	431	4
5810	3	431	1
5811	26	431	5
4708	28	490	6
4709	54	490	11
4710	15	490	3
4711	36	490	7
4712	44	490	9
4713	60	490	12
4714	10	490	2
4715	40	490	8
4716	21	490	4
4717	6	490	1
4718	49	490	10
4719	23	490	5
6328	29	599	6
6329	12	599	3
6330	36	599	7
6331	10	599	2
6332	37	599	8
6333	5	599	1
6334	21	599	4
6335	23	599	5
6360	30	600	6
6361	16	600	3
6362	36	600	7
6363	10	600	2
6364	40	600	8
6365	20	600	4
6366	5	600	1
6367	22	600	5
6368	30	601	6
6369	16	601	3
6370	36	601	7
6371	10	601	2
6372	40	601	8
6373	20	601	4
6374	5	601	1
6375	22	601	5
6388	29	602	6
6389	56	602	11
6390	15	602	3
6391	34	602	7
6392	46	602	9
6393	62	602	12
6394	10	602	2
6395	37	602	8
6396	20	602	4
6397	5	602	1
6398	51	602	10
6399	26	602	5
6524	30	498	6
6525	12	498	3
6526	36	498	7
6527	11	498	2
6528	37	498	8
6529	3	498	1
6530	21	498	4
6531	26	498	5
4620	29	374	6
4621	12	374	3
4622	33	374	7
4623	11	374	2
4624	40	374	8
4625	21	374	4
4626	3	374	1
4627	22	374	5
4692	29	415	6
4693	12	415	3
4694	33	415	7
4695	11	415	2
4696	41	415	8
4697	21	415	4
4698	3	415	1
4699	22	415	5
4720	28	409	6
4721	15	409	3
4722	36	409	7
4723	11	409	2
4724	41	409	8
4725	21	409	4
4726	5	409	1
4727	23	409	5
4752	28	508	6
4753	16	508	3
4754	33	508	7
4755	10	508	2
4756	40	508	8
4757	21	508	4
4758	6	508	1
4759	23	508	5
4776	28	510	6
4777	16	510	3
4778	33	510	7
4779	10	510	2
4780	37	510	8
4781	21	510	4
4782	3	510	1
4783	26	510	5
4792	28	561	6
4793	12	561	3
4794	33	561	7
4795	11	561	2
4796	37	561	8
4797	21	561	4
4798	6	561	1
4799	23	561	5
4800	29	560	6
4801	12	560	3
4802	34	560	7
4803	10	560	2
4804	37	560	8
4805	21	560	4
4806	6	560	1
4807	26	560	5
4808	30	448	6
4809	12	448	3
4810	36	448	7
4811	11	448	2
4812	37	448	8
4813	21	448	4
4814	3	448	1
4815	23	448	5
4816	30	347	6
4817	16	347	3
4818	33	347	7
4819	10	347	2
4820	37	347	8
4821	19	347	4
4822	6	347	1
4823	26	347	5
4832	28	518	6
4833	16	518	3
4834	36	518	7
4835	11	518	2
4836	37	518	8
4837	20	518	4
4838	6	518	1
4839	26	518	5
4848	29	519	6
4849	16	519	3
4850	36	519	7
4851	11	519	2
4852	37	519	8
4853	20	519	4
4854	3	519	1
4855	26	519	5
4856	29	442	6
4857	12	442	3
4858	36	442	7
4859	10	442	2
4860	40	442	8
4861	21	442	4
4862	3	442	1
4863	26	442	5
4864	28	541	6
4865	12	541	3
4866	36	541	7
4867	10	541	2
4868	41	541	8
4869	20	541	4
4870	6	541	1
4871	26	541	5
4872	28	520	6
4873	12	520	3
4874	36	520	7
4875	10	520	2
4876	41	520	8
4877	20	520	4
4878	6	520	1
4879	26	520	5
4880	28	543	6
4881	12	543	3
4882	36	543	7
4883	10	543	2
4884	41	543	8
4885	20	543	4
4886	6	543	1
4887	26	543	5
4912	30	366	6
4913	12	366	3
4914	36	366	7
4915	9	366	2
4916	41	366	8
4917	20	366	4
4918	5	366	1
4919	23	366	5
4936	28	525	6
4937	16	525	3
4938	36	525	7
4939	11	525	2
5796	28	501	6
5797	12	501	3
5798	33	501	7
4976	29	434	6
4977	12	434	3
4978	33	434	7
4979	11	434	2
4980	40	434	8
4981	21	434	4
4982	3	434	1
4983	22	434	5
5008	28	537	6
5009	16	537	3
5010	36	537	7
5011	11	537	2
5012	37	537	8
5013	21	537	4
5014	6	537	1
5015	26	537	5
5799	11	501	2
5800	37	501	8
5801	3	501	1
5802	21	501	4
5803	23	501	5
6140	30	588	6
6141	12	588	3
6142	36	588	7
6143	11	588	2
6144	37	588	8
6145	21	588	4
6146	3	588	1
6147	23	588	5
6148	28	489	6
6149	15	489	3
6150	33	489	7
6151	9	489	2
6152	40	489	8
6153	20	489	4
6154	6	489	1
6155	23	489	5
6352	30	392	6
6353	12	392	3
6354	33	392	7
6355	9	392	2
6356	41	392	8
6357	21	392	4
6358	3	392	1
6359	23	392	5
4944	30	562	6
4945	16	562	3
4946	33	562	7
4947	11	562	2
4948	41	562	8
4949	21	562	4
4950	6	562	1
4951	22	562	5
5852	28	523	6
5853	12	523	3
5854	36	523	7
5855	11	523	2
5856	40	523	8
5857	21	523	4
5858	3	523	1
5859	23	523	5
6156	30	551	6
6157	16	551	3
6158	33	551	7
6159	9	551	2
6160	41	551	8
6161	5	551	1
6162	21	551	4
6163	26	551	5
5024	28	529	6
5025	16	529	3
5026	36	529	7
5027	10	529	2
5028	37	529	8
5029	20	529	4
5030	6	529	1
5031	26	529	5
6180	29	569	6
6181	16	569	3
6182	36	569	7
6183	10	569	2
6184	40	569	8
6185	21	569	4
6186	3	569	1
6187	22	569	5
6216	30	590	6
6217	16	590	3
6218	34	590	7
6219	9	590	2
6220	40	590	8
6221	21	590	4
6222	3	590	1
6223	26	590	5
6416	28	603	6
6417	15	603	3
6418	33	603	7
6419	10	603	2
6420	37	603	8
6421	19	603	4
6422	5	603	1
6423	26	603	5
6424	29	604	6
6425	55	604	11
6426	15	604	3
6427	34	604	7
6428	43	604	9
6429	60	604	12
6430	10	604	2
6431	41	604	8
6432	19	604	4
6433	6	604	1
6434	49	604	10
6435	22	604	5
4940	37	525	8
4941	21	525	4
4942	6	525	1
4943	26	525	5
4952	28	390	6
4953	16	390	3
4954	36	390	7
4955	11	390	2
4956	41	390	8
4957	20	390	4
4958	5	390	1
4959	23	390	5
4984	30	563	6
4985	16	563	3
4986	36	563	7
4987	9	563	2
4988	40	563	8
4989	21	563	4
4990	6	563	1
4991	22	563	5
4992	29	357	6
4993	16	357	3
4994	36	357	7
4995	9	357	2
4996	41	357	8
4997	20	357	4
4998	6	357	1
4999	22	357	5
5032	28	383	6
5033	16	383	3
5034	36	383	7
5035	9	383	2
5036	41	383	8
5037	21	383	4
5038	5	383	1
5039	22	383	5
5040	28	531	6
5041	12	531	3
5042	36	531	7
5043	10	531	2
5044	37	531	8
5045	21	531	4
5046	6	531	1
5047	26	531	5
5056	28	530	6
5057	12	530	3
5058	36	530	7
5059	10	530	2
5060	37	530	8
5061	21	530	4
5062	6	530	1
5063	26	530	5
5080	29	424	6
5081	16	424	3
5082	34	424	7
5083	9	424	2
5084	41	424	8
5085	20	424	4
5086	3	424	1
5087	26	424	5
5088	28	391	6
5089	16	391	3
5090	36	391	7
5091	11	391	2
5092	41	391	8
5093	21	391	4
5094	6	391	1
5095	26	391	5
5112	30	435	6
5113	16	435	3
5114	36	435	7
5115	10	435	2
5116	41	435	8
5117	19	435	4
5118	6	435	1
5119	26	435	5
5120	29	565	6
5121	12	565	3
5122	36	565	7
5123	11	565	2
5124	37	565	8
5125	21	565	4
5126	3	565	1
5127	23	565	5
5208	29	333	6
5209	55	333	11
5210	12	333	3
5211	33	333	7
5212	44	333	9
5213	63	333	12
5214	10	333	2
5215	41	333	8
5216	20	333	4
5217	6	333	1
5218	51	333	10
5219	22	333	5
5220	29	575	6
5221	12	575	3
5222	34	575	7
5223	9	575	2
5224	41	575	8
5225	21	575	4
5226	6	575	1
5227	26	575	5
5860	30	574	6
5861	12	574	3
5862	33	574	7
5863	11	574	2
5864	37	574	8
5865	3	574	1
5866	21	574	4
5867	23	574	5
6172	29	568	6
6173	16	568	3
6174	36	568	7
6175	10	568	2
6176	40	568	8
6177	3	568	1
6178	21	568	4
6179	22	568	5
6196	29	589	6
6197	15	589	3
6198	33	589	7
6199	11	589	2
6200	40	589	8
6201	21	589	4
6202	3	589	1
6203	23	589	5
6468	29	606	6
6469	15	606	3
6470	34	606	7
6471	9	606	2
6472	40	606	8
6473	20	606	4
6474	6	606	1
6475	22	606	5
5868	30	570	6
5869	12	570	3
5870	33	570	7
5871	11	570	2
5872	37	570	8
5873	3	570	1
5874	21	570	4
5875	23	570	5
5272	29	577	6
5273	12	577	3
5274	33	577	7
5275	11	577	2
5276	40	577	8
5277	21	577	4
5278	3	577	1
5279	26	577	5
5288	29	578	6
5289	15	578	3
5290	33	578	7
5291	10	578	2
5292	41	578	8
5293	20	578	4
5294	5	578	1
5295	26	578	5
5296	29	559	6
5297	16	559	3
5298	36	559	7
5299	11	559	2
5300	41	559	8
5301	20	559	4
5302	5	559	1
5303	22	559	5
5304	29	579	6
5305	12	579	3
5306	33	579	7
5307	10	579	2
5308	37	579	8
5309	20	579	4
5310	3	579	1
5311	23	579	5
6204	28	576	6
6205	54	576	11
6206	15	576	3
6207	33	576	7
6208	44	576	9
6209	9	576	2
6210	63	576	12
6211	40	576	8
6212	19	576	4
6213	3	576	1
6214	49	576	10
6215	22	576	5
6240	29	571	6
6241	16	571	3
6242	36	571	7
6243	10	571	2
6244	40	571	8
6245	21	571	4
6246	3	571	1
6247	22	571	5
6312	29	598	6
6313	15	598	3
6314	36	598	7
6315	11	598	2
6316	41	598	8
6317	20	598	4
6318	3	598	1
6319	22	598	5
6436	28	605	6
6437	16	605	3
6438	36	605	7
6439	9	605	2
6440	37	605	8
6441	21	605	4
6442	3	605	1
6443	26	605	5
5248	30	473	6
5249	12	473	3
5250	33	473	7
5251	11	473	2
5252	41	473	8
5253	21	473	4
5254	3	473	1
5255	23	473	5
5876	30	573	6
5877	12	573	3
5878	33	573	7
5879	11	573	2
5880	37	573	8
5881	3	573	1
5882	21	573	4
5883	23	573	5
5312	30	408	6
5313	12	408	3
5314	36	408	7
5315	11	408	2
5316	41	408	8
5317	21	408	4
5318	3	408	1
5319	23	408	5
5328	30	349	6
5329	16	349	3
5330	36	349	7
5331	11	349	2
5332	40	349	8
5333	21	349	4
5334	3	349	1
5335	23	349	5
6224	29	591	6
6225	12	591	3
6226	36	591	7
6227	11	591	2
6228	41	591	8
6229	21	591	4
6230	3	591	1
6231	26	591	5
6256	29	595	6
6257	16	595	3
6258	33	595	7
6259	9	595	2
6260	40	595	8
6261	19	595	4
6262	3	595	1
6263	26	595	5
6296	29	594	6
6297	16	594	3
6298	36	594	7
6299	11	594	2
6300	40	594	8
6301	21	594	4
6302	3	594	1
6303	22	594	5
6304	30	592	6
6305	15	592	3
6306	36	592	7
6307	11	592	2
6308	41	592	8
6309	20	592	4
6310	4	592	1
6311	22	592	5
\.


--
-- Name: detalle_respuestas_co_detalle_respuestas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_respuestas_co_detalle_respuestas_seq', 6531, true);


--
-- Data for Name: estado_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado_evaluacion (id_estado_evaluacion, nb_estado_evaluacion) FROM stdin;
2	ANULADA
3	ELIMINADA
7	APELACION
11	BLOQUEADA
10	EVALUACION CREADA
5	EVALUACIÓN EN PROCESO DEL EVALUADOR
6	EVALUACIÓN APROBADA Y FINALIZADA
9	EVALUACION POR ESPERA DE APROBACION DE RRHH
\.


--
-- Name: estado_evaluacion_id_estado_evaluacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_evaluacion_id_estado_evaluacion_seq', 7, true);


--
-- Data for Name: evaluacion_general; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY evaluacion_general (id_evaluacion_general, fe_inicio_evaluacion, total_evaluacion, estado, periodo, dependencia, ubicacion_fisica, id_evaluador, id_evaluado, id_rango, notificacion, bloqueada) FROM stdin;
111	2013-07-08	60	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	445	3	f	f
109	2013-07-08	60	6	2	OFICINA DE SEGURIDAD INTEGRAL	AREA DE SERVICIOS GENERALES	458	474	3	f	f
126	2013-07-08	77.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	493	4	f	f
128	2013-07-08	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	488	3	f	f
129	2013-07-08	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	486	3	f	f
127	2013-07-08	85	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	503	4	f	f
130	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	460	3	f	f
100	2013-07-08	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	487	3	f	f
125	2013-07-08	77.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	494	4	f	f
83	2013-07-01	70	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE ATENCIÓN AL CIUDADANO	136	384	4	f	f
132	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	466	3	f	f
87	2013-07-03	72.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	94	388	4	f	f
89	2013-07-03	72.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	94	389	4	f	f
85	2013-07-03	67.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	94	391	3	f	f
119	2013-07-08	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	449	3	f	f
99	2013-07-08	82.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	438	4	f	f
123	2013-07-08	60	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	453	3	f	f
82	2013-07-01	72.5	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE ATENCIÓN AL CIUDADANO	136	382	4	f	f
80	2013-07-01	65	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE ATENCIÓN AL CIUDADANO	136	380	3	f	f
78	2013-07-01	62.5	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE ATENCIÓN AL CIUDADANO	136	379	3	f	f
81	2013-07-01	65	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE ATENCIÓN AL CIUDADANO 	136	381	3	f	f
90	2013-07-04	75	6	2	DIRECCION DEL DESPACHO	AREA DE SERVICIOS GENERALES	455	359	4	f	f
121	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	448	3	f	f
77	2013-07-01	65	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	90	351	3	f	f
133	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	444	3	f	f
131	2013-07-08	57.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	AREA DE SERVICIOS GENERALES	458	476	3	f	f
95	2013-07-08	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	AREA DE SERVICIOS GENERALES	458	475	4	f	f
101	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	477	3	f	f
136	2013-07-08	60	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	462	3	f	f
104	2013-07-08	57.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	461	3	f	f
86	2013-07-03	82.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	AREA DE SERVICIOS GENERALES	132	393	4	f	f
134	2013-07-08	55	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	457	3	f	f
108	2013-07-08	72.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	AREA DE SERVICIOS GENERALES	458	478	4	f	f
94	2013-07-08	75	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	473	4	f	f
102	2013-07-08	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	418	3	f	f
107	2013-07-08	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	469	4	f	f
137	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	454	3	f	f
298	2013-07-16	77.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	90	570	4	f	f
174	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	AREA DE SERVICIOS GENERALES	458	479	3	f	f
214	2013-07-09	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	543	3	f	f
239	2013-07-10	65	6	2	OFICINA DE GESTION ADMINISTRATIVA	Sotano 02	460	411	3	f	f
165	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	459	3	f	f
91	2013-07-04	67.5	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE SERVICIOS GENERALES	114	375	3	f	f
150	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	455	3	f	f
171	2013-07-08	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	467	4	f	f
213	2013-07-09	72.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	551	4	f	f
296	2013-07-16	65	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	90	568	3	f	f
275	2013-07-15	71	6	2	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	OFICINA DE GESTION ADMINISTRATIVA	464	576	4	f	f
229	2013-07-09	77.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	526	4	f	f
161	2013-07-08	85	6	2	OFICINA DE GESTION ADMINISTRATIVA	Jardineria	461	422	4	f	f
270	2013-07-13	72.5	6	2	CONSULTORIA JURIDICA	OFICINA DE GESTION ADMINISTRATIVA	163	355	4	f	f
158	2013-07-08	57.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	Sotano 2	461	417	3	f	f
140	2013-07-08	65	6	2	DESPACHO DEL MINISTRO	OFICINA DE GESTION ADMINISTRATIVA	457	396	3	f	f
151	2013-07-08	77.5	6	2	DESPACHO DEL MINISTRO	OFICINA DE GESTION ADMINISTRATIVA	457	394	4	f	f
227	2013-07-09	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	544	3	f	f
170	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	481	3	f	f
155	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	468	3	f	f
169	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	463	3	f	f
167	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	456	3	f	f
164	2013-07-08	67.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	Sotano 2 Plomeria	461	415	3	f	f
147	2013-07-08	95	6	2	DESPACHO DEL MINISTRO	OFICINA DE GESTION ADMINISTRATIVA	457	395	5	f	f
112	2013-07-08	82.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	482	4	f	f
234	2013-07-09	67.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	485	3	f	f
252	2013-07-10	72.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	435	4	f	f
156	2013-07-08	70	6	2	DESPACHO DEL MINISTRO	OFICINA DE GESTION ADMINISTRATIVA	457	402	4	f	f
157	2013-07-08	60	6	2	DESPACHO DEL MINISTRO	OFICINA DE GESTION ADMINISTRATIVA	457	401	3	f	f
208	2013-07-09	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	535	4	f	f
237	2013-07-09	75	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE SERVICIOS GENERALES	88	500	4	f	f
217	2013-07-09	85	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	514	4	f	f
145	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	458	3	f	f
230	2013-07-09	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	518	4	f	f
162	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	451	3	f	f
233	2013-07-09	77.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	542	4	f	f
261	2013-07-10	75	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	437	4	f	f
258	2013-07-10	70	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	441	4	f	f
272	2013-07-15	75	6	2	DIRECCION DEL DESPACHO	AREA DE SERVICIOS GENERALES	113	360	4	f	f
195	2013-07-09	75	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	456	540	4	f	f
210	2013-07-09	73	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	511	4	f	f
266	2013-07-12	62.5	6	2	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	AREA DE COMUNICACION E INFORMACION	106	573	3	f	f
264	2013-07-11	52.5	6	2	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	OFICINA DE GESTION ADMINISTRATIVA	161	387	2	f	f
152	2013-07-08	62.5	6	2	DESPACHO DEL MINISTRO	AREA DE COMPRAS	457	398	3	f	f
265	2013-07-12	87.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	89	566	5	f	f
221	2013-07-09	75	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	537	4	f	f
310	2013-07-16	90	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	585	5	f	f
291	2013-07-15	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	577	4	f	f
79	2013-07-01	70	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE ATENCIÓN AL CIUDADANO 	136	378	4	f	f
245	2013-07-10	60	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE GESTION ADMINISTRATIVA	136	385	3	f	f
263	2013-07-11	74	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	567	4	f	f
299	2013-07-16	72.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	90	571	4	f	f
168	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	420	3	f	f
146	2013-07-08	77.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	Sotano 2 Plomeria	461	414	4	f	f
141	2013-07-08	72.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	Jardineria	461	423	4	f	f
297	2013-07-16	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	90	569	3	f	f
292	2013-07-15	70	6	2	DIRECCION DEL DESPACHO	OFICINA DE GESTION ADMINISTRATIVA	455	587	4	f	f
312	2013-07-16	72.5	6	2	DIRECCION DEL DESPACHO	AREA DE COMPRAS	455	595	4	f	f
295	2013-07-15	72.5	6	2	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	OFICINA DE GESTION ADMINISTRATIVA	175	581	4	f	f
284	2013-07-15	77.5	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE COMPRAS	114	363	4	f	f
281	2013-07-15	75	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE GESTION ADMINISTRATIVA	114	505	4	f	f
283	2013-07-15	65	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE COMPRAS	114	370	3	f	f
290	2013-07-15	67.5	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE SERVICIOS GENERALES	114	376	3	f	f
282	2013-07-15	85	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE COMPRAS	114	365	4	f	f
286	2013-07-15	72.5	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE COMPRAS	114	369	4	f	f
144	2013-07-08	70	6	2	DESPACHO DEL MINISTRO	OFICINA DE GESTION ADMINISTRATIVA	457	400	4	f	f
241	2013-07-10	62.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	Sotano 02	460	413	3	f	f
98	2013-07-08	72.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	491	4	f	f
228	2013-07-09	77.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	456	530	4	f	f
160	2013-07-08	82.5	6	2	DESPACHO DEL MINISTRO	OFICINA DE GESTION ADMINISTRATIVA	457	399	4	f	f
154	2013-07-08	50	6	2	OFICINA DE GESTION ADMINISTRATIVA	Jardineria	461	425	2	f	f
235	2013-07-09	65	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	492	3	f	f
238	2013-07-10	85	6	2	OFICINA DE GESTION ADMINISTRATIVA	Sotano 02	460	410	4	f	f
153	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	472	3	f	f
209	2013-07-09	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	550	4	f	f
176	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	465	3	f	f
455	2013-10-31	95	6	17	AREA DE COMPRAS	AREA DE CONTABILIDAD	514	851	5	f	f
173	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	404	3	f	f
271	2013-07-15	85	6	2	OFICINA DE SEGURIDAD INTEGRAL	SEGURIDAD INTEGRAL 	169	575	4	f	f
257	2013-07-10	62.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	433	3	f	f
215	2013-07-09	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	519	3	f	f
260	2013-07-10	85	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	430	4	f	f
249	2013-07-10	80	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	434	4	f	f
250	2013-07-10	72.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	428	4	f	f
243	2013-07-10	77.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	436	4	f	f
248	2013-07-10	80	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	443	4	f	f
220	2013-07-09	65	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	527	3	f	f
255	2013-07-10	87.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	427	5	f	f
226	2013-07-09	72	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	541	4	f	f
262	2013-07-10	62.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	442	3	f	f
225	2013-07-09	75	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	515	4	f	f
224	2013-07-09	72.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	553	4	f	f
175	2013-07-08	87.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	154	350	5	f	f
274	2013-07-15	70	6	2	DIRECCION DEL DESPACHO	AREA DE SERVICIOS GENERALES	113	362	4	f	f
268	2013-07-12	71	6	2	DIRECCION DEL DESPACHO	OFICINA DE SEGURIDAD INTEGRAL	455	356	4	f	f
267	2013-07-12	87.5	6	2	DIRECCION DEL DESPACHO	AREA DE COMPRAS	455	358	5	f	f
306	2013-07-16	75	6	2	OFICINA DE RECURSOS HUMANOS	AREA DE COMPRAS	98	562	4	f	f
163	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	446	3	f	f
159	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	470	3	f	f
236	2013-07-09	62.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	489	3	f	f
240	2013-07-10	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	Sotano 02	460	412	3	f	f
200	2013-07-09	72.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	522	4	f	f
201	2013-07-09	65	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	545	3	f	f
149	2013-07-08	85	6	2	OFICINA DE GESTION ADMINISTRATIVA	Sotano 2 Plomeria	461	416	4	f	f
202	2013-07-09	65	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	524	3	f	f
179	2013-07-09	70	6	2	OFICINA DE RECURSOS HUMANOS	OFICINA DE RECURSOS HUMANOS	97	560	4	f	f
110	2013-07-08	60	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	447	3	f	f
203	2013-07-09	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	555	3	f	f
207	2013-07-09	72.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	539	4	f	f
204	2013-07-09	75	6	2	OFICINA DE SEGURIDAD INTEGRAL	DESPACHO DEL MINISTRO	456	547	4	f	f
206	2013-07-09	60	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	536	3	f	f
211	2013-07-09	80	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	456	528	4	f	f
212	2013-07-09	80	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	520	4	f	f
222	2013-07-09	65	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	546	3	f	f
219	2013-07-09	60	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	525	3	f	f
223	2013-07-09	82.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	552	4	f	f
287	2013-07-15	77.5	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE GESTION ADMINISTRATIVA	114	372	4	f	f
289	2013-07-15	80	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE COMPRAS	114	371	4	f	f
288	2013-07-15	62.5	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE SERVICIOS GENERALES	114	374	3	f	f
285	2013-07-15	70	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE COMPRAS	114	373	4	f	f
319	2013-07-19	92.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	98	594	5	f	f
279	2013-07-15	80	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE COMPRAS	114	368	4	f	f
280	2013-07-15	67.5	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE COMPRAS	114	366	3	f	f
322	2013-07-19	60	6	2	DIRECCION DEL DESPACHO	Despacho del Viceministro para nuevas fuentes de eneregia electrica	465	579	3	f	f
246	2013-07-10	57.5	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE GESTION ADMINISTRATIVA	136	383	3	f	f
259	2013-07-10	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	432	3	f	f
192	2013-07-09	85	6	2	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	OPPO	454	354	4	f	f
196	2013-07-09	67.5	6	2	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	OPPO	454	353	3	f	f
273	2013-07-15	80	6	2	DIRECCION DEL DESPACHO	OFICINA DE SEGURIDAD INTEGRAL	113	361	4	f	f
172	2013-07-08	77.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	Jardineria	461	424	4	f	f
166	2013-07-08	72.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	Jardineria	461	421	4	f	f
135	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	452	3	f	f
254	2013-07-10	77.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	429	4	f	f
143	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	464	3	f	f
142	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	AREA DE COMPRAS	458	480	3	f	f
148	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	419	3	f	f
184	2013-07-09	65	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	513	3	f	f
244	2013-07-10	57.5	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE GESTION ADMINISTRATIVA	136	386	3	f	f
251	2013-07-10	80	6	2	OFICINA DE RECURSOS HUMANOS	AREA DE RELACIONES INSTITUCIONALES	463	564	4	f	f
182	2013-07-09	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	529	4	f	f
253	2013-07-10	82.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	440	4	f	f
242	2013-07-10	87.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	426	5	f	f
247	2013-07-10	80	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	439	4	f	f
269	2013-07-12	80	6	2	DIRECCION DEL DESPACHO	AREA DE SERVICIOS GENERALES	455	377	4	f	f
256	2013-07-10	67.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	431	3	f	f
183	2013-07-09	80	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	517	4	f	f
198	2013-07-09	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	549	3	f	f
205	2013-07-09	71	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	531	4	f	f
194	2013-07-09	77.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	559	4	f	f
218	2013-07-09	85	6	2	OFICINA DE SEGURIDAD INTEGRAL	AREA DE COMPRAS	456	557	4	f	f
231	2013-07-09	60	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	516	3	f	f
232	2013-07-09	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	538	3	f	f
197	2013-07-09	72.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	554	4	f	f
193	2013-07-09	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	AREA DE SERVICIOS GENERALES	456	556	4	f	f
189	2013-07-09	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	512	4	f	f
188	2013-07-09	72	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	548	4	f	f
186	2013-07-09	75	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	532	4	f	f
190	2013-07-09	52.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	523	2	f	f
216	2013-07-09	66	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	521	3	f	f
185	2013-07-09	72	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	558	4	f	f
199	2013-07-09	70	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	534	4	f	f
313	2013-07-16	77.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	90	596	4	f	f
276	2013-07-15	80	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE CONTABILIDAD	153	574	4	f	f
303	2013-07-16	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	90	589	3	f	f
302	2013-07-16	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	90	591	3	f	f
301	2013-07-16	65	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	90	352	3	f	f
300	2013-07-16	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	90	572	3	f	f
305	2013-07-16	70	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	90	590	4	f	f
304	2013-07-16	72.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	90	592	4	f	f
314	2013-07-16	85	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE CORRESPONDENCIA Y ARCHIVO	152	588	4	f	f
311	2013-07-16	82.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	586	4	f	f
309	2013-07-16	82.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	584	4	f	f
278	2013-07-15	77.5	6	2	OFICINA DE ATENCION AL CIUDADANO	OFICINA DE SEGURIDAD INTEGRAL	114	504	4	f	f
317	2013-07-18	72.5	6	2	DIRECCION DEL DESPACHO	OFICINA DE SEGURIDAD INTEGRAL	175	583	4	f	f
316	2013-07-18	72.5	6	2	DIRECCION DEL DESPACHO	OFICINA DE SEGURIDAD INTEGRAL	175	582	4	f	f
321	2013-07-19	62.5	6	2	DIRECCION DEL DESPACHO	AREA DE SERVICIOS GENERALES	465	578	3	f	f
277	2013-07-15	85	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE COMPRAS	114	364	4	f	f
315	2013-07-18	77.5	6	2	DIRECCION DEL DESPACHO	AREA DE SERVICIOS GENERALES	98	563	4	f	f
320	2013-07-19	60	6	2	DIRECCION DEL DESPACHO	AREA DE SERVICIOS GENERALES	465	580	3	f	f
318	2013-07-19	100	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	98	561	5	f	f
355	2013-10-29	72.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	933	4	f	f
358	2013-10-29	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	655	4	f	f
333	2013-10-29	86	6	17	AREA DE RELACIONES INSTITUCIONALES	AREA DE RELACIONES INSTITUCIONALES	552	854	5	f	f
343	2013-10-29	65	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	878	3	f	f
586	2013-11-07	77.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	547	846	4	f	f
340	2013-10-29	95	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	938	5	f	f
346	2013-10-29	67.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	922	3	f	f
337	2013-10-29	75	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	881	4	f	f
338	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	882	4	f	f
335	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	883	4	f	f
331	2013-09-23	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE RECURSOS HUMANOS	554	855	4	f	f
378	2013-10-29	67.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	477	909	3	f	f
351	2013-10-29	90	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	901	5	f	f
396	2013-10-29	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	656	4	f	f
373	2013-10-29	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	958	4	f	f
348	2013-10-29	75	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	935	4	f	f
345	2013-10-29	80	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	936	4	f	f
395	2013-10-29	67.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	905	3	f	f
354	2013-10-29	95	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	870	5	f	f
497	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	740	3	f	f
458	2013-10-31	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	494	694	4	f	f
457	2013-10-31	72.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	494	686	4	f	f
380	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	906	4	f	f
399	2013-10-29	80	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	943	4	f	f
405	2013-10-29	82.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	658	4	f	f
387	2013-10-29	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	929	4	f	f
397	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	916	4	f	f
404	2013-10-29	82.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	962	4	f	f
599	2013-11-11	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	549	848	4	f	f
508	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	726	4	f	f
502	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	760	3	f	f
517	2013-11-04	82	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	773	4	f	f
511	2013-11-04	82	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	728	4	f	f
381	2013-10-29	95	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	908	5	f	f
372	2013-10-29	85	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	939	4	f	f
514	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	776	4	f	f
453	2013-10-30	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	508	701	4	f	f
394	2013-10-29	92.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	477	889	5	f	f
587	2013-11-08	60	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	508	705	3	f	f
451	2013-10-30	60	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	508	703	3	f	f
371	2013-10-29	67.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	940	3	f	f
379	2013-10-29	87.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	956	5	f	f
452	2013-10-30	87.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	508	700	5	f	f
391	2013-10-29	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	964	4	f	f
555	2013-11-05	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	999	4	f	f
450	2013-10-30	72.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	508	699	4	f	f
339	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	880	4	f	f
364	2013-10-29	87	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	941	5	f	f
370	2013-10-29	87.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	907	5	f	f
357	2013-10-29	82.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	960	4	f	f
342	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	923	4	f	f
401	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	963	4	f	f
398	2013-10-29	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	888	4	f	f
369	2013-10-29	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	659	4	f	f
361	2013-10-29	75	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	912	4	f	f
389	2013-10-29	90	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	928	5	f	f
367	2013-10-29	75	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	911	4	f	f
375	2013-10-29	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	910	4	f	f
384	2013-10-29	75	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	657	4	f	f
400	2013-10-29	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	863	4	f	f
403	2013-10-29	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	915	4	f	f
386	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	917	4	f	f
388	2013-10-29	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	925	4	f	f
376	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	884	4	f	f
368	2013-10-29	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	661	4	f	f
390	2013-10-29	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	945	4	f	f
366	2013-10-29	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	959	4	f	f
356	2013-10-29	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	899	4	f	f
483	2013-11-04	90	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	558	990	5	f	f
347	2013-10-29	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	877	4	f	f
365	2013-10-29	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	913	4	f	f
341	2013-10-29	72.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	477	879	4	f	f
491	2013-11-04	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	537	724	4	f	f
529	2013-11-04	80	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	747	4	f	f
336	2013-10-29	77.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	494	680	4	f	f
506	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	765	4	f	f
362	2013-10-29	60	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	887	3	f	f
588	2013-11-08	60	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	508	706	3	f	f
490	2013-11-04	70	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	537	720	4	f	f
377	2013-10-29	77.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	477	957	4	f	f
512	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	737	3	f	f
518	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	731	4	f	f
383	2013-10-29	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	965	4	f	f
509	2013-11-04	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	538	755	4	f	f
565	2013-11-06	62.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	526	1008	3	f	f
600	2013-11-11	77.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	547	845	4	f	f
359	2013-10-29	75	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	927	4	f	f
353	2013-10-29	75	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	900	4	f	f
538	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	748	3	f	f
505	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	739	3	f	f
392	2013-10-29	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	944	4	f	f
524	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	758	3	f	f
535	2013-11-04	65	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	753	3	f	f
532	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	732	3	f	f
499	2013-11-04	80	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	775	4	f	f
541	2013-11-04	82.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	769	4	f	f
501	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	754	3	f	f
572	2013-11-06	62.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	SEDE ESTADAL ZULIA	468	611	3	f	f
515	2013-11-04	85	6	17	AREA DE COMPRAS	AREA DE COMPRAS	538	772	4	f	f
526	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	766	4	f	f
521	2013-11-04	82.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	767	4	f	f
504	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	752	4	f	f
569	2013-11-06	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	SEDE ESTADAL ZULIA	468	608	4	f	f
568	2013-11-06	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	SEDE ESTADAL ZULIA	468	610	4	f	f
489	2013-11-04	85	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	537	722	4	f	f
486	2013-11-04	87.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	558	981	5	f	f
477	2013-11-04	87.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	558	984	5	f	f
480	2013-11-04	87.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	558	980	5	f	f
475	2013-11-04	87.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	558	986	5	f	f
350	2013-10-29	92.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	951	5	f	f
564	2013-11-06	90	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	1009	5	f	f
603	2013-11-11	90	6	17	AREA DE COMPRAS	AREA DE COMPRAS	555	861	5	f	f
498	2013-11-04	65	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	996	3	f	f
574	2013-11-06	62.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	SEDE ESTADAL ZULIA	468	607	3	f	f
537	2013-11-04	75	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	750	4	f	f
606	2013-11-13	87.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	555	1018	5	f	f
466	2013-10-31	77.5	6	17	DIRECCION DEL DESPACHO	DIRECCION DEL DESPACHO	494	975	4	f	f
460	2013-10-31	82.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	494	695	4	f	f
468	2013-10-31	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	494	689	4	f	f
469	2013-10-31	82.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	494	682	4	f	f
459	2013-10-31	95	6	17	AREA DE COMPRAS	COCINA	494	685	5	f	f
519	2013-11-04	72.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	729	4	f	f
540	2013-11-04	65	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	751	3	f	f
503	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	761	3	f	f
507	2013-11-04	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	538	745	4	f	f
516	2013-11-04	79	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	763	4	f	f
534	2013-11-04	85	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	774	4	f	f
566	2013-11-06	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	477	1007	4	f	f
522	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	757	3	f	f
510	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	749	4	f	f
528	2013-11-04	82	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	746	4	f	f
558	2013-11-06	75	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	557	976	4	f	f
602	2013-11-11	86	6	17	AREA DE COMPRAS	OFICINA DE RECURSOS HUMANOS	555	859	5	f	f
494	2013-11-04	77.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	537	723	4	f	f
374	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	885	4	f	f
531	2013-11-04	75	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	768	4	f	f
513	2013-11-04	70	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	759	4	f	f
382	2013-10-29	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	955	4	f	f
567	2013-11-06	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	468	605	4	f	f
571	2013-11-06	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	SEDE ESTADAL ZULIA	468	606	4	f	f
589	2013-11-08	72.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	559	993	4	f	f
601	2013-11-11	77.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	547	844	4	f	f
604	2013-11-11	84	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	502	696	4	f	f
488	2013-11-04	87.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	558	978	5	f	f
485	2013-11-04	87.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	558	985	5	f	f
476	2013-11-04	87.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	558	979	5	f	f
479	2013-11-04	87.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	558	983	5	f	f
482	2013-11-04	90	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	558	989	5	f	f
438	2013-10-29	80	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	477	918	4	f	f
536	2013-11-04	65	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	733	3	f	f
426	2013-10-29	65	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	477	894	3	f	f
523	2013-11-04	67.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	538	762	3	f	f
605	2013-11-12	77.5	6	17	AREA DE SEGUIMIENTO DE GESTION	AREA DE SEGUIMIENTO DE GESTION	537	1019	4	f	f
470	2013-10-31	77.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	494	691	4	f	f
464	2013-10-31	95	6	17	AREA DE COMPRAS	AREA DE COMPRAS	494	687	5	f	f
456	2013-10-31	77.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	494	690	4	f	f
557	2013-11-06	82.5	6	17	AREA DE COMPRAS	AREA DE CORRESPONDENCIA	536	718	4	f	f
556	2013-11-06	85	6	17	AREA DE COMPRAS	AREA DE CORRESPONDENCIA	536	719	4	f	f
607	2013-11-13	70	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	555	860	4	f	f
520	2013-11-04	82.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	538	771	4	f	f
530	2013-11-04	75	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	730	4	f	f
554	2013-11-05	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	1000	4	f	f
492	2013-11-04	90	6	17	AREA DE COMPRAS	AREA DE COMPRAS	537	725	5	f	f
527	2013-11-04	80	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	756	4	f	f
533	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	741	4	f	f
539	2013-11-04	85	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	736	4	f	f
423	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	874	4	f	f
493	2013-11-04	92.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	537	721	5	f	f
487	2013-11-04	87.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	558	982	5	f	f
473	2013-11-01	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	489	856	3	f	f
484	2013-11-04	87.5	6	17	DESPACHO DEL MINISTRO	DESPACHO DEL MINISTRO	558	987	5	f	f
481	2013-11-04	87.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	558	991	5	f	f
525	2013-11-04	75	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	764	4	f	f
570	2013-11-06	62.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	SEDE ESTADAL ZULIA	468	609	3	f	f
573	2013-11-06	62.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	SEDE ESTADAL ZULIA	468	612	3	f	f
590	2013-11-08	80	6	17	AREA DE COMPRAS	AREA DE COMPRAS	559	1014	4	f	f
435	2013-10-29	82.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	966	4	f	f
441	2013-10-29	97.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	903	5	f	f
432	2013-10-29	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	946	4	f	f
429	2013-10-29	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	947	4	f	f
575	2013-11-06	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	515	709	4	f	f
439	2013-10-29	75	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	660	4	f	f
542	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	744	4	f	f
545	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	734	4	f	f
496	2013-11-04	65	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	995	3	f	f
547	2013-11-04	77.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	735	4	f	f
543	2013-11-04	82.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	727	4	f	f
442	2013-10-29	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	954	4	f	f
591	2013-11-08	72.5	6	17	AREA DE CORRESPONDENCIA Y ARCHIVO	AREA DE CORRESPONDENCIA Y ARCHIVO	513	707	4	f	f
424	2013-10-29	87.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	865	5	f	f
461	2013-10-31	70	6	17	AREA DE COMPRAS	AREA DE COMPRAS	494	683	4	f	f
471	2013-10-31	77.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	494	684	4	f	f
467	2013-10-31	75	6	17	AREA DE COMPRAS	AREA DE COMPRAS	494	688	4	f	f
465	2013-10-31	77.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	494	681	4	f	f
472	2013-10-31	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	494	977	4	f	f
462	2013-10-31	77.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	494	693	4	f	f
463	2013-10-31	77.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	494	692	4	f	f
559	2013-11-06	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	1004	4	f	f
433	2013-10-29	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	920	4	f	f
430	2013-10-29	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	872	4	f	f
436	2013-10-29	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	891	4	f	f
360	2013-10-29	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	866	4	f	f
427	2013-10-29	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	893	4	f	f
581	2013-11-07	70	6	17	AREA DE COMPRAS	SEGURIDAD INTEGRAL	525	713	4	f	f
608	2013-11-13	77.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	555	862	4	f	f
609	2013-11-19	80	6	17	AREA DE COMPRAS	AREA DE COMPRAS	559	1015	4	f	f
610	2013-12-15	\N	10	17	OFICINA DE RECURSOS HUMANOS	OFICINA DE RECURSOS HUMANOS	532	970	\N	f	f
114	2013-07-08	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	AREA DE COMPRAS	458	403	3	f	f
92	2013-07-04	75	6	2	OFICINA DE ATENCION AL CIUDADANO	AREA DE COMPRAS	114	367	4	f	f
117	2013-07-08	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	471	3	f	f
138	2013-07-08	72.5	6	2	DESPACHO DEL MINISTRO	OFICINA DE GESTION ADMINISTRATIVA	457	397	4	f	f
84	2013-07-02	75	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	94	390	4	f	f
139	2013-07-08	62.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE GESTION ADMINISTRATIVA	458	450	3	f	f
103	2013-07-08	57.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	496	3	f	f
97	2013-07-08	79	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE SERVICIOS GENERALES	88	502	4	f	f
106	2013-07-08	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	484	3	f	f
96	2013-07-08	82	6	2	OFICINA DE GESTION ADMINISTRATIVA	Area de Servicos Generales y Logistica	88	501	4	f	f
118	2013-07-08	57.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	495	3	f	f
122	2013-07-08	65	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	490	3	f	f
113	2013-07-08	67.5	6	2	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	456	533	3	f	f
124	2013-07-08	60	6	2	OFICINA DE GESTION ADMINISTRATIVA	AREA DE COMPRAS	88	497	3	f	f
120	2013-07-08	87.5	6	2	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	88	483	5	f	f
544	2013-11-04	65	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	770	3	f	f
349	2013-10-29	65	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	934	3	f	f
402	2013-10-29	82.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	871	4	f	f
560	2013-11-06	77.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	560	1006	4	f	f
576	2013-11-06	77	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	546	1001	4	f	f
592	2013-11-08	72.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	549	847	4	f	f
580	2013-11-07	70	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	525	1003	4	f	f
578	2013-11-06	90	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	489	858	5	f	f
561	2013-11-06	70	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	560	1005	4	f	f
548	2013-11-04	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	538	743	4	f	f
546	2013-11-04	65	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	738	3	f	f
393	2013-10-29	82.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	864	4	f	f
549	2013-11-05	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	997	4	f	f
577	2013-11-06	72.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	489	857	4	f	f
579	2013-11-07	70	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	525	1002	4	f	f
594	2013-11-08	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	549	849	4	f	f
352	2013-10-29	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	876	4	f	f
562	2013-11-06	75	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	551	853	4	f	f
582	2013-11-07	82.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	507	697	4	f	f
584	2013-11-07	80	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	493	679	4	f	f
500	2013-11-04	67.5	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	538	742	3	f	f
551	2013-11-05	85	6	17	AREA DE COMUNICACION E INFORMACION	AREA DE COMUNICACION E INFORMACION	490	676	4	f	f
595	2013-11-08	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	557	1010	4	f	f
363	2013-10-29	75	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	886	4	f	f
553	2013-11-05	60	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	998	3	f	f
563	2013-11-06	75	6	17	AREA DE COMPRAS	AREA DE ALMACEN	551	852	4	f	f
598	2013-11-08	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	559	994	4	f	f
585	2013-11-07	77.5	6	17	AREA DE SERVICIOS GENERALES	AREA DE SERVICIOS GENERALES	493	677	4	f	f
583	2013-11-07	88	6	17	OFICINA DE SEGURIDAD INTEGRAL	OFICINA DE SEGURIDAD INTEGRAL	493	678	5	f	f
434	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	919	4	f	f
412	2013-10-29	75	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	921	4	f	f
445	2013-10-29	85	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	952	4	f	f
446	2013-10-29	72.5	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	869	4	f	f
444	2013-10-29	85	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	953	4	f	f
420	2013-10-29	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	949	4	f	f
413	2013-10-29	83	6	17	AREA DE COMPRAS	AREA DE COMPRAS	477	950	4	f	f
417	2013-10-29	90	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	931	5	f	f
428	2013-10-29	90	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	926	5	f	f
408	2013-10-29	65	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	924	3	f	f
409	2013-10-29	80	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	961	4	f	f
440	2013-10-29	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	904	4	f	f
407	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	914	4	f	f
418	2013-10-29	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	896	4	f	f
449	2013-10-30	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	508	698	4	f	f
447	2013-10-30	87.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	508	702	5	f	f
415	2013-10-29	72.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	867	4	f	f
448	2013-10-30	60	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	508	704	3	f	f
422	2013-10-29	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	875	4	f	f
431	2013-10-29	75	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	892	4	f	f
443	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	868	4	f	f
411	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	898	4	f	f
425	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	873	4	f	f
421	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	895	4	f	f
437	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	890	4	f	f
406	2013-10-29	77.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	942	4	f	f
410	2013-10-29	87.5	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	902	5	f	f
414	2013-10-29	70	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	897	4	f	f
416	2013-10-29	85	6	17	OFICINA DE GESTION ADMINISTRATIVA	OFICINA DE GESTION ADMINISTRATIVA	477	932	4	f	f
\.


--
-- Name: evaluacion_general_id_evaluacion_general_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('evaluacion_general_id_evaluacion_general_seq', 610, true);


--
-- Data for Name: evaluadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY evaluadores (id_evaluador, cedula, periodo, id_trabajador) FROM stdin;
558	15715041	17	\N
559	18187680	17	\N
560	10575364	17	\N
75	4330313	2	184401637
81	9883889	2	184400549
84	18041486	2	184403700
91	5571821	2	184401634
519	12137274	17	184403270
538	10713270	17	184404195
65	14174747	2	184403562
73	3398005	2	184400779
74	4084540	2	184401105
452	17049218	2	184403658
80	7684588	2	184400546
82	5424068	2	184403445
88	11204087	2	184400555
89	11632419	2	184403504
90	6362703	2	184403461
92	13459554	2	184403535
93	3185667	2	184405832
94	13160858	2	184404670
97	13515144	2	184402910
98	6403965	2	184402912
99	10335501	2	184403488
100	14096849	2	184403559
101	3989003	2	184402858
102	16589755	2	184403644
104	11739816	2	184405742
105	3189401	2	184405731
106	14203235	2	184403564
109	12831050	2	184403525
110	13123569	2	184402859
113	9989641	2	184403485
114	7414558	2	184403472
116	4171597	2	184405504
118	7058915	2	184403470
119	13962726	2	184400564
121	11774660	2	184400219
453	6343288	2	184404266
125	6336246	2	184405120
128	9994574	2	184401994
129	4845971	2	184402655
132	6551371	2	184401991
136	6863918	2	184403467
137	6430339	2	184402856
139	10435827	2	184403490
140	5220261	2	184405633
142	7565409	2	184402857
152	10784301	2	184401107
153	16777912	2	184397465
154	9656558	2	184401113
160	7388774	2	184403427
161	14743189	2	184403402
162	4583329	2	184405822
166	13531880	2	184403426
168	4576721	2	184404450
169	6727530	2	184404062
171	17077262	2	184403660
172	6209936	2	184402997
173	10508423	2	184403818
175	5000792	2	184402987
178	19505644	2	184403717
179	10872961	2	184392043
180	6430339	2	184402856
182	14929837	2	184403582
454	4052048	2	184403435
455	10784111	2	184403493
457	19963740	2	184403731
458	18219277	2	184403702
459	7683310	2	184399034
460	9927154	2	184404335
461	16824332	2	184403651
462	9675640	2	184405370
463	4117929	2	184405632
464	14789730	2	184405311
465	4347658	2	184402638
466	14174747	17	184403562
468	4084540	17	184401105
470	17049218	17	184403658
476	11632419	17	184403504
477	6362703	17	184403461
479	13459554	17	184403535
485	14096849	17	184403559
489	3189401	17	184405731
490	14203235	17	184403564
493	9989641	17	184403485
494	7414558	17	184403472
498	13962726	17	184400564
502	6336246	17	184405120
504	9994574	17	184401994
505	4845971	17	184402655
507	6551371	17	184401991
508	6863918	17	184403467
512	7565409	17	184402857
513	10784301	17	184401107
514	16777912	17	184397465
515	9656558	17	184401113
517	14743189	17	184403402
522	13531880	17	184403426
524	4576721	17	184404450
525	6727530	17	184404062
526	17077262	17	184403660
527	6209936	17	184402997
528	10508423	17	184403818
532	19505644	17	184403717
533	10872961	17	184392043
534	6430339	17	184402856
535	14929837	17	184403582
536	4052048	17	184403435
537	10784111	17	184403493
544	9675640	17	184405370
546	14789730	17	184405311
547	4347658	17	184402638
549	12396553	17	184405734
550	14517412	17	184405735
551	6857700	17	184405743
552	14789714	17	184403578
553	8939354	17	184405635
554	10628816	17	184405836
555	10684313	17	184405661
556	6857228	17	184405837
557	14762168	17	184406026
117	19086707	2	184401709
123	10459819	2	184402204
126	14745080	2	184405069
131	10384207	2	184401996
163	12137274	2	184403270
164	7116432	2	184402991
165	4116203	2	184403075
167	5589381	2	184400543
174	9644372	2	184402998
176	6420250	2	184403091
456	10713270	2	184404195
469	4330313	17	184401637
472	9883889	17	184400549
474	18041486	17	184403700
478	5571821	17	184401634
496	19086707	17	184401709
\.


--
-- Name: evaluadores_id_evaluadores_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('evaluadores_id_evaluadores_seq', 560, true);


--
-- Data for Name: evaluados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY evaluados (id_evaluado, ci_evaluado, id_evaluador, periodo, id_trabajador) FROM stdin;
977	1733699	494	17	\N
978	11987200	558	17	\N
979	11932423	558	17	\N
981	14304768	558	17	\N
983	13376815	558	17	\N
984	18989920	558	17	\N
986	17208279	558	17	\N
989	12071108	558	17	\N
990	12378412	558	17	\N
993	11111081	559	17	\N
996	5417503	477	17	\N
997	3104015	477	17	\N
999	5011904	477	17	\N
1001	10823570	546	17	\N
1003	13210330	525	17	\N
1004	11201730	477	17	\N
1005	12634670	560	17	\N
1008	15587381	526	17	\N
1009	3012544	477	17	\N
1010	6328414	557	17	\N
1014	12561112	559	17	\N
1018	10806536	555	17	\N
1019	6030405	537	17	\N
980	13792185	558	17	\N
982	15769992	558	17	\N
985	15340563	558	17	\N
987	20045954	558	17	\N
988	10002199	558	17	\N
991	14022669	558	17	\N
994	6968402	559	17	\N
995	13143418	477	17	\N
998	14758302	477	17	\N
1000	6868611	477	17	\N
1002	17150558	525	17	\N
1006	14100196	560	17	\N
1007	14870268	477	17	\N
1012	6097125	559	17	\N
1015	16952119	559	17	\N
519	17305399	456	2	184400698
520	15314363	456	2	184400689
521	12782171	456	2	184400667
522	19659909	456	2	184400726
523	10390781	456	2	184402453
524	17490366	456	2	184402459
525	9961474	456	2	184400654
526	19012801	456	2	184400721
527	10828651	456	2	184402454
528	16461306	456	2	184400898
529	9486607	456	2	184400653
530	10804444	456	2	184404941
531	6325327	456	2	184400710
532	10687012	456	2	184400659
533	12616498	456	2	184402455
534	6527627	456	2	184402450
535	15872997	456	2	184400694
536	18369595	456	2	184400719
537	14446895	456	2	184402457
538	16871845	456	2	184402458
539	17491032	456	2	184400717
540	10487936	456	2	184400897
541	6105271	456	2	184402514
542	6968338	456	2	184403931
543	15118756	456	2	184400686
544	5891501	456	2	184400706
545	19015685	456	2	184402511
546	6682274	456	2	184400712
547	6055847	456	2	184404190
548	16626652	456	2	184401276
549	12502764	456	2	184402656
550	16204007	456	2	184402513
551	14036366	456	2	184400677
552	10543972	456	2	184400657
553	18366341	456	2	184402510
554	15959288	456	2	184400695
555	16265748	456	2	184401301
556	17769843	456	2	184402394
557	15700013	456	2	184400691
558	7190966	456	2	184400714
559	20291493	456	2	184400729
560	14909175	97	2	184404064
561	15178614	98	2	184400688
717	2159413	532	17	\N
1016	13636519	559	17	\N
677	13852539	493	17	184402339
678	14857486	493	17	184400683
679	16970971	493	17	184402393
680	24896843	494	17	184400732
681	4927197	494	17	184400704
682	4212260	494	17	184400701
683	19760868	494	17	184400727
684	19199167	494	17	184400723
685	14240060	494	17	184400680
686	10898867	494	17	184400661
687	13750980	494	17	184400673
688	22019468	494	17	184400731
689	20173840	494	17	184404131
690	20129424	494	17	184400728
691	17160486	494	17	184402657
692	18032733	494	17	184402395
693	10179709	494	17	184402332
694	15240675	494	17	184405258
695	17384308	494	17	184400716
696	11413032	502	17	184402515
697	16523676	507	17	184402396
698	17195854	508	17	184405275
699	17224747	508	17	184400697
700	17478331	508	17	184405277
701	13852007	508	17	184405250
702	14450821	508	17	184405254
703	13673075	508	17	184405249
704	10331802	508	17	184404065
705	17651988	508	17	184405279
706	18556388	508	17	184405303
707	6313513	513	17	184400760
709	20364540	515	17	184405294
713	12642933	525	17	184400775
718	13483979	536	17	184400670
719	10269986	536	17	184400656
720	19563313	537	17	184400725
721	15021238	537	17	184400685
722	13465458	537	17	184402338
723	10797339	537	17	184402334
724	18755116	537	17	184405288
725	15585914	537	17	184400690
726	6349832	538	17	184402399
338	2159413	178	2	\N
350	20364540	154	2	184405294
351	12279352	90	2	184400890
352	13187168	90	2	184405246
353	13483979	454	2	184400670
354	10269986	454	2	184400656
355	15587381	163	2	184400835
356	19563313	455	2	184400725
358	15021238	455	2	184400685
359	13465458	455	2	184402338
360	13852539	113	2	184402339
361	14857486	113	2	184400683
362	16970971	113	2	184402393
363	24896843	114	2	184400732
364	4927197	114	2	184400704
365	4212260	114	2	184400701
366	19760868	114	2	184400727
367	19199167	114	2	184400723
368	14240060	114	2	184400680
369	10898867	114	2	184400661
370	13750980	114	2	184400673
371	22019468	114	2	184400731
372	20173840	114	2	184404131
373	20129424	114	2	184400728
374	17160486	114	2	184402657
375	18032733	114	2	184402395
376	10179709	114	2	184402332
377	10797339	455	2	184402334
378	17195854	136	2	184405275
379	17224747	136	2	184400697
380	17478331	136	2	184405277
381	13852007	136	2	184405250
382	14450821	136	2	184405254
383	13673075	136	2	184405249
384	10331802	136	2	184404065
385	17651988	136	2	184405279
386	18556388	136	2	184405303
387	6868611	161	2	184405213
388	18749203	94	2	184400896
389	13636519	94	2	184400892
390	12561112	94	2	184400665
391	16952119	94	2	184400696
392	11413032	125	2	184402515
393	16523676	132	2	184402396
394	15021735	457	2	184400893
395	11197711	457	2	184405234
396	19310487	457	2	184405290
397	15662215	457	2	184405263
398	4114880	457	2	184400700
399	6029592	457	2	184405195
400	6264140	457	2	184405203
401	11409002	457	2	184405238
402	6372700	457	2	184405207
403	19194146	458	2	184400722
404	20629122	458	2	184405295
410	18932980	460	2	184405289
411	13528083	460	2	184405248
412	16134032	460	2	184405267
413	20799051	460	2	184405298
414	6273474	461	2	184405204
415	17622871	461	2	184405278
416	6864979	461	2	184405212
417	6347884	461	2	184400711
418	6493132	458	2	184405210
419	5132551	458	2	184405191
420	4070592	458	2	184405185
421	3984287	461	2	184400838
422	7982881	461	2	184405215
423	23142335	461	2	184405302
424	16805456	461	2	184405273
425	5579215	461	2	184405192
426	16263951	88	2	184405268
427	5888532	88	2	184405194
428	6376341	88	2	184405208
429	16619063	88	2	184405271
430	13030866	88	2	184405244
431	18466607	88	2	184405285
432	9412669	88	2	184405220
433	11203225	88	2	184405236
434	18729445	88	2	184405287
435	13143418	88	2	184405245
436	16870123	88	2	184405274
437	6111839	88	2	184405200
438	6059472	88	2	184405197
439	16033735	88	2	184405266
440	5662636	88	2	184405193
441	16659309	88	2	184405272
442	19379183	88	2	184405291
443	12684585	88	2	184405241
444	6164694	458	2	184405202
445	12765227	458	2	184405242
446	12958407	458	2	184405243
447	6093373	458	2	184405198
448	22646493	458	2	184405300
449	10627825	458	2	184405230
450	14953496	458	2	184405256
451	6321100	458	2	184405205
452	6427051	458	2	184405209
453	17343206	458	2	184405276
454	4299581	458	2	184405186
455	6137521	458	2	184405201
456	4713714	458	2	184405187
457	20753423	458	2	184405297
458	10521341	458	2	184405229
459	6099830	458	2	184405199
460	9960891	458	2	184405223
461	21718382	458	2	184405299
462	18374624	458	2	184405284
463	10505751	458	2	184405227
464	13945576	458	2	184405251
465	8034072	458	2	184405216
466	10091910	458	2	184405224
467	11850965	458	2	184405239
468	9143463	458	2	184405218
469	15491303	458	2	184405261
470	10868339	458	2	184405232
471	13408326	458	2	184405247
472	15492107	458	2	184405262
473	9085545	458	2	184405217
474	4806610	458	2	184402275
475	12561778	458	2	184402336
476	10523069	458	2	184402333
477	10800843	458	2	184402854
478	3810546	458	2	184402274
479	7663382	458	2	184402331
480	5517569	458	2	184400705
481	11405579	458	2	184400839
482	6328414	88	2	184405206
483	11201730	88	2	184405235
484	18714740	88	2	184400720
485	11401264	88	2	184400762
486	4582648	88	2	184400703
487	4352367	88	2	184400702
488	6124529	88	2	184400707
489	10383177	88	2	184405226
490	3627016	88	2	184400699
491	9098380	88	2	184400652
492	7959317	88	2	184400715
493	15133360	88	2	184400687
494	7928809	88	2	184400837
495	11679935	88	2	184400663
496	13909125	88	2	184400675
497	10811220	88	2	184400660
500	5113406	88	2	184402276
501	13307706	88	2	184400669
502	6201835	88	2	184400708
505	15240675	114	2	184405258
514	6349832	456	2	184402399
517	19391519	456	2	184400724
503	11111081	88	2	184400662
504	17384308	114	2	184400716
511	7967994	456	2	184402452
515	5595909	456	2	184402398
518	12717444	456	2	184400666
512	6220315	456	2	184400709
513	13490452	456	2	184402456
516	14155541	456	2	184400679
562	3354429	98	2	184400651
563	6864637	98	2	184402330
564	14984221	463	2	184400759
565	14870268	165	2	184400684
566	6968402	89	2	184400895
567	10547995	456	2	184400658
568	15374621	90	2	184405259
569	14287516	90	2	184400681
570	16382267	90	2	184405270
571	14448191	90	2	184405253
572	12459702	90	2	184405240
573	9504276	106	2	184400761
574	15701981	153	2	184400692
575	12642933	169	2	184400775
576	10823570	464	2	184400899
577	12377754	456	2	184402512
578	11688892	465	2	184402335
579	13486842	465	2	184400671
580	14526196	465	2	184402397
581	16027693	175	2	184405265
582	14756849	175	2	184405373
583	16685020	175	2	184405374
584	10518227	88	2	184405228
585	11926803	88	2	184400664
586	18142867	88	2	184400894
587	18755116	455	2	184405288
588	6313513	152	2	184400760
589	15800341	90	2	184400693
590	18109624	90	2	184405282
591	15835455	90	2	184405264
592	13545401	90	2	184400891
594	3969889	98	2	184401121
595	15585914	455	2	184400690
596	6824407	90	2	184400713
597	18572080	74	2	184405286
598	20692947	74	2	184405296
599	6663414	74	2	184405211
600	9711111	74	2	184405221
601	14167183	74	2	184405252
602	7778859	74	2	184405214
603	16352295	74	2	184405269
604	2988418	74	2	184405182
605	18572080	468	17	184405286
606	20692947	468	17	184405296
607	6663414	468	17	184405211
608	9711111	468	17	184405221
609	14167183	468	17	184405252
610	7778859	468	17	184405214
611	16352295	468	17	184405269
612	2988418	468	17	184405182
655	12279352	477	17	184400890
656	13187168	477	17	184405246
657	15374621	477	17	184405259
658	14287516	477	17	184400681
659	16382267	477	17	184405270
660	14448191	477	17	184405253
661	12459702	477	17	184405240
676	9504276	490	17	184400761
727	19391519	538	17	184400724
728	7967994	538	17	184402452
729	5595909	538	17	184402398
730	12717444	538	17	184400666
731	6220315	538	17	184400709
732	13490452	538	17	184402456
733	14155541	538	17	184400679
734	17305399	538	17	184400698
735	15314363	538	17	184400689
736	12782171	538	17	184400667
737	19659909	538	17	184400726
738	10390781	538	17	184402453
739	17490366	538	17	184402459
740	9961474	538	17	184400654
741	19012801	538	17	184400721
742	10828651	538	17	184402454
743	16461306	538	17	184400898
744	9486607	538	17	184400653
745	10804444	538	17	184404941
746	6325327	538	17	184400710
747	10687012	538	17	184400659
748	12616498	538	17	184402455
749	6527627	538	17	184402450
750	15872997	538	17	184400694
751	18369595	538	17	184400719
752	14446895	538	17	184402457
753	16871845	538	17	184402458
754	17491032	538	17	184400717
755	10487936	538	17	184400897
756	6105271	538	17	184402514
757	6968338	538	17	184403931
758	15118756	538	17	184400686
759	5891501	538	17	184400706
760	19015685	538	17	184402511
761	6682274	538	17	184400712
762	6055847	538	17	184404190
763	16626652	538	17	184401276
764	12502764	538	17	184402656
765	16204007	538	17	184402513
766	14036366	538	17	184400677
767	10543972	538	17	184400657
768	18366341	538	17	184402510
769	15959288	538	17	184400695
770	16265748	538	17	184401301
771	17769843	538	17	184402394
772	15700013	538	17	184400691
773	7190966	538	17	184400714
774	20291493	538	17	184400729
775	10547995	538	17	184400658
776	12377754	538	17	184402512
844	11688892	547	17	184402335
845	13486842	547	17	184400671
846	14526196	547	17	184402397
847	6824407	549	17	184400713
848	15835455	549	17	184405264
849	18109624	549	17	184405282
850	18749203	549	17	184400896
851	10186103	514	17	184400655
852	15800341	551	17	184400693
853	13545401	551	17	184400891
854	14984221	552	17	184400759
855	14909175	554	17	184404064
856	16685020	489	17	184405374
857	14756849	489	17	184405373
858	16027693	489	17	184405265
859	15178614	555	17	184400688
860	6864637	555	17	184402330
861	3969889	555	17	184401121
862	3354429	555	17	184400651
863	19310487	477	17	184405290
864	6029592	477	17	184405195
865	15662215	477	17	184405263
866	6264140	477	17	184405203
867	11409002	477	17	184405238
868	6372700	477	17	184405207
869	4114880	477	17	184400700
870	11197711	477	17	184405234
871	15021735	477	17	184400893
872	20629122	477	17	184405295
873	9085545	477	17	184405217
874	12765227	477	17	184405242
875	6093373	477	17	184405198
876	12958407	477	17	184405243
877	6493132	477	17	184405210
878	4713714	477	17	184405187
879	12561778	477	17	184402336
880	6099830	477	17	184405199
881	17343206	477	17	184405276
882	22646493	477	17	184405300
883	10627825	477	17	184405230
884	10505751	477	17	184405227
885	9960891	477	17	184405223
886	10091910	477	17	184405224
887	10800843	477	17	184402854
888	20753423	477	17	184405297
889	3810546	477	17	184402274
890	15491303	477	17	184405261
891	5132551	477	17	184405191
892	6164694	477	17	184405202
893	8034072	477	17	184405216
894	4806610	477	17	184402275
895	10868339	477	17	184405232
896	9143463	477	17	184405218
897	6427051	477	17	184405209
898	15492107	477	17	184405262
899	4070592	477	17	184405185
900	5517569	477	17	184400705
901	11405579	477	17	184400839
902	18932980	477	17	184405289
903	11850965	477	17	184405239
904	18374624	477	17	184405284
905	16134032	477	17	184405267
906	4299581	477	17	184405186
907	20799051	477	17	184405298
908	19194146	477	17	184400722
909	10523069	477	17	184402333
910	14953496	477	17	184405256
911	21718382	477	17	184405299
912	13408326	477	17	184405247
913	13528083	477	17	184405248
914	10521341	477	17	184405229
915	13945576	477	17	184405251
916	6137521	477	17	184405201
917	6321100	477	17	184405205
918	7663382	477	17	184402331
919	6864979	477	17	184405212
920	6273474	477	17	184405204
921	5579215	477	17	184405192
922	6347884	477	17	184400711
923	7982881	477	17	184405215
924	3984287	477	17	184400838
925	16805456	477	17	184405273
926	17622871	477	17	184405278
927	23142335	477	17	184405302
928	11401264	477	17	184400762
929	6059472	477	17	184405197
931	19379183	477	17	184405291
932	7928809	477	17	184400837
933	18714740	477	17	184400720
934	16033735	477	17	184405266
935	13909125	477	17	184400675
936	10811220	477	17	184400660
938	3627016	477	17	184400699
939	15133360	477	17	184400687
940	16870123	477	17	184405274
941	13307706	477	17	184400669
942	18142867	477	17	184400894
943	11679935	477	17	184400663
944	6376341	477	17	184405208
945	9412669	477	17	184405220
946	10518227	477	17	184405228
947	16659309	477	17	184405272
948	18729445	477	17	184405287
949	12684585	477	17	184405241
950	6201835	477	17	184400708
951	7959317	477	17	184400715
952	9098380	477	17	184400652
953	4582648	477	17	184400703
954	5662636	477	17	184405193
955	10383177	477	17	184405226
956	4352367	477	17	184400702
957	5113406	477	17	184402276
958	16263951	477	17	184405268
959	6111839	477	17	184405200
960	13030866	477	17	184405244
961	5888532	477	17	184405194
962	6124529	477	17	184400707
963	16619063	477	17	184405271
964	11203225	477	17	184405236
965	18466607	477	17	184405285
966	11926803	477	17	184400664
970	11409186	532	17	184405061
971	11209270	532	17	184402262
975	16094459	494	17	184405951
976	19209789	557	17	184400776
\.


--
-- Name: evaluados_id_evaluado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('evaluados_id_evaluado_seq', 1019, true);


--
-- Data for Name: factores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY factores (co_factor, nombre) FROM stdin;
1	Calidad del trabajo
2	Cantidad de trabajo
3	Cumplimiento de normas
4	Hábitos de seguridad
5	Interés por el trabajo
6	Cooperación
7	Manejo de bienes y equipos
8	Atención al público
9	Capacidad de Mando
10	Toma de decisiones
11	Coordinación en el trabajo
12	Comunicación con los trabajadores
\.


--
-- Name: factores_co_factor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('factores_co_factor_seq', 14, true);


--
-- Name: id_periodo_sec; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_periodo_sec', 2, true);


--
-- Data for Name: periodos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY periodos (id_periodos, inicio, fin) FROM stdin;
1	2011-07-01	2011-12-31
2	2013-01-01	2013-06-30
17	2013-07-01	2013-12-31
\.


--
-- Name: periodos_id_periodos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('periodos_id_periodos_seq', 17, true);


--
-- Data for Name: rango; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rango (id_rango, valor_rango, descripcion) FROM stdin;
1	1	DESEMPEÑO DEFICIENTE
2	2	DESEMPEÑO REGULAR
3	3	DESEMPEÑO BUENO
4	4	DESEMPEÑO MUY BUENO
5	5	DESEMPEÑO EXCELENTE
\.


--
-- Name: rango_id_rango_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rango_id_rango_seq', 5, true);


--
-- Data for Name: tmp_v_datos_personales_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tmp_v_datos_personales_evaluacion (id_trabajador, cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, tipo_personal, dependencia, email, descripcion_cargo, codigo_nomina, tipo_cargo, id_serie_cargo, serie_cargo, id_tipo_personal, unidad_ejecutora) FROM stdin;
184403757	11740767	JOAO	ALBERTO	DE NOBREGA		COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	jdenobrega@mppee.gob.ve	PROFESIONAL III	141	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184400775	12642933	CLAUDIO	JAVIER	CALDERON	CARRILLO 	OBRERO FIJO	AREA DE COMPRAS	ccalderon@mppee.gob.ve	CHOFER	87	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404521	15315193	HELIOS	PASTOR	ESPIN	DEL RIO	EGRESADOS	OFICINA DE RECURSOS HUMANOS	HESPIN@MPPEE.GOB.VE	DIRECTOR	9	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184405722	17208279	EGLYSH	ELENA	GUERRA 	DE CONTRERAS	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO		ESCOLTA	58	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184400732	24896843	GUILLERMO		DURAN 	TAFUR	OBRERO FIJO	AREA DE COMPRAS	GDURAN@MPPEE.GOB.VE	MESONERO	82	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405230	10627825	MARIA 	ESTHER	GUZMAN	DE BARRERA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MGUZMAN201@MPPEE.GOB.VE	ASEADOR	216	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401991	6551371	MIGUEL	ANTONIO	MUÑOZ	PALACIOS	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	MMUNOZ@MPPEE.GOB.VE	COORDINADOR	91	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SEGURIDAD INTEGRAL
184404513	5520466	JULIO	ALBERTO	YEPEZ	CASTRO	EGRESADOS	OFICINA DE RECURSOS HUMANOS		DIRECTOR	1	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184405967	14445993	YARITZA	DEL VALLE	SILVERA	MORALES	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	YSILVERA@MPPEE.GOB.VE	TECNICO I	170	2	92	TECNICO	22	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184405434	6826435	WILKIE 	LEANDRO	ROJAS 	SALAS	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2768	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184399821	11491566	MARIO	ENRIQUE	SANCHEZ		OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO	MESANCHEZ@MPPEE.GOB.VE	ESCOLTA	1	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184398586	11196057	PATRICIA		QUINTERO		HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	2710	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184403524	12780278	YAMILETH		UZCÁTEGUI	GONZÁLEZ	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	YUZCATEGUI@MPPEE.GOB.VE	PROFESIONAL II	700089	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184400714	7190966	CARLOS 	CARMELO	QUINTO	DETERNOZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	CQUINTO@MPPEE.GOB.VE	SUPERVISOR DE SEGURIDAD	17	4	111	OBRERO SUPERVISOR	13	OFICINA DE SEGURIDAD INTEGRAL
184403552	14021960	NICOLAS	ENRIQUE	GUTIERREZ	GONZALEZ	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	NGUTIERREZ@MPPEE.GOB.VE	BACHILLER I	100003	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184406024	19792660	LEVIS	FEDERICO	AFANADOR	MUÑOZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS	LEVIS_AM1009@HOTMAIL.COM	APOYO ADMINISTRATIVO	825	1	93	ADMINISTRATIVO	28	OFICINA DE RECURSOS HUMANOS
184405832	3185667	OFELIA	DALILA	FERMIN	VASQUEZ	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	OFERMIN@MPPEE.GOB.VE	JUBILADO	12	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184403879	10036409	WILLIAM	ALBERTO	BRICEÑO	ARAUJO	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	WBRICENO@MPPEE.GOB.VE	PROFESIONAL III	800008	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184400554	10729544	JUAN	CARLOS	CUBEROS	MONTES	ALTO NIVEL Y/O CONFIANZA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JCUBEROS@MPPEE.GOB.VE	COORDINADOR	2684	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184392937	14960813	JESSE	MILEDDY	PERDOMO	SEIJAS	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	JESSMILED@GMAIL.COM	PROFESIONAL I	2214	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184404777	18729900	JULIO	CESAR	PEREZ		CONTRATADO	OFICINA DE RECURSOS HUMANOS	JPEREZ@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	770	1	93	ADMINISTRATIVO	28	OFICINA DE RECURSOS HUMANOS
184404262	16017074	JUAN 	MANUEL	BORREGALES	MARTÍNEZ	EMPLEADO FIJO	DESPACHO DEL MINISTRO	jborregales@mppee.gob.ve	PROFESIONAL I	600206	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184406038	14729904	MARY	ISABEL	CARAPAICA	DE BLANCO	CONTRATADO	OFICINA DE RECURSOS HUMANOS	MARYCARAPAICA2013@HOTMAIL.COM	APOYO PROFESIONAL	831	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184394934	6915644	HANITZIA	VIRGINIA	LOPEZ	ESTELLER	EMPLEADO FIJO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	HLOPEZ@MPPEE.GOB.VE	PROFESIONAL I	600013	2	35	PROFESIONAL	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184403064	17815447	GERARDO	ANTONIO	RIVERO	VASQUEZ	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	RIVERO.GERARDO@GMAIL.COM	PASANTE PROFESIONAL	93	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404559	1417113	JULIO	MARCELINO	CHIRINO		EGRESADOS	OFICINA DE RECURSOS HUMANOS	JCHIRINO@MPPEE.GOB.VE	DIRECTOR	47	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184405476	15695735	NIXON	ENRIQUE	SANCHEZ	ORTEGA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2810	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403944	18140174	FRANCY	DEL VALLE	MORALES	UGUETO	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	FMORALES@MPPEE.GOB.VE	APOYO TECNICO	708	2	92	TECNICO	28	OFICINA DE SEGURIDAD INTEGRAL
184403593	15366959	ANAIS	YETZARI	HERRERA	DE IZZO	EMPLEADO FIJO	DESPACHO DEL MINISTRO	AHERRERA@MPPEE.GOB.VE	PROFESIONAL II	700001	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184405566	18183307	ANDRES	ALBERTO	CONTRERAS	VERA	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	AACONTRERASV@GMAIL.COM	PASANTE PROFESIONAL	159	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404515	6498678	JESUS	EDUARDO	VILLARROEL	GONZÁLEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	IVILLARROEL@MPEE@LAEDC.VE   /   JESUSVILL56@HOTMAIL.COM	COORDINADOR	3	0	39	COORDINADOR	141	OFICINA DE RECURSOS HUMANOS
184396352	12765966	KARINA	ISABEL	ARELLAN	MIRANDA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	KARELLAN@MPPEE.GOB.VE	PROFESIONAL II	700077	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184400593	17589210	LEONELLA	BEATRIZ	LA ROCCA	LOBO	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	llarocca@mppee.gob.ve	APOYO ADMINISTRATIVO	437	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403722	20094544	HUMBERTO	ANTONIO	ZAMBRANO	CAMARGO	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	HZAMBRANO@MPPEE.GOB.VE	BACHILLER I	100025	1	93	ADMINISTRATIVO	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184398797	14690407	RUTH	SOFIA	FONT	SCROCCHI	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	RFONT@MPPEE.GOB.VE	APOYO PROFESIONAL	2707	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184391463	13233294	SERGIO	NOEL	NEGRETE	MESSORI	EMPLEADO FIJO	CONSULTORIA JURIDICA	SNEGRETE@MPPEE.GOB.VE	PROFESIONAL II	700025	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184397725	9616770	ANDREA 		JIMENEZ	GUERRA	EMPLEADO FIJO	AREA DE ANALISIS Y FORMULACION ESTRATEGICA	AJIMENEZ@MPPEE.GOB.VE	COORDINADOR	2674	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184404275	12909621	ALEXANDER	RAIMUNDO	LEZAMA	LOPEZ	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	alezama@mppee.gob.ve	APOYO TECNICO	737	2	92	TECNICO	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403476	8899041	JUANA 	MARGARITA	GARCIA	CASTAÑO	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	JMGARCIA@MPPEE.GOB.VE	PROFESIONAL I	600024	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184404671	12082729	ARGENIS	JOSE	MONCADA	MELENDEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	ARGENISMONCADA@GMAIL.COM	PROFESIONAL II	156	1	35	PROFESIONAL	22	OFICINA DE SEGURIDAD INTEGRAL
3378	9416134	MAYERLIN	BEATRIZ	BERROTERAN	VELIZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	MBERROTERAN@MPPEE.GOB.VE	PROFESIONAL III	800022	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184400728	20129424	MARIA 	GABRIELA	FIGUEREDO	MADRIZ	OBRERO FIJO	AREA DE COMPRAS	MFIGUEREDO@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	78	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403419	6057689	MARIA	VALENTINA	BENAVENTE	ABAD 	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	MBENAVENTE@MPPEE.GOB.VE	BACHILLER II	200031	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184404132	16760495	JEAN	CARLOS	GUEVARA	NARANJO	CONTRATADO	CENTRO NACIONAL DE DESPACHO	JCGUEVARA@MPPEE.GOB.VE	APOYO TECNICO	727	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184403702	18219277	FREDDY	DANIEL	TORRES	TORRES	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	FTORRES@MPPEE.GOB.VE	PROFESIONAL I	600218	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184406091	12833820	JOSMELY	DEL CARMEN	MORANTES	SILVA	CONTRATADO	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	834	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184404832	5221995	MAGALY		CHARAMA	PINTO	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	MCHARAMA@MPPEE.GOB.VE	JUBILADO	6	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184403672	17359157	CARLOS 	AUGUSTO	ESCALONA 	GUARIGUATA	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	cescalona@mppee.gob.ve	PROFESIONAL I	600207	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184405838	10522117	XIOMARA	DEL CARMEN	SEIJAS 	RIVAS	SUPLENTE	CONSULTORIA JURIDICA	ARAMOIX1910@HOTMAIL.COM	BACHILLER II	15	1	93	ADMINISTRATIVO	73	CONSULTORÍA JURIDICA
184405653	15421497	KELIN	YORUVY	COCHO	ANGULO	PASANTE	DIRECCION GENERAL DE PARTICIPACION POPULAR	YORUVY@HOTMAIL.COM	PASANTE TECNICO	166	2	92	TECNICO	62	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184400553	10353172	VIVIAN		ALVARADO		ALTO NIVEL Y/O CONFIANZA	DIRECCION DEL DESPACHO	VALVARADO@MPPEE.GOB.VE	DIRECTOR DE DESPACHO	2648	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN DEL DESPACHO
184402510	18366341	CRISTHIAN 	JOSE	ROJAS		OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	CROJAS@MPPEE.GOB.VE	VIGILANTE	151	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184398125	13866994	JOSE	REINALDO	CAMEJO	DIAZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION DEL DESPACHO	JRCAMEJO@MPPEE.GOB.VE	PROFESIONAL III	33	2	35	PROFESIONAL	22	DIRECCIÓN DEL DESPACHO
184403535	13459554	YORHANA	MARIELY	HERNANDEZ	NUÑEZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	YHERNANDEZ@MPPEE.GOB.VE	PROFESIONAL II	700133	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184405378	18466541	ANA	KORINA	LOPEZ	DOMINGUEZ	PASANTE	AREA DE COMUNICACION E INFORMACION	ANA_KORINA_1567@HOTMAIL.COM	PASANTE TECNICO	146	2	92	TECNICO	62	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184404931	2803899	TOMAS	ARMANDO	NOVELLINO	GILLY	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO		ASISTENTE	131	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184398304	7453538	LEONARDO	JOSE	LOPEZ	GIMENEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	LEONARDO.LOPEZ@LAEDC.COM.VE	COORDINADOR	37	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403432	3975505	ARNALDO	JOSE	TAVIO	YABRUDI	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	ATAVIO@MPPEE.GOB.VE	PROFESIONAL III	800105	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184397967	13464605	ENGELBERTT	JAVIER	MARTINEZ	CORDERO	CONTRATADO	AREA DE PLANIFICACION Y CONTROL DE PROYECTOS DE TECNOLOGIAS DE LA INFORMACION	EMARTINEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	165	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184403718	19528260	KENIA	ANAKARY	SEQUERA	CUBEROS	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	KSEQUERA@MPPEE.GOB.VE	PROFESIONAL I	600028	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405560	15715041	JULIO	EDGARDO	SEQUERA	AVILAN	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DESPACHO DEL MINISTRO	JESEQUERA@MPPEE.GOB.VE	ASISTENTE	143	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DESPACHO DEL MINISTRO
184397885	5003011	JAVIER		ALVARADO	OCHOA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO		VICEMINISTRO	25	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184401253	8217488	CARLOS	ENRIQUE	HERNANDEZ	ASTUDILLO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2755	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403738	17266333	LILA	DEIVY	BARRETO	BECERRA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	LBARRETO@MPPEE.GOB.VE	PROFESIONAL I	600164	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405276	17343206	ORLYMAR	YOSELINE	LOPEZ		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	OLOPEZ202@MPPEE.GOB.VE	ASEADOR	262	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401904	11604745	KELVIS	ALEXANDER	MALDONADO	CALDERON	CONTRATADO	DIRECCION DEL DESPACHO		AUXILIAR DE SERVICIOS DE OFICINA	575	4	24	OBRERO	28	DIRECCIÓN DEL DESPACHO
184404844	17081864	MARIA	YNES	BOYER	CEBALLOS	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	MARIAYNESMC@HOTMAIL.COM	APOYO TECNICO	777	2	92	TECNICO	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404943	10324456	HECTOR	RAFAEL	REYES		ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	ROTCEH2005@GMAIL.COM	COORDINADOR	9950010	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184405300	22646493	EMPERATRIZ		MENDEZ	MARTINEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	EMENDEZ201@MPPEE.GOB.VE	ASEADOR	286	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404265	16598393	GREYLIS	DAYANA	GIMENEZ	MEJIA	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	ggimenez@mppee.gob.ve	APOYO PROFESIONAL	735	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184403682	17458006	MARCOS	DAVID	BOCARANDA	AGUILAR	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	mbocaranda@mppee.gob.ve	TECNICO I	400043	2	92	TECNICO	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184405898	10741708	ERICK	ORLANDO	MORA	URREA	ALTO NIVEL Y/O CONFIANZA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION		DIRECTOR GENERAL	9950032	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184401034	17632693	MARIA 	FRANCIA	MORA	GARCIA	PASANTE	DESPACHO DEL MINISTRO	MARIA_509@HOTMAIL.COM	PASANTE PROFESIONAL	53	2	35	PROFESIONAL	62	DESPACHO DEL MINISTRO
184405199	6099830	MARIA 	DE LOS ANGELES	GOMEZ	ZAMBRANO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MGOMEZ206@MPPEE.GOB.VE	ASEADOR	185	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400699	3627016	FELIX	OSWALDO	RIOS	HERNÁNDEZ	OBRERO FIJO	AREA DE COMPRAS	FRIOS@MPPEE.GOB.VE	CHOFER	2	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184397444	12971091	LENER	MANZUR	SAAVEDRA	BAUTISTA	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	LSAAVEDRA@MPPEE.GOB.VE	ESCOLTA	4	4	24	OBRERO	22	OFICINA DE SEGURIDAD INTEGRAL
184399965	13138131	DERUBY	CAROLINA	NARANJO	BERNAL	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	DERUBY@GMAIL.COM	APOYO ADMINISTRATIVO	411	1	93	ADMINISTRATIVO	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184405499	20632162	AVELY	MARGARETH	HERNANDEZ	VELASQUEZ	PASANTE	OFICINA DE SEGURIDAD INTEGRAL	AVELY_20@HOTMAIL.COM	PASANTE PROFESIONAL	155	2	35	PROFESIONAL	62	OFICINA DE SEGURIDAD INTEGRAL
184403716	19499560	LIGIA	ELENA	MOGOLLON	LOPEZ	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	LMOGOLLON@MPPEE.GOB.VE	TECNICO I	400009	2	92	TECNICO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184397732	17166278	VANESSA	NATHALY	CORREA		CONTRATADO	AREA DE COMPRAS	VCORREA@MPPEE.GOB.VE	APOYO TECNICO	92	2	92	TECNICO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184404539	3555645	JESUS	RAFAEL	VILLARROEL		EGRESADOS	OFICINA DE RECURSOS HUMANOS		OFICIAL DE SEGURIDAD	27	4	24	OBRERO	141	OFICINA DE RECURSOS HUMANOS
184402451	6931531	JOSE	GREGORIO	GARCIA	VASQUEZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	MILINEA@CANTV.NET	ESCOLTA	142	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184402784	4766685	ALBERTO	JOANES	URDANETA	URDANETA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL MINISTRO	AURDANETA@MPPEE.GOB.VE	PROFESIONAL III	127	1	35	PROFESIONAL	22	DESPACHO DEL MINISTRO
184404618	18402015	FRANCIS	HELLEN	MURO	MOGOLLON	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	FRANCISHEL18@HOTMAIL.COM	APOYO TECNICO	769	2	92	TECNICO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184401107	10784301	MAYURY	ESTELA 	GARCIA	PEREZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MGARCIA@MPPEE.GOB.VE	PROFESIONAL III	800029	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184399745	18310781	ATILA	EULICE	MALDONADO	MORA	OBRERO-CONTRATADO	AREA DE COMPRAS	AMALDONADO@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	46	4	24	OBRERO	92	OFICINA DE GESTIÓN ADMINISTRATIVA
184404543	15929711	MARELVY	ELVIRA	ARCE	SUAREZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	MARCE@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	31	1	93	ADMINISTRATIVO	141	OFICINA DE RECURSOS HUMANOS
184404849	15804034	VERONICA	BEATRIZ	ECHEVERRIA	BRICEÑO	CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	VECHEVERRIA@MPPEE.GOB.VE	APOYO PROFESIONAL	782	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184405821	9287296	RAFAEL	ERNESTO	LEAL	MARTINEZ	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	LEAL3112@GMAIL.COM	APOYO TECNICO	820	2	92	TECNICO	28	OFICINA DE SEGURIDAD INTEGRAL
184404550	26625416	BRIAN	RAFAEL	PEREZ	ASTUDILLO	EGRESADOS	OFICINA DE RECURSOS HUMANOS		CHOFER	38	4	24	OBRERO	141	OFICINA DE RECURSOS HUMANOS
184403159	14045465	YIPSI	NACARI	HENRIQUEZ	ROJAS	CONTRATADO	AREA DE SEGUIMIENTO Y EVALUACION DE POLÍTICAS PÚBLICAS	yhenriquez@mppee.gob.ve	APOYO TECNICO	690	2	92	TECNICO	28	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184403508	11841544	TANIA		MARQUEZ	MONTILVA	EMPLEADO FIJO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	TMARQUEZ@MPPEE.GOB.VE	PROFESIONAL I	600089	2	35	PROFESIONAL	12	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184402919	11225699	ILIANETT	ELOINA	QUIROGA	CEBAN	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	iquiroga@mppee.gob.ve	PROFESIONAL III	700026	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184400022	20745659	MARIO	ENRIQUE	ALVAREZ	CUELLO	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	MARIO-ALVAREZ_37@HOTMAIL.COM	PASANTE TECNICO	38	2	92	TECNICO	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184401761	4769443	DIANA		QUIROS	ANCHETTA	PENSIONADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	DQUIROS@MPPEE.GOB.VE	INCAPACITADO	1	1	102	PENSIONADOS	43	OFICINA DE RECURSOS HUMANOS
184402336	12561778	ROBERTO	ANTONIO	RODRIGUEZ		OBRERO FIJO	AREA DE SERVICIOS GENERALES	RRODRIGUEZ@MPPEE.GOB.VE	ASEADOR	127	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405215	7982881	AMADO 	ANTONIO	ESCALONA	GONZALEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	AESCALONA201@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	201	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184406020	15791720	YEXENIA	MARGARITA 	MORENO	MOGOLLON	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	YMMORENO@MPPEE.GOB.VE	PROFESIONAL I	173	1	35	PROFESIONAL	22	OFICINA DE SEGURIDAD INTEGRAL
3614	6450852	MARITZA	DEL CARMEN	TORRES	ALVAREZ	EMPLEADO FIJO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	MTORRES@MPPEE.GOB.VE	BACHILLER III	300001	1	93	ADMINISTRATIVO	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184403068	21013287	GABRIEL	ALFREDO	SANCHEZ	RIVERO	PASANTE	AREA DE ASUNTOS INTERNACIONALES		PASANTE TECNICO	97	2	92	TECNICO	62	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
3595	7118182	VANNIE	MARGARITA	VIVAS	OROPEZA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	VVIVAS@MPPEE.GOB.VE	BACHILLER II	200021	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405477	16259845	DAVID	JONATAN	CHACON	SANCHEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2811	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405431	18676755	GABRIEL	ANTONIO	FRIAS	BASTARDO	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	GABRIELWIN0.1@GMAIL.COM	APOYO ADMINISTRATIVO	810	1	93	ADMINISTRATIVO	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184401837	14743854	ERICA	ELIZABETH	BARRIOS	MENDOZA	CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	EBARRIOS@MPPEE.GOB.VE	APOYO TECNICO	568	2	92	TECNICO	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184400570	15999229	ROSA	MARIA 	GALEANO	URRUTIA 	ALTO NIVEL Y/O CONFIANZA	OFICINA DE RECURSOS HUMANOS	RGALEANO@MPPEE.GOB.VE	DIRECTOR	2697	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184400020	18184487	ONAXY	ALEXANDER	MALAVE	FIGUERA	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	ONAXY.MALAVE@GMAIL.COM	PASANTE PROFESIONAL	36	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403931	6968338	ANGEL	ENRIQUE	ARISTIGUETA	ESCOBAR	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	AARISTIGUETA@MPPEE.GOB.VE	ESCOLTA	161	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184405661	10684313	SANTIAGO		PEREZ	BELEÑO	ALTO NIVEL Y/O CONFIANZA	OFICINA DE RECURSOS HUMANOS		DIRECTOR	9950021	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184402987	5000792	ZENAIDA	MARGARITA	HERNANDEZ	MONTES DE OCA	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	zhernandez@mppee.gob.ve	PROFESIONAL III	800011	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405187	4713714	MARITZA	YSABEL	ALVAREZ		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MALVAREZ203@MPPEE.GOB.VE	ASEADOR	173	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398421	16310951	JUAN	BAUTISTA	ZAMBRANO	VERNAY	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	ZAMBRANOVERNAY@GMAIL.COM	TECNICO I	52	2	92	TECNICO	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184400662	11111081	MARIA	ALEJANDRA	GUTIERREZ		OBRERO FIJO	AREA DE COMPRAS	MGUTIERREZ@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	29	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398612	16416065	PEDRO	ANTONIO	OCANTO	BILINSKIJ	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	PEDROOCANTO1@GMAIL.COM	APOYO PROFESIONAL	242	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184405953	3524662	GUSTAVO	ENRIQUE	CAÑIZALES		CONTRATADO	DIRECCION ESTADAL (MERIDA)		APOYO ADMINISTRATIVO	824	1	93	ADMINISTRATIVO	28	DIRECCIONES ESTADALES
184400217	8000211	JULIO	ANTONIO	RUIZ	DUGARTE	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	JRUIZO@CANTV.NET	PROFESIONAL III	82	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397003	8532668	DOUGLAS		SANCHEZ	VASQUEZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	DSANCHEZ@MPPEE.GOB.VE	DIRECTOR GENERAL	2646	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE RECURSOS HUMANOS
184402452	7967994	JOSE	LUIS	URRIBARRI	VERA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JURRIBARRI@MPPEE.GOB.VE	SUPERVISOR DE SEGURIDAD	143	4	111	OBRERO SUPERVISOR	13	OFICINA DE SEGURIDAD INTEGRAL
184397955	17251492	JOSE	RAFAEL	SILVA	LOPEZ	CONTRATADO	AREA DE COMPRAS	JSILVA@MPPEE.GOB.VE	APOYO TECNICO	158	2	92	TECNICO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184404007	18014486	JAVIER	ALEXANDER	ACOSTA	SISO	CONTRATADO	CENTRO NACIONAL DE DESPACHO	JAVIERACOSTA928@HOTMAIL.COM	APOYO TECNICO	721	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184400278	18677907	CARLA	DANIELA	PRIETO	VERA	SUPLENTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA		BACHILLER I	4	1	93	ADMINISTRATIVO	73	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184401189	17387059	YOLIMAR	ALEJANDRA	GARCIA	BRICEÑO	SUPLENTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	YOLINACHO@HOTMAIL.COM	BACHILLER I	8	1	93	ADMINISTRATIVO	73	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400544	6340911	ARELIS	ISABEL	SUAREZ	GUTIERREZ	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	SUAREZISABEL@CANTV.NET	ASISTENTE	2716	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184389921	14927403	MARIA	ISABEL	MARIN	FLORES	EMPLEADO FIJO	CONSULTORIA JURIDICA	MMARIN@MPPEE.GOB.VE	PROFESIONAL I	600044	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184402994	6904397	RUBEN	ENRIQUE	GONZALEZ	FLORES	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	REGONZALEZ@MPPEE.GOB.VE	BACHILLER III	132	1	93	ADMINISTRATIVO	22	OFICINA DE SEGURIDAD INTEGRAL
184397310	6968797	CLERIEM	ALDORIS	RIVAS	DIAZ	CONTRATADO	DIRECCION GENERAL DE PARTICIPACION POPULAR		APOYO ADMINISTRATIVO	23	1	93	ADMINISTRATIVO	28	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184398573	7413213	YELITZA	JOSEFINA	MANFREY		COMISION DE SERVICIOS Y/O ENCARGADURIA	AREA DE INFORMACION Y DIVULGACION AL CIUDADANO	YMANFREY@MPPEE.GOB.VE	COORDINADOR	56	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE ATENCIÓN AL CIUDADANO
184403075	4116203	JUAN 	CARLOS	GONZALEZ	MOLINERO	ALTO NIVEL Y/O CONFIANZA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JGONZALEZM@MPPEE.GOB.VE	DIRECTOR GENERAL	2759	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184400660	10811220	LUIS	RAMON	RUGGIERO	ÁLVAREZ	OBRERO FIJO	AREA DE COMPRAS	LRUGGIENO@MPPEE.GOB.VE	CHOFER	27	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403677	17406593	LEON	FRANCISCO	FIGUEROA	ESTRELLA	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	LFIGUEROA@MPPEE.GOB.VE	BACHILLER II	200037	1	93	ADMINISTRATIVO	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184402279	6185419	VICTOR	BONIFACIO	LAZO	BORGES	OBRERO FIJO	AREA DE SERVICIOS GENERALES	VLAZO@MPPEE.GOB.VE	MENSAJERO	120	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405893	18222683	YARITZA	CAROLINA	MENDOZA	ESCOBAR	PASANTE	OFICINA DE RECURSOS HUMANOS	YARIANI33@HOTMAIL.COM	PASANTE TECNICO	177	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184404569	6427821	CARMEN	ELOINA	DIAZ	GARCIA	EGRESADOS	OFICINA DE RECURSOS HUMANOS	CEDIAZ@MPPEE.GOB.VE	DIRECTOR ADJUNTO	57	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184400683	14857486	CARMEN	YILBARY	TORREALBA	RODRIGUEZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	CTORREALBA@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	50	4	111	OBRERO SUPERVISOR	13	OFICINA DE SEGURIDAD INTEGRAL
184400141	18734867	BETZAIDA 	DEL VALLE	GRATEROL 	GONZALEZ	PASANTE	DIRECCION GENERAL DE PARTICIPACION POPULAR		PASANTE PROFESIONAL	49	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184403512	12057575	TREMEY	ANTONIO	GONZALEZ	LA CRUZ	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	TGONZALEZ@MPPEE.GOB.VE	TECNICO II	500018	2	92	TECNICO	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397971	13969031	DAYANA 	CAROLINA	SOSA	CEDEÑO	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	DSOSA@MPPEE.GOB.VE	ASISTENTE	2689	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE SEGURIDAD INTEGRAL
184397556	4435493	LOURDES	ELENA	PEREZ	MARTINEZ	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	LPEREZ@MPPEE.GOB.VE	PROFESIONAL II	700067	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184401111	19852542	NAHONY	ALEJANDRA	JAIMES	PRINCIPAL	PASANTE	AUDITORIA INTERNA		PASANTE PROFESIONAL	58	2	35	PROFESIONAL	62	AUDITORÍA INTERNA
184399099	16115822	MADELEIN	FABIOLA 	SUAREZ	BAGNAROL	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	msuarez@mppee.gob.ve	APOYO PROFESIONAL	323	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404517	6810892	ERWIN	JOHANNES	MULLER	NAVARRO	EGRESADOS	OFICINA DE RECURSOS HUMANOS	EMULLER@MPPEE.GOB.VE	DIRECTOR	5	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184397602	20128991	HECTOR	LUIS	APONTE	UZCATEGUI	CONTRATADO	OFICINA DE RECURSOS HUMANOS		AYUDANTE DE SERVICIOS GENERALES	79	4	24	OBRERO	28	OFICINA DE RECURSOS HUMANOS
184404572	10111892	ROSANGEL		ACEVEDO	DE ALVARADO	EGRESADOS	OFICINA DE RECURSOS HUMANOS	RACEVEDO@MPPEE.GOB.VE	COORDINADOR	60	0	39	COORDINADOR	141	OFICINA DE RECURSOS HUMANOS
184401255	6450926	FELIX	RENE	COLMENARES	LOPEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL	FCOLMENARES@MPPEE.GOB.VE	HONORARIO PROFESIONAL	2757	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184401276	16626652	JOELVIS	DEL JESUS	RAMIREZ	CARRERA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JRAMIREZ@MPPEE.GOB.VE	SUPERVISOR DE SEGURIDAD	110	4	111	OBRERO SUPERVISOR	13	OFICINA DE SEGURIDAD INTEGRAL
184403457	6291754	ANGELA 	MARIA	BENCOMO	MENDEZ	EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	ABENCOMO@MPPEE.GOB.VE	TECNICO II	500025	2	92	TECNICO	12	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184402986	4262191	BEATRIZ	ELVIRA	NOVELLINO	GILLY	EMPLEADO FIJO	AUDITORIA INTERNA	bnovellino@mppee.gob.ve	PROFESIONAL II	700142	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184404001	18159054	MARVALDI	JOSE	GONZALEZ	GONZALEZ	CONTRATADO	CENTRO NACIONAL DE DESPACHO	MJGENLASES27@HOTMAIL.COM	APOYO TECNICO	715	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184402016	8611963	LEDYS	YUMIRY	FIGUEROA 	COLMENARES	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO		APOYO PROFESIONAL	591	1	35	PROFESIONAL	28	OFICINA DE ATENCIÓN AL CIUDADANO
184405462	13231830	NESTOR		NIÑO		PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2796	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403639	16537624	ANALI	MARIA	HERNANDEZ	GIL	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	amhernandez@mppee.gob.ve	PROFESIONAL I	600211	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184404771	8894729	NINOSKA 	MERCEDES	DIAZ	CAMPO	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	NDIAZ@MPPEE.GOB.VE	BACHILLER II	800149	1	93	ADMINISTRATIVO	12	OFICINA DE RECURSOS HUMANOS
184401035	18529628	ELSY	LAILAI	ANGULO	VEGAS	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	ELSY_AV20@HOTMAIL.COM	PASANTE PROFESIONAL	54	2	35	PROFESIONAL	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405063	19879313	GABRIELA	JOSE	TORRES	MANZANAREZ	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	G.TORRES1190@GMAIL.COM	APOYO PROFESIONAL	805	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184403733	15220286	GUSTAVO	JOSE	DELGADO	RODRIGUEZ	EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	GJDELGADO@MPPEE.GOB.VE	PROFESIONAL I	600077	2	35	PROFESIONAL	12	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184398790	8143914	ESTEBAN	DE JESUS	CASTELLANOS	GIL	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	ECASTELLANO@MPPEE.GOB.VE	APOYO PROFESIONAL	270	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405453	11477751	YONNY	RAMON	SANCHEZ	LUGO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2787	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404190	6055847	JOSE	GREGORIO	ZERPA		OBRERO FIJO	DESPACHO DEL MINISTRO	JZERPA@MPPEE.GOB.VE	ESCOLTA	165	4	24	OBRERO	13	DESPACHO DEL MINISTRO
184404617	13801289	VANESSA	DEL VALLE	CELIS	VELASQUEZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS	VANECELIS@HOTMAIL.COM	APOYO TECNICO	768	2	92	TECNICO	28	OFICINA DE RECURSOS HUMANOS
184403641	16555108	ARMIN	RODOLFO	KESSLER	ZAMORA	EMPLEADO FIJO	DESPACHO DEL MINISTRO	akessler@mppee.gob.ve	PROFESIONAL I	600177	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184400657	10543972	WILMER	ENRIQUE	RODRIGUEZ	COCHO	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	WRODRIGUEZ@MPPEE.GOB.VE	VIGILANTE	24	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403071	14141320	JOHANN	ENRIQUE	MARTINEZ	SANCHEZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS	jmartinez@mppee.gob.ve	APOYO PROFESIONAL	672	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184405668	11932423	EDGARDO	RAMON	VALERA	BENAVIDES	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO		ESCOLTA	54	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184404064	14909175	ANA	JACQUELINE	DUQUE	HERNANDEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	aduque@mppee.gob.ve	AUXILIAR DE SERVICIOS DE OFICINA	162	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400027	3764072	MANUEL	ANTONIO	HERNANDEZ	SALAZAR	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	MAHERNANDEZ@MPPEE.GOB.VE	PROFESIONAL II	73	1	35	PROFESIONAL	22	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184405288	18755116	VICTOR	OSCAR	GONZALEZ	OLIVARES	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	VGONZALEZ@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	274	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184393730	12393378	CHARLEE	WLADIMIR	ROBLES	GUILLEN	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	CROBLES@MPPEE.GOB.VE	PROFESIONAL II	700086	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184397890	6089088	JHONY	RAFAEL	ROMERO	PERALTA	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	JROMERO@MPPEE.GOB.VE	PROFESIONAL III	800089	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184397061	4300829	SIMON	ANTONIO	BOADA	BONILLO	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION		DIRECTOR GENERAL	2650	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184401187	17014227	DARWIN	ANTHONIEL	EGOAVIL	CABEZA	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	DEGOAVIL@MPPEE.GOB.VE	APOYO TECNICO	488	2	92	TECNICO	28	OFICINA DE SEGURIDAD INTEGRAL
184401271	5896710	RAUL	JOSE	LOPEZ	SILVIO	ALTO NIVEL Y/O CONFIANZA	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION		DIRECTOR	2729	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184406021	11671526	JAIME	MANUEL	DE OLIVEIRA	CORREIA	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	JDEOLIVEIRA@MPPEE.GOB.VE	PROFESIONAL III	174	1	35	PROFESIONAL	22	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403156	12293803	MAIRYM	ARIADNA	MARQUEZ	MONTES DE OCA	CONTRATADO	DESPACHO DEL MINISTRO	MAIRYMMARQUEZ@YAHOO.ES	APOYO PROFESIONAL	687	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184405475	15653792	FREDDY	ALBERTO	BOTIN	LOPEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2809	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184400711	6347884	JOSE	RAMON	PALACIOS	MADERA	OBRERO FIJO	AREA DE COMPRAS	JRPALACIOS@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	14	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403213	19452302	WILLY	JESUS	GRANADOS	MORA	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	WILLYJMORA20@HOTMAIL.COM	PASANTE TECNICO	100	2	92	TECNICO	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404845	17720141	VANESSA	CAROLINA	BOLAÑO	TORO	CONTRATADO	OFICINA DE RECURSOS HUMANOS	VBOLANO@MPPEE.GOB.VE	APOYO TECNICO	778	2	92	TECNICO	28	OFICINA DE RECURSOS HUMANOS
184405210	6493132	VICTOR	MANUEL	TOVAR	SALAZAR	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	VTOVAR200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	196	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400675	13909125	DAVID	ALEXANDER	BONALDE	LOZADA	OBRERO FIJO	AREA DE COMPRAS	DBONALDE@MPPEE.GOB.VE	CHOFER	42	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400219	11774660	MARIA	SUSANA	GOMEZ	NUÑEZ	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL MINISTRO	SGOMEZ@MPPEE.GOB.VE	DIRECTOR ADJUNTO	9930002	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL MINISTRO
184401573	3027110	HOMERO	JOSE	ESPAÑOL	HERNANDEZ	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	HESPANOL@MPPEE.GOB.VE	PROFESIONAL III	800069	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184396061	6905230	ANA 	MARCELINA	PEDRAZA 	DURAN 	EMPLEADO FIJO	CONSULTORIA JURIDICA	APEDRAZA@MPPEE.GOB.VE	BACHILLER I	100027	1	93	ADMINISTRATIVO	12	CONSULTORÍA JURIDICA
184400661	10898867	CARMEN	TERESA	ESCALANTE	SERRANO	OBRERO FIJO	AREA DE COMPRAS	CESCALANTE@MPPEE.GOB.VE	COCINERO	28	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399781	3555645	JESUS	RAFAEL	VILLARROEL		OBRERO-CONTRATADO	OFICINA DE RECURSOS HUMANOS		OFICIAL DE SEGURIDAD	188	4	24	OBRERO	92	OFICINA DE RECURSOS HUMANOS
184405461	13149251	HUGO	ENRIQUE	PARRA 	MARTINEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2795	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184398591	12105217	RAMÓN	ABELARDO	ESPINOZA	GODOY	HONORARIOS PROFESIONALES	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	2715	1	35	PROFESIONAL	53	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184404264	20572320	NORELYS	ALEJANDRA	SANCHEZ	URDANETA	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	nsanchez@mppee.gob.ve	APOYO PROFESIONAL	734	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184397977	4478127	LUIS	EDGARDO	SANCHEZ	RIOS	EMPLEADO FIJO	AREA DE COMPRAS	LSANCHEZ@MPPEE.GOB.VE	DIRECTOR	2692	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184405442	8678408	IRIS		AKEL 	UZCATEGUI	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2776	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405496	19930364	JESUS 	ALI	MARRERO	DAVILA	PASANTE	AUDITORIA INTERNA	JESUS_ALI_MARRERO_20@HOTMAIL.COM	PASANTE TECNICO	152	2	92	TECNICO	62	AUDITORÍA INTERNA
184401306	18146209	CARLOS 	EDGAR	ESTEVEZ	GOMEZ	CONTRATADO	CONSULTORIA JURIDICA	cestevez@mppee.gob.ve	APOYO PROFESIONAL	505	1	35	PROFESIONAL	28	CONSULTORÍA JURIDICA
184403818	10508423	HILDA 	ROSARIO	OCCHIPINTI	LAMAS	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	hocchipinti@mppee.gob.ve	DIRECTOR GENERAL	127	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184396351	13382514	YELITZA	DEL CARMEN	MOSQUERA		EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	YMOSQUERA@MPPEE.GOB.VE	PROFESIONAL II	700078	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184399351	20821341	ALEJANDRA	NATALY	JIMENEZ	ORTA	PASANTE	OFICINA DE RECURSOS HUMANOS	ANJIMENEZ@MPPEE.GOB.VE	PASANTE TECNICO	22	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184400025	19387276	ROTSENY	MERCEDES	PEREZ	PEREZ	PASANTE	OFICINA DE RECURSOS HUMANOS		PASANTE PROFESIONAL	41	2	35	PROFESIONAL	62	OFICINA DE RECURSOS HUMANOS
184400777	16115822	MADELEIN	FABIOLA 	SUAREZ	BAGNAROL	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	msuarez@mppee.gob.ve	APOYO PROFESIONAL	451	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184405266	16033735	DOUGLAS	JOSE	MIJARES	RIVAS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	DMIJARES201@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	252	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401903	13985858	ALIS	ANTONIO	PALACIOS	PARRA	CONTRATADO	DIRECCION DEL DESPACHO	ALISPALACIOS@HOTMAIL.COM 	APOYO ADMINISTRATIVO	574	1	93	ADMINISTRATIVO	28	DIRECCIÓN DEL DESPACHO
184398420	13253543	YOVANA	PATRICIA	VARGAS	CUADRADO	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	VARGASYOVANA@GMAIL.COM	PROFESIONAL I	51	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184404578	15999229	ROSA	MARIA 	GALEANO	URRUTIA 	EGRESADOS	OFICINA DE RECURSOS HUMANOS	RGALEANO@MPPEE.GOB.VE	DIRECTOR	66	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184405128	25626709	FRANYEL	YOCE	BLANCO	ESQUEDA	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	FRANYEL.BLANCO@HOTMAIL.COM	PASANTE BACHILLER	142	1	33	BACHILLER	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184406036	14919971	EDYMAR	DEL VALLE	SILVA	CASTEL	CONTRATADO	OFICINA DE RECURSOS HUMANOS	EDYMARSILVA77@HOTMAIL.COM	APOYO TECNICO	829	2	92	TECNICO	28	OFICINA DE RECURSOS HUMANOS
184399280	15024572	JOSE	VICENTE	ANELLI	REYES	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	2727	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184401023	5579499	SUSANA	ANTONIA	TREJO	TOVAR	OBRERO FIJO	AREA DE COMPRAS	STREJO@CANTV.NET	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	106	4	111	OBRERO SUPERVISOR	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405243	12958407	ANGELICA	MARIA	GARCIA	URDANETA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	AGARCIA210@MPPEE.GOB.VE	ASEADOR	229	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405723	18989920	YACKSON	LEANDRO	CONTRERAS 	CAMARGO	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO		ESCOLTA	59	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184402727	16226400	CARLA	KARINA 	ZAMBRANO	VAN BOCHOVE	CONTRATADO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	CARLAZVB82@HOTMAIL.COM	APOYO PROFESIONAL	651	1	35	PROFESIONAL	28	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184405502	16074890	MEIBER	ANDREINA	OSORIO	PIÑERO	SUPLENTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA		BACHILLER II	11	1	93	ADMINISTRATIVO	73	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405296	20692947	MOISES	JORGE	CANO	ROMERO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MCANO@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	282	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404526	6129289	LUIS 	GREGORIO	GRAU	CAÑAS	EGRESADOS	OFICINA DE RECURSOS HUMANOS	LUIS.GRAU@LAEDC.COM.VE	PROFESIONAL III	14	2	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184401365	16663312	FRANCIS	DEL CARMEN	SANTIAGO	CERMEÑO	CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	SANTIAGOCFC@GMAIL.COM	APOYO PROFESIONAL	511	1	35	PROFESIONAL	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184400665	12561112	FREDDY	ROMAN	SANCHEZ	HERNANDEZ	OBRERO FIJO	AREA DE COMPRAS	FSANCHEZ@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	32	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402630	15870969	JUAN	MANUEL	RODRIGUEZ	DAVILA	CONTRATADO	DESPACHO DEL MINISTRO		APOYO PROFESIONAL	624	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184403211	16878091	PEDRO	GABRIEL	ROJAS	MENDOZA	CONTRATADO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	PROJAS@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	692	1	93	ADMINISTRATIVO	28	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184400142	18692513	BELKIS	KATHERINE	CAÑIZALEZ	TORRELLAS	PASANTE	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	KATHERIN5190@HOTMAIL.COM	PASANTE TECNICO	50	2	92	TECNICO	62	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405234	11197711	JHESY	WELANEC	VELIZ	RODRIGUEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JVELIZ200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	220	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399294	12044840	FRANCOISE	NINOSKA	ESCOBAR	GARCIA	CONTRATADO	AUDITORIA INTERNA	FESCOBAR@MPPEE.GOB.VE	APOYO PROFESIONAL	340	1	35	PROFESIONAL	28	AUDITORÍA INTERNA
184404831	3437254	CARLOS	RAFAEL	LANZ	RODRIGUEZ	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL MINISTRO	CLANZ@MPPEE.GOB.VE	COORDINADOR	9950004	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL MINISTRO
184399692	17120050	JHONATHAN	JOSE	SANCHEZ	IBARRA	CONTRATADO	AREA DE SEGUIMIENTO DE GESTION		APOYO PROFESIONAL	388	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184401832	17775326	LUISA	ELIBETH	DE CAIRES	GONZALEZ	CONTRATADO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	LUISADECAIRES@HOTMAIL.COM	APOYO PROFESIONAL	563	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184398122	15670350	RAIBEL	MARIA	BUITRIAGO	PEREZ	CONTRATADO	AREA DE GESTION DE PROGRAMAS ESPECIALES	RBUITRIAGO@MPPEE.GOB.VE	APOYO PROFESIONAL	183	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184404339	18739588	JESUS	ALEJANDRO	CARRILLO 	OROPEZA	CONTRATADO	CENTRO NACIONAL DE DESPACHO	jcarrillo201@mppee.gob.ve	APOYO TECNICO	747	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184405370	9675640	ALEXANDER	GONZALO	BERMUDEZ	MARTINEZ	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	AREA DE PROTECCION Y RESGUARDO	ALEXBER70@HOTMAIL.COM	COORDINADOR	139	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SEGURIDAD INTEGRAL
184400950	19015713	KELLY	ALEJANDRA	VALENZUELA	MARIN	CONTRATADO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	kvalenzuela@mppee.gob.ve	APOYO PROFESIONAL	452	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184406032	10336411	HELIOCRATES		ADARMES	VELASCO	ALTO NIVEL Y/O CONFIANZA	CONSULTORIA JURIDICA	HELIOCRATES1@@GMAIL.COM	COORDINADOR	9950036	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	CONSULTORÍA JURIDICA
184405741	3799050	PETRA	MARIA	ANGULO	GARCIA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	PANGULO@MPPEE.GOB.VE	PROFESIONAL III	163	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184399831	13074547	MILDRED	JOSEFINA	GONZALEZ	RODRIGUEZ	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	MJGONZALEZ@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	397	1	93	ADMINISTRATIVO	28	OFICINA DE SEGURIDAD INTEGRAL
184403475	7661558	DOUGLAS	ADOLFO	CASTILLO	NIÑO	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	dcastillo@mppee.gob.ve	BACHILLER I	100002	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403604	15533613	HILGRE	LEONOR	SEQUERA	HERNANDEZ	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	hsequera@mppee.gob.ve	PROFESIONAL I	600029	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184402272	16216028	JORGE 	LUIS	MARTINEZ	CHIRGUITA	CONTRATADO	DIRECCION DEL DESPACHO	JLMARTINEZ@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	619	1	93	ADMINISTRATIVO	28	DIRECCIÓN DEL DESPACHO
184404841	13231870	ADRIANA	BERENICE	RAMOS	MATERAN	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	ADRIANARAMOSMATERAN@GMAIL.COM	APOYO PROFESIONAL	774	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403934	84487566	LIKZA	DESIREE	SOSA	HERNANDEZ	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	LITZA_SOSA@YAHOO.COM	APOYO PROFESIONAL	702	1	35	PROFESIONAL	28	OFICINA DE ATENCIÓN AL CIUDADANO
184403516	12210879	DARWIN	AGLAIS	PADRINO	QUIROGA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	DPADRINO@MPPEE.GOB.VE	TECNICO II	500011	2	92	TECNICO	12	OFICINA DE RECURSOS HUMANOS
184403740	13892214	ANDRES	ELOY	DELGADO	TORRES	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	ADELGADO@MPPEE.GOB.VE	PROFESIONAL I	600079	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403541	13615389	LILIANA	YUXIBET	ECHEZURIA	DE BERROTERAN	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	LECHEZURIA@MPPEE.GOB.VE	PROFESIONAL III	800083	2	35	PROFESIONAL	12	OFICINA DE ATENCIÓN AL CIUDADANO
184392586	14759455	CARLOS	EDUARDO	CEBALLOS	PEREZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	CCEBALLOS@MPPEE.GOB.VE	PROFESIONAL II	700098	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184402649	6120021	VLADIMIR	JOSE	ACOSTA	SARACHE	CONTRATADO	AREA DE RELACIONES INSTITUCIONALES	vacosta@mppee.gob.ve	APOYO ADMINISTRATIVO	639	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405069	14745080	JOSE 	GREGORIO	DE SOUSA	COSTA	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	JDESOUSA@MPPEE.GOB.VE	COORDINADOR	132	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184400720	18714740	CHARLES	RAMON	VICENT	VAZQUEZ	OBRERO FIJO	AREA DE COMPRAS	CVICENT@MPPEE.GOB.VE	CHOFER	70	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403625	16179823	OFELIA		CLEMENTE	GARCIA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	OCLEMENTE@MPPEE.GOB.VE	PROFESIONAL I	600058	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184404776	6439318	CLARET	DEL VALLE	APONTE	DÍAZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	CLARET_APONTE@HOTMAIL.COM	TECNICO I	800152	2	92	TECNICO	12	OFICINA DE RECURSOS HUMANOS
184399837	16936889	RENNY	JESUS	MARTINEZ	GUTIERREZ	OBRERO-CONTRATADO	AREA DE COMPRAS	RJMARTINEZ@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	434	4	24	OBRERO	92	OFICINA DE GESTIÓN ADMINISTRATIVA
184397903	11288895	TERESA	SOFIA	SANDOVAL	OCANDO	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	SANDOVALTERESA@HOTMAIL.COM	COORDINADOR	20	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184389922	15200334	MORELLA	CAROLINA	GIL	ARIAS	EMPLEADO FIJO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	MGIL@MPPEE.GOB.VE	PROFESIONAL II	700087	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184401294	13834114	ISAMAR	EUGENIA	LOPEZ 	DE RUGGIERO	CONTRATADO	DIRECCION GENERAL DE PARTICIPACION POPULAR	ILOPEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	502	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184403706	18396407	DIANA	CAROLINA	ARIAS	VELASQUEZ	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	DARIAS@MPPEE.GOB.VE	PROFESIONAL I	600062	2	35	PROFESIONAL	12	OFICINA DE ATENCIÓN AL CIUDADANO
184401258	16472109	BEBERLY		MORENO	HERNANDEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2760	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403708	18633499	CHRISTIAN 	ANTONIO	FAYAD		EMPLEADO FIJO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	CFAYAD@MPPEE.GOB.VE	PROFESIONAL I	600121	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184405127	19797578	CARLOS	JOSE	LOPEZ	UGUETO	PASANTE	OFICINA DE SEGURIDAD INTEGRAL	CARLOS_LOPEZ_206@HOTMAIL.COM	PASANTE PROFESIONAL	141	2	35	PROFESIONAL	62	OFICINA DE SEGURIDAD INTEGRAL
184403877	5708007	GUILLERMO	JESUS	MORALES		EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	gmorales@mppee.gob.ve	PROFESIONAL I	600032	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
3564	13246300	MARYELING	MERCEDES	REINALES	PEÑA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	MREINALES@MPPEE.GOB.VE	BACHILLER I	100013	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398367	12420138	ALEXIS	ENRIQUE	BRAVO  	QUEVEDO	COMISION DE SERVICIOS Y/O ENCARGADURIA	AREA DE BIENESTAR SOCIAL	ABRAVO@MPPEE.GOB.VE	TECNICO II	48	2	92	TECNICO	22	OFICINA DE RECURSOS HUMANOS
184404921	13944505	JANNELLE	CAROLINA	PEREZ	PEREZ	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JCPEREZ@MPPEE.GOB.VE	TECNICO I	800154	2	92	TECNICO	12	OFICINA DE SEGURIDAD INTEGRAL
184400706	5891501	WILLIAM		MARTIN	RANGEL	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	WMARTIN@MPPEE.GOB.VE	VIGILANTE	9	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403545	13858090	LUIS 	MANUEL	FERNANDEZ	CAMERO	EMPLEADO FIJO	AUDITORIA INTERNA	LFERNANDEZ@MPPEE.GOB.VE	PROFESIONAL I	600037	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184402999	17920819	NICOLAS	ANTONIO	ESPITIA	CASTILLO	CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	SPIT.DESIGNING@GMAIL.COM	APOYO ADMINISTRATIVO	667	1	93	ADMINISTRATIVO	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184390628	6363024	HENRY	TAYLOR	CARRERO	BETANCOURT	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	HCARRERO@MPPEE.GOB.VE	PROFESIONAL III	800071	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184405438	7246940	EMIR	ANTONIO	ROMERO	SOSA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2772	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405654	19734563	OSCAR	ERNESTO	GARCÍA	GONZALEZ	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	OSCARGARCÍA_GE@HOTMAIL.COM	PASANTE PROFESIONAL	167	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400751	5263784	EUGENIO	LEOPOLDO	GARCIA	TORRES	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	EGARCIA@MPPEE.GOB.VE	PROFESIONAL III	85	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403938	3527984	COROMOTO		MENDOZA 	GOMEZ	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	COROMENGO@HOTMAIL.COM	APOYO PROFESIONAL	706	1	35	PROFESIONAL	28	OFICINA DE ATENCIÓN AL CIUDADANO
184403599	15421882	EDUARDO	MANUEL	MORALES	JUAREZ	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	EMORALES@MPPEE.GOB.VE	PROFESIONAL I	600072	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184402991	7116432	CECILIA	INES	GUERRA	FUENTES	ALTO NIVEL Y/O CONFIANZA	OFICINA DE RECURSOS HUMANOS	cguerra@mppee.gob.ve	COORDINADOR	2758	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184403678	17423401	OSCAR	ALBERTO	ROMERO	AZUAJE	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	oromero@mppee.gob.ve	PROFESIONAL I	600214	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403693	17862193	FRANCY	YORLEY	GUERRERO	CHACON	EMPLEADO FIJO	DIRECCION DEL DESPACHO	FGUERRERO@MPPEE.GOB.VE	PROFESIONAL I	600005	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184400890	12279352	JOSE 	EUGENIO	PARRA 	ROQUE	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JPARRA@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	96	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405501	16523834	JANLISBERT		VELASCO		ALTO NIVEL Y/O CONFIANZA	OFICINA DE RECURSOS HUMANOS	JANLISBERT@HOTMAIL.COM	COORDINADOR	9950015	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184405627	17563780	MAIKO	OVIDIO	OLIVEROS 	HERNANDEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2825	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405258	15240675	ROSELY	TERESA	BOHORQUEZ	ARRAIZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RBOHORQUEZ@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS DE COCINA	244	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404570	9602447	KRUSCAYA	MARIA	LOPEZ	MARTI	EGRESADOS	OFICINA DE RECURSOS HUMANOS	KLOPEZ@MPPEE.GOB.VE	DIRECTOR	58	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184403155	18488300	FRANCISCO	JAVIER	TORRES	FELIPE	CONTRATADO	DESPACHO DEL MINISTRO	FRAN_FJTF@HOTMAIL.COM	APOYO PROFESIONAL	686	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184397744	13556586	ALICIA	MARIA	DE SOUSA	CHAPELLIN	CONTRATADO	AREA DE CORRESPONDENCIA Y ARCHIVO	ADESOUSA@MPPEE.GOB.VE	APOYO PROFESIONAL	104	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184397452	4847076	ELSA	MARGARITA	SOTO	ESCALONA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	ESOTO@MPPEE.GOB.VE	PROFESIONAL II	700074	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184404519	11309043	LUIS	ERNESTO	VERDE	GOMEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	LVERDE@MPPEE.GOB.VE	COORDINADOR	7	0	39	COORDINADOR	141	OFICINA DE RECURSOS HUMANOS
184402666	19290653	JESUS	GABRIEL	RIVERO	HERNANDEZ	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA		PASANTE PROFESIONAL	90	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184400680	14240060	ARELIS	MARIA	URRUTIA	PEREZ	OBRERO FIJO	AREA DE COMPRAS	AURRUTIA@MPPEE.GOB.VE	COCINERO	47	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405211	6663414	WENDY	DEL VALLE	GONZALEZ	BARRIOS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	WGONZALEZ@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	197	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399699	15929711	MARELVY	ELVIRA	ARCE	SUAREZ	CONTRATADO	DIRECCION DEL DESPACHO	MARCE@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	395	1	93	ADMINISTRATIVO	28	DIRECCIÓN DEL DESPACHO
184406022	9065470	IDELINA	MARIA	GOMES	FERNANDES	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE GESTION ADMINISTRATIVA	IGOMES@MPPEE.GOB.VE	PROFESIONAL III	175	1	35	PROFESIONAL	22	OFICINA DE GESTIÓN ADMINISTRATIVA
184399896	6562897	FERNANDO	JOSE	TRAVIESO	LUGO	HONORARIOS PROFESIONALES	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL		HONORARIOS PROFESIONALES	2749	2	35	PROFESIONAL	53	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184403216	20409609	LUIS	EDUARDO	MARQUINA	LEON	PASANTE	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	lmarquina@mppee.gob.ve	PASANTE TECNICO	103	2	92	TECNICO	62	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184405509	10002199	JOSE	LUIS	SALAS	SOSA	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	JSALAS@MPPEE.GOB.VE	PROFESIONAL III	161	1	35	PROFESIONAL	22	OFICINA DE SEGURIDAD INTEGRAL
184400696	16952119	LUIS	ALBERTO	DIAZ	BELTRAN 	OBRERO FIJO	AREA DE COMPRAS	LADIAZ@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	63	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404253	8201856	LISBETH	MARIA	GARCIA	ESPINOZA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	lgarcia@mppee.gob.ve	PROFESIONAL III	800019	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184399012	26523811	MAURICIO		RODRIGUEZ	VALDES	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	MARODRIGUEZ@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	297	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184402638	4347658	HECTOR	ENRIQUE	CONSTANT	MACHADO	ALTO NIVEL Y/O CONFIANZA	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	HCONSTANT@MPPEE.GOB.VE	VICEMINISTRO	9950002	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184402854	10800843	ISBELYS	JOSEFINA	PANTOJA	UZCATEGUI	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	IPANTOJA@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	159	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398588	3969481	DAVID	EUGENIO	ZULETA	IBARGÜEN	HONORARIOS PROFESIONALES	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	2712	1	35	PROFESIONAL	53	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184402145	19498408	JACKELINE		TAPIA	RAMIREZ	PASANTE	DIRECCION GENERAL DE PARTICIPACION POPULAR		PASANTE PROFESIONAL	80	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184400548	9616770	ANDREA 		JIMENEZ	GUERRA	ALTO NIVEL Y/O CONFIANZA	AREA DE ANALISIS Y FORMULACION ESTRATEGICA	AJIMENEZ@MPPEE.GOB.VE	DIRECTOR GENERAL	2674	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184405950	13086125	ADRIANA	INDIRA	REYES	TORRES	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA		ASISTENTE	147	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184406106	16205617	YOHAN	ALEXIS	BOLÍVAR	GONZÁLEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL MINISTRO		PROFESIONAL I	181	1	35	PROFESIONAL	22	DESPACHO DEL MINISTRO
184401763	17586241	LUISA	ANDREINA	VELASQUEZ	ROMERO	CONTRATADO	DIRECCION ESTADAL (ZULIA)	lvelasquez@mppee.gob.ve	APOYO PROFESIONAL	557	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184404591	11163952	JEFRI	GERARDO	MORENO 	RADA	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	JMORENO@MPPEE.GOB.VE	PROFESIONAL II	800146	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184405067	19561167	MARIO	JOSE	ROSALES	MENDEZ	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	MARIOJRM_3120@HOTMAIL.COM	PASANTE PROFESIONAL	134	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398443	8179069	CARLOS		ACOSTA	ARANZAZU	HONORARIOS PROFESIONALES	OFICINA DE GESTION ADMINISTRATIVA		APOYO PROFESIONAL	6	1	35	PROFESIONAL	53	OFICINA DE GESTIÓN ADMINISTRATIVA
184403488	10335501	LILETTE	MERCEDES	PULIDO	GUIRADOS	EMPLEADO FIJO	AUDITORIA INTERNA	lpulido@mppee.gob.ve	PROFESIONAL II	700019	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184400725	19563313	MARILIN		DIAZ	YZARRA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	MDIAZ@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	75	4	111	OBRERO SUPERVISOR	13	OFICINA DE SEGURIDAD INTEGRAL
184400147	6340911	ARELIS	ISABEL	SUAREZ	GUTIERREZ	EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	SUAREZISABEL@CANTV.NET	ASISTENTE	2716	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184390629	11682500	DARWIN	ANTONIO	PLANES	ANDRADE	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	DPLANES@MPPEE.GOB.VE	PROFESIONAL I	600097	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405224	10091910	ROSA	ELENA	ESCALONA		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RESCALONA200@MPPEE.GOB.VE	ASEADOR	210	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399026	15804034	VERONICA	BEATRIZ	ECHEVERRIA	BRICEÑO	CONTRATADO	AUDITORIA INTERNA	VECHEVERRIA@MPPEE.GOB.VE	APOYO PROFESIONAL	303	1	35	PROFESIONAL	28	AUDITORÍA INTERNA
184400669	13307706	IGNACIO	ALBERTO 	POMBO	PEDROZA 	OBRERO FIJO	AREA DE COMPRAS	IPOMBO@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS INTERNOS	36	4	111	OBRERO SUPERVISOR	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401632	13242304	ANELIS	DEL VALLE	AGUILAR		CONTRATADO	DIRECCION ESTADAL (ZULIA)	aaguilar@mppee.gob.ve	APOYO PROFESIONAL	536	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184403652	16835042	HEBERT	ERNESTO	NAVA	BARRIOS	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	hnava@mppee.gob.ve	PROFESIONAL I	600144	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184401277	5520466	JULIO	ALBERTO	YEPEZ	CASTRO	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL		DIRECTOR GENERAL	99	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE SEGURIDAD INTEGRAL
184403212	18366406	IRVING	YEFERSSON	VITALI	LEON	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	IRVINGVITALI@HOTMAIL.COM	PASANTE PROFESIONAL	99	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404868	6353851	RODOLFO	VALENTINO	GONZALEZ	RODRIGUEZ	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	RVGONZALEZ@MPPEE.GOB.VE	COORDINADOR	9950006	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403525	12831050	IGNACIO		CORONA	SALAS	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	ICORONA@MPPEE.GOB.VE	PROFESIONAL III	800010	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403546	13891551	CAROLINA 	TERESA	VIVAS	ORTEGA	EMPLEADO FIJO	AUDITORIA INTERNA	CVIVAS@MPPEE.GOB.VE	PROFESIONAL I	600168	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184402200	15378988	ANGEL	AUGUSTO	BLANCO	RANGEL	CONTRATADO	DIRECCION DEL DESPACHO	ABLANCO@MPPEE.GOB.VE	APOYO TECNICO	608	2	92	TECNICO	28	DIRECCIÓN DEL DESPACHO
184405435	6899821	MANUEL 	DAVID	CONTRERAS 	HERNANDEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2769	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184400211	11913133	YOVANIS	ENRIQUE	VILORIA	BRICEÑO	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO		ESCOLTA	43	4	24	OBRERO	93	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184405641	6968037	FRANCISCO	VICENTE	GARRIDO	GOMEZ	ALTO NIVEL Y/O CONFIANZA	OFICINA DE RECURSOS HUMANOS	FGARRIDO@MPPEE.GOB.VE	DIRECTOR GENERAL	9950020	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184403435	4052048	LORENZO		GONZALEZ	MARRERO	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	LGONZALEZ@MPPEE.GOB.VE	PROFESIONAL III	800007	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403582	14929837	JUAN	MIGUEL	PAREDES	ANGEL	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JPAREDES@MPPEE.GOB.VE	PROFESIONAL III	800034	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397457	4312213	CARMEN	ELENA	RODRIGUEZ	JARAMILLO	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	CERODRIGUEZ@MPPEE.GOB.VE	PROFESIONAL I	600090	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405468	13779055	EFRAIN	LEONARDO	LAGUNA	LOVERA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2802	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184402856	6430339	MARLIZE	SOLEDAD	GUERRERO	CAMACHO	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	MGUERRERO@MPPEE.GOB.VE	PROFESIONAL III	800020	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184403483	9881073	IVONNE	DEL CARMEN	PARRAGA 	YLARRETA	EMPLEADO FIJO	AUDITORIA INTERNA	iparraga@mppee.gob.ve	PROFESIONAL I	600040	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184403485	9989641	YULEENY	YSABEL	SEGURA	PEREZ	EMPLEADO FIJO	DIRECCION DEL DESPACHO	YSEGURA@MPPEE.GOB.VE	PROFESIONAL III	800078	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184404137	17433303	JESAIAS	JOSUE	NAAL	MATOS	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	jnaal@mppee.gob.ve	APOYO PROFESIONAL	732	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398051	4277501	DANIEL	JOSE	GRAU	CASTILLO	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	4	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184405631	14850313	IMMER	ELIEZER	MARCANO	MORALES	PASANTE	CENTRO NACIONAL DE DESPACHO	IMMER_MARCANO@HOTMAIL.COM	PASANTE PROFESIONAL	164	2	35	PROFESIONAL	62	DESPACHO DEL MINISTRO
184405007	16091268	YENIFER	YOHANA	OSORIO	GALINDO	CONTRATADO	CENTRO NACIONAL DE DESPACHO	YENIFER_OSORIO@HOTMAIL.COM	APOYO PROFESIONAL	799	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184405294	20364540	ALEJANDRO	ANTONIO	UZCATEGUI	ROJAS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ALEJANDRO-364@HOTMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	280	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403489	10348275	JOSE	AMARANTO	VARGAS	CLEMENTE	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	JVARGAS@MPPEE.GOB.VE	TECNICO II	500021	2	92	TECNICO	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184399094	13871417	SEGUNDO	ONOFRE	CAMPUZANO	LINARES	CONTRATADO	DIRECCION DEL DESPACHO	SEGUNDOIMJCARACAS@HOTMAIL.COM	AUXILIAR DE SERVICIOS DE OFICINA	320	4	24	OBRERO	28	DIRECCIÓN DEL DESPACHO
184402398	5595909	RUBEN	DARIO	GARCIA	LOVERA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	RGARCIA@MPPEE.GOB.VE	VIGILANTE	139	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184397197	13969031	DAYANA 	CAROLINA	SOSA	CEDEÑO	CONTRATADO	OFICINA DE RECURSOS HUMANOS	DSOSA@MPPEE.GOB.VE	APOYO PROFESIONAL	10	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184404566	5230259	ORLANDO	JOSE	MELO	URQUIOLA	EGRESADOS	OFICINA DE RECURSOS HUMANOS	OMELO@MPPEE.GOB.VE	DIRECTOR DE LINEA	54	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184403495	10804734	NESTOR	RAFAEL	MOYA	PARICA	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	nmoya@mppee.gob.ve	PROFESIONAL III	800074	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184403425	16341165	YORIBELK	PENELOPE	BERROTERAN	PAREDES	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	YBERROTERAN@MPPEE.GOB.VE	BACHILLER II	200035	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184398856	9567101	JUAN	RAMON	GUZMAN	BALLESTER	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	INSOLITISTA@YAHOO.COM	APOYO ADMINISTRATIVO	273	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184402393	16970971	MAYRA	ALEJANDRA	CARMONA	PEÑA	OBRERO FIJO	AREA DE SERVICIOS GENERALES	macarmona@mppee.gob.ve	AUXILIAR DE SERVICIOS DE OFICINA	134	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404542	15870969	JUAN	MANUEL	RODRIGUEZ	DAVILA	EGRESADOS	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL 	30	1	93	ADMINISTRATIVO	141	OFICINA DE RECURSOS HUMANOS
184402798	5816264	INES	ARMIDA	MORALES	GUEVARA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	imorales@mppee.gob.ve	PROFESIONAL III	128	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184397953	10729544	JUAN	CARLOS	CUBEROS	MONTES	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JCUBEROS@MPPEE.GOB.VE	COORDINADOR	2684	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184398852	4116173	CARLOS	JOSE	GARCIA 	RODRIGUEZ	HONORARIOS PROFESIONALES	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	2722	1	35	PROFESIONAL	53	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184401270	4017024	MERCY	JUDITH	ARTEAGA	TOVAR	ALTO NIVEL Y/O CONFIANZA	DIRECCION ESTADAL (ZULIA)	MRCRTG@GMAIL.COM	COORDINADOR	2728	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIONES ESTADALES
184400656	10269986	NELSON	LUIS	AGUIRRE	TORRES	OBRERO FIJO	AREA DE COMPRAS	NAGUIRRE@MPPEE.GOB.VE	MENSAJERO	23	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405312	8491971	ELIAS	ANTONIO	MORENO	MARTINEZ	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	EMORENO@MPPEE.GOB.VE	DIRECTOR GENERAL	136	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SEGURIDAD INTEGRAL
184390937	11565540	NERKYS	DEL ROSARIO	AROCHA	NORIA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	NAROCHA@MPPEE.GOB.VE	BACHILLER II	200026	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405562	8378589	CELEIDA	GEDALIAS	ALIENDRES	ARCIA	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE RECURSOS HUMANOS		PROFESIONAL I	162	1	35	PROFESIONAL	22	OFICINA DE RECURSOS HUMANOS
184405495	19915631	HUMBERTO	JOSE	AGUILERA	RAMIREZ	PASANTE	OFICINA DE RECURSOS HUMANOS	HUMBERTOJOSE@HOTMAIL.COM	PASANTE TECNICO	151	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184404192	17150558	LUCAS	ENRIQUE	CHIRINO		OBRERO-LICENCIAS REMUNERADAS	OFICINA DE SEGURIDAD INTEGRAL		ESCOLTA	49	4	24	OBRERO	93	OFICINA DE SEGURIDAD INTEGRAL
184405969	7431198	ALDRIN	ALEJANDRO	BRICEÑO	PENZO	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	aabriceno@mppee.gob.ve	PROFESIONAL III	172	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403065	14642007	YESENIA	ANYELI	GUTIERREZ	RIOS	PASANTE	DIRECCION GENERAL DE PARTICIPACION POPULAR		PASANTE PROFESIONAL	94	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184400968	81328677	PABLO 	BERNARDO	CAMURRI		CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	pcamurri@mppee.gob.ve	APOYO PROFESIONAL	467	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184405274	16870123	ROBERT	FERNANDO	MARQUEZ	RODRIGUEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RMARQUEZ204@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	260	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403670	17319004	GIULIANY	VIRGINIA	VASQUEZ		EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	GVASQUEZ@MPPEE.GOB.VE	PROFESIONAL I	600200	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184399350	20820659	ABILMAR 	GRISET	TERAN	JARAMILLO	PASANTE	OFICINA DE RECURSOS HUMANOS	ATERAN@MPPEE.GOB.VE	PASANTE TECNICO	21	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184403560	14123344	EFRAIN	ERNESTO	AGUILERA	DIAZ	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	EAGUILERA@MPPEE.GOB.VE	PROFESIONAL I	600026	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184402726	13712402	MARGOT	ELIZABETH	GIMON	RONDON	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION DEL DESPACHO	MGIMON@MPPEE.GOB.VE	BACHILLER III	126	1	93	ADMINISTRATIVO	22	DIRECCIÓN DEL DESPACHO
184396064	15133958	ROSA	FRANCIS	SANABRIA	RAMOS	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	RSANABRIA@MPPEE.GOB.VE	PROFESIONAL II	700049	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184403219	15457247	BARBARA	THAIRY	FIGUEROA	GONZALEZ	CONTRATADO	CENTRO NACIONAL DE DESPACHO	bfigueroa@mppee.gob.ve	APOYO ADMINISTRATIVO	693	1	93	ADMINISTRATIVO	28	DESPACHO DEL MINISTRO
184400023	17589630	KEISSY	LISBELY	DIAZ	TORRES	PASANTE	OFICINA DE RECURSOS HUMANOS	KEISSYT@HOTMAIL.COM	PASANTE PROFESIONAL	39	2	35	PROFESIONAL	62	OFICINA DE RECURSOS HUMANOS
184400716	17384308	JESSICA		FAJARDO 	CONTRERAS	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JFAJARDO@MPPEE.GOB.VE	RECEPTOR INFORMADOR	66	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403066	18323503	JIRALEISKA	YURUBI	HERNANDEZ	CASTELLANOS	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	JIRUBY.HERNANDEZ@GMAIL.COM	PASANTE PROFESIONAL	95	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184397442	10953063	ALEJANDRO 		DE LA ROSA		COMISION DE SERVICIOS Y/O ENCARGADURIA	AREA DE SISTEMAS	ADELAROSA@MPPEE.GOB.VE	COORDINADOR	2	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184400687	15133360	JEAN	DAVID	BARRAGAN	SALAZAR	OBRERO FIJO	AREA DE COMPRAS	JBARRAGAN@MPPEE.GOB.VE	CHOFER	54	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403153	9870298	JOSEFINA	THAYRI	ROMERO	ECHENIQUE	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	jtromero@mppee.gob.ve	APOYO PROFESIONAL	684	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397009	10353172	VIVIAN		ALVARADO		EMPLEADO FIJO	DIRECCION DEL DESPACHO	VALVARADO@MPPEE.GOB.VE	DIRECTOR DE DESPACHO	2648	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	DIRECCIÓN DEL DESPACHO
184403932	12112108	MAITE	CAROLINA	BASTERRA	PINTO	CONTRATADO	OFICINA DE RECURSOS HUMANOS	mbasterra@mppee.gob.ve	APOYO PROFESIONAL	700	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184403487	10234668	ADA	MILENA	OJEDA		EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	AOJEDA@MPPEE.GOB.VE	PROFESIONAL III	800023	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184403936	16577355	ANGUI	CAROLINA	RODRIGUEZ	MORALES	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO		APOYO TECNICO	704	2	92	TECNICO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184403668	17215181	MARYURITH	DEL CARMEN	SILVEIRA 	PABON	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	msilveira@mppee.gob.ve	PROFESIONAL I	600059	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184402394	17769843	MARIBEL		HERNANDEZ 	GUTIERREZ	OBRERO FIJO	AREA DE SERVICIOS GENERALES	MHERNANDEZG@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	135	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403083	13375496	RAFAEL	RAMON	PULGAR	ALVARADO	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	rpulgar@mppee.gob.ve	PROFESIONAL III	137	1	35	PROFESIONAL	22	OFICINA DE SEGURIDAD INTEGRAL
184401304	9415743	EDUARDO		SEQUEDA		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ESEQUEDA@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	114	4	111	OBRERO SUPERVISOR	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405223	9960891	MERCEDES	ODALY	DORANTES	FREITES	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MDORANTES200@MPPEE.GOB.VE	ASEADOR	209	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404584	16562074	JOHAN	ANTONIO	VALERA	PUCHE	PASANTE	DIRECCION GENERAL DE PARTICIPACION POPULAR	JOHAN_VALERA@HOTMAIL.COM	PASANTE PROFESIONAL	127	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184400759	14984221	GERSON	OVIDIO	GALEANO	NAVARRO	OBRERO FIJO	AREA DE RELACIONES INSTITUCIONALES	GGALEANO@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	83	4	111	OBRERO SUPERVISOR	13	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184400670	13483979	JONNY	JOSE	PICHARDO	ESPINOZA	OBRERO FIJO	AREA DE COMPRAS	JPICHARDO@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	37	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404335	9927154	ALEXANDER 	JESUS	LUGO	DIAZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ALEXLUGO70@HOTMAIL.COM	PROFESIONAL II	800145	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403534	13383191	STILLWEL	MAIKER	BETANCOURT	MARCANO	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	sbetancourt@mppee.gob.ve	TECNICO I	400027	2	92	TECNICO	12	OFICINA DE SEGURIDAD INTEGRAL
184398589	10102984	NEREYDA	COROMOTO	RIVAS	VALBUENA	HONORARIOS PROFESIONALES	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	2713	1	35	PROFESIONAL	53	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184399839	2865930	MANUEL	ALBERTO	PERAZA		HONORARIOS PROFESIONALES	DIRECCION DEL DESPACHO		HONORARIOS PROFESIONALES	2746	2	35	PROFESIONAL	53	DIRECCIÓN DEL DESPACHO
184400212	13584878	ALEXANDER	ROMAN	MARTINEZ	PEREZ	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO		ESCOLTA	44	4	24	OBRERO	93	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184402915	11158264	LUIS 	MIGUEL	FIGUERA	TORREALBA	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	LFIGUERA@MPPEE.GOB.VE	PROFESIONAL II	700014	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184400513	16264777	JACKSON	JOSE	SEGOVIA	COLMERARES	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	JSEGOVIA@MPPEE.GOB.VE	OFICIAL DE SEGURIDAD	146	4	24	OBRERO	28	OFICINA DE SEGURIDAD INTEGRAL
184405467	13454179	JEAN	CARLOS	NIETO 	GIL	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2801	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184402857	7565409	JULIAN	MANUEL	ELJURI	MARIN	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	jeljuri@mppee.gob.ve	PROFESIONAL III	800005	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184397976	5230259	ORLANDO	JOSE	MELO	URQUIOLA	CONTRATADO	OFICINA DE RECURSOS HUMANOS	OMELO@MPPEE.GOB.VE	APOYO PROFESIONAL	169	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184402577	14196505	INGERZON	DAVID	FREITES	RODRIGUEZ	CONTRATADO	DESPACHO DEL MINISTRO	IFREITES@MPPEE.GOB.VE	APOYO PROFESIONAL	621	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184404255	12460358	AZAEL	EDUARDO	PEREZ	QUIJADA	EMPLEADO FIJO	AUDITORIA INTERNA	APEREZ@MPPEE.GOB.VE	PROFESIONAL I	600205	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184405227	10505751	GLADYS	MARGARITA	BRICEÑO	BRICEÑO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	BGLADYS200@MPPEE.GOB.VE	ASEADOR	213	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403606	15581700	JAISABEL 	MARIA	RAMOS	ROMERO	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JRAMOS@MPPEE.GOB.VE	BACHILLER II	200039	1	93	ADMINISTRATIVO	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184405436	6929374	RICHARD 	ALBERTO	ARAUJO		PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2770	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184397458	4361227	REBECA	COROMOTO	QUINTERO	DE HERNANDEZ	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	RQUINTERO@MPPEE.GOB.VE	PROFESIONAL III	800049	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403617	15924019	JESUS	ANTONIO	MENDOZA	LINAREZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	JAMENDOZA@MPPEE.GOB.VE	PROFESIONAL I	600157	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184401631	26625416	BRIAN	RAFAEL	PEREZ	ASTUDILLO	CONTRATADO	AREA DE SERVICIOS GENERALES		CHOFER	535	4	24	OBRERO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184397726	15929711	MARELVY	ELVIRA	ARCE	SUAREZ	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	MARCE@MPPEE.GOB.VE	ASISTENTE	2675	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184398307	4766685	ALBERTO	JOANES	URDANETA	URDANETA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	AURDANETA@MPPEE.GOB.VE	DIRECTOR GENERAL	38	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184402669	16676215	MAIBENY	YANITZA	FLORES	FERNANDEZ	CONTRATADO	AUDITORIA INTERNA	mflores@mppee.gob.ve	APOYO PROFESIONAL	645	1	35	PROFESIONAL	28	AUDITORÍA INTERNA
184400542	5416001	FRANKLIN	DIONISIO	PANTOJA	GUZMAN	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	FPANTOJA@MPPEE.GOB.VE	COORDINADOR	9920060	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184405280	17771648	ELIZABETH		GONZALEZ	GONZALEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	EGONZALEZ214@MPPEE.GOB.VE	ASEADOR	266	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404923	12485888	ROSELIA	DEL CARMEN	PEREZ	GARNIER	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	PG_AILESOR@HOTMAIL.COM	ASISTENTE	9950009	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184400691	15700013	DANIEL	ANTONIO	CORDERO	ALVAREZ	OBRERO FIJO	AREA DE COMPRAS	DCORDERO@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	58	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404947	10747341	HELINE		ESCALANTE	SANCHEZ	CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	HELINEESCALANTE81@GMAIL.COM	APOYO ADMINISTRATIVO	789	1	93	ADMINISTRATIVO	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184401265	18340373	ATENA	DEL CARMEN	HUICE	FLORES	CONTRATADO	DIRECCION ESTADAL (ZULIA)	ahuice@mppee.gob.ve	APOYO PROFESIONAL	493	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184403580	14889997	MARLIN	NATALIA	NEGRON	RINCON	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	mnegron@mppee.gob.ve	PROFESIONAL I	600057	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184402015	19267259	IVANNY		UZTARIZ	MUJICA	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	IVANNYYUZTARIZ2007@HOTMAIL.COM	PASANTE PROFESIONAL	72	2	35	PROFESIONAL	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184405265	16027693	DAVIS	ALEXANDER	SOTO 	OJEDA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	dsoto@mppee.gob.ve	CHOFER	251	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402642	6869872	ANGEL	DANIEL	FUENTES	SEGURA	CONTRATADO	DESPACHO DEL MINISTRO	ADFUENTES@MPPEE.GOB.VE	APOYO PROFESIONAL	632	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184404458	10030369	CARLOS	ERNESTO	VARGAS		CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	CARLOSVARGAS1403@HOTMAIL.COM	APOYO CULTURAL	759	1	93	ADMINISTRATIVO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184392938	13622042	YSVIC	ALEJANDRA	ROSA	ALBANI	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	YROSA@MPPEE.GOB.VE	PROFESIONAL I	600118	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403660	17077262	ISIS	AMAHL	SOLORZANO	CAVALIERI	EMPLEADO FIJO	DESPACHO DEL MINISTRO	ISOLORZANO@MPPEE.GOB.VE	PROFESIONAL II	700003	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184405121	12789087	ALFREDO	JOSÉ	CAGUAO	YAGUA	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	ALFREDOCAGUAO@GMAIL.COM	COORDINADOR	134	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184400690	15585914	LUIS	MANUEL	RODRIGUEZ	GONZALEZ	OBRERO FIJO	AREA DE COMPRAS	LRODRIGUEZ@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	57	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403703	18235162	JUAN 	DANIEL	FELIX	FERNANDEZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	JFELIX@MPPEE.GOB.VE	PROFESIONAL I	600016	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184401572	3977050	JOEL		CABALLERO	MADRID	EMPLEADO FIJO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	JCABALLERO@MPPEE.GOB.VE	PROFESIONAL III	800057	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184403724	25237806	ALEXIS	OSWALD	PADILLA	RAMIREZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	apadilla@mppee.gob.ve	PROFESIONAL I	600202	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398590	11497544	YENNY	MARGARITA	QUINTERO	MORA	HONORARIOS PROFESIONALES	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	2714	1	35	PROFESIONAL	53	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184404332	5554190	ANTONIO		NAKOUL		(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	anakoul@mppee.gob.ve	VICEMINISTRO	129	0	35	PROFESIONAL	121	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184399372	841072	FELIX	REGALADO	ORTIZ	FIGUEROA	HONORARIOS PROFESIONALES	DESPACHO DEL MINISTRO	FORTIZ@MPPEE.GOB.VE	APOYO PROFESIONAL	2736	1	35	PROFESIONAL	53	DESPACHO DEL MINISTRO
184399909	3972333	JOSE		BARRETO	UTRERA	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	CLARA321@HOTMAIL.COM	APOYO PROFESIONAL	405	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184402983	3322765	JOSE	ANGEL	ALVARADO	LISCANO	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	JAALVARADO@MPPEE.GOB.VE	JUBILADO	5	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184405061	11409186	ALEIDA	ANTONIA	GUDIÑO	GIL	CONTRATADO	OFICINA DE RECURSOS HUMANOS	ALEIDAG22@HOTMAIL.COM	APOYO ADMINISTRATIVO	803	1	93	ADMINISTRATIVO	28	OFICINA DE RECURSOS HUMANOS
184400692	15701981	STARKY	ELY	MORA	CONTRERAS	OBRERO FIJO	AREA DE COMPRAS	SMORA@MPPEE.GOB.VE	CHOFER	59	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405569	18404372	MICHELLE	FRANCO	SPANO	FRANCO	PASANTE	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	ACUARIO1426@HOTMAIL.COM	PASANTE PROFESIONAL	162	2	35	PROFESIONAL	62	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184400543	5589381	MARIA ESPERANZA 	DE JESÚS 	GINER 	BARRETO 	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	MGINER@MPPEE.GOB.VE	ASISTENTE	9910008	1	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184401121	3969889	ALEJANDRO	ANTONIO	BOLIVAR	PACHECO	OBRERO FIJO	AREA DE COMPRAS	ABOLIVAR@MPPEE.GOB.VE	CHOFER	108	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400201	4680104	JUAN	CARLOS	CASTILLO	ZAMORA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	JCASTILLO@MPPEE.GOB.VE	PROFESIONAL II	81	1	35	PROFESIONAL	22	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184400651	3354429	CIRO	JOSE	MAESTRI	SOJO	OBRERO FIJO	AREA DE COMPRAS	CMAESTRI@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	1	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403675	17390375	ALEJANDRO		MATOS	BATISTA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	AMATOS@MPPEE.GOB.VE	TECNICO I	400037	2	92	TECNICO	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404846	12901950	YAMURU	WANIMANDE	APARICIO	JIMENEZ	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	YWAPARICIOJ@HOTMAIL.COM	APOYO PROFESIONAL	779	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184395460	7884624	FLORINDA	DE LA CONCEPCION	PEREIRA	AGUILERA	EMPLEADO FIJO	CONSULTORIA JURIDICA	FPEREIRA@MPPEE.GOB.VE	BACHILLER II	200006	1	93	ADMINISTRATIVO	12	CONSULTORÍA JURIDICA
184403646	16600554	MAYERLING	MARIA	MONTILLA 	MARTINEZ	EMPLEADO FIJO	DIRECCION DEL DESPACHO	MMONTILLA@MPPEE.GOB.VE	TECNICO I	400005	2	92	TECNICO	12	DIRECCIÓN DEL DESPACHO
184401927	17440435	EDWARD	ADRIAN	RAVELLO	LOPEZ	PASANTE	DIRECCION DE ENERGIAS RENOVABLES	EDWARQUITEK@GMAIL.COM	PASANTE PROFESIONAL	68	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184402273	3489486	JESUS	ANIBAL	SALAZAR		CONTRATADO	DIRECCION ESTADAL (ZULIA)	JASALAZAR@MPPEE.GOB.VE	APOYO PROFESIONAL	620	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184405743	6857700	EDMUNDO	JOSE	GELVIS	GELVEZ	CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	DONEDMUNDOG@GMAIL.COM	APOYO PROFESIONAL	812	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184403680	17438321	OTTO	MANUEL	GONZALEZ	LINARES	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	omgonzalez@mppee.gob.ve	PROFESIONAL I	600082	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184404611	6120236	ALEJANDRO		COUSELO	ACOSTA	CONTRATADO	OFICINA DE RECURSOS HUMANOS	ALEJANDROCOUSELO6@HOTMAIL.COM	APOYO ADMINISTRATIVO	763	1	93	ADMINISTRATIVO	28	OFICINA DE RECURSOS HUMANOS
184401570	12687244	ELIANA	ALEJANDRA	GALINDO	MOLINA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	EGALINDO@MPPEE.GOB.VE	PROFESIONAL III	800056	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403547	13891623	MARIANA	TIBISAY	CASTRO	MENDEZ	EMPLEADO FIJO	AUDITORIA INTERNA	MCASTRO@MPPEE.GOB.VE	PROFESIONAL I	600041	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184403686	17692338	FABIANA	CAROLINA	LIENDO	VIÑA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	FLIENDO@MPPEE.GOB.VE	BACHILLER I	100014	1	93	ADMINISTRATIVO	12	OFICINA DE RECURSOS HUMANOS
184403595	15385840	NATHALIE	COROMOTO	COLINA	REVILLA	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	NCOLINA@MPPEE.GOB.VE	PROFESIONAL I	600073	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404866	6869151	LENNYS	GREGORIA	LIRA 	GARCÍA 	PASANTE	OFICINA DE RECURSOS HUMANOS		PASANTE PROFESIONAL	131	2	35	PROFESIONAL	62	OFICINA DE RECURSOS HUMANOS
184403610	15662904	EVERT	LEONARDO	PALACIOS	RODRIGUEZ	EMPLEADO FIJO	DIRECCION DEL DESPACHO	ELPALACIOS@MPPEE.GOB.VE	TECNICO I	400002	2	92	TECNICO	12	DIRECCIÓN DEL DESPACHO
184401996	10384207	JUZMARY	MARGARITA	RIVAS	TRIAS	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	JRIVAS@MPPEE.GOB.VE	COORDINADOR	90	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SEGURIDAD INTEGRAL
3303	9375863	DANIS	DEL CARMEN	SAAVEDRA	GONZALEZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	DSAAVEDRA@MPPEE.GOB.VE	PROFESIONAL III	800033	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184400709	6220315	FRANK	LEONEL	ROMERO	PERALTA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	FLROMERO@MPPEE.GOB.VE	ESCOLTA	12	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184398064	2159413	CARLOS	ALBERTO	GIL	RIVODO	CONTRATADO	AREA DE COMUNICACION E INFORMACION	CGIL@MPPEE.GOB.VE	FOTOGRAFO	175	2	35	PROFESIONAL	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403633	16386049	ALEXIS 	EDUARDO 	ALVARADO	PAEZ 	EMPLEADO FIJO	DIRECCION DEL DESPACHO	AALVARADO@MPPEE.GOB.VE	TECNICO I	400003	2	92	TECNICO	12	DIRECCIÓN DEL DESPACHO
184404271	16972404	NELSON 	JOSÉ	ORTIZ	GARCIA	ALTO NIVEL Y/O CONFIANZA	CONSULTORIA JURIDICA	nortiz@mppee.gob.ve	COORDINADOR	9950003	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	CONSULTORÍA JURIDICA
184405456	12220452	JOHN 	RODNEY	ANDRADE	MOLINA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2790	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403746	11664014	ADITH	YAZED	LEON	LINARES	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	ALEON@MPPEE.GOB.VE	PROFESIONAL II	700038	2	35	PROFESIONAL	12	OFICINA DE ATENCIÓN AL CIUDADANO
184400089	14214422	JOHN	JAIR	RANGEL	GIL	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	JOHNRANGEL1980@GMAIL.COM	PASANTE PROFESIONAL	47	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403717	19505644	ALEJANDRO		GARRIDO	MOTA	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	AGARRIDO@MPPEE.GOB.VE	BACHILLER II	200038	1	93	ADMINISTRATIVO	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184400957	4731886	CRUZ	MARIO	MEDINA	QUIROZ	CONTRATADO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	MARIOMEDINAQUIROZÆGMAIL.COM	APOYO PROFESIONAL	459	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184400026	5742680	CARLOS	ALFONSO	GOYO	BARRIENTOS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	CARLOS.GOYO-BARRIENTOS@CANTV.NET	DIRECTOR GENERAL	72	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184397254	5523130	FLOR	OMAIRA	QUIROZ	RODRIGUEZ	CONTRATADO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	FQUIROZ@MPPEE.GOB.VE	APOYO PROFESIONAL	17	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184405896	19885326	YOLIANDER	SALVADOR	CANO	MURILLO	PASANTE	DIRECCION GENERAL DE PARTICIPACION POPULAR	YOLIANDERCANO@GMAIL.COM	PASANTE PROFESIONAL	180	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184403069	18164289	MABEL	MARLEY	JEREZ	BRACHO	PASANTE	CENTRO NACIONAL DE DESPACHO	MABEL_JEREZ_UNEFA@HOTMAIL.COM	PASANTE TECNICO	98	2	92	TECNICO	62	DESPACHO DEL MINISTRO
184400564	13962726	MAYRA	ALEJANDRA	VELASQUEZ	PEÑA	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL MINISTRO	MVELASQUEZ@MPPEE.GOB.VE	COORDINADOR	9920002	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL MINISTRO
184404199	18994134	AURA	MAHOLY	OLIVO	VARELA	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	OLIVOAURA@YAHOO.COM	PASANTE PROFESIONAL	113	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184401303	6341730	GUSTAVO	ANIBAL	BELLO	GOMEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	GBELLO@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	113	4	111	OBRERO SUPERVISOR	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398587	3882619	LUIS	ANTONIO	ROSALES 	CASTILLO	HONORARIOS PROFESIONALES	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	2711	1	35	PROFESIONAL	53	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184405315	14953952	LEONARDO	ANTONIO	MONROY	URBINA	CONTRATADO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	MONROYLEONARDO@HOTMAIL.COM	APOYO PROFESIONAL	808	1	35	PROFESIONAL	28	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
3402	6563917	ALFONSO	JOSE	MATEO	RUIZ	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	AMATEO@MPPEE.GOB.VE	PROFESIONAL III	800055	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184400752	3799050	PETRA	MARIA	ANGULO	GARCIA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	PANGULO@MPPEE.GOB.VE	PROFESIONAL III	86	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184405666	13376815	JAIRO	ALEXANDER	ANDRADE	GRATEROL	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO		ESCOLTA	52	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184403504	11632419	JOSE	ANGEL	PINTO	SILVERA	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JPINTO@MPPEE.GOB.VE	PROFESIONAL II	700041	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403439	4346122	MARIA 	JOSEFINA	VILLAVICENCIO	DE BARRIOS	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MVILLAVICENCIO@MPPEE.GOB.VE	PROFESIONAL II	700139	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
3660	6235306	GRECIA	COROMOTO	LOBO	ORTIZ	EMPLEADO FIJO	CONSULTORIA JURIDICA	GLOBO@MPPEE.GOB.VE	PROFESIONAL III	800015	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184405458	12268958	CARLOS	GREGORIO	MALAVE		PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2792	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404861	18994134	AURA	MAHOLY	OLIVO	VARELA	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	OLIVOAURA@YAHOO.COM	PASANTE PROFESIONAL	130	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184398951	19205687	ANDREA	ESTEFANÍA 	MANZUR 	PÉREZ 	SUPLENTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	AMANZUR@MPPEE.GOB.VE	BACHILLER I	2	1	93	ADMINISTRATIVO	73	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400537	4478127	LUIS	EDGARDO	SANCHEZ	RIOS	ALTO NIVEL Y/O CONFIANZA	AREA DE COMPRAS	LSANCHEZ@MPPEE.GOB.VE	DIRECTOR	2692	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE GESTIÓN ADMINISTRATIVA
184402634	14831999	JOAN	MANUEL	GUERRERO	CARDOZO	CONTRATADO	DIRECCION ESTADAL (ZULIA)	jguerrero@mppee.gob.ve	APOYO PROFESIONAL	628	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184403477	9096675	JOSE 	MARTÍN	BARRETO		EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	JBARRETO@MPPEE.GOB.VE	TECNICO II	500020	2	92	TECNICO	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184400830	18041486	ERIKA	ROSSANA	TARAZONA	CASTILLO	ALTO NIVEL Y/O CONFIANZA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	ETARAZONA@MPPEE.GOB.VE	COORDINADOR	2724	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184403687	17700198	INDIRA	MATYELINE	TRAVIEZO	OROPEZA	EMPLEADO FIJO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	ITRAVIEZO@MPPEE.GOB.VE	PROFESIONAL I	600127	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184403553	14033641	WISMAR	JESUS	PULIDO	CORDERO	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	WPULIDO@MPPEE.GOB.VE	TECNICO II	500016	2	92	TECNICO	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184402335	11688892	FERNANDO	JOSE	SANCHEZ	SANCHEZ	OBRERO FIJO	AREA DE SERVICIOS GENERALES	FJSANCHEZ@MPPEE.GOB.VE	CHOFER	126	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184393678	12457583	RICHARD	JOSE	PEREZ	MATOS	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	RPEREZ@MPPEE.GOB.VE	PROFESIONAL II	700079	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184402450	6527627	FELIX	VICENTE	KEY	LOPEZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	FKEY@MPPEE.GOB.VE	VIGILANTE	141	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184404065	10331802	RICARDO 	JOSE	DE ANDRADE	DE FREITES	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RDANDRADE@MPPEE.GOB.VE	CHOFER	163	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399695	18041486	ERIKA	ROSSANA	TARAZONA	CASTILLO	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	ETARAZONA@MPPEE.GOB.VE	APOYO PROFESIONAL	391	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404853	20614595	MAITE	ANDREINA	ROJAS	RUIZ	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION		PASANTE PROFESIONAL	129	2	35	PROFESIONAL	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184401424	14196532	NESTOR	SISNEY	ALAVA	HIDALGO	COMISION DE SERVICIOS Y/O ENCARGADURIA	AREA DE COMPRAS	NALAVA@MPPEE.GOB.VE	PROFESIONAL II	106	1	35	PROFESIONAL	22	OFICINA DE GESTIÓN ADMINISTRATIVA
184404585	5313075	ESPERANZA	DEL VALLE	COLON	CONTRERAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	ESPERANZACOLON@GMAIL.COM	PROFESIONAL III	155	1	35	PROFESIONAL	22	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184403720	19822849	ALISON	ROCIO	AVENDAÑO		EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	AAVENDANO@MPPEE.GOB.VE	PROFESIONAL I	600081	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184405621	17744929	ISABEL 	TERESA	ALFONZO	RIOS	SUPLENTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	ISALFONZOR@GMAIL.COM	ASISTENTE	12	1	91	DIRECCION/GERENCIA/SUPERVISORES	73	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184399376	15186954	ELIATH		GONZALEZ	PERNETH	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	EGONZALEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	348	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403085	17530495	ARTURO	JOSE	GARCIA	VENEGAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	ajgarcia@mppee.gob.ve	TECNICO I	139	2	92	TECNICO	22	OFICINA DE SEGURIDAD INTEGRAL
184404670	13160858	JESSIKA	JENSY	ABREU	PEREZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	jjabreu@mppee.gob.ve	PROFESIONAL I	800148	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184404547	17775326	LUISA	ELIBETH	DE CAIRES	GONZALEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	LUISADECAIRES@HOTMAIL.COM	APOYO PROFESIONAL 	35	1	93	ADMINISTRATIVO	141	OFICINA DE RECURSOS HUMANOS
184401032	5223455	MARISELA		ASCANIO	GONZALEZ	EMPLEADO FIJO	DIRECCION DEL DESPACHO	MASCANIO@MPPEE.GOB.VE	BACHILLER I	100001	1	93	ADMINISTRATIVO	12	DIRECCIÓN DEL DESPACHO
184402799	5874494	MARCOS	ANIBAL	SALAZAR		CONTRATADO	OFICINA DE RECURSOS HUMANOS	marsalazar@mppee.gob.ve	APOYO PROFESIONAL	661	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184399704	4149805	YXORA	DEL CARMEN	PEROZO 	MORENO	HONORARIOS PROFESIONALES	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO		HONORARIOS PROFESIONALES	2744	2	35	PROFESIONAL	53	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184403598	15403490	ADRIANA	VANESSA	GAINZA	JIMENEZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	AVGAINZA@MPPEE.GOB.VE	PROFESIONAL II	700128	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184401709	19086707	VICTOR	FIDEL	CASTELLANOS	GUERRERO	ALTO NIVEL Y/O CONFIANZA	DIRECCION DEL DESPACHO	VCASTELLANOS@MPPEE.GOB.VE	DIRECTOR GENERAL	9940001	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN DEL DESPACHO
184397911	3851882	CARLOS	JOSE	FIGUEREDO	ROJAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	CFIGUEREDO@MPPEE.GOB.VE	DIRECTOR GENERAL	24	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184403614	15838015	JERSSON	ANTONIO	SILVA	MAUCO	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	JASILVA@MPPEE.GOB.VE	PROFESIONAL I	600152	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400779	3398005	ANGEL	RAMON	CEDEÑO	SILVA	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	acedeno@mppee.gob.ve	COORDINADOR	9920063	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184397190	2767629	HENRY	JOSE	ARROYO	CLEMENTE	CONTRATADO	OFICINA DE RECURSOS HUMANOS	HARROYO@MPPEE.GOB.VE	COORDINADOR	3	1	91	DIRECCION/GERENCIA/SUPERVISORES	28	OFICINA DE RECURSOS HUMANOS
184405000	16564377	JONATHAN	RAMON	COMAS	VIVAS	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	jcomas@mppee.gob.ve	APOYO ADMINISTRATIVO	792	1	93	ADMINISTRATIVO	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404450	4576721	RUBEN	AUSTIDE	MACHADO		CONTRATADO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	rmachado@mppee.gob.ve	APOYO PROFESIONAL	758	1	35	PROFESIONAL	28	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184404922	14372024	SALVIS	ALEXANDER	PEREZ	ORELLANA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	SALVISPEREZ@HOTMAIL.COM	PROFESIONAL I	800155	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184405452	11274346	GREISLY	DAMELYS	LEGON	MOYETONES	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2786	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404066	15844811	SISY	EMPERATRIZ	TRUJILLO	VALLADARES	PASANTE	OFICINA DE SEGURIDAD INTEGRAL	SISY1504@HOTMAIL.COM	PASANTE PROFESIONAL	106	2	35	PROFESIONAL	62	OFICINA DE SEGURIDAD INTEGRAL
184401094	17801276	CHEL		OLIVEROS	MATAMOROS	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	CHEL.OLIVEROS@GMAIL.COM	PASANTE PROFESIONAL	57	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400726	19659909	YEREMID	RAFAEL 	LOPEZ	BRITO	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	YLOPEZ@MPPEE.GOB.VE	VIGILANTE	76	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403603	15533031	JUAN 	CARLOS	CASTILLO 	RINCON	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	jccastillo@mppee.gob.ve	TECNICO I	400010	2	92	TECNICO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405285	18466607	JOANDRI	JOSE	RODRIGUEZ	MIJARES	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JRODRIGUEZ233@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	271	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403152	4265197	MATILDE	JOSEFINA	LEZAMA	ZERPA	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	mlezama@mppee.gob.ve	APOYO PROFESIONAL	683	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400213	10312115	JUAN 	CARLOS	MENDEZ	PAREDES	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	JUANCMENDEZ_70@YAHOO.COM	ESCOLTA	45	4	24	OBRERO	93	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184403619	15929840	EVELIN	YANETT	BRICEÑO	TORCATES	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	EBRICENO@MPPEE.GOB.VE	PROFESIONAL I	600060	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184399297	4681925	ALI	JOSE	DIAZ	ASCANIO	CONTRATADO	DIRECCION DEL DESPACHO	ADIAZ@MPPEE.GOB.VE	APOYO PROFESIONAL	343	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184401707	15946416	MERIBETH	DEL VALLE	ROJAS	ARAQUE	CONTRATADO	DIRECCION ESTADAL (ZULIA)	mrojas@mppee.gob.ve	APOYO PROFESIONAL	554	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184397752	17123357	LILIBETH	YAZMIN	AZUAJE	GONZALEZ	CONTRATADO	AREA DE CORRESPONDENCIA Y ARCHIVO	LAZUAJE@MPPEE.GOB.VE	APOYO PROFESIONAL	112	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184398129	1417113	JULIO	MARCELINO	CHIRINO		EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JCHIRINO@MPPEE.GOB.VE	DIRECTOR GENERAL	2699	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE SEGURIDAD INTEGRAL
184402575	4774242	RAFAEL	SIMON	CHACON	GUZMAN	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION DEL DESPACHO	RCHACON@MPPEE.GOB.VE	PROFESIONAL III	122	1	35	PROFESIONAL	22	DIRECCIÓN DEL DESPACHO
184405474	15489722	FRANKLIN	JUALIANS	PEÑA	PADRON	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2808	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403618	15928450	DIANNELYS	DEL VALLE	DIAZ	SUBERO	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	ddiaz@mppee.gob.ve	TECNICO I	400039	2	92	TECNICO	12	OFICINA DE RECURSOS HUMANOS
184399211	5589381	MARIA ESPERANZA 	DE JESÚS 	GINER 	BARRETO 	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	MGINER@MPPEE.GOB.VE	ASISTENTE	2709	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405206	6328414	CARLOS	AUGUSTO	TORRES	ABREU	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CMT62011@HOTMAIL.COM	CHOFER	192	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403577	14789126	ANDRES	ALBERTO	GAINZA	JIMENEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	AAGAINZA@MPPEE.GOB.VE	PROFESIONAL I	600154	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405205	6321100	CARMEN	ELENA	BAPTISTA		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CBAPTISTA200@MPPEE.GOB.VE	ASEADOR	191	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403448	5566308	ANTONIO	DAVID	CLEMENTE	TOVAR	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	ACLEMENTE@MPPEE.GOB.VE	PROFESIONAL III	800068	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405831	9281056	MORELLA	JOSEFINA	PEREZ	RIVAS	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MJPEREZ@MPPEE.GOB.VE	BACHILLER III	800158	1	93	ADMINISTRATIVO	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184400088	18942232	KATERIN	JOSEFINA	KELTAI	GRATEROL	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	KELTAIKATERIN@GMAIL.COM	PASANTE PROFESIONAL	46	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403945	3593579	RUBEN	ENRIQUE	JIMENEZ		CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	JIMENEZRE2005@HOTMAIL.COM	APOYO PROFESIONAL	709	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184402914	11204462	NELSY	JOHANNA	MONTILLA	SANCHEZ	EMPLEADO FIJO	DESPACHO DEL MINISTRO	NMONTILLA@MPPEE.GOB.VE	TECNICO I	400001	2	92	TECNICO	12	DESPACHO DEL MINISTRO
184403530	13072748	SIMAR	JOSE	ORTIZ	GALENO	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	SORTIZ@MPPEE.GOB.VE	PROFESIONAL II	700071	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184400754	15179109	MARIA	CAROLINA	ALBERO	CARDENAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	malbero@mppee.gob.ve	PROFESIONAL I	88	1	35	PROFESIONAL	22	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184405197	6059472	ROMULO	GREGORIO	GOMEZ	TOVAR	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RGOMEZ202@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	183	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400744	16578609	HECTOR 	JOSE	AZUAJE 	PERALES	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	hazuaje@mppee.gob.ve	APOYO TECNICO	444	2	92	TECNICO	28	OFICINA DE SEGURIDAD INTEGRAL
184399961	15119130	MARIA 	VALENTINA	YZAGUIRRE	ADRIAN	CONTRATADO	DIRECCION DEL DESPACHO	MYZAGUIRRE@MPPEE.GOB.VE	APOYO TECNICO	407	2	92	TECNICO	28	DIRECCIÓN DEL DESPACHO
184400832	15929711	MARELVY	ELVIRA	ARCE	SUAREZ	ALTO NIVEL Y/O CONFIANZA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	MARCE@MPPEE.GOB.VE	COORDINADOR	2725	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397998	15999229	ROSA	MARIA 	GALEANO	URRUTIA 	EMPLEADO FIJO	DESPACHO DEL MINISTRO	RGALEANO@MPPEE.GOB.VE	DIRECTOR	2697	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	DESPACHO DEL MINISTRO
184398608	18009146	ELY 	SAUL	FERREIROA	CAMPOS	PASANTE	AREA DE DESARROLLO		PASANTE TECNICO	8	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184397961	12783770	YAMELIS	DEL VALLE	CADENAS	OPORTA	CONTRATADO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	YCADENAS@MPPEE.GOB.VE	APOYO PROFESIONAL	159	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184401104	17922134	DHEIVY	JESUS	ACEVEDO	LOZADA	CONTRATADO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	dacevedo@mppee.gob.ve	APOYO PROFESIONAL	475	1	35	PROFESIONAL	28	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184401702	5567577	ANTONIO	JOSE	ALVAREZ		CONTRATADO	DESPACHO DEL MINISTRO	aalvarez@mppee.gob.ve	APOYO PROFESIONAL	549	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184404537	2259911	HUGO	ARCENIO	ROSAS		EGRESADOS	OFICINA DE RECURSOS HUMANOS	HUGHAR47@HOTMAIL.COM	APOYO PROFESIONAL 	25	1	93	ADMINISTRATIVO	141	OFICINA DE RECURSOS HUMANOS
184404193	6356685	RAFAEL	ERNETO	TORRES	TORRES	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL MINISTRO	rtorres@mppee.gob.ve	PROFESIONAL III	148	1	35	PROFESIONAL	22	DESPACHO DEL MINISTRO
184390555	15151076	DANIEL		FEIJOO	RODRIGUEZ	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	DFEIJOO@MPPEE.GOB.VE	PROFESIONAL I	600085	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184403587	15069544	NESTOR	LUIS	ALFONZO	HERRERA	EMPLEADO FIJO	DESPACHO DEL MINISTRO	NALFONZO@MPPEE.GOB.VE	PROFESIONAL I	600001	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184403741	11959465	JACSON	LONIEL	LOBO	NIETO	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	JLOBO@MPPEE.GOB.VE	PROFESIONAL III	800037	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403626	16202906	MARIA	JOSE	HIGUERA	MORENO	EMPLEADO FIJO	DESPACHO DEL MINISTRO	MHIGUERA@MPPEE.GOB.VE	PROFESIONAL I	600178	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184405451	11243597	EUDES	GERONIMO	MENDOZA		PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2785	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184400762	11401264	JESUS	MARIA	TERAN	HERNANDEZ	OBRERO FIJO	AREA DE COMPRAS	JTERAN@MPPEE.GOB.VE	CHOFER	86	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400524	2767629	HENRY	JOSE	ARROYO	CLEMENTE	ALTO NIVEL Y/O CONFIANZA	OFICINA DE GESTION ADMINISTRATIVA	HARROYO@MPPEE.GOB.VE	DIRECTOR GENERAL	2682	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE GESTIÓN ADMINISTRATIVA
184404394	17235060	JOSE	ANDRES	PINEDA	FIGUEROA	CONTRATADO	CENTRO NACIONAL DE DESPACHO	JOSEPINEDAF@GMAIL.COM	APOYO PROFESIONAL	752	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184402204	10459819	FRANCISCO 	JOSE	MOLINA 	PEREIRA	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	FMOLINA@MPPEE.GOB.VE	COORDINADOR	117	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405626	16596061	RONIER 	MANUEL	TIRAJARA	SANCHEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2824	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403467	6863918	AZUCENA	MARIA	JASPE	GARCIA	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	AJASPE@MPPEE.GOB.VE	PROFESIONAL III	800027	2	35	PROFESIONAL	12	OFICINA DE ATENCIÓN AL CIUDADANO
184401021	16130986	EDICSON	DANIEL	VELASQUEZ	CASANOVA	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	EVELASQUEZ@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	470	1	93	ADMINISTRATIVO	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184396926	13689295	RAMON	ENRIQUE	ALVAREZ	CAMPOS	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RALVAREZ@MPPEE.GOB.VE	TECNICO I	400018	2	92	TECNICO	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403656	16991057	DENISSE	YAMILES	CHOURIO	SOLARTE	EMPLEADO FIJO	DIRECCION DEL DESPACHO	DCHOURIO@MPPEE.GOB.VE	PROFESIONAL I	600172	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184403873	19383585	ELIANA	CARINA	ARAUJO	SANTOS	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	EARAUJO@MPPEE.GOB.VE	PROFESIONAL I	600153	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184402515	11413032	GIOVANNI	VICENTE	MARCANO	MIJARES	OBRERO FIJO	AREA DE SERVICIOS GENERALES	GMARCANO@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	156	4	111	OBRERO SUPERVISOR	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404331	15929246	JOSE	ANTONIO	PEREZ	MEJIAS	CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	JAPMEJIAS@HOTMAIL.COM	CHOFER	743	4	24	OBRERO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184403073	6466151	JOSE	ALEXIS	LARA	SULBARAN	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	jlara@mppee.gob.ve	PROFESIONAL II	700013	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184398940	7959407	JOSE	GREGORIO	ARIAS	FLORES	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	JARIAS@MPPEE.GOB.VE	COORDINADOR	58	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184405623	7662075	GUILLERMO	ANTONIO	TORRES 	GUTIERREZ 	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2821	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184401275	13099400	ILLICH	CANDELARIO	VIELMA	DIAZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	IVIELMA@MPPEE.GOB.VE	PROFESIONAL III	98	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403490	10435827	CARLOS	ALBERTO	MEDINA	FERRER	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	camedina@mppee.gob.ve	PROFESIONAL II	700036	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184405481	17427349	NOEL	JAVIER	PEÑA	ZAMBRANO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2815	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403511	12040134	DANIEL	JOSE	ARCONADA 	TORRES	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	DARCONADA@MPPEE.GOB.VE	PROFESIONAL I	600173	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184402512	12377754	EDGAR	JESUS	VALBUENA	ESTEVES	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	EVALBUENA@MPPEE.GOB.VE	ESCOLTA	153	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184405236	11203225	WILMER	ALEXANDER	PASTRAN	VARELA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	WPASTRAN200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	222	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402970	12745044	MARIA	GABRIELA	CASTRO	ZOZAYA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	mgcastro@mppee.gob.ve	PROFESIONAL I	600055	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184399283	12639883	GAUMARA	JUMED	MARTINEZ	RIVAS	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	GAUMARA2006@HOTMAIL.COM	APOYO PROFESIONAL	2730	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184404454	6452294	JOSE	PONCIANO	MUJICA	VILLARREAL	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	jmujica@mppee.gob.ve	PASANTE PROFESIONAL	120	2	35	PROFESIONAL	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184402996	9644372	CESAR	DAVID	LABRADOR	TOVAR	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	CLABRADOR@MPPEE.GOB.VE	DIRECTOR GENERAL	134	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE SEGURIDAD INTEGRAL
184401984	5520466	JULIO	ALBERTO	YEPEZ	CASTRO	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL		DIRECTOR GENERAL	99	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SEGURIDAD INTEGRAL
184401994	9994574	RICARDO	MANUEL	LUY	SANABRIA	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	RLUY@MPPEE.GOB.VE	DIRECTOR GENERAL	43	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184405317	12309151	MAGLY	CAROLINA	LEON	RODRIGUEZ	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	AREA DE SEGURIDAD DE LA INFORMACION	MALEON@MPPEE.GOB.VE	COORDINADOR	137	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SEGURIDAD INTEGRAL
184405472	14860142	CLAUDIO	YAQUIER	GIORGIO	RODRIGUEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2806	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405195	6029592	MARCO	ANTONIO	FONCAULT	COLINA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MFONCAULT200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	181	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405062	15605530	JENNIFER		RODRIGUES	ALVAREZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS	JSARAHY_483@HOTMAIL.COM	APOYO PROFESIONAL	804	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184403611	15751960	DEYVIS	LEANDRO	DAVILA	GONZALEZ	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	DDAVILA@MPPEE.GOB.VE	PROFESIONAL I	600122	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403647	16634422	MARY	ISABEL	BUITRIAGO	PEREZ	EMPLEADO FIJO	DIRECCION DEL DESPACHO	mbuitriago@mppee.gob.ve	PROFESIONAL I	600007	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184403551	14002523	CARLOS	LUIS	SANCHEZ	FLORIDA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	CSANCHEZ@MPPEE.GOB.VE	PROFESIONAL II	700110	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184401093	18526283	YOSELYN	RAYBELL	DORANTE 	VALERA	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	ydorante@mppee.gob.ve	PASANTE PROFESIONAL	56	2	35	PROFESIONAL	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404575	11230675	TAWATA		ARAUJO	JUAN	EGRESADOS	OFICINA DE RECURSOS HUMANOS	TARAUJO@MPPEE.GOB.VE	COORDINADOR	63	0	39	COORDINADOR	141	OFICINA DE RECURSOS HUMANOS
184400713	6824407	OSCAR	DANIEL	BLANCO 	ARAUJO	OBRERO FIJO	AREA DE COMPRAS	ODBLANCO@MPPEE.GOB.VE	VIGILANTE	16	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184406095	17077834	PATRICIA		RODRIGUEZ 	RANGEL	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	AICIRTAP984@GMAIL.COM	APOYO TECNICO	838	2	92	TECNICO	28	OFICINA DE SEGURIDAD INTEGRAL
184404396	14287465	ROBERTH	LEONARDO	NARANJO	ROMERO	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	BASE5.ORG@GMAIL.COM	APOYO PROFESIONAL	754	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403565	14261628	YESSIKA		MARTINEZ	SOTO	EMPLEADO FIJO	CONSULTORIA JURIDICA	YMARTINEZ@MPPEE.GOB.VE	PROFESIONAL II	700129	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184404122	4115097	IGOR	JOSE	GAVIDIA	LEON	ALTO NIVEL Y/O CONFIANZA	CENTRO NACIONAL DE DESPACHO	IGAVIDIA@MPPEE.GOB.VE	DIRECTOR GENERAL	2769	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	CENTRO NACIONAL DE DESPACHO
184402330	6864637	JOSE	LUIS	ALVAREZ	RAMOS	OBRERO FIJO	AREA DE SERVICIOS GENERALES	jlalvarez@mppee.gob.ve	MENSAJERO	121	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401926	591759	JOSE	JESUS	RONDON	PINO	CONTRATADO	DIRECCION DEL DESPACHO	JRONDON@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	587	1	93	ADMINISTRATIVO	28	DIRECCIÓN DEL DESPACHO
184403607	15585068	CRISS	MAIRLET	COMAS	VIVAS	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	CCOMAS@MPPEE.GOB.VE	PROFESIONAL II	700047	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184402399	6349832	ALVEN	DANILO	ROJAS	ESTANGA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	ADROJAS@MPPEE.GOB.VE	VIGILANTE	140	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184397453	5702268	DALIS	DEL VALLE	MARTINEZ	NADALIS	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	DMARTINEZ@MPPEE.GOB.VE	PROFESIONAL II	700075	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405567	17428470	JORGE	ALIRIO DEL VALLE	FLORES	PALMERO	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	JAFP100@GMAIL.COM	PASANTE PROFESIONAL	160	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397071	9602447	KRUSCAYA	MARIA	LOPEZ	MARTI	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	KLOPEZ@MPPEE.GOB.VE	DIRECTOR GENERAL	2651	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE ATENCIÓN AL CIUDADANO
184405005	14142698	FELIX	ROBERTO	CASTILLO	TORRES	CONTRATADO	CENTRO NACIONAL DE DESPACHO	FELIX_CASTILLO14@HOTMAIL.COM	APOYO ADMINISTRATIVO	797	1	93	ADMINISTRATIVO	28	DESPACHO DEL MINISTRO
184405201	6137521	MIRNA	JOSEFINA	SIERRA	ESTEVES	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MSIERRA200@MPPEE.GOB.VE	ASEADOR	187	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400569	15506125	MICHELLE		DUNMETT	TOVAR	ALTO NIVEL Y/O CONFIANZA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	DUNMETTM@MPPEE.GOB.VE	DIRECTOR	2712	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405731	3189401	NELLY	ESTHER	LORENZO	DE DIAZ	ALTO NIVEL Y/O CONFIANZA	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	NLORENZO@MPPEE.GOB.VE	DIRECTOR	9950023	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184401906	17030839	LUIS	EDUARDO	SEGOVIA	PIÑERO	CONTRATADO	DIRECCION DEL DESPACHO		AUXILIAR DE SERVICIOS DE OFICINA	577	4	24	OBRERO	28	DIRECCIÓN DEL DESPACHO
184398444	11458817	NELSON	GERARDO	PUCHE	OQUENDO	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	NPUCHE@MPPEE.GOB.VE	APOYO PROFESIONAL	222	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397591	6152976	NESTOR	EDUARDO	GARCIA	LA CRUZ	CONTRATADO	AREA DE COMPRAS	NGARCIA@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	68	4	24	OBRERO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184405801	15737781	BENJAMIN	JESÚS	BUSTAMANTE	LÓPEZ	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	BUSTAMANTEBENJAMIN@GMAIL.COM	APOYO PROFESIONAL	819	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403473	7464062	MIRIAM	DIOCELIS	ROSALES	ARENAS	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	MROSALES@MPPEE.GOB.VE	PROFESIONAL I	600174	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403715	19445566	MIGUEL	GABRIEL	VIERA	CRUZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	MVIERA@MPPEE.GOB.VE	PROFESIONAL I	600215	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184401266	16794384	NATALY	CECILIA	TRIANA	LINAREZ	CONTRATADO	DIRECCION ESTADAL (ZULIA)	ntriana@mppee.gob.ve	APOYO PROFESIONAL	494	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184390562	13139376	ROMINA	ISBELIA	MONTICELLI	CASTELLANOS	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	RMONTICELLI@MPPEE.GOB.VE	PROFESIONAL I	600135	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403759	6247862	MICHELE	ANTONIO	RICUCCI	GIORDANO	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	MRICUCCI@MPPEE.GOB.VE	PROFESIONAL III	143	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184402078	7724026	LIBIA	NANCY	MEDINA	DE CORREA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION ESTADAL (ZULIA)	lmedina@mppee.gob.ve	BACHILLER III	118	1	93	ADMINISTRATIVO	22	DIRECCIONES ESTADALES
184403422	6004354	MARLENE	JOSEFINA	CAÑIZALEZ	MATHEUS	EMPLEADO FIJO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	mcanizalez@mppee.gob.ve	BACHILLER II	200022	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184401106	3900582	GILBERTO	CLARET	BARRETO 	MEDERICO	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	gbarreto@mppee.gob.ve	PROFESIONAL II	97	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184401766	18756648	JUNIOR		SALAZAR	GONZALEZ	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	jsalazar@mppee.gob.ve	APOYO ADMINISTRATIVO	560	1	93	ADMINISTRATIVO	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397194	6352195	NICOLAS		PICADO	CORDERO	CONTRATADO	DESPACHO DEL MINISTRO		APOYO PROFESIONAL	7	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184404533	13866994	JOSE	REINALDO	CAMEJO	DIAZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	JRCAMEJO@MPPEE.GOB.VE	PROFESIONAL III	21	2	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184400897	10487936	HERNAN	GERARDO	URBINA	GARCIA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	HURBINA@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	103	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398512	11127229	ALIRIO		PERDOMO		HONORARIOS PROFESIONALES	OFICINA DE GESTION ADMINISTRATIVA		APOYO PROFESIONAL	7	1	35	PROFESIONAL	53	OFICINA DE GESTIÓN ADMINISTRATIVA
184405894	19885326	YOLIANDER	SALVADOR	CANO	MURILLO	PASANTE	OFICINA DE RECURSOS HUMANOS	YOLIANDERCANO@GMAIL.COM	PASANTE PROFESIONAL	178	2	35	PROFESIONAL	62	OFICINA DE RECURSOS HUMANOS
184391062	10633212	CAREMI	MILEYDY	MILLAN	RODRIGUEZ	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	CMILLAN@MPPEE.GOB.VE	BACHILLER I	100008	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405290	19310487	JUAN	ERNESTO	ESCALANTE	ARGUINZONES	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JESCALANTE@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	276	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401982	4766685	ALBERTO	JOANES	URDANETA	URDANETA	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	AURDANETA@MPPEE.GOB.VE	DIRECTOR GENERAL	38	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184404134	17864202	DANYILA	FABIOLA	CADENAS	NARDONE	CONTRATADO	CENTRO NACIONAL DE DESPACHO	FABIOLACADENASNARDONE@GMAIL.COM	APOYO PROFESIONAL	729	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184397191	4253285	MIREYA	ANTONIA	MERLO	DE SEMPRUN	CONTRATADO	AREA DE SECRETARIA	MMERLO@MPPEE.GOB.VE	APOYO PROFESIONAL	4	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184404062	6727530	JOSE	GREGORIO	GARCIA	CONTRERAS	ALTO NIVEL Y/O CONFIANZA	OFICINA DE SEGURIDAD INTEGRAL	jggarciac@mppee.gob.ve	DIRECTOR	2768	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE SEGURIDAD INTEGRAL
184404135	17830673	JAVIER	ENRIQUE	VASQUEZ	ANDARA	CONTRATADO	CENTRO NACIONAL DE DESPACHO	VASQJAV@GMAIL.COM	APOYO PROFESIONAL	730	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184403339	12204812	ALEXANDER	RAMON	CAMACHO	URBINA	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	acamacho@mppee.gob.ve	COORDINADOR	2762	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184403621	16022986	JOSÉ	ANTONIO	MONJE	PÉREZ	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JMONJE@MPPEE.GOB.VE	PROFESIONAL I	600070	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404946	3752904	ZOILA	ROSA	ALVAREZ	CASTAÑO	CONTRATADO	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	zalvarez@mppee.gob.ve	APOYO ADMINISTRATIVO	788	1	93	ADMINISTRATIVO	28	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184404525	5313075	ESPERANZA	DEL VALLE	COLON	CONTRERAS	EGRESADOS	OFICINA DE RECURSOS HUMANOS	ESPERANZACOLON@GMAIL.COM	PROFESIONAL III	13	2	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184405271	16619063	JUAN	CARLOS	CONTRERAS	VELAZCO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JCONTRERAS202@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	257	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403616	15907072	NESTOR	DANIEL	MARTINEZ	SANCHEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	ndmartinez@mppee.gob.ve	PROFESIONAL I	600147	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400684	14870268	ALEXIS	ANTONIO	TORREALBA		OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	ATORREALBA@MPPEE.GOB.VE	CHOFER	51	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184400540	5151141	IGNACIO	DANILO	GARCIA	HERNANDEZ	ALTO NIVEL Y/O CONFIANZA	AREA DE ESTADISTICAS	IGARCIA@MPPEE.GOB.VE	COORDINADOR	2672	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184398853	1617698	RODOLFO	ENRIQUE	GALVIS	RUIZ	HONORARIOS PROFESIONALES	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	RGALVIS@MPPEE.GOB.VE	APOYO PROFESIONAL	2723	1	35	PROFESIONAL	53	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404568	6340911	ARELIS	ISABEL	SUAREZ	GUTIERREZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	SUAREZISABEL@CANTV.NET	ASISTENTE	56	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184404614	11918932	WILKELY	DAVID	FERMIN 	QUINTERO	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	WILKELYF@HOTMAIL.COM	APOYO PROFESIONAL	766	1	35	PROFESIONAL	28	OFICINA DE ATENCIÓN AL CIUDADANO
184400836	5417503	JOSE 	ALEJANDRO	CLEMENTE		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JCLEMENTE@MPPEE.GOB.VE	MENSAJERO	92	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398798	1198048	RUBEN	RAFAEL	SUAREZ	JIMENEZ	HONORARIOS PROFESIONALES	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	2708	1	35	PROFESIONAL	53	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184405733	20999802	ANALICIA		RINCON 	GONZALEZ	PASANTE	OFICINA DE RECURSOS HUMANOS	ANALICIARINCON20@GMAIL.COM	PASANTE PROFESIONAL	169	2	35	PROFESIONAL	62	OFICINA DE RECURSOS HUMANOS
184403657	16996396	MERYS	TERESA	MARCANO	ACUÑA	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	MMARCANO@MPPEE.GOB.VE	PROFESIONAL I	600221	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397192	15165834	JEANAIS	ALEJANDRA	QUIROZ	ANGULO	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	AQUIROZ@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	5	1	93	ADMINISTRATIVO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184399500	16880696	ROSALES	NUÑEZ	EMNIANY	ANAIS	PASANTE	OFICINA DE SEGURIDAD INTEGRAL	ANAIS8462@HOTMAIL.COM	PASANTE PROFESIONAL	28	2	35	PROFESIONAL	62	OFICINA DE SEGURIDAD INTEGRAL
3343	9965882	ENRIQUE	JAVIER	PEREZ	ZAMORA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	EPEREZ@MEM.GOV.VE	PROFESIONAL II	1482	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184403471	7317036	ASTRID	MARGARITA	CALDERA	MARQUEZ	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	ACALDERA@MPPEE.GOB.VE	PROFESIONAL I	600132	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184390026	11059106	ARON	ELEAZAR	LADERA	GARCIA	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	ALADERA@MPPEE.GOB.VE	PROFESIONAL III	800009	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
3588	6343546	LILIANA	 MAITE	ÑAÑEZ	BANDES	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	LNANEZ@MPPEE.GOB.VE	BACHILLER III	300006	1	93	ADMINISTRATIVO	12	OFICINA DE RECURSOS HUMANOS
184404850	15331697	MIGUEL	ALFONSO	BORJAS	RONDON	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	MBORJAS@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	783	1	93	ADMINISTRATIVO	28	OFICINA DE SEGURIDAD INTEGRAL
184404399	14015605	FRANCIS	BETTY	MORENO	FRANCO	CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	FMORENO@MPPEE.GOB.VE	APOYO TECNICO	757	2	92	TECNICO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184401986	5742680	CARLOS	ALFONSO	GOYO	BARRIENTOS	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	CARLOS.GOYO-BARRIENTOS@CANTV.NET	DIRECTOR GENERAL	72	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184405470	13935879	JOSE	GREGORIO	VALERO 	COVA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2804	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404138	591759	JOSE	JESUS	RONDON	PINO	ALTO NIVEL Y/O CONFIANZA	DIRECCION DEL DESPACHO	JRONDON@MPPEE.GOB.VE	COORDINADOR	2770	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN DEL DESPACHO
184400727	19760868	ABNER	ABISAY	MARGAREJO		OBRERO FIJO	AREA DE COMPRAS	AMARGAREJO@MPPEE.GOB.VE	COCINERO	77	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184390016	12069501	DAYANA	SIKIU	VASQUEZ	VEGAS	EMPLEADO FIJO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	DVASQUEZ@MPPEE.GOB.VE	PROFESIONAL II	700008	2	35	PROFESIONAL	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184403217	19291444	SAMUEL		REYES	GARCÍA	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	sreyes@mppee.gob.ve	PASANTE PROFESIONAL	104	2	35	PROFESIONAL	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184401123	1581763	JOSE	STALIN	BRICEÑO	BECERRA	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	jsbriceno@mppee.gob.ve	APOYO PROFESIONAL	477	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403751	17719026	LEONEL	JESUS	MARVAL	RAMIREZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	LMARVAL@MPPEE.GOB.VE	BACHILLER II	200010	1	93	ADMINISTRATIVO	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184405432	16084361	JONATHAN	RAFAEL	RAMIREZ	MELO	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JRRAMIREZ@MPPEE.GOB.VE	APOYO PROFESIONAL	811	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184402017	3527984	COROMOTO		MENDOZA 	GOMEZ	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	COROMENGO@HOTMAIL.COM	APOYO PROFESIONAL	592	1	35	PROFESIONAL	28	OFICINA DE ATENCIÓN AL CIUDADANO
184402146	19906187	JUSMERY	MARIA	SI	CHING LIN	PASANTE	DIRECCION ESTADAL (ZULIA)		PASANTE PROFESIONAL	81	2	35	PROFESIONAL	62	DIRECCIONES ESTADALES
184404455	19444535	RICHARD	RAFAEL	HERNANDEZ	FREITES	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO		PASANTE PROFESIONAL	121	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403615	15842762	CARLOS 	LUIS	GONZALEZ	SILVERIO	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	CLGONZALEZ@MPPEE.GOB.VE	TECNICO II	500017	2	92	TECNICO	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184398069	84409348	ELVIO	RAMON	CHAVEZ	GONZALEZ	CONTRATADO	AREA DE SISTEMAS	ECHAVEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	180	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397558	6017598	YOLANDA		ZERPA	OROPEZA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	YZERPA@MPPEE.GOB.VE	PROFESIONAL III	800053	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405561	7253135	FRANCO	JAVIER	SILVA	AVILA	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	FSILVA@MPPEE.GOB.VE	VICEMINISTRO	9950016	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184404279	18014754	JESUS	AUGUSTO GREGORIO	SILVA	LOPEZ	CONTRATADO	CENTRO NACIONAL DE DESPACHO	BONYORNY_20@HOTMAIL.COM	APOYO TECNICO	741	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184402144	20779431	GABRIELA	CRISTINA	VILLAMIZAR	MORAN	PASANTE	DIRECCION ESTADAL (ZULIA)		PASANTE PROFESIONAL	79	2	35	PROFESIONAL	62	DIRECCIONES ESTADALES
184405251	13945576	ENYS	DAYANA	RANGEL	CARRASQUEL	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ERANGEL200@MPPEE.GOB.VE	ASEADOR	237	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398616	5973171	WILLIAMS	JOSE	RAMOS	CERRADA	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	WRAMOS@MPPEE.GOB.VE	APOYO TECNICO	246	2	92	TECNICO	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400707	6124529	JUAN 	RAMON	BRITO		OBRERO FIJO	AREA DE COMPRAS	JRBRITO@MPPEE.GOB.VE	CHOFER	10	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403583	14987231	ALEJANDRO 	ESTEBAN	LOPEZ	GONZALEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	aelopez@mppee.gob.ve	PROFESIONAL II	700107	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400681	14287516	JHONSON	ANTONIO	SOTELDO	RODRIGUEZ	OBRERO FIJO	AREA DE COMPRAS	JSOTELDO@MPPEE.GOB.VE	CHOFER	48	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404451	17693733	JHONY	ALBERTO	GRILLET	MEDINA	PASANTE	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA		PASANTE PROFESIONAL	117	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184405745	10381473	DOUGLAS	ANTONIO	DIAZ	MONTEZUMA	CONTRATADO	OFICINA DE RECURSOS HUMANOS		INSTRUCTOR DE GIMNASIO	814	3	93	ADMINISTRATIVO	28	OFICINA DE RECURSOS HUMANOS
184401921	16877209	YERLY	MARIAM	MONSALVE	GARCIA	CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	YMONSALVE@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	582	1	93	ADMINISTRATIVO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184401574	11230675	TAWATA		ARAUJO	JUAN	ALTO NIVEL Y/O CONFIANZA	DIRECCION DEL DESPACHO	TARAUJO@MPPEE.GOB.VE	COORDINADOR	2736	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN DEL DESPACHO
184400148	5531946	JOSE 	ENRIQUE	SANCHEZ	PIÑATE	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	jesanchez@mppee.gob.ve	PROFESIONAL I	78	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184398585	5965438	GAUDY	MIGUEL	SANCHEZ	TORRES	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	GSANCHEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	2709	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184405275	17195854	JOHAN	ARTURO	VALERO	ALVAREZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JVALERO@MPPEE.GOB.VE	AYUDANTE DE ALMACEN	261	1	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399436	4709193	LEIDA	BEATRIZ	ARAUJO 	MARCANO	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	LARAUJO@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	358	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184401423	11307062	VANESSA	CAROLINA	REQUENA	TIZZANI	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION DEL DESPACHO		BACHILLER III	105	1	93	ADMINISTRATIVO	22	DIRECCIÓN DEL DESPACHO
184403440	4605158	MARIA	CAROLINA	BLANCO	DE PIERANTONI	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	MCBLANCO@MPPEE.GOB.VE	PROFESIONAL III	800041	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184400892	13636519	LUIS	GUILLERMO	DIAZ	ROJAS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	LGDIAZ@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	98	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404510	15289347	RONALD	MIGUEL	ROMERO 	GIL	CONTRATADO	CENTRO NACIONAL DE DESPACHO	RMROMERO@MPPEE.GOB.VE	APOYO TECNICO	761	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184405565	21409196	JUAN	CARLOS	CABRAL	QUINTANA	PASANTE	DIRECCION DEL DESPACHO	JCCABRAL09@GMAIL.COM	PASANTE TECNICO	158	2	92	TECNICO	62	DIRECCIÓN DEL DESPACHO
184400523	1417113	JULIO	MARCELINO	CHIRINO		ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	JCHIRINO@MPPEE.GOB.VE	DIRECTOR GENERAL	2699	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184402396	16523676	AIDA	COROMOTO	HERNANDEZ	TOVAR	OBRERO FIJO	AREA DE SERVICIOS GENERALES	ACHERNANDEZ@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	137	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400697	17224747	JOSE	ABRAHAN	GOMEZ	PEREZ	OBRERO FIJO	AREA DE COMPRAS	JAGOMEZP@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	64	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184397826	17147234	VELVET	MOUREEN	DE SOUSA	D'AGOSTINO	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	VDESOUSA@MPPEE.GOB.VE	APOYO PROFESIONAL	129	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405229	10521341	YELITZA		SUAREZ		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	YSUAREZ203@MPPEE.GOB.VE	ASEADOR	215	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400831	10384207	JUZMARY	MARGARITA	RIVAS	TRIAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	JRIVAS@MPPEE.GOB.VE	COORDINADOR	90	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE SEGURIDAD INTEGRAL
184405624	10241271	JOSE		ROJAS	ROJAS	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2822	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184402332	10179709	VICTOR	ALEXIS	VIVAS 	RODRIGUEZ	OBRERO FIJO	AREA DE SERVICIOS GENERALES	VAVIVAS@MPPEE.GOB.VE	MESONERO	123	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184397075	5312799	ARIANIZ		VILLASMIL		EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS		ASISTENTE	2655	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE RECURSOS HUMANOS
184405129	3877328	ALEJANDRO	ANTONIO	RODRIGUEZ	PERAZA	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	AARODRIGUEZ@MPPEE.GOB.VE	JUBILADO	7	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184405319	3612427	NOEL	RAFAEL	DIAZ	SALAZAR	ALTO NIVEL Y/O CONFIANZA	AREA DE GESTION DE EQUIPOS E INFRAESTRUCTURA DEL SISTEMA ELECTRICO NACIONAL	NAVDIAZ@GMAIL.COM	COORDINADOR	9950013	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403754	16264390	AILEEN	ALEJANDRA	DIAZ	VASQUEZ	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	AADIAZ@MPPEE.GOB.VE	PROFESIONAL I	600069	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184402910	13515144	JESUS	ALBERTO	GUEVARA	HOYER	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	JGUEVARA@MPPEE.GOB.VE	PROFESIONAL II	700032	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184398514	11127230	SEGUNDO		PERDOMO	VASQUEZ	HONORARIOS PROFESIONALES	OFICINA DE GESTION ADMINISTRATIVA		APOYO PROFESIONAL	2704	1	35	PROFESIONAL	53	OFICINA DE GESTIÓN ADMINISTRATIVA
184399508	2085052	RAFAEL 	GERARDO	CORDERO	VALENZUELA	HONORARIOS PROFESIONALES	DESPACHO DEL MINISTRO		APOYO PROFESIONAL	2742	1	35	PROFESIONAL	53	DESPACHO DEL MINISTRO
184403658	17049218	MARILIN	DEL VALLE	DURAN	BRACAMONTE	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	mduran@mppee.gob.ve	PROFESIONAL I	600056	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184404672	1733699	MARIA 	CRISTINA	CORONADO		OBRERO-CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	MCORONADO200@MPPEE.GOB.VE	OPERARIO(A) DE LIMPIEZA Y MANTENIMIENTO	436	4	24	OBRERO	92	OFICINA DE GESTIÓN ADMINISTRATIVA
184398794	640666	ALBERTO	JULIAN	ROSSI	HERRERA	EMPLEADO FIJO	ÁREA LEGAL	AROSSI@MPPEE.GOB.VE	DIRECTOR	2705	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE RECURSOS HUMANOS
184405962	13325251	TISBETH	DEL CARMEN	FAJARDO	SOTILLO	ALTO NIVEL Y/O CONFIANZA	OFICINA DE ATENCION AL CIUDADANO	TFAJARDO06@HOTMAIL.ES	DIRECTOR	9950034	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE ATENCIÓN AL CIUDADANO
184398673	16379678	CARLOS	JOSE	VALERA	HURTADO	CONTRATADO	AREA DE COMPRAS	CARLOSVALERA67@HOTMAIL.COM	CHOFER	253	4	24	OBRERO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184405194	5888532	PEDRO	LUIS	MIJARES	MAIZO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	AZ019PLMM@HOTMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	180	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184394933	11705639	PUBLIO	JOSE	MONTILLA	DE LOS SANTOS	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	PMONTILLA@MPPEE.GOB.VE	PROFESIONAL II	700124	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405895	19527324	YURASMY	JOSÉ	RODRÍGUEZ	MALAVE	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	YUR.RODRI@GMAIL.COM	PASANTE PROFESIONAL	179	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403872	18121146	NAYRETH	MILAGROS	MONTIEL	GONZALEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	NAYRETHMONTIEL@HOTMAIL.COM	PROFESIONAL I	600141	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403503	11557537	DAMARIS	ALEJANDRA	YEPEZ	AGUILERA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	dyepez@mppee.gob.ve	PROFESIONAL II	700127	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184405289	18932980	CRISTIAN	ALBERTO	CHIRINO	CASTRO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CHIRINOS717@GMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	275	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404772	13116397	DEMERY	DE JESUS	FRANCO		EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	DEMERY2@HOTMAIL.COM	PROFESIONAL II	800150	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184397253	9480568	ZOBEIDA	MIREYA	MUÑOZ	JIMENEZ	CONTRATADO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	ZMUNOZ@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	16	1	93	ADMINISTRATIVO	28	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184400717	17491032	CRISTIAN	GEORZE	CARO	ESCALANTE	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	CCARO@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	67	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184402511	19015685	KELVIN	SMITH	DAVILA	FUENTES	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	KDAVILA@MPPEE.GOB.VE	VIGILANTE	152	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184397571	14548629	MARIA	TERESA	PEREZ	MANAGUA	CONTRATADO	AREA DE PLANIFICACION Y SEGUIMIENTO DE GESTION	MPEREZ@MPPEE.GOB.VE	APOYO PROFESIONAL	48	1	35	PROFESIONAL	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184404003	17095008	JEAN	CARLO LUIS	SANCHEZ	PAREDES	CONTRATADO	CENTRO NACIONAL DE DESPACHO	JSANCHEZ@MPPEE.GOB.VE	APOYO TECNICO	717	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184398516	17756256	STANLEY		IZTURRIAGA	ESCALANTE	HONORARIOS PROFESIONALES	OFICINA DE GESTION ADMINISTRATIVA		APOYO PROFESIONAL	9	1	35	PROFESIONAL	53	OFICINA DE GESTIÓN ADMINISTRATIVA
184402271	12867116	NEYLA	SAFFI	TEGUEDOR	OSORIO	CONTRATADO	DIRECCION ESTADAL (ZULIA)	NTEGUEDOR@MPPEE.GOB.VE	APOYO PROFESIONAL	618	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184405192	5579215	RUBEN	DARIO	PARRA	MARQUEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RPARRA203@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	178	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403669	17227127	DANIEL	JOEL	ARAUJO	RIERA	EMPLEADO FIJO	DESPACHO DEL MINISTRO	daraujo@mppee.gob.ve	PROFESIONAL I	600003	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184401126	17726281	EDWAR	JESUS	RODRIGUEZ	RODRIGUEZ	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	EDWARROD@HOTMAIL.COM	PASANTE PROFESIONAL	60	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400688	15178614	MARTHA	LIGIA	HERRERA	LEON	OBRERO FIJO	AREA DE COMPRAS	MHERRERA@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	55	4	111	OBRERO SUPERVISOR	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403721	19885956	GRISBETH	EGLEE	RODRIGUEZ	AULAR	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	GERODRIGUEZ@MPPEE.GOB.VE	TECNICO I	400006	2	92	TECNICO	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184398061	10827708	ORQUIDEA		VILLEGAS	HENRIQUEZ	EMPLEADO FIJO	CONSULTORIA JURIDICA	OVILLEGAS@MPPEE.GOB.VE	PROFESIONAL III	800016	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184403498	11031633	CLAUDIA	CAROLINA	GONZALEZ	MEZONES	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	CGONZALEZ@MPPEE.GOB.VE	PROFESIONAL II	700010	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184406107	16012678	LUIS	ALBERTO	PATIÑO	LINARES	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL MINISTRO		PROFESIONAL I	182	1	35	PROFESIONAL	22	DESPACHO DEL MINISTRO
184398953	5094309	ARIS	DEL VALLE	FERRER	VELASQUEZ	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	aferrer@mppee.gob.ve	APOYO PROFESIONAL	288	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184400214	18363333	JESUS 	ENRIQUE	GONZALEZ	PINTO	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO		ESCOLTA	46	4	24	OBRERO	93	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184398607	18815249	XAVIER	FAUSTINO	COFFI	RIERA	PASANTE	AREA DE DESARROLLO		PASANTE TECNICO	7	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184402997	6209936	FABIAN	EDUARDO	FLORES	FREIRE	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	fflores@mppee.gob.ve	DIRECTOR GENERAL	122	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
3373	5885588	RICHARD	CLEMENTE	ARDILA		EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	RARDILA@MPPEE.GOB.VE	PROFESIONAL III	800062	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398515	16740147	DANNY	RAFAEL	ARAUJO		HONORARIOS PROFESIONALES	OFICINA DE GESTION ADMINISTRATIVA		APOYO PROFESIONAL	8	1	35	PROFESIONAL	53	OFICINA DE GESTIÓN ADMINISTRATIVA
184399226	19310601	LOREDANA	GABRIELA	GONZALEZ	QUIÑONES	PASANTE	OFICINA DE RECURSOS HUMANOS	LOREDANA_GONZALEZ@HOTMAIL.COM	PASANTE TECNICO	16	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184397944	2767629	HENRY	JOSE	ARROYO	CLEMENTE	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	HARROYO@MPPEE.GOB.VE	DIRECTOR GENERAL	2682	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184405269	16352295	CARLOS	EDUARDO	URBINA	URDANETA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CEURBINA@MPPEE.GOB.VE	CHOFER	255	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405257	15200909	ROSAURA		MALDONADO		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MROSAURA200@MPPEE.GOB.VE	ASEADOR	243	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401700	3945626	EZEQUIEL	ENRIQUE	AGUILERA	FIGUERA	CONTRATADO	DESPACHO DEL MINISTRO	eeaguilera@mppee.gob.ve	APOYO PROFESIONAL	547	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184401637	4330313	BLANCA	MARLENE	ZAMBRANO 	FLORES	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL MINISTRO	bzambrano@mppee.gob.ve	COORDINADOR	9920079	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL MINISTRO
184404869	3346493	OLIVER	DEL JESUS	BELISARIO		ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE PARTICIPACION POPULAR	OBELISARIO@MPPEE.GOB.VE	COORDINADOR	9950007	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184405497	17920205	JANSON	ALEXANDER	FLAUTES	TUAREZ	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	JACK02@HOTMAIL.COM	PASANTE PROFESIONAL	153	2	35	PROFESIONAL	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184399838	15440366	CLAUDIA	PATRICIA	SANTAMARIA	VARELA	OBRERO-CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	CSANTAMARIA@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	435	4	24	OBRERO	92	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
3341	9387265	RINO	 	SORDI	TARONNA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	RSORDI@MPPEE.GOB.VE	PROFESIONAL II	700085	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184399229	16577355	ANGUI	CAROLINA	RODRIGUEZ	MORALES	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	2726	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184400712	6682274	DOUGLAS	ALEICA 	LAMON	MONTAÑA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	DLAMON@MPPEE.GOB.VE	VIGILANTE	15	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184399030	9989532	YILBER	ALBERTO	VILLAMIZAR	PEÑA	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	YVILLAMIZAR@MPPEE.GOB.VE	APOYO PROFESIONAL	307	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405120	6336246	FRANCISCO	EVELIO	SUAREZ	BRICEÑO	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE PARTICIPACION POPULAR	FSUAREZ@MPPEE.GOB.VE	DIRECTOR GENERAL	133	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184404276	16254632	MARCO	ANTONIO	REQUENA 	SALAZAR	CONTRATADO	CENTRO NACIONAL DE DESPACHO	MREQUENA@MPPEE.GOB.VE	APOYO TECNICO	738	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184403654	16953942	MARIANELLA	DEL CARMEN	ZAMBRANO	SANCHEZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	mzambrano@mppee.gob.ve	PROFESIONAL I	600023	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184404842	14646677	CESAR	JOSÉ	MALPICA	CARRASQUEL	CONTRATADO	CONSULTORIA JURIDICA	CMALPICA@MPPEE.GOB.VE	APOYO PROFESIONAL	775	1	35	PROFESIONAL	28	CONSULTORÍA JURIDICA
184405190	5104106	ZOILA		CARMONA	DE OLIVAR	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ZCARMONA200@MPPEE.GOB.VE	ASEADOR	176	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404520	11678675	YATMERY	MERLY	MONTILLA 	LOPEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	YMONTILLA@MPPEE.GOB.VE	DIRECTOR	8	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184405252	14167183	ANA	LOURDES	REYES	PALENCIA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ALREYES@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	238	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402395	18032733	RAFAEL	ANTONIO	ZERPA	RONDON	OBRERO FIJO	AREA DE SERVICIOS GENERALES	rzerpa@mppee.gob.ve	MESONERO	136	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401031	3764146	RUBEN 	DARIO	GARCIA	IBARRA	CONTRATADO	AREA DE COMPRAS	rdgarcia@mppee.gob.ve	APOYO PROFESIONAL	472	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184405633	5220261	NORMA	ELENA	BELLO	CELIS	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	NBELLO@MPPEE.GOB.VE	JUBILADO	11	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184399446	16530775	LINDA	CAROLINA	VASCONEZ	CARVAJAL	HONORARIOS PROFESIONALES	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	CAROLINDA341@GMAIL.COM	APOYO PROFESIONAL	2740	1	35	PROFESIONAL	53	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184402457	14446895	JORGE	LUIS	BRICEÑO 	TORREALBA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JBRICENO@MPPEE.GOB.VE	VIGILANTE	148	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184397995	13801968	JUAN	CRISOSTOMO	DE ABREU	LOZADA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	JUAN_DEABREU280380@HOTMAIL.COM	ASISTENTE	31	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184405238	11409002	JOSE	RAFAEL	GARCIA	NIEVES	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JGARCIA216@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	224	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401307	6129289	LUIS 	GREGORIO	GRAU	CAÑAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	LUIS.GRAU@LAEDC.COM.VE	PROFESIONAL III	101	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184404564	4170020	HELCIAS	MOISES	BENAIM	CASADO	EGRESADOS	OFICINA DE RECURSOS HUMANOS	HBENAIM@MPPEE.GOB.VE	DIRECTOR ADJUNTO	52	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184403817	12204812	ALEXANDER	RAMON	CAMACHO	URBINA	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	acamacho@mppee.gob.ve	PROFESIONAL II	700058	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184390280	12388964	ELYSAUD		BERMUDEZ	RUBIO	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	EBERMUDEZ@MPPEE.GOB.VE	PROFESIONAL I	600101	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184406023	16115664	JESSENIA	CAROLINA	ALDANA	JARAMILLO	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	jaldana@mppee.gob.ve	BACHILLER III	176	1	93	ADMINISTRATIVO	22	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405466	13372030	RONY	SANDER	AREVALO	SALON	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2800	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404511	19840440	JUAN	PABLO RAFAEL	ROJAS	BRAZON	CONTRATADO	CENTRO NACIONAL DE DESPACHO	JPROJAS@MPPEE.GOB.VE	APOYO TECNICO	762	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184404920	1877735	ANGEL	EDUARDO	PIMENTEL	SANCHEZ	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE PARTICIPACION POPULAR	APIMENTEL@MPPEE.GOB.VE	COORDINADOR	9950008	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184402459	17490366	YOEL 	LEOPOLDO	TORO 	ROJAS	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	YTORO@MPPEE.GOB.VE	VIGILANTE	150	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184390625	13149296	RICARDO	IVAN	ARIAS	VELASQUEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	RARIAS@MPPEE.GOB.VE	PROFESIONAL III	800063	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400837	7928809	PEDRO	CELESTINO	CAIGUA	ARAGUACHE	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	PCAIGUA@MPPEE.GOB.VE	CHOFER	93	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404531	12641032	AURORA	MARIA	LEDEZMA	GONZALEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	ALEDEZMA@MPPEE.GOB.VE	PROFESIONAL III	19	2	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184401127	18466407	KARLA	CAROLINA	PERALTA	GARCIA	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA		PASANTE TECNICO	61	2	92	TECNICO	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184399962	18589209	JHONNY	ALEXANDER	MENDEZ	ALAYON	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JMENDEZ@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	408	1	93	ADMINISTRATIVO	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184400479	16936889	RENNY	JESUS	MARTINEZ	GUTIERREZ	CONTRATADO	AREA DE COMPRAS	RJMARTINEZ@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	434	4	24	OBRERO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184400515	25053254	JOSE		IGLESIAS 	DOMINGUEZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS		OFICIAL DE SEGURIDAD	187	4	24	OBRERO	28	OFICINA DE RECURSOS HUMANOS
184405291	19379183	JOSE 	LUIS	JIMENEZ	VARGAS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	SONGORO480@HOTMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	277	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402720	14929518	DANIEL	JOSE	HIDALGO	SIMANCAS	CONTRATADO	DIRECCION ESTADAL (ZULIA)	DHIDALGO@MPPEE.GOB.VE	APOYO PROFESIONAL	646	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184400685	15021238	SIMON	LEONEL	ACOSTA	AMARO	OBRERO FIJO	AREA DE COMPRAS	SACOSTA@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	52	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403084	12059652	PEDRO	ALCIDES	TINEO 	DIAZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	PTINEO@MPPEE.GOB.VE	PROFESIONAL III	138	1	35	PROFESIONAL	22	OFICINA DE SEGURIDAD INTEGRAL
184403481	9415868	MARIA	VICTORIA	ALDANA	HERNANDEZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MALDANA@MPPEE.GOB.VE	PROFESIONAL II	700042	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403533	13360799	FREDDY	JOSE	NAVA	LOPEZ	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	FNAVA@MPPEE.GOB.VE	PROFESIONAL I	600191	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184403701	18103354	JULIO	CESAR	GARABITO	SANCHEZ	EMPLEADO FIJO	DESPACHO DEL MINISTRO	JGARABITO@MPPEE.GOB.VE	PROFESIONAL I	600181	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184401252	5079091	LUIS	EDGARDO	CHACON 	DURAN	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL	LCHACON@MPPEE.GOB.VE	HONORARIO PROFESIONAL	2754	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404518	11109727	AMIN	DUBRASKA	GONZALEZ	SANCHEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	AMINGONZALEZ21@GMAIL.COM	DIRECTOR DE LINEA	6	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184397902	4056575	ANA	ELISA	OSORIO	GRANADO	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	AOSORIO@MPPEE.GOB.VE	JUBILADO	1	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184403573	14584558	ANA	KARINA	LOPEZ 	PULIDO	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	aklopez@mppee.gob.ve	PROFESIONAL I	600217	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184399299	10900860	ALIDA		PEÑA	RODRIGUEZ	PASANTE	OFICINA DE RECURSOS HUMANOS		PASANTE TECNICO	20	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184405805	19045642	KATIUSKA 	KATHERINE	PARRA	DIAZ	PASANTE	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES		PASANTE TECNICO	173	2	92	TECNICO	62	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405218	9143463	JOSE	ELADIO	ARAQUE	RAMIREZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JARAQUE200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	204	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405287	18729445	NELSON	JOSE	MATHEUS	ARENAS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	NMATHEUS@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	273	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403667	17202105	MAYGISEL	JOSE	BARRIOS	HERNANDEZ	EMPLEADO FIJO	DESPACHO DEL MINISTRO	MBARRIOS@MPPEE.GOB.VE	PROFESIONAL I	600180	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184400029	5579499	SUSANA	ANTONIA	TREJO	TOVAR	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	STREJO@CANTV.NET	APOYO TECNICO	414	2	92	TECNICO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184403735	19031523	MARY	CAROLINA	MENDOZA	GRATEROL	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	MMENDOZA@MPPEE.GOB.VE	PROFESIONAL I	600086	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184405301	22670780	PAOLA		RAMOS	GRACIA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	PRAMOS200@MPPEE.GOB.VE	ASEADOR	287	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405241	12684585	FRANCISCO	JAVIER	NIEVES	BASTARDO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	FNIEVES200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	227	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405372	12634670	EDDY	MARISELA	GUERRERO	DIAZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	LAGOCHAMARISELA1977@HOTMAIL.COM	ASEADOR	289	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184405469	13824319	FELIX	JOSE	PEREZ	CARREÑO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2803	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405628	19839011	CARLOS	GABRIEL	NARVAEZ 	COLMENARES	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2826	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403592	15328694	RONALD	DAVID	SALCEDO	HERRERA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	RSALCEDO@MPPEE.GOB.VE	PROFESIONAL I	600151	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184401268	18287315	MIGUEL	ANGEL	ALVARADO	VILORIA	CONTRATADO	DIRECCION ESTADAL (ZULIA)	malvarado@mppee.gob.ve	APOYO PROFESIONAL	496	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184397561	6811175	NELIDA	DEL VALLE	ONTIVEROS	CAMACHO	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	NONTIVEROS@MPPEE.GOB.VE	PROFESIONAL II	700081	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184397464	13433814	ANA	ROSA	PUERTA	PEREZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	APUERTA@MPPEE.GOB.VE	PROFESIONAL II	700125	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184399221	3638390	RAFIC		SOUKI	RINCON	CONTRATADO	DESPACHO DEL MINISTRO	RSOUKI@MPPEE.GOB.VE	APOYO PROFESIONAL	335	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184400673	13750980	YANETT		BAYONA	DE BRICEÑO	OBRERO FIJO	AREA DE COMPRAS	YBAYONA@MPPEE.GOB.VE	COCINERO	40	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405825	24280410	MARIO	JOSÉ	ORTIZ	SILVA	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	ORTIZSILVAM@GMAIL.COM	PASANTE TECNICO	174	2	92	TECNICO	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184397665	6563404	MARIA	ALEXANDRA	RAMIREZ	PARRA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO		COORDINADOR	15	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184403698	18020505	MARIANA	ZULAY	GUANDA	MONCADA	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	MGUANDA@MPPEE.GOB.VE	PROFESIONAL I	600163	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184400895	6968402	IRIS	JOSEFINA	CARTAYA		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ICARTAYA@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	101	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405232	10868339	RAFAEL	RAMON	HERNANDEZ	BRICEÑO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RHERNANDEZ208@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	218	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399506	11552699	MARIA	ANTONIA	DI NICOLA	SANCHEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	AREA DE COMPRAS	MDINICOLA@MPPEE.GOB.VE	TECNICO I	66	2	92	TECNICO	22	OFICINA DE GESTIÓN ADMINISTRATIVA
184403655	16953993	ERICK	JAVIER	BRITO	FLORES	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	EBRITO@MPPEE.GOB.VE	PROFESIONAL I	600021	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184402458	16871845	DEIVIS	ALEXANDER	UTRERA	MARTINEZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	DUTRERA@MPPEE.GOB.VE	VIGILANTE	149	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184404524	5306680	MARIA	ELENA	PAEZ	MACIA	EGRESADOS	OFICINA DE RECURSOS HUMANOS	MPAEZ@MPPEE.GOB.VE	COORDINADOR	12	0	39	COORDINADOR	141	OFICINA DE RECURSOS HUMANOS
184403613	15831149	CINDY	MARGARITA	GONZALEZ	MARTINEZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CMGONZALEZ@MPPEE.GOB.VE	PROFESIONAL II	700138	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184396996	15151070	EDIRSON	GERARDO	MARQUINA	GAMEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	EMARQUINA@MPPEE.GOB.VE	TECNICO I	400036	2	92	TECNICO	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405478	16541779	JOSE	ALEXANDER	PORRAS	COLMENARES	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2812	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404933	9272671	MARIANELA	DE LA COROMOTO	CERVIÑO	ALONSO	COMISION DE SERVICIOS Y/O ENCARGADURIA	AUDITORIA INTERNA	MARIANELA2000_VE@YAHOO.COM	PROFESIONAL III	158	1	35	PROFESIONAL	22	AUDITORÍA INTERNA
184403871	18736353	CORYMAR	YELENA	LAVADO	MORA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	CORYNTHYA@HOTMAIL.COM  	PROFESIONAL I	600140	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184399449	20417943	LUCY	GEORGIANA	ABACHE 	PONCE	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	LABACHE@MPPEE.GOB.VE	PASANTE TECNICO	27	2	92	TECNICO	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184404263	11735528	PEDRO	LUIS	FARIAS	BRITO	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	pfarias@mppee.gob.ve	PROFESIONAL I	600199	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184404136	17056097	LEYVIS	EGLEE	URDANETA	ROA	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	LEUR86@HOTMAIL.COM	APOYO PROFESIONAL	731	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404851	4681914	JUAN 	JOEL	CHAPARRO	FIGUEROA	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	JOELCHAPARRO@CANTV.NET /  JUANJOELCH@GMAIL.COM	COORDINADOR	9950005	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404941	10804444	RUBEN	GREGORIO	TORO		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RTORO@MPPEE.GOB.VE	VIGILANTE	167	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184392936	13307505	ALEIDA	JOSEFINA	GIL	ROJAS	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	AGIL@MPPEE.GOB.VE	PROFESIONAL I	600110	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405455	11895068	ALEXANDER	DE JESUS	TORRES	FERNANDEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2789	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405198	6093373	TIBISAY	NORELES	CARRASQUEL	CARRASQUEL	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	TCARRASQUEL200@MPPEE.GOB.VE	ASEADOR	184	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402089	17165089	MIGUEL	ALEJANDRO	NARANJO	ESPINOZA	PASANTE	DIRECCION GENERAL DE PARTICIPACION POPULAR	MIGUELNARANJO_1986@HOTMAIL.COM	PASANTE PROFESIONAL	74	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184404194	10860112	ESTHER	TAMAR	QUIARO	VARGAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION DEL DESPACHO	ESTHERQUIARO@GMAIL.COM	PROFESIONAL I	149	1	35	PROFESIONAL	22	DIRECCIÓN DEL DESPACHO
184403570	14450614	MERLIN	ANDREINA	ROSSEL	GOMEZ	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	mrossel@mppee.gob.ve	PROFESIONAL I	600027	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
3342	9965216	XAVIER	ALFREDO	GHEZZI	CUMANA	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	XGHEZZI@MPPEE.GOB.VE	PROFESIONAL III	800070	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184399776	13871417	SEGUNDO	ONOFRE	CAMPUZANO	LINARES	OBRERO-CONTRATADO	AREA DE SEGUIMIENTO DE GESTION	SEGUNDOIMJCARACAS@HOTMAIL.COM	AUXILIAR DE SERVICIOS DE OFICINA	320	4	24	OBRERO	92	DIRECCIÓN DEL DESPACHO
184404398	8469106	ANA	LUISA	CARABALLO	LEOTA	CONTRATADO	CENTRO NACIONAL DE DESPACHO	ANACARABALLOL@YAHOO.COM	APOYO PROFESIONAL	756	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184391143	12730580	JUAN	MANUEL	VAZQUEZ	HERNANDEZ	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JVAZQUEZ@MPPEE.GOB.VE	PROFESIONAL II	700048	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184401122	10271706	ALFREDO	LISANDRO	CASTILLO 	CORONA	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	acastillo@mppee.gob.ve	APOYO TECNICO	476	2	92	TECNICO	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184400658	10547995	JUAN 	DE LA SUERTE 	PALACIOS	ALFARO	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JPALACIOS@MPPEE.GOB.VE	SUPERVISOR DE SEGURIDAD	25	4	111	OBRERO SUPERVISOR	13	OFICINA DE SEGURIDAD INTEGRAL
184398369	12627732	JENNY	CAROLINA	ACHE	PEDRON	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JACHE@MPPEE.GOB.VE	BACHILLER I	50	1	93	ADMINISTRATIVO	22	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404527	6519067	DELIA	LISETH	TORO	BLANCO	EGRESADOS	OFICINA DE RECURSOS HUMANOS	DELIALIS28@GMAIL.COM	PROFESIONAL I	15	1	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184399034	7683310	JORGE RAMON	ANDRES	GUERRA	RODRIGUEZ	CONTRATADO	AREA DE COMPRAS	JGUERRA@MPPEE.GOB.VE	APOYO PROFESIONAL	310	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184404333	13948032	MARÍA	CRISTINA	LANDAETA		EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	mlandaeta@mppee.gob.ve	PROFESIONAL I	800144	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184403086	6519067	DELIA	LISETH	TORO	BLANCO	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL MINISTRO	DELIALIS28@GMAIL.COM	PROFESIONAL I	140	1	35	PROFESIONAL	22	DESPACHO DEL MINISTRO
184402075	1	A	A	A	A	SUPLENTES (OBREROS)	DESPACHO DEL MINISTRO		COCINERO	1	4	24	OBRERO	131	DESPACHO DEL MINISTRO
184400149	12337053	JUAN 	CARLOS	TOVAR	GUTIERREZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	JUANCARLOSTG@YAHOO.COM	PROFESIONAL II	79	1	35	PROFESIONAL	22	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184400891	13545401	ANDRES	JOSE	BOGARIN 	VILLARROEL	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ABOGARIN@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	97	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405242	12765227	DAMELY	ORITZA	NUÑEZ	GARCIA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	DNUNEZ200@MPPEE.GOB.VE	ASEADOR	228	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404393	17845412	MARCO	ANTONIO	HURTADO	RANGEL	CONTRATADO	CENTRO NACIONAL DE DESPACHO	MARCOA HURTADO@GMAIL.COM	APOYO PROFESIONAL	751	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184403067	19379590	MIGUEL	JOSE	CUARTIN	GOICOECHEA	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	MCUARTIN@GMAIL.COM	PASANTE PROFESIONAL	96	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403514	12073746	NATHALIE		VIVAS	ESCOBAR	EMPLEADO FIJO	DESPACHO DEL MINISTRO	nvivas@mppee.gob.ve	PROFESIONAL III	800001	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184405839	11269745	HELIMENES	RAMON	COLINA		COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	HELIMENES9603@GMAIL.COM	PROFESIONAL I	165	1	35	PROFESIONAL	22	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184405263	15662215	SERGIO	ANTONIO	PARRA	MENDOZA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	SPARRA200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	249	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400899	10823570	NORMAN	DAVID	MARTINEZ	HURTADO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	NMARTINEZ@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	105	4	111	OBRERO SUPERVISOR	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184406102	13525733	EDELYS	YANELBA	VIVAS	ALARCON	CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA		APOYO PROFESIONAL	840	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184404582	17078224	JHONNEY		MATA	CHACON	PASANTE	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	JHONNEY2003@HOTMAIL.COM	PASANTE TECNICO	125	2	92	TECNICO	62	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405264	15835455	JOHAN	JOSE	CARRASCO	GONZALEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JCARRASCO200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	250	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405498	21014543	LENIN	YANUOSKY	LEON	GUZMAN	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	LENINOSO_25_12@HOTMAIL.COM	PASANTE PROFESIONAL	154	2	35	PROFESIONAL	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184405506	6886845	JESSE	ALONSO	CHACON	ESCAMILLO	ALTOS FUNCIONARIOS	DESPACHO DEL MINISTRO	JCHACON@MPPEE.GOB.VE	MINISTRO	9970001	0	91	DIRECCION/GERENCIA/SUPERVISORES	111	DESPACHO DEL MINISTRO
184402993	10278892	PEDRO	ENRIQUE	GONZALEZ 	SILVA	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	PGONZALEZ@MPPEE.GOB.VE	TECNICO II	131	2	92	TECNICO	22	OFICINA DE SEGURIDAD INTEGRAL
184402985	9412098	DALYS	JOSEFINA	AGUILERA	QUIJADA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	DAGUILERA@MPPEE.GOB.VE	PROFESIONAL II	700028	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184400404	17030839	LUIS	EDUARDO	SEGOVIA	PIÑERO	CONTRATADO	AREA DE SEGUIMIENTO DE GESTION		AUXILIAR DE SERVICIOS DE OFICINA	328	4	24	OBRERO	28	DIRECCIÓN DEL DESPACHO
184404251	17772144	YASMIRA	CAROLINA	MARTINEZ	CARTAGENA	PASANTE	OFICINA DE ATENCION AL CIUDADANO	YASMIRAMARTINEZ19@HOTMAIL.COM	PASANTE TECNICO	115	2	92	TECNICO	62	OFICINA DE ATENCIÓN AL CIUDADANO
184403550	13907349	YBELLYZETH		MARQUEZ	TERRERO	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	YMARQUEZ@MPPEE.GOB.VE	PROFESIONAL II	700141	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405217	9085545	CLEMENTE	JESUS DEL CARMEN	PARRA		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CPARRA202@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	203	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402390	14100196	RICHARD		TORRES	BAUTISTA	OBRERO FIJO	AREA DE SERVICIOS GENERALES	RICHARDTORRESBAUTISTA@HOTMAIL.COM	MENSAJERO MOTORIZADO	131	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402339	13852539	JORGE	LUIS	GATICA	CONTRERAS	OBRERO FIJO	AREA DE SERVICIOS GENERALES	JGATICA@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	130	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400084	18528628	JESSICA	NATHALY	COLMENARES	GOMEZ	PASANTE	OFICINA DE RECURSOS HUMANOS	JEKA0709@HOTMAIL.COM	PASANTE TECNICO	42	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184401292	5427913	RODOLFO		NAVARRO	DIAZ	ALTOS FUNCIONARIOS	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	RNAVARRO@MPPEE.GOB.VE	VICEMINISTRO	2	0	91	DIRECCION/GERENCIA/SUPERVISORES	111	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184404613	16521796	MARIANELA		MELENDEZ	ZAVALA	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	MMELENDEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	765	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184403418	6331966	CLELIA	JOSEFINA	ESTRADA	FIGUERA	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	CESTRADA@MPPEE.GOB.VE	BACHILLER II	200015	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184397551	4265503	ROSA	MARIA	MARTINEZ		EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	RMARTINEZ@MPPEE.GOB.VE	DIRECTOR	2664	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE RECURSOS HUMANOS
184403568	14427505	MICHAEL	DOUGLAS	CASTILLO	ACASIO	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	mdcastillo@mppee.gob.ve	TECNICO I	400035	2	92	TECNICO	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184398519	84554242	LUISA	MARIA	PARRA	URQUIOLA	CONTRATADO	AREA DE BIENESTAR SOCIAL	lparra@mppee.gob.ve	APOYO TECNICO	239	2	92	TECNICO	28	OFICINA DE RECURSOS HUMANOS
184401571	3752073	YASMINE	DEL ROSARIO	FLORES	MENDEZ	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	YFLORES@MPPEE.GOB.VE	PROFESIONAL III	800051	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403500	11230861	MARIA 	ALEJANDRA	HERRERA 	HERNÁNDEZ	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	MAHERRERA@MPPEE.GOB.VE	BACHILLER III	300005	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184404674	3104015	JUAN	ISIDRO	BARROETA	VILLA	OBRERO-CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	BJUAN200@MPPEE.GOB.VE	OPERARIO(A) DE LIMPIEZA Y MANTENIMIENTO	438	4	24	OBRERO	92	OFICINA DE GESTIÓN ADMINISTRATIVA
184398593	84477725	JOHANNA	CAMILLE	LEVY		HONORARIOS PROFESIONALES	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	2717	1	35	PROFESIONAL	53	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184393679	16356278	RAUL	EDUARDO	REYES	RAMIREZ	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	RREYES@MPPEE.GOB.VE	PROFESIONAL II	700118	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184403574	14587635	OSNEIDER	JOSE	BLANCO	ROJAS	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	OBLANCO@MPPEE.GOB.VE	PROFESIONAL I	600075	2	35	PROFESIONAL	12	OFICINA DE SEGURIDAD INTEGRAL
184402275	4806610	ESPERANZA		CORREA		OBRERO FIJO	AREA DE SERVICIOS GENERALES	ECORREA@MPPEE.GOB.VE	ASEADOR	116	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402013	19401288	ALEJANDRO	JOSE	PEREZ	OLIVARES	PASANTE	OFICINA DE RECURSOS HUMANOS	apevez@mppee.gob.ve	PASANTE TECNICO	70	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184403590	15205498	SANNY	DOMENICO	SPANO	FRANCO	EMPLEADO FIJO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	SSPANO@MPPEE.GOB.VE	PROFESIONAL I	600125	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184399150	2788656	NICOLAS 	ANTONIO	URDANETA 	NUÑEZ	HONORARIOS PROFESIONALES	DESPACHO DEL MINISTRO		APOYO PROFESIONAL	2725	1	35	PROFESIONAL	53	DESPACHO DEL MINISTRO
184399816	2980635	CARLOS	ARGENIS	MARTINEZ	VILLALTA	OBRERO-CONTRATADO	OFICINA DE RECURSOS HUMANOS		OFICIAL DE SEGURIDAD	186	4	24	OBRERO	92	OFICINA DE RECURSOS HUMANOS
184397888	6516773	JOSE	LUIS	DEL VALLE	MEJIAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	JDELVALLE@MPPEE.GOB.VE	DIRECTOR GENERAL	28	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184401091	6516773	JOSE	LUIS	DEL VALLE	MEJIAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JDELVALLE@MPPEE.GOB.VE	DIRECTOR DE LINEA	95	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184406092	17828315	KARINA	YELITZA	LEON	ALTUVE	CONTRATADO	OFICINA DE RECURSOS HUMANOS	KARIYELI@HOTMAIL.COM	APOYO PROFESIONAL	835	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184403502	11551887	MELVA	ESPERANZA	VALDEZ	CHIVATA	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	MVALDEZ@MPPEE.GOB.VE	PROFESIONAL I	600129	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184403421	4882716	JOHANA	TERESA	BERECZ	RAMIREZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	JBERECZ@MPPEE.GOB.VE	BACHILLER II	200032	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404009	17860924	JOSE	ALEJANDRO	PIMENTEL	RODRIGUEZ	CONTRATADO	CENTRO NACIONAL DE DESPACHO	jpimentel@mppee.gob.ve	APOYO PROFESIONAL	723	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184402147	83666151	DIGNA	ISABEL	ANDRADE	CARREÑO	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	ISAANDRADEC@HOTMAIL.COM	PASANTE PROFESIONAL	82	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403555	14048188	REMIGIO	ALEXANDER	RONDON	RINCON	EMPLEADO FIJO	AUDITORIA INTERNA	RRONDON@MPPEE.GOB.VE	PROFESIONAL I	600038	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184403683	17572835	MOISES	ELY	EREU	HERNANDEZ	EMPLEADO FIJO	DESPACHO DEL MINISTRO	MEREU@MPPEE.GOB.VE	PROFESIONAL I	600182	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184405060	17713757	MARIA	YOLANDA	VIVEZ	GUEVARA	CONTRATADO	OFICINA DE RECURSOS HUMANOS	LICMARYVIVEZ@HOTMAIL.COM  /  PANTERAMY@HOTMAIL.COM	APOYO PROFESIONAL	802	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184399284	3527984	COROMOTO		MENDOZA 	GOMEZ	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	COROMENGO@HOTMAIL.COM	APOYO PROFESIONAL	2731	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184405837	6857228	NAUDIS	ALFREDO	MALDONADO	PARRA	ALTO NIVEL Y/O CONFIANZA	OFICINA DE RECURSOS HUMANOS	AMALDONADO1@HOTMAIL.COM	COORDINADOR	9950030	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184403470	7058915	LESBIA	MATILDE	AREVALO		EMPLEADO FIJO	DIRECCION DEL DESPACHO	larevalo@mppee.gob.ve	PROFESIONAL III	800079	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184399298	16971511	DAYARLYN	CAROLINA	SALAZAR 	BASTIDAS	PASANTE	OFICINA DE RECURSOS HUMANOS	DAYARLYN-21@HOTMAIL.COM	PASANTE TECNICO	19	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184404862	20221850	CARLOS	ALEJANDRO	CRUZ	DOLORIET	CONTRATADO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	CARLOSCRUZD@GMAIL.COM	APOYO PROFESIONAL	784	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184403403	6361270	ALVARO	ENRIQUE	RODRIGUEZ	NOGUERA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2766	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184397827	17556617	VICTOR	ALEXANDER	CABRITAS	TORRES	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL		CHOFER	130	4	24	OBRERO	28	OFICINA DE SEGURIDAD INTEGRAL
184392932	13576474	YUBRINY	MARIA	PUNCE	DIAZ	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	YPUNCE@MPPEE.GOB.VE	PROFESIONAL II	700057	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184400704	4927197	LUIS	ELADIO	GONZALEZ	UZCATEGUI	OBRERO FIJO	AREA DE COMPRAS	LEGONZALEZ@MPPEE.GOB.VE	MESONERO	7	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401102	18745505	GUSTAVO 	ALEJANDRO	GERENDAS 	CIAVATTONE	CONTRATADO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	ggerendas@mppee.gob.ve	APOYO PROFESIONAL	473	1	35	PROFESIONAL	28	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184405473	15096571	LEONCIO	ANGEL	AGUILAR		PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2807	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184400654	9961474	JIMMY	JESUS	CEDEÑO		OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JCEDENO@MPPEE.GOB.VE	VIGILANTE	21	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403456	6185808	YELITZA	JOSEFINA	DIAZ	SUAREZ	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	ydiaz@mppee.gob.ve	PROFESIONAL II	700136	2	35	PROFESIONAL	12	OFICINA DE ATENCIÓN AL CIUDADANO
184403469	6915196	MARIA 	SOLEDAD	RAY	RODRIGUEZ	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	MRAY@MPPEE.GOB.VE	PROFESIONAL I	600034	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405625	13534552	FRANCISCO	BRAULIO	LEON		PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2823	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405283	18116776	CRISTINA	ALEXANDRA	SEIJAS		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CSEIJAS200@MPPEE.GOB.VE	ASEADOR	269	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404330	19122863	VICTORIANO	SATURNINO	FERRER	UGUETO	CONTRATADO	CENTRO NACIONAL DE DESPACHO	NINO-FUTBOL@HOTMAIL.COM	APOYO TECNICO	742	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184402072	6931531	JOSE	GREGORIO	GARCIA	VASQUEZ	CONTRATADO	DESPACHO DEL MINISTRO	MILINEA@CANTV.NET	ESCOLTA	597	4	24	OBRERO	28	DESPACHO DEL MINISTRO
3346	11462457	CELIDA	CECILIA	VEGA	SALAZAR	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	CCVEGA@MPPEE.GOB.VE	PROFESIONAL II	700083	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405278	17622871	ALVARO	ANTONIO	BRITO	RODRIGUEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ABRITO202@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	264	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405216	8034072	LIGIA		ZAMBRANO	ZAMBRANO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	LZAMBRANO203@MPPEE.GOB.VE	ASEADOR	202	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403571	14531860	DAYBETT	KATHERIN	ORIGUEN 	GERDEL	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	doriguen@mppee.gob.ve	PROFESIONAL II	700068	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184405272	16659309	JOSE	LUIS	REYES	MARTINEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JREYES205@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	258	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404266	6343288	DULCINEA	DEL VALLE	DABOIN	PERNIA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	ddaboin@mppee.gob.ve	PROFESIONAL III	800024	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184398850	15327433	ROSA	MATILDE	ESTEVES	LA TORRE	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	2720	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184404273	13971749	CARLOS	ALFONSO	PARRA	PEREZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	cparra@mppee.gob.ve	PROFESIONAL III	153	1	35	PROFESIONAL	22	OFICINA DE SEGURIDAD INTEGRAL
184401908	16490561	MARIA	JOSE 	RODRIGUEZ	HERNANDEZ	CONTRATADO	DIRECCION DEL DESPACHO	MARIJO_RODRIGUEZRNV@HOTMAIL.COM	APOYO ADMINISTRATIVO	579	1	93	ADMINISTRATIVO	28	DIRECCIÓN DEL DESPACHO
184402337	12857667	WILFREDO	EMILIO	HERNANDEZ	PADRON	OBRERO FIJO	AREA DE SERVICIOS GENERALES	WHERNANDEZ@MPPEE.GOB.VE	ESCOLTA	128	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184406034	10800278	JOSE	LUIS	RODRIGUEZ	GUIA	CONTRATADO	OFICINA DE RECURSOS HUMANOS		INSTRUCTOR DE GIMNASIO	827	3	93	ADMINISTRATIVO	28	OFICINA DE RECURSOS HUMANOS
184405295	20629122	RICARDO		MUJICA	GARCIA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RMUJICA200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	281	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403536	13463356	MARIA	VIRGINIA	OTAIZA 	ROJAS	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	MOTAIZA@MPPEE.GOB.VE	PROFESIONAL II	700015	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184404555	14743854	ERICA	ELIZABETH	BARRIOS	MENDOZA	EGRESADOS	OFICINA DE RECURSOS HUMANOS	EBARRIOS@MPPEE.GOB.VE	TÉCNICO I	43	2	92	TECNICO	141	OFICINA DE RECURSOS HUMANOS
184397472	5306680	MARIA	ELENA	PAEZ	MACIA	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE ATENCION AL CIUDADANO	MPAEZ@MPPEE.GOB.VE	COORDINADOR	12	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE ATENCIÓN AL CIUDADANO
184405202	6164694	MARITZA		ALADEJO		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MALADEJO200@MPPEE.GOB.VE	ASEADOR	188	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405823	10575364	FRANCA	MARIA	PAVONE	MANISCALCO	ALTO NIVEL Y/O CONFIANZA	DIRECCION DEL DESPACHO	FRANCAPAVONE@HOTMAIL.COM	DIRECTOR	9950027	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN DEL DESPACHO
184400474	6030405	MANUEL	ANTONIO	PORTILLO	TORO	CONTRATADO	AREA DE SEGUIMIENTO DE GESTION	MPORTILLO@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	322	4	24	OBRERO	28	DIRECCIÓN DEL DESPACHO
184403438	4267779	MARILU		LOPEZ	HERNANDEZ	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	MLOPEZ@MPPEE.GOB.VE	PROFESIONAL III	800072	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184403506	11793556	LUCAS		SAPIAIN	ZAMBRANO	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	LSAPIAIN@MPPEE.GOB.VE / LSAPIAIN@HOTMAIL.COM	PROFESIONAL II	700122	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184402278	6097125	RISUTO		CARTAGENA	RONDON	OBRERO FIJO	AREA DE SERVICIOS GENERALES	RISUTOCARTAGENA@HOTMAIL.COM	MENSAJERO MOTORIZADO	119	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400776	19209789	JULIO 	CESAR 	CARRILLO	QUINTERO	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JCARRILLO@MPPEE.GOB.VE	MENSAJERO	88	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403739	13690809	JOSEFINA 	DEL VALLE	HERRERA	HERRERA	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	JHERRERA@MPPEE.GOB.VE	PROFESIONAL I	600078	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184405667	13792185	DIEGO	GERONIMO	GIMON	MORENO	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO		ESCOLTA	53	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184401905	14742009	RONI	ALBERTO	CHAPELLIN	REYES	CONTRATADO	DIRECCION DEL DESPACHO		AUXILIAR DE SERVICIOS DE OFICINA	576	4	24	OBRERO	28	DIRECCIÓN DEL DESPACHO
184399227	17587652	ANDREINA 	JOHANA	SANCHEZ	CARRILLO	PASANTE	OFICINA DE RECURSOS HUMANOS	ANDREINA_SANCHEZ_@HOTMAIL.COM	PASANTE TECNICO	17	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184404773	3870451	ASUNCIÓN	JOSE	MARIN	MARCANO	EMPLEADO FIJO	AUDITORIA INTERNA	ASUNCIONMARIN@GMAIL.COM	PROFESIONAL II	800151	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184405228	10518227	MARCO	ANTONIO	REVERON		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MREVERON200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	214	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398183	3555645	JESUS	RAFAEL	VILLARROEL		CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL		OFICIAL DE SEGURIDAD	188	4	24	OBRERO	28	OFICINA DE SEGURIDAD INTEGRAL
184404008	11182247	LIRVIA 	AURISTELA	RODRIGUEZ 	DE RODRIGUEZ	CONTRATADO	CENTRO NACIONAL DE DESPACHO	MERVIS.ANTON@HOTMAIL.COM	APOYO PROFESIONAL	722	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184404615	15022877	BETSYBELL	NOELY	ASCANIO	LAMUS	CONTRATADO	OFICINA DE RECURSOS HUMANOS	BETSYBELLASCANIO@HOTMAIL.COM	APOYO PROFESIONAL	767	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184405221	9711111	ARELIS	AURORA	LOAIZA	SILVA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ALOAIZA@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	207	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
3349	12267635	JOSE	JUAN	TINEO	GARCIA	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	JTINEO@MPPEE.GOB.VE	PROFESIONAL III	800044	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184405833	19707679	FRANCIS	ELENA	PONCE	VELASQUEZ	SUPLENTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	FRANCIS02_09@HOTMAIL.COM	BACHILLER II	13	1	93	ADMINISTRATIVO	73	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184402018	17224280	ANYILIANA	COROMOTO	RODRIGUEZ	GOMEZ	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO		APOYO TECNICO	593	2	92	TECNICO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184404843	13482080	YANITZA	GREGORIA	RODRIGUEZ	PEREZ	CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	YRODRIGUEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	776	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184399433	16681133	KARINA	TERESA	ALVAREZ	TORRES	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	KALVAREZ@MPPEE.GOB.VE	APOYO PROFESIONAL	355	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184400582	13158242	ELIO	ALBERTO	PEÑA	ESCALONA	CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	ELIOPE@GMAIL.COM	APOYO TECNICO	427	2	92	TECNICO	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184399361	6810892	ERWIN	JOHANNES	MULLER	NAVARRO	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	EMULLER@MPPEE.GOB.VE	DIRECTOR DE LINEA	60	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184401278	13642066	JOHAN	ALEXANDER	RODRIGUEZ	ZABALA	PASANTE	AREA DE COMPRAS	JOHANEXAGON@HOTMAIL.COM	PASANTE TECNICO	67	2	92	TECNICO	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184403588	15106393	JEAN 	FRANK	VARELA 	USECHE	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	JVARELA@MPPEE.GOB.VE	TECNICO I	400042	2	92	TECNICO	12	OFICINA DE RECURSOS HUMANOS
184400581	10507018	YASMIL	CELESTE	CORTEZ		CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	YASMILCORTEZ@GMAIL.COM	APOYO PROFESIONAL	426	1	35	PROFESIONAL	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403756	16246987	CHRISTIAN		REBUFFO	CARRASCO	EMPLEADO FIJO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	CREBUFFO@MPPEE.GOB.VE	PROFESIONAL III	800004	2	35	PROFESIONAL	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184398434	10933679	JOSE 	LUIS	GONZALEZ	VILLEGAS	CONTRATADO	DIRECCION GENERAL DE PARTICIPACION POPULAR	JGONZALEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	213	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184404852	20820941	LUIS	FELÍPE	SOSA 	FERMÍN	PASANTE	CENTRO NACIONAL DE DESPACHO	LUIS_EL_POETA@HOTMAIL.COM	PASANTE TECNICO	128	2	92	TECNICO	62	DESPACHO DEL MINISTRO
184403712	19112835	VICTOR	ARMANDO	GONZALEZ	AZACON	EMPLEADO FIJO	DESPACHO DEL MINISTRO	vagonzalez@mppee.gob.ve	PROFESIONAL I	600179	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184392442	6848940	MIGDALIA	JOSEFINA	RAMIREZ	GERMANY	EMPLEADO FIJO	DESPACHO DEL MINISTRO	MRAMIREZ@MPPEE.GOB.VE	PROFESIONAL II	700002	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
4102	12346385	EDWAR	LUWIS	SILVA	COBARRUBIA	EMPLEADO FIJO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	ESILVA@MPPEE.GOB.VE	PROFESIONAL II	700006	2	35	PROFESIONAL	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184405249	13673075	ALEXANDER	MANUEL	LAREZ	ARRAIZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	alarez@mppee.gob.ve	MENSAJERO	235	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184390683	11552609	LUIS	RAFAEL	DIAZ		EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	LDIAZ@MPPEE.GOB.VE	PROFESIONAL I	600096	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184397943	5072132	PEDRO	LUIS	ACOSTA	LOPEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE RECURSOS HUMANOS		COORDINADOR	22	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE RECURSOS HUMANOS
184405219	9327492	ZULAY	COROMOTO	DUARTE	DE MATOS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ZDUARTE200@MPPEE.GOB.VE	ASEADOR	205	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402001	11678675	YATMERY	MERLY	MONTILLA 	LOPEZ	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	YMONTILLA@MPPEE.GOB.VE	DIRECTOR GENERAL	29	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184406094	17312856	ZORAIDA	ALFONSINA	GUILLEN 	PACHECO	CONTRATADO	OFICINA DE RECURSOS HUMANOS	ZGUILLEN22@GMAIL.COM	APOYO PROFESIONAL	837	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
3664	4586385	YRMA	 	DELGADO	DE PERAZA	EMPLEADO FIJO	CONSULTORIA JURIDICA	YDELGADO@MPPEE.GOB.VE	PROFESIONAL III	800014	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184400556	11230675	TAWATA		ARAUJO	JUAN	ALTO NIVEL Y/O CONFIANZA	DIRECCION DEL DESPACHO	TARAUJO@MPPEE.GOB.VE	DIRECTOR	2652	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN DEL DESPACHO
184402019	16577355	ANGUI	CAROLINA	RODRIGUEZ	MORALES	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO		APOYO TECNICO	594	2	92	TECNICO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184403507	11839676	MARIA 	DEL CARMEN	PEREZ	PEREZ	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	MCPEREZ@MPPEE.GOB.VE	PROFESIONAL III	800073	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184403091	6420250	PEDRO	RAFAEL	RAMOS		(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	PRAMOS@MPPEE.GOB.VE	DIRECTOR GENERAL	124	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184402982	3977106	NELLY	AVELINA	TRUJILLO	DE BRUZUAL	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	NTRUJILLO@MPPEE.GOB.VE	JUBILADO	4	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184400587	640666	ALBERTO	JULIAN	ROSSI	HERRERA	ALTO NIVEL Y/O CONFIANZA	ÁREA LEGAL	AROSSI@MPPEE.GOB.VE	DIRECTOR	2705	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184405964	14401932	LUCIO 	ALEJANDRO	LISCANO	BARRIOS	COMISION DE SERVICIOS Y/O ENCARGADURIA	AUDITORIA INTERNA	lliscano@mppee.gob.ve	PROFESIONAL I	167	1	35	PROFESIONAL	22	AUDITORÍA INTERNA
184398441	20638088	MAYRA	ALEJANDRA	SEMPRUN	MERLO	CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	MSEMPRUN@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	220	1	93	ADMINISTRATIVO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184402454	10828651	WILLIAM	JOSE	GAMEZ	OVALLES	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	WGAMEZ@MPPEE.GOB.VE	VIGILANTE	145	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184405463	13237472	CIRYL	ENRIQUE	MENDEZ	CONTRERAS	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2797	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405622	7436743	AMERICO		BARRADA 	GARCIA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL	EDGARPARADA435@HOTMAIL.COM	HONORARIO PROFESIONAL	2820	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405311	14789730	EDWARD	JOSETTE	ORTEGA	SALAS	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	EORTEGA@CORPOELEC.COM.VE	COORDINADOR	135	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405318	18358601	MAGALI	ANDREINA	BLANCO	CHACON	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	MAGALIBLANCOCH@HOTMAIL.COM	ASISTENTE	138	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184397748	5487465	JORGE	LUIS	LIRA		CONTRATADO	OFICINA DE RECURSOS HUMANOS		COORDINADOR	108	1	91	DIRECCION/GERENCIA/SUPERVISORES	28	OFICINA DE RECURSOS HUMANOS
184405204	6273474	JOSE	EFRAIN	BARRIOS	GUEVARA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JBARRIOS204@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	190	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405479	16545667	JESUS	ENRIQUE	BRACHO	HERNANDEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2813	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184397996	5536569	INGRID	CAROLINA	VIERA	HERNANDEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	INGRID.VIERA@HOTMAIL.COM	TECNICO I	32	2	92	TECNICO	22	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184397447	6273257	JULIO	CESAR	CARRILLO	RAMIREZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE GESTION ADMINISTRATIVA	JCCARRILLO@MPPEE.GOB.VE	CHOFER	7	4	24	OBRERO	22	OFICINA DE GESTIÓN ADMINISTRATIVA
184398067	17974037	SANTIAGO	JESUS	ZARATE	LOPEZ	CONTRATADO	AREA DE SISTEMAS	SZARATE@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	178	1	93	ADMINISTRATIVO	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184403081	13463285	SPARTACO		HERNANDEZ	DE PRISCO	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	shernandez@mppee.gob.ve	BACHILLER II	135	1	93	ADMINISTRATIVO	22	OFICINA DE SEGURIDAD INTEGRAL
184403330	6905176	YORAIMA	JOSEFINA	COLMENARES 	CASTILLO	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	ycolmenares@mppee.gob.ve	PROFESIONAL II	700123	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184402517	18942232	KATERIN	JOSEFINA	KELTAI	GRATEROL	PASANTE	CENTRO NACIONAL DE DESPACHO	KELTAIKATERIN@GMAIL.COM	PASANTE PROFESIONAL	85	2	35	PROFESIONAL	62	DESPACHO DEL MINISTRO
184405123	20088293	RAFAEL	SALOMON	DUARTE	CARRASQUEL	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	SALOMON.16@HOTMAIL.COM	PASANTE PROFESIONAL	137	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405748	12826263	JOSEPH	ALEXANDER	HERNANDEZ	AYALA	CONTRATADO	DESPACHO DEL MINISTRO	JAHAYALA@GAMIL.COM	APOYO PROFESIONAL	816	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184398952	28300835	CESAR 	DAVID	OROZCO 	ALEMAN	HONORARIOS PROFESIONALES	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	OROMUSIC@HOTMAIL.COM	APOYO PROFESIONAL	2724	1	35	PROFESIONAL	53	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184404949	15911575	KRISTIAM	ALEXANDER	GARCIA	ORTEGA	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	KGARCIA@MPPEE.GOB.VE	APOYO PROFESIONAL	791	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184401634	5571821	TANIA	JANET	LEON 	SANCHEZ	ALTO NIVEL Y/O CONFIANZA	OFICINA DE GESTION ADMINISTRATIVA	TLEON@MPPEE.GOB.VE	COORDINADOR	9920034	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE GESTIÓN ADMINISTRATIVA
184398873	14690407	RUTH	SOFIA	FONT	SCROCCHI	CONTRATADO	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	RFONT@MPPEE.GOB.VE	APOYO PROFESIONAL	277	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184402513	16204007	LEONARDO	AUGUSTO	ARAUJO	MARIN	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	laaraujo@mppee.gob.ve	ESCOLTA	154	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403072	5011904	WILLIAM	JOSE	PEREZ		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	wperez@mppee.gob.ve	CHOFER	160	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403569	14427786	ALEXIS	OMAR	HERNANDEZ	HERNANDEZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	AHERNANDEZ@MPPEE.GOB.VE	PROFESIONAL I	600015	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403094	17766551	JEAN	CARLOS	CALDERON		CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	jcalderon@mppee.gob.ve	APOYO PROFESIONAL	675	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405836	10628816	JOSE	LEODEGARIO	BUITRAGO	BUITRAGO	ALTO NIVEL Y/O CONFIANZA	OFICINA DE RECURSOS HUMANOS		COORDINADOR	9950029	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184405066	18720739	ADIRA	YADIRA	QUINTERO	SANCHEZ	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	ADIRA0411@GMAIL.COM	PASANTE PROFESIONAL	133	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184401649	19829138	GRECIA	PAOLA	HIPPOLYTE	ROMERO	CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	ghippolyte@mppee.gob.ve	APOYO ADMINISTRATIVO	546	1	93	ADMINISTRATIVO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184404581	17983249	PEDRO	JOSE	MODESTO	COLINA	PASANTE	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	PEDROJMODESTO@HOTMAIL.COM	PASANTE TECNICO	124	2	92	TECNICO	62	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184390554	13355644	CARLOS	ENRIQUE	HERRERA	PEREIRA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	CHERRERA@MPPEE.GOB.VE	PROFESIONAL I	600137	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397905	13823311	HANNYE	COROMOTO	HALLS	YLARRETA	CONTRATADO	AREA DE PLANIFICACION Y CONTROL DE PROYECTOS DE TECNOLOGIAS DE LA INFORMACION	HHALLS@MPPEE.GOB.VE	APOYO PROFESIONAL	139	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184400429	14742009	RONI	ALBERTO	CHAPELLIN	REYES	CONTRATADO	AREA DE SEGUIMIENTO DE GESTION		AUXILIAR DE SERVICIOS DE OFICINA	329	4	24	OBRERO	28	DIRECCIÓN DEL DESPACHO
184399098	17344109	ISRAEL	DE JESUS	ESCOBAR	VASQUEZ	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	ISRAESCO@HOTMAIL.COM	PASANTE PROFESIONAL	12	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398365	11313764	JOSE	DE LOS SANTOS	VIELMA	MENDOZA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	JVIELMA@MPPEE.GOB.VE	PROFESIONAL I	46	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184405629	26036255	ALFONSO 	ADONIS	GONZALEZ	MARTINEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL	ALFON21_43@HOTMAIL.COM	HONORARIO PROFESIONAL	2827	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405181	14494092	LUIS	ORLANDO	MARIN	GONZALEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE RECURSOS HUMANOS	LOMG21@ CANTV.NET	PROFESIONAL III	159	1	35	PROFESIONAL	22	OFICINA DE RECURSOS HUMANOS
184403520	12588641	SANDRA	COROMOTO	SALAZAR	PAZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	SSALAZAR@MPPEE.GOB.VE	TECNICO I	400015	2	92	TECNICO	12	OFICINA DE RECURSOS HUMANOS
184390553	13158405	MAGDALENA	 	GAMBOA	ACOSTA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	MGAMBOA@MPPEE.GOB.VE	PROFESIONAL II	700073	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403664	17158174	JESSICA	ANDREINA	MARCANO	ROSALES	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	JMARCANO@MPPEE.GOB.VE	PROFESIONAL I	600017	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403946	17075459	MARIA	DE LOS ANGELES	FRANCO	GUZMAN	CONTRATADO	CONSULTORIA JURIDICA	mfranco@mppee.gob.ve	APOYO PROFESIONAL	710	1	35	PROFESIONAL	28	CONSULTORÍA JURIDICA
184399296	15315342	NATHALY	ANDREINA	RODRIGUEZ	RANGEL	CONTRATADO	AUDITORIA INTERNA	NARODRIGUEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	342	1	35	PROFESIONAL	28	AUDITORÍA INTERNA
184403390	11714922	MARCOS 	TULIO	DUGARTE	GOMEZ	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	MDUGARTE@MPPEE.GOB.VE	COORDINADOR	2763	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184405835	21696774	GENESIS	ANAELI	MOLINA	COLS	SUPLENTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	GENESISMC92@HOTMAIL.COM	BACHILLER II	14	1	93	ADMINISTRATIVO	73	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184404603	19138103	JORGE	LUIS	MUÑOZ	JIMENEZ	SUPLENTES (OBREROS)	AREA DE COMPRAS	JORGELUIS18091989@HOTMAIL.COM	MESONERO	8	4	24	OBRERO	131	OFICINA DE GESTIÓN ADMINISTRATIVA
184403747	9120081	YAJAIRA	GRACIELA	GUTIERREZ	SANCHEZ	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	VALABRAM18@HOTMAIL.COM	PROFESIONAL I	600030	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403673	17359518	SERGIO	JOSE RAFAEL	OROPEZA	MACHADO	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	soropeza@mppee.gob.ve	PROFESIONAL I	600192	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400021	18738101	YXART	JOSE	JAIMES	SANDOVAL	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	YXART88@HOTMAIL.COM	PASANTE TECNICO	37	2	92	TECNICO	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405316	5886488	JOSE	ANTONIO	PISANI	LANDER	CONTRATADO	DIRECCION DEL DESPACHO	JOSE.PISANI@HOTMAIL.COM	APOYO PROFESIONAL	809	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184403468	6892502	FIDEL	ROLANDO	GUEVARA	HENRIQUEZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	FGUEVARA@MPPEE.GOB.VE	PROFESIONAL III	800084	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403584	14988469	EGLY		PALACIOS	CASTILLO	EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	EPALACIOS@MPPEE.GOB.VE	PROFESIONAL I	600134	2	35	PROFESIONAL	12	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184398050	3710544	EMMA		HERMOSO	DE CASTILLO	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	3	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184401090	6254950	NOLBERTO	ANTONIO	CEDEÑO	SANCHEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	ncedeno@mppee.gob.ve	TECNICO II	94	2	92	TECNICO	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184405225	10372824	LUIS	ANTONIO	GIMENEZ	RODRIGUEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	LUISAGRLT@HOTMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	211	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403636	16530678	PEDRO 	JOSE	NAVAS	DUQUE	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	pnavas@mppee.gob.ve	PROFESIONAL I	600197	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405126	6348342	MARIA	LINA	GUERRERO	FERNANDEZ	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA		PASANTE TECNICO	140	2	92	TECNICO	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405746	6362337	CARLOS	JULIO	FIGUEROA	BARCELO	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	CFIGUEROA@MPPEE.GOB.VE	TECNICO II	164	2	92	TECNICO	22	OFICINA DE SEGURIDAD INTEGRAL
184400833	12071108	JOSÉ	ALFREDO	DONQUIZ	MARQUEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JDONQUIZ@MPPEE.GOB.VE	ESCOLTA	89	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400547	9602447	KRUSCAYA	MARIA	LOPEZ	MARTI	ALTO NIVEL Y/O CONFIANZA	OFICINA DE ATENCION AL CIUDADANO	KLOPEZ@MPPEE.GOB.VE	DIRECTOR GENERAL	2651	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE ATENCIÓN AL CIUDADANO
184399225	10505099	AIDA	AMERICA	RUIZ	RAMIREZ	PASANTE	OFICINA DE RECURSOS HUMANOS	AIDAAMERICA@HOTMAIL.COM	PASANTE TECNICO	15	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184404252	18516468	ROSEMER	MARIA	MAVAREZ	DIAZ	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO		PASANTE PROFESIONAL	116	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398671	16662083	JUAN 	JOSE	OSPEDALES	RODRIGUEZ	CONTRATADO	AREA DE COMUNICACION E INFORMACION	JOSPEDALES@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	251	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184393732	12293396	MARIA	ISABEL	SALAZAR	CORRO	EMPLEADO FIJO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	MSALAZAR@MPPEE.GOB.VE	PROFESIONAL II	700009	2	35	PROFESIONAL	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184399701	15506125	MICHELLE		DUNMETT	TOVAR	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	DUNMETTM@MPPEE.GOB.VE	DIRECTOR	2712	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404779	17390897	DELIA	DEL CARMEN	BOLIVAR	COLMENARES	CONTRATADO	OFICINA DE RECURSOS HUMANOS	DECABOCO@HOTMAIL.COM / DECABOCO@GMAIL.COM	APOYO TECNICO	772	2	92	TECNICO	28	OFICINA DE RECURSOS HUMANOS
184403415	13760773	MAYDE 	COROMOTO	GUTIERREZ		EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	MCGUTIERREZ@MPPEE.GOB.VE	BACHILLER II	200024	1	93	ADMINISTRATIVO	12	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184405563	20130826	JHOSMERLY	NAIRETH	TOVAR	LOPEZ	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	JHOSMERLY@HOTMAIL.COM	PASANTE TECNICO	156	2	92	TECNICO	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184405002	15453078	PATRICIA	LINEL	POLACHINI	OCHOA	CONTRATADO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	PPOLACHINI@MPPEE.GOB.VE	APOYO PROFESIONAL	794	1	35	PROFESIONAL	28	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184400028	17980988	NATASHA	MARIA	TORRES	DEL MONTE	CONTRATADO	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	ntorres@mppee.gob.ve	APOYO PROFESIONAL	413	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184403484	9964228	ROSA	VICTORIA	PAEZBRAVO	GOMEZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	RPAEZBRAVO@MPPEE.GOB.VE	PROFESIONAL I	600175	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184400896	18749203	ANDRES	ALEJANDRO	ACOSTA	VERA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	AACOSTA@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	102	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398182	25053254	JOSE		IGLESIAS 	DOMINGUEZ	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL		OFICIAL DE SEGURIDAD	187	4	24	OBRERO	28	OFICINA DE SEGURIDAD INTEGRAL
184405212	6864979	FRANCISCO	MIGUEL	BLANCO	AQUINO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	FBLANCO201@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	198	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402858	3989003	GILBERTO		RODRIGUEZ	GUERRERO	EMPLEADO FIJO	AUDITORIA INTERNA	GRODRIGUEZ@MPPEE.GOB.VE	PROFESIONAL III	800013	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184404554	11763126	GUSTAVO	ADOLFO	HURTADO	GIMENEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	GHURTADO@MPPEE.GOB.VE	PROFESIONAL II	42	2	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184400672	13622266	CARLOS 	LUIS 	ESTANGA	SOTILLO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CESTANGA@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	39	4	111	OBRERO SUPERVISOR	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403743	17989583	RONALD	JOSE	LOZANO	MILANO	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	rlozano@mppee.gob.ve	PROFESIONAL I	600087	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184404565	5151141	IGNACIO	DANILO	GARCIA	HERNANDEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	IGARCIA@MPPEE.GOB.VE	COORDINADOR	53	0	39	COORDINADOR	141	OFICINA DE RECURSOS HUMANOS
184397999	7844885	PEDRO	LEON	TORRES	MEDINA	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	PTORRES@MPPEE.GOB.VE	APOYO PROFESIONAL	2	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184403417	17143322	SANDRA		RANGEL 	BELEÑO	EMPLEADO FIJO	DIRECCION DEL DESPACHO	SRANGEL@MPPEE.GOB.VE	BACHILLER II	200029	1	93	ADMINISTRATIVO	12	DIRECCIÓN DEL DESPACHO
184405065	19730735	CARLOS	EDUARDO	MARQUEZ	IBARRA	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	CEMARQUEZI@GMAIL.COM	PASANTE PROFESIONAL	132	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400664	11926803	YUARITER	JOSE	PIÑATES	VASQUEZ	OBRERO FIJO	AREA DE COMPRAS	YPINATES@MPPEE.GOB.VE	MENSAJERO	31	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403510	11900397	MORALBER	KARINA	TORRES	TREJO	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	mktorres@mppee.gob.ve	PROFESIONAL II	700135	2	35	PROFESIONAL	12	OFICINA DE ATENCIÓN AL CIUDADANO
184399703	10093857	FELIPE	ALEXANDER	FARIAS	GRANADO	HONORARIOS PROFESIONALES	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES		HONORARIOS PROFESIONALES	2743	2	35	PROFESIONAL	53	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405260	15440696	JESSICA 	BEATRIZ	RIOS	SANCHEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JRIOS203@MPPEE.GOB.VE	ASEADOR	246	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400693	15800341	HECTOR	ALCIDES	PIMENTEL	GALLARDO	OBRERO FIJO	AREA DE COMPRAS	HPIMENTEL@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	60	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404540	8444751	PEDRO	JOSE	PATIÑO	DIAZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL 	28	1	93	ADMINISTRATIVO	141	OFICINA DE RECURSOS HUMANOS
184403548	13893610	MAILING	JOSMAR	BRITO	DONES	EMPLEADO FIJO	DIRECCION DEL DESPACHO	MBRITO@MPPEE.GOB.VE	TECNICO I	400004	2	92	TECNICO	12	DIRECCIÓN DEL DESPACHO
184400676	14022669	JAVIER	JOSE	GARCIA	TORO	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JGARCIA@MPPEE.GOB.VE	VIGILANTE	43	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184405191	5132551	ALEXIS	JESUS	PEREZ	ESPAÑOL	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	APEREZ209@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	177	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403493	10784111	NAIOMARALIZ	ATAHUAILMAR	PIÑATE	VASQUEZ	EMPLEADO FIJO	DIRECCION DEL DESPACHO	NPINATE@MPPEE.GOB.VE	PROFESIONAL I	600008	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184400585	841072	FELIX	REGALADO	ORTIZ	FIGUEROA	CONTRATADO	DIRECCION DEL DESPACHO	FORTIZ@MPPEE.GOB.VE	APOYO PROFESIONAL	430	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184401257	9637863	CARLOS	EDUARDO	GÓMEZ		PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2759	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405261	15491303	GEOVANNY	MANUEL	ARJONA		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	GARJONA200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	247	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402331	7663382	NATALIA 	MARGARITA	PEÑA		OBRERO FIJO	AREA DE SERVICIOS GENERALES	NPENA@MPPEE.GOB.VE	ASEADOR	122	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184397723	5151141	IGNACIO	DANILO	GARCIA	HERNANDEZ	EMPLEADO FIJO	AREA DE ESTADISTICAS	IGARCIA@MPPEE.GOB.VE	COORDINADOR	2672	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184406039	12809998	NIELSEN	AMADO	HERRERA 	PEREZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	832	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184390018	10805678	ALEJANDRO	EMILIO	REQUENA	ABUNASSAR	EMPLEADO FIJO	AREA DE SUSTANCIACION	AREQUENA@MPPEE.GOB.VE	PROFESIONAL I	600048	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184405965	14163551	JOSE	ALBERTO	COLMENARES	TORRES	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE GESTION ADMINISTRATIVA	JCOLMENARES@MPPEE.GOB.VE	BACHILLER I	168	1	93	ADMINISTRATIVO	22	OFICINA DE GESTIÓN ADMINISTRATIVA
184405635	8939354	NIEVES	BETZAIDA	VALDEZ	MEDERICO	ALTO NIVEL Y/O CONFIANZA	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	NVALDEZ@MPPEE.GOB.VE	DIRECTOR GENERAL	9950018	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184398889	1617698	RODOLFO	ENRIQUE	GALVIS	RUIZ	CONTRATADO	DESPACHO DEL MINISTRO	RGALVIS@MPPEE.GOB.VE	APOYO PROFESIONAL	286	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184403558	14086843	LEOPOLDO	JOSE	MOLINA 	NUÑEZ	EMPLEADO FIJO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	lmolina@mppee.gob.ve	PROFESIONAL I	600123	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184397544	9956998	JORQUY		ABREU	FUENTES	COMISION DE SERVICIOS Y/O ENCARGADURIA	AREA DE BIENESTAR SOCIAL	JABREU@MPPEE.GOB.VE	PROFESIONAL I	14	1	35	PROFESIONAL	22	OFICINA DE RECURSOS HUMANOS
184403699	18022252	RAFAEL	JOSE	MASY	SOJO	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RMASY@MPPEE.GOB.VE	BACHILLER I	100019	1	93	ADMINISTRATIVO	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184401302	6024495	FELIX	ADALBERTO	TORRES	ROMERO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	FATORRES@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	112	4	111	OBRERO SUPERVISOR	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405222	9842643	JOSE	ANTONIO	RODRIGUEZ		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JRODRIGUEZ227@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	208	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405811	9411838	SANDRA	CAROLINA	GOMEZ	CASTILLO	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE RECURSOS HUMANOS	SANDRACAROLINAGOMEZ@GMAIL.COM	COORDINADOR	145	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE RECURSOS HUMANOS
184405122	18994897	GILBERT		BARRETO	NUÑEZ	PASANTE	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	BARRETOGILBERT@GMAIL.COM	PASANTE PROFESIONAL	136	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184403529	13066528	JONATHAN	DAVID	TOVAR	DUQUE	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JTOVAR@MPPEE.GOB.VE	PROFESIONAL II	700052	2	35	PROFESIONAL	12	OFICINA DE SEGURIDAD INTEGRAL
184401112	20175548	ALEXANDER	JOSUE	MORENO	MARQUEZ	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	ALEX.MMARQUEZ@HOTMAIL.COM	PASANTE TECNICO	59	2	92	TECNICO	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397256	6263472	BELKIS	VERONICA	SANCHEZ	GIRON 	CONTRATADO	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	BSANCHEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	19	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184405747	17048334	RAIMOND	JOSE	MORENO	DEL ROSARIO	CONTRATADO	CENTRO NACIONAL DE DESPACHO	rmoreno@mppee.gob.ve	APOYO PROFESIONAL	815	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184400411	18310781	ATILA	EULICE	MALDONADO	MORA	CONTRATADO	AREA DE COMPRAS	AMALDONADO@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	46	4	24	OBRERO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184404944	4542797	CLEMENTE	ISIDORO	HERRERA	HERAS	ALTO NIVEL Y/O CONFIANZA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	CIHERRERA@MPPEE.GOB.VE	COORDINADOR	9950011	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184402646	15335769	EDUARDO	RAFAEL	MEJIAS	MARCANO	CONTRATADO	DIRECCION DEL DESPACHO	EDUARDO_MEJIAS_15@HOTMAIL.COM 	APOYO ADMINISTRATIVO	636	1	93	ADMINISTRATIVO	28	DIRECCIÓN DEL DESPACHO
184400755	9065470	IDELINA	MARIA	GOMES	FERNANDES	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE GESTION ADMINISTRATIVA	IGOMES@MPPEE.GOB.VE	PROFESIONAL III	89	1	35	PROFESIONAL	22	OFICINA DE GESTIÓN ADMINISTRATIVA
184404534	15517734	DIEGO 	LUIS	MEYENDORFF	ALARCON	EGRESADOS	OFICINA DE RECURSOS HUMANOS	MEYENDORFFDIEGO@GMAIL.COM	PROFESIONAL I	22	1	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184405253	14448191	ALEJANDRO	JOSE	RENDILES		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ALEJANDRORENDILES@HOTMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	239	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403517	12294084	KARINA	MARIA	COELLO	BERMUDEZ	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	kcoello@mppee.gob.ve	PROFESIONAL I	600088	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184405822	4583329	DELLAMIRA		MUÑOZ	GIL	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	DMUNOZG@MPPEE.GOB.VE	APOYO PROFESIONAL	821	1	35	PROFESIONAL	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403549	13901034	MARIA	CAROLINA	GUANIPA	NOGUERA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	mguanipa@mppee.gob.ve	PROFESIONAL I	600155	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403480	9414872	ELKE	DEL VALLE	FERMIN	PEREZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	EFERMIN@MPPEE.GOB.VE	PROFESIONAL II	700031	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184402277	5222986	ROSA	ALBA	MARQUEZ	DE REYES	OBRERO FIJO	AREA DE SERVICIOS GENERALES	RDEMARQUEZ@MPPEE.GOB.VE	ASEADOR	118	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403586	15048841	BALMORE	ALEJANDRO	GARCIA	MARTINEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	BGARCIA@MPPEE.GOB.VE	PROFESIONAL I	600149	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184393731	13078491	JUAN	JOSE	VASQUEZ	BOMPART	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	JVASQUEZ@MPPEE.GOB.VE	PROFESIONAL I	600108	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403544	13844564	JOSMAR	EMPERATRIZ	ACEVEDO	SUAREZ	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	JACEVEDO@MPPEE.GOB.VE	PROFESIONAL II	700121	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184403270	12137274	GABRIEL	ANDRES	COSTANZO	CASTILLO	ALTO NIVEL Y/O CONFIANZA	CONSULTORIA JURIDICA	GCOSTANZO@MPPEE.GOB.VE	DIRECTOR	2761	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	CONSULTORÍA JURIDICA
184397668	4170020	HELCIAS	MOISES	BENAIM	CASADO	EMPLEADO FIJO	AREA DE ANALISIS Y FORMULACION ESTRATEGICA	HBENAIM@MPPEE.GOB.VE	COORDINADOR	2667	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184401240	19733106	VICTOR	DANIEL	SILGADO	PEREZ	PASANTE	AREA DE COMPRAS		PASANTE PROFESIONAL	62	2	35	PROFESIONAL	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184404556	14929518	DANIEL	JOSE	HIDALGO	SIMANCAS	EGRESADOS	OFICINA DE RECURSOS HUMANOS	DHIDALGO@MPPEE.GOB.VE	PROFESIONAL II	44	2	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184405492	9315003	ORLANDO	JOSE	GONZALEZ	MORENO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2779	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403745	3923205	RAFAEL	 ENRIQUE	BASTIDAS	JARA	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	rebastidas@mppee.gob.ve	PROFESIONAL I	600130	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184398581	4419505	ANGEL		HERNÁNDEZ		HONORARIOS PROFESIONALES	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION		APOYO PROFESIONAL	2705	1	35	PROFESIONAL	53	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184405951	16094459	ALVER		RICO	LASCARRO	CONTRATADO	DIRECCION DEL DESPACHO	REDMERCURY2001@GMAIL.COM	MENSAJERO INTERNO	822	4	24	OBRERO	28	DIRECCIÓN DEL DESPACHO
184397720	6393535	HECTOR	EDUARDO	APONTE	DIAZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION		COORDINADOR	2669	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184405286	18572080	JESUS	ENRIQUE	BERMUDEZ	ROMERO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	jbermudez@mppee.gob.ve	AYUDANTE DE SERVICIOS GENERALES	272	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405284	18374624	YUSY	YUDAIRIS	PEREZ	BEDOYA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	YPEREZ205@MPPEE.GOB.VE	ASEADOR	270	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398851	3981427	FRANCISCA	ALICIA	GONZALEZ	INFANTE	HONORARIOS PROFESIONALES	DIRECCION DEL DESPACHO		APOYO PROFESIONAL	2721	1	35	PROFESIONAL	53	DIRECCIÓN DEL DESPACHO
184405890	18528926	KEILIS 	IREMAR	HIGUERA	MENDOZA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	KEILYS_1@HOTMAIL.COM	AUXILIAR DE SERVICIOS DE OFICINA	292	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400760	6313513	HAROLD	DANIEL	PEREZ		OBRERO FIJO	AREA DE CORRESPONDENCIA Y ARCHIVO	HPEREZ@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	84	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400146	4071577	ELBIA	PASTORA	RODRIGUEZ	RAMIREZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	eprodriguez@mppee.gob.ve	PROFESIONAL III	77	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400671	13486842	LUIS	ARNALDO	MORALES	GARCIA	OBRERO FIJO	AREA DE COMPRAS	LMORALES@MPPEE.GOB.VE	CHOFER	38	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401907	3658870	AMANDA	JOSEFINA	ROMERO	CELIS	CONTRATADO	OFICINA DE RECURSOS HUMANOS	aromero@mppee.gob.ve	APOYO PROFESIONAL	578	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
3615	6868466	CRUZ	ELENA	VEGAS	SALAZAR	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	CVEGAS@MPPEE.GOB.VE	TECNICO I	400014	2	92	TECNICO	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184401998	11309043	LUIS	ERNESTO	VERDE	GOMEZ	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	AREA DE DICTAMENES	LVERDE@MPPEE.GOB.VE	COORDINADOR	45	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	CONSULTORÍA JURIDICA
184405277	17478331	JONATHAN	DOLAN	ACOSTA	AMARO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	jacosta@mppee.gob.ve	MENSAJERO MOTORIZADO	263	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401184	15366372	VIVIANA	SATURNO	GUTIERREZ	PALOMINO	CONTRATADO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	vgutierrez@mppee.gob.ve	APOYO TECNICO	486	2	92	TECNICO	28	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403526	12911636	JORGE 	ARTURO	REYES 	HERNANDEZ	EMPLEADO FIJO	DESPACHO DEL MINISTRO	jreyes@mppee.gob.ve	PROFESIONAL II	700130	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184397077	5072132	PEDRO	LUIS	ACOSTA	LOPEZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS		DIRECTOR GENERAL	2657	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE RECURSOS HUMANOS
184403442	5010061	JULVIO		DELGADO	MILLAR	EMPLEADO FIJO	DESPACHO DEL MINISTRO	JDELGADO@MPPEE.GOB.VE	PROFESIONAL I	600166	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184406031	9248281	DULFA	DALILA	HERNANDEZ	MEDINA	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	DALILA HERNANDEZ@HOTMAIL.COM	VICEMINISTRO	9950035	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184406037	15573263	ALEXANDRA	CELESTE	BRITO	BRICEÑO	CONTRATADO	OFICINA DE RECURSOS HUMANOS	ALEXB1005@GMAIL.COM	APOYO PROFESIONAL	830	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184405662	17908967	EDGAR	RAFAEL	GRAZIADIO	PRATO	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	EGRAZIADIO@HOTMAIL.COM	PASANTE PROFESIONAL	168	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403496	10863718	CAROLINA	THAIS	GARCIA	LOPEZ	EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	cgarcia@mppee.gob.ve	TECNICO I	400030	2	92	TECNICO	12	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184405239	11850965	JOSE	LUIS	JARA	ARJONA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JARARJONA72@HOTMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	225	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403627	16209348	JUAN	CARLOS	MORA 	MONTES	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	jcmora@mppee.gob.ve	PROFESIONAL I	600198	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184401836	19162163	YURUANI	YE KUANA	SANCHEZ	MOLINA	CONTRATADO	DESPACHO DEL MINISTRO	ysanchez@mppee.gob.ve	APOYO PROFESIONAL	567	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184400483	2980635	CARLOS	ARGENIS	MARTINEZ	VILLALTA	CONTRATADO	OFICINA DE RECURSOS HUMANOS		OFICIAL DE SEGURIDAD	186	4	24	OBRERO	28	OFICINA DE RECURSOS HUMANOS
184403659	17064408	MARYANT	COROMOTO	GUERRERO	GUERRA	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	mcguerrero@mppee.gob.ve	PROFESIONAL I	600083	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403691	17813329	JOSE	NICOLAS	ATACHO	QUINTERO	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	JATACHO@MPPEE.GOB.VE	TECNICO II	500006	2	92	TECNICO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184399441	17691729	ARGELIA	SOFIA	COBOS	LLAMOZAS	PASANTE	OFICINA DE SEGURIDAD INTEGRAL	ARGELIA_COBOS@HOTMAIL.COM	PASANTE PROFESIONAL	25	2	35	PROFESIONAL	62	OFICINA DE SEGURIDAD INTEGRAL
184398582	5620189	MEIRA	JOSEFINA	RODRIGUEZ	TORRES	HONORARIOS PROFESIONALES	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION		APOYO PROFESIONAL	2706	1	35	PROFESIONAL	53	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403736	11230238	LEONARDO 	GREGORIO	MONASTERIOS 	MATEUS	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	LMONASTERIOS@MPPEE.GOB.VE	PROFESIONAL III	800039	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184404551	5579499	SUSANA	ANTONIA	TREJO	TOVAR	EGRESADOS	OFICINA DE RECURSOS HUMANOS	STREJO@CANTV.NET	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	39	4	24	OBRERO	141	OFICINA DE RECURSOS HUMANOS
184405004	19796773	LILIANA	VICTORIA	GAVIDIA	FERRER	CONTRATADO	CENTRO NACIONAL DE DESPACHO	VIKY_GAVIDIA24@24GMAIL.COM	APOYO ADMINISTRATIVO	796	1	93	ADMINISTRATIVO	28	DESPACHO DEL MINISTRO
184403632	16351085	MARELVIS	YARINETH	GONZALEZ	ROJAS	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	mygonzalez@mppee.gob.ve	PROFESIONAL I	600031	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184404002	15293461	HENRY	JOSE	ROMERO	MAGGIORANI	CONTRATADO	CENTRO NACIONAL DE DESPACHO	HROMERO@MPPEE.GOB.VE	APOYO TECNICO	716	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184398791	4586631	JANE	MARIA	BAILY	PINTO	SUPLENTE	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS		BACHILLER II	1	1	93	ADMINISTRATIVO	73	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184400761	9504276	SORAYA	DEL CARMEN	DIAZ		OBRERO FIJO	AREA DE COMUNICACION E INFORMACION	SDIAZ@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	85	4	24	OBRERO	13	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403629	16265016	NILVIA	JOSEFINA	MARTINEZ	SALAZAR	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	njmartinez@mppee.gob.ve	PROFESIONAL I	600210	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184404548	20638088	MAYRA	ALEJANDRA	SEMPRUN	MERLO	EGRESADOS	OFICINA DE RECURSOS HUMANOS	MSEMPRUN@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	36	1	93	ADMINISTRATIVO	141	OFICINA DE RECURSOS HUMANOS
184404060	18299402	JAVIER	ANDRES	LUK	CHANG	CONTRATADO	CENTRO NACIONAL DE DESPACHO	JAVIERLUK@GMAIL.COM	APOYO PROFESIONAL	724	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184397560	6523295	ISABEL	DOLORES	PINO	RODRIGUEZ	EMPLEADO FIJO	CONSULTORIA JURIDICA	IPINO@MPPEE.GOB.VE	BACHILLER II	200005	1	93	ADMINISTRATIVO	12	CONSULTORÍA JURIDICA
184403620	16022360	FREDDY		HERNANDEZ	HERNANDEZ	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	FHERNANDEZ@MPPEE.GOB.VE	PROFESIONAL I	600188	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184398606	20210640	YENIFER	LISBETH	SANCHEZ	PACHECO	PASANTE	AREA DE DESARROLLO		PASANTE TECNICO	6	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184403445	5424068	FRANCISCO	JOSE	RAMIREZ	ESCALONA	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	FRAMIREZ@MPPEE.GOB.VE	PROFESIONAL II	700051	2	35	PROFESIONAL	12	OFICINA DE SEGURIDAD INTEGRAL
184392101	16926568	EMILY	JOSEFINA	PEREZ	GARCIA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	EPEREZ@MPPEE.GOB.VE	PROFESIONAL I	600116	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184397972	9883889	WILLIAMS	JOSE	ALVAREZ	BLANCO	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JALVAREZ@MPPEE.GOB.VE	COORDINADOR	2690	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE SEGURIDAD INTEGRAL
184398433	10093311	CARMEN	LOANNY	PÉREZ	RAVELO	CONTRATADO	DIRECCION GENERAL DE PARTICIPACION POPULAR		APOYO TECNICO	212	2	92	TECNICO	28	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184399282	7948913	GABRIELA	PATRICIA	BARRAGAN	GEANT	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	GABYPBG@GMAIL.COM	APOYO PROFESIONAL	2729	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184397543	9882468	ALEXANDRA		ROZO		COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE RECURSOS HUMANOS	AROSO@MPPEE.GOB.VE	PROFESIONAL III	13	1	35	PROFESIONAL	22	OFICINA DE RECURSOS HUMANOS
184406025	14889823	DANIELA	MARIA	D ASCENZO	PEREZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION DEL DESPACHO		PROFESIONAL I	177	1	35	PROFESIONAL	22	DIRECCIÓN DEL DESPACHO
184405193	5662636	MIGUEL	ANGEL	CEDIEL	GARCIA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MIGUELANGELCEDIELGARCÍA58@HOTMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	179	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403601	15444823	MARIA	ESTHER	PARRA	ARTEAGA	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	MPARRA@MPPEE.GOB.VE	BACHILLER II	200008	1	93	ADMINISTRATIVO	12	OFICINA DE ATENCIÓN AL CIUDADANO
184403450	5679630	MIRNA	ISABEL	ARISMENDI	TOVAR	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	marismendi@mppee.gob.ve	PROFESIONAL I	600209	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184390552	4824155	SERGIA	MAGDALENA	ALVAREZ	 	EMPLEADO FIJO	DIRECCION DEL DESPACHO	SALVAREZ@MPPEE.GOB.VE	PROFESIONAL II	700131	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184398360	6910544	MARIA	CAROLINA	BETANCOURT	GARCIA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	MBETANCOURT@MPPEE.GOB.VE	PROFESIONAL I	41	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184402788	16431546	EVERTH	JOSE	JIMENEZ	GONZALEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2762	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403690	17789483	NATASHA	EVELYN	MIRO	MIERES	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	nmiro@mppee.gob.ve	BACHILLER I	100018	1	93	ADMINISTRATIVO	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403157	15757862	CARLOS	JULIO	DUNO	MORA	CONTRATADO	OFICINA DE RECURSOS HUMANOS	JULIODUNO05@HOTMAIL.COM	APOYO PROFESIONAL	688	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184404063	13223643	GERMAN 	ALEJANDRO	MARTINEZ	MARTINEZ	CONTRATADO	CENTRO NACIONAL DE DESPACHO	ELECTRICIDAD100@YAHOO.ES	APOYO TECNICO	726	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184401254	9270947	HAMLET	ATAHUALPA	ESCOBAR	GONZALEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL	HAMLETESCOBAR@YAHOO.COM	HONORARIO PROFESIONAL	2756	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405207	6372700	ORLANDO		DELGADO	BLANCO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ODELGADO200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	193	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184397455	5592916	MARGRIET	JOSEFINA	LAMPERT	ROMERO	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	MLAMPERT@MPPEE.GOB.VE	PROFESIONAL III	800050	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
3367	11635048	JUDITH	ANDREINA	RODRIGUEZ	FERMIN	EMPLEADO FIJO	CONSULTORIA JURIDICA	JRODRIGUEZ@MPPEE.GOB.VE	PROFESIONAL III	800081	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184400703	4582648	MAURO	ENRIQUE	CAVALIERI	ELSTER	OBRERO FIJO	AREA DE COMPRAS	MCAVALIERI@MPPEE.GOB.VE	CHOFER	6	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403082	14925046	FRANCISCO	JAVIER	COLON		COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	fcolon@mppee.gob.ve	BACHILLER III	136	1	93	ADMINISTRATIVO	22	OFICINA DE SEGURIDAD INTEGRAL
184402918	4164996	CARMEN	LUISA	TORRES		EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	CTORRES@MPPEE.GOB.VE	PROFESIONAL III	800092	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184405744	10381680	DARRIS	GREGORIO	DIAZ	MONTEZUMA	CONTRATADO	OFICINA DE RECURSOS HUMANOS	DARRISDIAZ@HOTMAIL.COM	INSTRUCTOR DE GIMNASIO	813	3	93	ADMINISTRATIVO	28	OFICINA DE RECURSOS HUMANOS
184403692	17855023	NATACHA	EMPERATRIZ	ESCALONA	GAMEZ	EMPLEADO FIJO	DIRECCION DEL DESPACHO	NESCALONA@MPPEE.GOB.VE	PROFESIONAL I	600171	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184404000	14261142	OMER	ALEXANDER	FARIAS	AMARISTA	CONTRATADO	CENTRO NACIONAL DE DESPACHO	OFARIAS@MPPEE.GOB.VE	APOYO TECNICO	714	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184399434	16810728	JHULIANA	MIREYLLIS	TORRES		CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	jtorres@mppee.gob.ve	APOYO PROFESIONAL	356	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184397667	12641032	AURORA	MARIA	LEDEZMA	GONZALEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION DEL DESPACHO	ALEDEZMA@MPPEE.GOB.VE	PROFESIONAL III	17	1	35	PROFESIONAL	22	DIRECCIÓN DEL DESPACHO
184403527	12949830	JENNY	DEL CARMEN	GONZALEZ	DE VILCHEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	jdgonzalez@mppee.gob.ve	PROFESIONAL II	700111	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184399899	2144141	GERTRUDIS	DEL CARMEN	SARACHE		CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	gsarache@mppee.gob.ve	APOYO PROFESIONAL	403	1	35	PROFESIONAL	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403455	6158879	DEYANIRA	MARLENE	SEGOVIA		EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	dsegovia@mppee.gob.ve	PROFESIONAL III	800028	2	35	PROFESIONAL	12	OFICINA DE ATENCIÓN AL CIUDADANO
184405494	19933782	YULIMAR	CAROLINA	HIDALGO 	PANTOJA	PASANTE	CONSULTORIA JURIDICA	KARO_2311@HOTMAIL.COM	PASANTE PROFESIONAL	150	2	35	PROFESIONAL	62	CONSULTORÍA JURIDICA
184397542	15227358	FABIANA	CAROLINA	NUÑEZ	BENAVIDEZ	CONTRATADO	AREA DE SECRETARIA	FNUNEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	47	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184403581	14929518	DANIEL	JOSE	HIDALGO	SIMANCAS	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	DHIDALGO@MPPEE.GOB.VE	PROFESIONAL II	700104	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404541	10489569	JESUS	DAVID	PARTIDA		EGRESADOS	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL 	29	1	93	ADMINISTRATIVO	141	OFICINA DE RECURSOS HUMANOS
184403561	14160674	ARELYS	NINOSKA	TORRES	RAMIREZ	EMPLEADO FIJO	CONSULTORIA JURIDICA	atorres@mppee.gob.ve	PROFESIONAL II	700132	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184401990	6516773	JOSE	LUIS	DEL VALLE	MEJIAS	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JDELVALLE@MPPEE.GOB.VE	COORDINADOR	95	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184401243	19298870	GRISEL	AL-THAIR	NAKOUL	GARNIER	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO		PASANTE PROFESIONAL	65	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184399285	14489073	ELIANA	JOSE	AREVALO	FERNANDEZ	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	ELIAREVALO@CANTV.NET	APOYO PROFESIONAL	2732	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184405663	18187680	GERARDO		CORTES	FERNANDEZ	ALTO NIVEL Y/O CONFIANZA	OFICINA DE GESTION ADMINISTRATIVA		DIRECTOR	9950022	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE GESTIÓN ADMINISTRATIVA
184401267	12787080	MARY	LUZ	SANCHEZ	GARCES	CONTRATADO	DIRECCION ESTADAL (ZULIA)	mlsanchez@mppee.gob.ve	APOYO PROFESIONAL	495	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184403651	16824332	EDUARDO	JOSE	GIMENEZ	JIMENEZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	EGIMENEZ@MPPEE.GOB.VE	PROFESIONAL II	700044	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184399832	10791611	PEDRO	JOSE	NUÑEZ	RIVAS	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	PNUNEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	398	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184404516	6516773	JOSE	LUIS	DEL VALLE	MEJIAS	EGRESADOS	OFICINA DE RECURSOS HUMANOS	JDELVALLE@MPPEE.GOB.VE	COORDINADOR	4	0	39	COORDINADOR	141	OFICINA DE RECURSOS HUMANOS
184403579	14805762	MARIA	ALEJANDRA	UZCATEGUI	ZERPA	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	MUZCATEGUI@MPPEE.GOB.VE	TECNICO I	400007	2	92	TECNICO	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184404390	11901059	NELSON	LUIS	MARIN	LA ROSA	CONTRATADO	CENTRO NACIONAL DE DESPACHO	ANGUSDEI75@HOTMAIL.COM	APOYO TECNICO	748	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184403609	15605016	ALEJANDRO		VIVAS	SALAZAR	EMPLEADO FIJO	AUDITORIA INTERNA	avivas@mppee.gob.ve	PROFESIONAL I	600042	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184401264	11068211	MARINERIS	ELIZABETH	FUENMAYOR	CHAPARRO	CONTRATADO	DIRECCION ESTADAL (ZULIA)	MFUENMAYOR@MPPEE.GOB.VE	APOYO PROFESIONAL	492	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184400659	10687012	ELY	SAUL	YZARRA	ROA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	EIZARRA@MPPEE.GOB.VE	VIGILANTE	26	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403939	17474653	YEIKER	KARINA	AZUAJE	RAMOS	CONTRATADO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	YAZUAJE@MPPEE.GOB.VE	APOYO PROFESIONAL	707	1	35	PROFESIONAL	28	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184397078	1417113	JULIO	MARCELINO	CHIRINO		COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	JCHIRINO@MPPEE.GOB.VE	DIRECTOR GENERAL	23	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE SEGURIDAD INTEGRAL
184399892	5054730	EMIL	SANDOR	KERMENDY	VONDRACHEK	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	EKERMENDY@MPPEE.GOB.VE	PROFESIONAL III	70	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184399819	14742009	RONI	ALBERTO	CHAPELLIN	REYES	OBRERO-CONTRATADO	AREA DE SEGUIMIENTO DE GESTION		AUXILIAR DE SERVICIOS DE OFICINA	329	4	24	OBRERO	92	DIRECCIÓN DEL DESPACHO
184403492	10548863	MARY	ESTHER	PEÑAFIEL	RAMBAL	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	MPENAFIEL@MPPEE.GOB.VE	PROFESIONAL II	700030	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184405824	9205799	LUIS	ARGELIS	REY	GARCIA	ALTO NIVEL Y/O CONFIANZA	OFICINA DE SEGURIDAD INTEGRAL	IREY33@HOTMAIL.COM	COORDINADOR	9950028	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE SEGURIDAD INTEGRAL
184400597	12805293	LUIS 	ENRIQUE	UZCATEGUI	MARTINEZ	CONTRATADO	DIRECCION ESTADAL (ZULIA)	luzcategui@mppee.gob.ve	APOYO TECNICO	438	2	92	TECNICO	28	DIRECCIONES ESTADALES
184404272	3371883	EDITH	ROSA	URDANETA	GARCIA	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	eurdaneta@mppee.gob.ve	ASISTENTE	128	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398795	5230259	ORLANDO	JOSE	MELO	URQUIOLA	EMPLEADO FIJO	ÁREA DE REGISTRO Y CONTROL	OMELO@MPPEE.GOB.VE	DIRECTOR	2706	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE RECURSOS HUMANOS
184402988	11969468	LUIS	FRANCISCO	LAREZ	REYES	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	LLAREZ@MPPEE.GOB.VE	PROFESIONAL III	800021	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184405954	12001553	MARIA	ALESSANDRA	BABINO	POCAY	ALTO NIVEL Y/O CONFIANZA	OFICINA DE RECURSOS HUMANOS		COORDINADOR	9950033	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184401992	6810892	ERWIN	JOHANNES	MULLER	NAVARRO	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	EMULLER@MPPEE.GOB.VE	DIRECTOR DE LINEA	60	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403752	14666124	CARLOS	ANIBAL	CEDEÑO 	LAREZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	CCEDENO@MPPEE.GOB.VE	TECNICO II	500003	2	92	TECNICO	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403479	9361290	EDGAR	ARMANDO	OROZCO 	BELANDRIA	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	eorozco@mppee.gob.ve	PROFESIONAL II	700091	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184401504	3714184	HECTOR	AUGUSTO	NAVARRO	DIAZ	ALTOS FUNCIONARIOS	DESPACHO DEL MINISTRO	HNAVARRO@MPPEE.GOB.VE	MINISTRO	9960001	0	91	DIRECCION/GERENCIA/SUPERVISORES	111	DESPACHO DEL MINISTRO
184404948	11465030	EWARD	ALEXANDER	BECERRA	LUPI	CONTRATADO	DIRECCION DEL DESPACHO	EBELUP@HOTMAIL.COM  /  EBECEL@GMASIL.COM	APOYO PROFESIONAL	790	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184400898	16461306	JONATHAN	JOSE	DIAZ	LAZO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JDIAZ@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	104	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403575	14676917	NEHOMAR	ALEXANDER	DURAN	ARMARIO	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	nduran@mppee.gob.ve	PROFESIONAL II	700112	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397073	8827612	VLADIMIR	ERNESTO	MIRO	MIERES	EMPLEADO FIJO	DESPACHO DEL MINISTRO	VMIRO@MPPEE	DIRECTOR	2653	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	DESPACHO DEL MINISTRO
184403661	17097304	EGLENYS	ELENA	LEAL	VILLALOBOS	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	ELEAL@MPPEE.GOB.VE	PROFESIONAL II	700035	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184405440	7884009	GILBERTO 	MEDARDO	MENESES	VEGAS	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2774	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184398181	2980635	CARLOS	ARGENIS	MARTINEZ	VILLALTA	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL		OFICIAL DE SEGURIDAD	186	4	24	OBRERO	28	OFICINA DE SEGURIDAD INTEGRAL
184400430	15440366	CLAUDIA	PATRICIA	SANTAMARIA	VARELA	CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	CSANTAMARIA@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	435	4	24	OBRERO	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184398570	6026377	MARICELA		REVERON	DE REYES	EMPLEADO FIJO	DIRECCION DEL DESPACHO	MREVERON@MPPEE.GOB.VE	PROFESIONAL II	700005	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184405250	13852007	OMAR 	JOSE	MEDINA	TOLEDO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	OMEDINA@MPPEE.GOB.VE	CHOFER	236	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403605	15580639	ELIECER	JOSE	QUINTERO	GARCIA	EMPLEADO FIJO	DESPACHO DEL MINISTRO	equintero@mppee.gob.ve	PROFESIONAL I	600170	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184401263	16403668	JESUS	ALFREDO	CASTILLO	COLMENAREZ	CONTRATADO	DIRECCION ESTADAL (ZULIA)	JACASTILLO@MPPEE.GOB.VE	APOYO TECNICO	491	2	92	TECNICO	28	DIRECCIONES ESTADALES
184390341	6501129	LUIS	JOSE	ACOSTA	ALCALA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	LUISJACOSTA@HOTMAIL.COM	PROFESIONAL I	2153	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184403063	16451982	JOHANNA	LEONELIS	FLORES	PACHECO	CONTRATADO	DIRECCION DEL DESPACHO	jflores@mppee.gob.ve	APOYO TECNICO	671	2	92	TECNICO	28	DIRECCIÓN DEL DESPACHO
184401822	16301205	DIANA	CAROLINA	GALVIS	SANDOVAL	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	DIANA16301@HOTMAIL.COM	PROFESIONAL I	114	1	35	PROFESIONAL	22	OFICINA DE SEGURIDAD INTEGRAL
184403685	17659520	LEONARDO	RAFAEL	SANGUINETTI	MORA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	lsanguinetti@mppee.gob.ve	PROFESIONAL I	600193	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404601	13207624	MARCOS	AURELIO	YANEZ	PACHECO	SUPLENTES (OBREROS)	OFICINA DE GESTION ADMINISTRATIVA		MENSAJERO	7	4	24	OBRERO	131	OFICINA DE GESTIÓN ADMINISTRATIVA
184400689	15314363	ROBERTO	CARLOS	CASTILLO	CARRILLO	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	ROCASTILLO@MPPEE.GOB.VE	VIGILANTE	56	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403648	16703128	MARIELYS 	DEL VALLE	NARVAEZ	GONZALEZ	EMPLEADO FIJO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	MNARVAEZ@MPPEE.GOB.VE	PROFESIONAL I	600120	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184404942	4254313	DINORAH	MARÍA	TORRES	ROJAS	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	DTORRES@71HOTMAIL.COM	TECNICO I	800156	2	92	TECNICO	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184403935	4170020	HELCIAS	MOISES	BENAIM	CASADO	CONTRATADO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	HBENAIM@MPPEE.GOB.VE	APOYO PROFESIONAL	703	1	35	PROFESIONAL	28	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184402794	16357332	KLEYDER	OSWALDO	RIVAS	ROMERO	CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	krivas@mppee.gob.ve	APOYO PROFESIONAL	658	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184400652	9098380	STANLEY		IZTURRIAGA	ESCALONA	OBRERO FIJO	AREA DE COMPRAS	SIZTURRIAGA@MPPEE.GOB.VE	CHOFER	19	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401643	3983523	JOSE	ANTONIO	MENDOZA	RODRIGUEZ	CONTRATADO	DIRECCION DEL DESPACHO	JMENDOZA@MPPEE.GOB.VE	APOYO PROFESIONAL	542	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184405008	16815678	LUIS 	ENRIQUE	CUEVAS	SANTANA	CONTRATADO	CENTRO NACIONAL DE DESPACHO	LECS29@GMAIL.COM	APOYO PROFESIONAL	800	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184400700	4114880	DELFIN	OSWALDO	RUIZ	IRIARTE	OBRERO FIJO	AREA DE COMPRAS	DRUIZ@MPPEE.GOB.VE	MECANICO DE REFRIGERACION	3	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403591	15314519	LISKEILA 	ALIESKA	ROJAS	FIGUEROA	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	lrojas@mppee.gob.ve	PROFESIONAL I	600022	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184405240	12459702	JUAN	CARLOS	SOSA	MAYORA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JSOSA200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	226	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405303	18556388	JHON THAIRON	DE JESUS	VASQUEZ	JASPE	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JTVASQUEZ@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	56	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403519	12382349	MARIANA		BLANCO	RAMIREZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	MBLANCO@MPPEE.GOB.VE	PROFESIONAL III	800090	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403714	19398156	EDWIN	ALEXANDER	TABARES	RODRIGUEZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	ETABARES@MPPEE.GOB.VE	TECNICO I	400041	2	92	TECNICO	12	OFICINA DE RECURSOS HUMANOS
184403681	17456786	MIGUEL	ALEJANDRO	CARMONA	PEÑA	EMPLEADO FIJO	DESPACHO DEL MINISTRO	MCARMONA@MPPEE.GOB.VE	PROFESIONAL I	600165	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184404197	12357622	LUIS	NICOLAS	PEREZ	PIÑA	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	XAVIERPEREZ@HOTMAIL.COM	PROFESIONAL III	152	1	35	PROFESIONAL	22	OFICINA DE SEGURIDAD INTEGRAL
184405003	18819244	LENNYS	VANESSA	BARRIOS	GONZALEZ	CONTRATADO	CENTRO NACIONAL DE DESPACHO	VANESSA_1_26@HOTMAIL.COM	APOYO ADMINISTRATIVO	795	1	93	ADMINISTRATIVO	28	DESPACHO DEL MINISTRO
184403472	7414558	LENIS	THAIS	SALGUEIRO	ARRAIZ	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	LSALGUEIRO@MPPEE.GOB.VE	PROFESIONAL II	700037	2	35	PROFESIONAL	12	OFICINA DE ATENCIÓN AL CIUDADANO
184404530	12337053	JUAN 	CARLOS	TOVAR	GUTIERREZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	JUANCARLOSTG@YAHOO.COM	PROFESIONAL II	18	2	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184397471	10543960	JAVIER	NICOLAS	RODRIGUEZ	COCHO	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	JNRODRIGUEZ@MPPEE.GOB.VE	CHOFER	11	4	24	OBRERO	22	OFICINA DE SEGURIDAD INTEGRAL
184404456	19671929	LINALBER		RODRIGUEZ	RUIZ	PASANTE	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES		PASANTE TECNICO	122	2	92	TECNICO	62	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184398305	17147234	VELVET	MOUREEN	DE SOUSA	D'AGOSTINO	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	VDESOUSA@MPPEE.GOB.VE	ASISTENTE	2701	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397975	640666	ALBERTO	JULIAN	ROSSI	HERRERA	CONTRATADO	OFICINA DE RECURSOS HUMANOS	AROSSI@MPPEE.GOB.VE	DIRECTOR	168	0	91	DIRECCION/GERENCIA/SUPERVISORES	28	OFICINA DE RECURSOS HUMANOS
184403753	8102807	WILLIAM	ALEXANDER	AGELVIS	GUILLEN	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	wagelvis@mppee.gob.ve	TECNICO II	500019	2	92	TECNICO	12	OFICINA DE SEGURIDAD INTEGRAL
184398439	19499515	ELIZABETH		OMAÑA	AVENDAÑO	CONTRATADO	AREA DE RELACIONES INSTITUCIONALES	THAMY182@HOTMAIL.COM	APOYO ADMINISTRATIVO	218	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184400715	7959317	JOSÉ	DANIEL	TORREALBA	TORREALBA	OBRERO FIJO	AREA DE COMPRAS	JTORREALBA@MPPEE.GOB.VE	CHOFER	18	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399818	17030839	LUIS	EDUARDO	SEGOVIA	PIÑERO	OBRERO-CONTRATADO	AREA DE SEGUIMIENTO DE GESTION		AUXILIAR DE SERVICIOS DE OFICINA	328	4	24	OBRERO	92	DIRECCIÓN DEL DESPACHO
184400839	11405579	JUAN 	RAMON	HERNANDEZ	HERNANDEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JRHERNANDEZ@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	95	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403649	16750014	JOSE 	ANTONIO	VARGAS 	VIVAS 	EMPLEADO FIJO	DESPACHO DEL MINISTRO	JAVARGAS@MPPEE.GOB.VE	PROFESIONAL I	600183	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184403095	14341493	SEDLY	JOSEFINA	DUARTE	DE MIRABAL	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	SDUARTE@MPPEE.GOB.VE	APOYO PROFESIONAL	676	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397196	9883889	WILLIAMS	JOSE	ALVAREZ	BLANCO	CONTRATADO	OFICINA DE RECURSOS HUMANOS	JALVAREZ@MPPEE.GOB.VE	COORDINADOR	9	1	91	DIRECCION/GERENCIA/SUPERVISORES	28	OFICINA DE RECURSOS HUMANOS
184391061	13068184	DOUGLAS	AYARI	SALAS	PEÑA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	DSALAS@MPPEE.GOB.VE	PROFESIONAL I	600107	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184401033	19685132	LUIS	RAMON	RODRIGUEZ	RODRIGUEZ	PASANTE	DESPACHO DEL MINISTRO		PASANTE PROFESIONAL	52	2	35	PROFESIONAL	62	DESPACHO DEL MINISTRO
184400705	5517569	SAMUEL	JOSE	ARRIECHE	MELO	OBRERO FIJO	AREA DE COMPRAS	SARRIECHE@MPPEE.GOB.VE	CONSERJE	8	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400551	10111892	ROSANGEL		ACEVEDO	DE ALVARADO	ALTO NIVEL Y/O CONFIANZA	AREA DE COMPRAS	RACEVEDO@MPPEE.GOB.VE	COORDINADOR	2673	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE GESTIÓN ADMINISTRATIVA
184405460	12940311	ORLANDO	ALIRIO	LOPEZ	ALBESIANO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2794	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
3336	6451529	MARIA	ELENA	CALDEIRA	SOUSA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	MCALDEIRA@MPPEE.GOB.VE	PROFESIONAL I	600091	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184402148	18419387	MARIA	ALEJANDRA	ESCOBAR 	GARCIA	PASANTE	AREA DE ASUNTOS INTERNACIONALES		PASANTE PROFESIONAL	83	2	35	PROFESIONAL	62	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403634	16473485	LEHINS	SIRYAKIBBE	OSORIO	DUQUE	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	LOSORIO@MPPEE.GOB.VE	PROFESIONAL I	600176	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184400668	13158325	YULENA	CECILIA	YZARRA		OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	YYZARRA@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS ESPECIALIZADOS	35	4	111	OBRERO SUPERVISOR	13	OFICINA DE SEGURIDAD INTEGRAL
184403705	18313061	CARLOS 	ANTONIO	ORTA 	GRILLO	EMPLEADO FIJO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	CORTA@MPPEE.GOB.VE	PROFESIONAL I	600014	2	35	PROFESIONAL	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184402984	16468494	JUAN 	PABLO	ARIZA	RAMIREZ	CONTRATADO	DIRECCION DEL DESPACHO	jariza@mppee.gob.ve	APOYO PROFESIONAL	666	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184402665	12640200	JENNY	CECILIA	RAMIREZ	BARRIOS	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA		PASANTE TECNICO	89	2	92	TECNICO	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403750	15325514	HANS 	STEVE	PADRON	BIRKE	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	HANSPADRON@GMAIL.COM	TECNICO I	400011	2	92	TECNICO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184402852	4419505	ANGEL		HERNÁNDEZ		CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION		AUXILIAR DE SERVICIOS DE OFICINA	664	4	24	OBRERO	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184400750	6366554	JOSE 	FELIX	AGREDA	GUERRA	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	JAGREDA_12@HOTMAIL.COM	APOYO PROFESIONAL	450	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184398677	2147718	CARLOS	ENRIQUE	MEJIAS		CONTRATADO	DIRECCION DEL DESPACHO	CMEJIAS@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	257	1	93	ADMINISTRATIVO	28	DIRECCIÓN DEL DESPACHO
184400428	13871417	SEGUNDO	ONOFRE	CAMPUZANO	LINARES	CONTRATADO	AREA DE SEGUIMIENTO DE GESTION	SEGUNDOIMJCARACAS@HOTMAIL.COM	AUXILIAR DE SERVICIOS DE OFICINA	320	4	24	OBRERO	28	DIRECCIÓN DEL DESPACHO
184400962	3238012	ARGENIS		GIRON 	SOTILLO	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	agiron@mppee.gob.ve	APOYO ADMINISTRATIVO	461	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403875	6851389	ALFREDO	RAFAEL	LOPEZ	PALACIOS	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	ARLOPEZ@MPPEE.GOB.VE	PROFESIONAL III	800060	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184400963	6165339	JOSE 	MIGUEL	VIELMA	LOPEZ	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	VIELMAJOTA4@HOTMAIL.COM	APOYO PROFESIONAL	462	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184396353	14503499	JOSE	NICOLAS	MENDEZ	ESPITIA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	JNMENDEZ@MPPEE.GOB.VE	PROFESIONAL I	600112	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405441	8229510	ARTURO	RAMON	GUAREGUA	VELASQUEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2775	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184396284	15891650	LUIS	ALFONSO	DAVILA	VIVAS	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	LDAVILA@MPPEE.GOB.VE	PROFESIONAL I	600115	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405009	18728304	RAUL	OSWALDO	GONZALEZ	GONZALEZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS	RAULGG528@HOTMAIL.COM	APOYO TECNICO	801	2	92	TECNICO	28	OFICINA DE RECURSOS HUMANOS
184403602	15507077	YILSNOIMAR	FLORIVIER	NAVARRO	ESQUEDA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	YNAVARRO@MPPEE.GOB.VE	TECNICO I	400016	2	92	TECNICO	12	OFICINA DE RECURSOS HUMANOS
184406101	12297062	EFREN	ARMANDO	MARTIN 	PIMENTEL	CONTRATADO	OFICINA DE RECURSOS HUMANOS	EFRENMARTIN.EE@GMAIL.COM	PRESIDENTE	839	1	91	DIRECCION/GERENCIA/SUPERVISORES	28	OFICINA DE RECURSOS HUMANOS
184405254	14450821	JHON	GARBEY	SANABRIA	PINHO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JSANABRIA@MPPEE.GOB.VE	CHOFER	240	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404452	14850313	IMMER	ELIEZER	MARCANO	MORALES	PASANTE	CENTRO NACIONAL DE DESPACHO	IMMER_MARCANO@HOTMAIL.COM	PASANTE PROFESIONAL	118	2	35	PROFESIONAL	62	DESPACHO DEL MINISTRO
184405281	18024764	HENDRIS	CARLOS	MONTEROLA		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	HMONTEROLA200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	267	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399281	8611963	LEDYS	YUMIRY	FIGUEROA 	COLMENARES	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	2728	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184403612	15791075	IRAIMA	JOSEFINA	GONZALEZ	GARCIA	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	YGONZALEZ@MPPEE.GOB.VE	BACHILLER I	100017	1	93	ADMINISTRATIVO	12	OFICINA DE ATENCIÓN AL CIUDADANO
184404514	5742680	CARLOS	ALFONSO	GOYO	BARRIENTOS	EGRESADOS	OFICINA DE RECURSOS HUMANOS	CARLOS.GOYO-BARRIENTOS@CANTV.NET	DIRECTOR	2	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184402004	15315193	HELIOS	PASTOR	ESPIN	DEL RIO	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	HESPIN@MPPEE.GOB.VE	DIRECTOR GENERAL	30	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184406027	15929539	CARLOS 	EDUARDO	ROA	SOCAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	CARLOSROA@GMAIL.COM	PROFESIONAL II	178	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184406105	14531444	HUMBERTO	ANTONIO	MANZANARES	GÁMEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL MINISTRO		PROFESIONAL I	180	1	35	PROFESIONAL	22	DESPACHO DEL MINISTRO
184399820	6273257	JULIO	CESAR	CARRILLO	RAMIREZ	OBRERO-LICENCIAS REMUNERADAS	OFICINA DE GESTION ADMINISTRATIVA	JCCARRILLO@MPPEE.GOB.VE	ESCOLTA	7	4	24	OBRERO	93	OFICINA DE GESTIÓN ADMINISTRATIVA
3401	6544290	ERMELINDA	GRISEL	CHACIN	CASTILLO	EMPLEADO FIJO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	ECHACIN@MPPEE.GOB.VE	PROFESIONAL III	800003	2	35	PROFESIONAL	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184399817	25053254	JOSE		IGLESIAS 	DOMINGUEZ	OBRERO-CONTRATADO	OFICINA DE RECURSOS HUMANOS		OFICIAL DE SEGURIDAD	187	4	24	OBRERO	92	OFICINA DE RECURSOS HUMANOS
184405185	4070592	MANUEL	ENRIQUE	SANCHEZ		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MSANCHEZ203@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	171	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399093	10783405	ADRIANA	XIOMARA	HERNANDEZ	AGUILARTE	CONTRATADO	AREA DE SEGUIMIENTO DE GESTION	AXHERNANDEZ@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	319	1	93	ADMINISTRATIVO	28	DIRECCIÓN DEL DESPACHO
184403737	5133129	LUIS 	RUBEN	ACUÑA 	ESTEVES	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	LACUNA@MPPEE.GOB.VE	PROFESIONAL III	800075	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184397313	7116432	CECILIA	INES	GUERRA	FUENTES	CONTRATADO	AREA TECNICA	cguerra@mppee.gob.ve	APOYO PROFESIONAL	26	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184398180	9416035	HENRY	JESUS	CORDERO	GUTIERREZ	EMPLEADO FIJO	AREA DE SEGUIMIENTO Y CONTROL PRESUPUESTARIO	CORDEROHENRY@HOTMAIL.COM	COORDINADOR	2700	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184404459	18895257	FREDDY	RAMÓN	ARMAS	MONCADO	CONTRATADO	CENTRO NACIONAL DE DESPACHO	FREDDY3186@HOTMAIL.COM	APOYO TECNICO	760	2	92	TECNICO	28	DESPACHO DEL MINISTRO
3977	4355671	RICARDO	 	RAHN	MONTSERRAT	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	RRAHN@MEM.GOV.VE	JEFE DE GRUPO	687	0	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184403812	11071207	EDUARDO	ALBERTO	RIVAS 	ALFONZO	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	ERIVAS@MPPEE.GOB.VE	PROFESIONAL II	700053	2	35	PROFESIONAL	12	OFICINA DE SEGURIDAD INTEGRAL
184401092	17387059	YOLIMAR	ALEJANDRA	GARCIA	BRICEÑO	SUPLENTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	YOLINACHO@HOTMAIL.COM	BACHILLER I	6	1	93	ADMINISTRATIVO	73	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405966	25019039	GLADYS	ELISA	VERGARA	DE BUELVAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	GVERGARA@MPPEE.GOB.VE	BACHILLER I	169	1	93	ADMINISTRATIVO	22	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184401124	4353936	FELIPE 	XAVIER	BELLO 	GONZALEZ	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	fbello@mppee.gob.ve	FOTOGRAFO	478	2	35	PROFESIONAL	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403462	6383543	BEATRIZ	DEL CARMEN	GUILLEN	AULAR	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	BGUILLEN@MPPEE.GOB.VE	BACHILLER I	100021	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184400545	6427821	CARMEN	ELOINA	DIAZ	GARCIA	ALTO NIVEL Y/O CONFIANZA	OFICINA DE GESTION ADMINISTRATIVA	CEDIAZ@MPPEE.GOB.VE	DIRECTOR	2694	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE GESTIÓN ADMINISTRATIVA
184402975	14586688	ISRAEL	JESUS	ROJAS	APONTE	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE PARTICIPACION POPULAR	irojas@mppee.gob.ve	BACHILLER I	130	1	93	ADMINISTRATIVO	22	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184402397	14526196	CESAR		MARRUGO	MARRUGO	OBRERO FIJO	AREA DE SERVICIOS GENERALES	cmarrugo@mppee.gob.ve	MENSAJERO MOTORIZADO	138	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184392103	7948986	JOSE	GREGORIO	ARTIGAS	BAPTISTA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	JARTIGAS@MPPEE.GOB.VE	PROFESIONAL II	700084	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184398244	3400544	MAXIMO		TORRES 	CEIBA	CONTRATADO	AREA DE COMPRAS	MATORRES@MPPEE.GOB.VE	APOYO PROFESIONAL	199	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184402514	6105271	JOSE	ANTONIO	FRIAS	RAMIREZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JFRIAS@MPPEE.GOB.VE	SUPERVISOR DE SEGURIDAD	155	4	111	OBRERO SUPERVISOR	13	OFICINA DE SEGURIDAD INTEGRAL
184405244	13030866	JOSE	FELICIANO	MAZARA		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JMAZARA200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	230	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399288	8444751	PEDRO	JOSE	PATIÑO	DIAZ	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	2735	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184398796	23625455	FRANCISCO		RODRIGUEZ	GARCIA	HONORARIOS PROFESIONALES	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	2718	1	35	PROFESIONAL	53	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184402516	16905807	ALBERTO	FRANALBERT	BORGES	LAYA	PASANTE	AREA DE REGULACION DE LA ENERGIA RENOVABLE		PASANTE PROFESIONAL	84	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184397454	6054281	ELY	VILMARY	VASQUEZ	CORDERO	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	EVASQUEZ@MPPEE.GOB.VE	PROFESIONAL III	800054	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184394930	15508914	PAOLA	DEL CARMEN	RIVAS	PLATA	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	PRIVAS@MPPEE.GOB.VE	PROFESIONAL III	800040	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184403532	13246942	YLENY	TATIANA	CUMANA	LUGO	EMPLEADO FIJO	CONSULTORIA JURIDICA	YCUMANA@MPPEE.GOB.VE	PROFESIONAL II	700024	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184401361	2259911	HUGO	ARCENIO	ROSAS		CONTRATADO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	HUGHAR47@HOTMAIL.COM	APOYO PROFESIONAL	507	1	35	PROFESIONAL	28	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184403816	11714922	MARCOS 	TULIO	DUGARTE	GOMEZ	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	MDUGARTE@MPPEE.GOB.VE	PROFESIONAL III	800035	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184406093	18915595	JUALY	NAYARI	LABRADOR	DUARTE	CONTRATADO	OFICINA DE RECURSOS HUMANOS		APOYO TECNICO	836	2	92	TECNICO	28	OFICINA DE RECURSOS HUMANOS
184404778	15835432	MARIANA	COROMOTO	REYES	URBINA	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	MCREYES@MPPEE.GOB.VE	APOYO TECNICO	771	2	92	TECNICO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184399151	5427913	RODOLFO		NAVARRO	DIAZ	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	RNAVARRO@MPPEE.GOB.VE	VICEMINISTRO	1	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184403540	13598718	KEILA	MARINA	TOVAR	BECERRA	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	KTOVAR@MPPEE.GOB.VE / KTOVAR2978@GMAIL.COM	PROFESIONAL I	600169	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184398185	12831478	ELOINA	RAMONA	DIAZ	DURAN	CONTRATADO	AREA DE ATENCION CIUDADANA	EDIAZ@MPPEE.GOB.VE	APOYO PROFESIONAL	190	1	35	PROFESIONAL	28	OFICINA DE ATENCIÓN AL CIUDADANO
184406104	16338149	ERICK	ALEXANDER	GARCÍA	GALAVIS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL MINISTRO		PROFESIONAL I	179	1	35	PROFESIONAL	22	DESPACHO DEL MINISTRO
184405302	23142335	ALFONSO		BERTEL	TORRES	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ABERTEL200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	288	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
3351	13010825	JEIDY	NIDETH	CEPEDA	PEREZ	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	JCEPEDA@MPPEE.GOB.VE	PROFESIONAL III	800043	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184403742	11650492	CESAR	ARISTOTELES	YAJURE	RAMIREZ	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	CYAJURE@MPPEE.GOB.VE	PROFESIONAL II	700134	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184405734	12396553	JHOAN 	MANUEL	REYES	VELAZQUEZ	ALTO NIVEL Y/O CONFIANZA	OFICINA DE GESTION ADMINISTRATIVA		COORDINADOR	9950025	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE GESTIÓN ADMINISTRATIVA
184401301	16265748	TITO	HENBERDY	DAZA	PERALTA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	tdaza@mppee.gob.ve	ESCOLTA	111	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403644	16589755	JOSE	ENRIQUE	PINTO	BALLESTEROS	EMPLEADO FIJO	AUDITORIA INTERNA	JEPINTO@MPPEE.GOB.VE	PROFESIONAL I	600043	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184405313	12415525	MARÍA 	DE LOS ANGELES	ROMAN	TORRES	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	MARIANGELROMAN@HOTMAIL.COM	ASISTENTE	9950012	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184405203	6264140	JORGE	LUIS	UNAMO	CARVAJAL	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JUNAMO200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	189	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403947	21013768	FELIX	MANUEL	TEIXEIRA	LOPEZ	CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	fteixeira@mppee.gob.ve	APOYO ADMINISTRATIVO	711	1	93	ADMINISTRATIVO	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184405213	6868611	JOSE	RAFAEL	TREMONT	GALICIA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JTREMONT@MPPEE.GOB.VE	CHOFER	199	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405735	14517412	OMAR	RAFAEL	SOLORZANO	GARCIA	ALTO NIVEL Y/O CONFIANZA	CONSULTORIA JURIDICA	EJCM2112@HOTMAIL.COM	DIRECTOR	9950026	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	CONSULTORÍA JURIDICA
184405804	20824131	YERICKA 	GINETTE	MENDOZA	TORRES	PASANTE	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES		PASANTE TECNICO	172	2	92	TECNICO	62	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184404558	18736353	CORYMAR	YELENA	LAVADO	MORA	EGRESADOS	OFICINA DE RECURSOS HUMANOS	CORYNTHYA@HOTMAIL.COM  	PROFESIONAL I	46	1	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184403454	6149422	FRANKLIN	FRANCISCO	FUENMAYOR 	ZURITA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	FFUENMAYOR@MPPEE.GOB.VE	TECNICO II	500010	2	92	TECNICO	12	OFICINA DE RECURSOS HUMANOS
184405651	13972235	ENRY	JOSUÉ	DURAN		(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DESPACHO DEL MINISTRO		COORDINADOR	144	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DESPACHO DEL MINISTRO
184401647	6662651	LUISA 	NINOSKA	FLORES		COMISION DE SERVICIOS Y/O ENCARGADURIA	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	LFLORES@MPPEE.GOB.VE	PROFESIONAL I	110	1	35	PROFESIONAL	22	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184397487	15999229	ROSA	MARIA 	GALEANO	URRUTIA 	CONTRATADO	DIRECCION DEL DESPACHO	RGALEANO@MPPEE.GOB.VE	APOYO PROFESIONAL	42	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184399905	18536383	ELIANYS	NASBEL	MAYORA	HERNANDEZ	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	ANGELIANYS@GMAIL.COM	PASANTE PROFESIONAL	34	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405282	18109624	LEONARDO	VIRGENIS	VILLAHERMOSA	CEDEÑO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	VLEONARDO200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	268	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184392043	10872961	JOSE	ANTONIO	ALONSO	RIVAS	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	JALONSO@MPPEE.GOB.VE	PROFESIONAL III	800026	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184403449	5575780	WILLIAM	JOSE	SALCEDO	TREJO	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	WSALCEDO@MPPEE.GOB.VE	PROFESIONAL II	700046	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184400087	19292275	DANIEL		MANFRE	JAIMES	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	DANIMAN28@GMAIL.COM	PASANTE PROFESIONAL	45	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405235	11201730	MIGUEL	ANGEL	CAVALIERI	AGUILAR	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	macavalieri@mppee.gob.ve	CHOFER	221	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405247	13408326	JUAN	LUIS	PAREDES		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JPAREDES204@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	233	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400753	7174391	ELENA		CARABALLO	HENRIQUEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	ecaraballo@mppee.gob.ve	PROFESIONAL III	87	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184404544	16462685	ANDREA	ISABEL	GONZALEZ	OTTO	EGRESADOS	OFICINA DE RECURSOS HUMANOS	AGONZALEZ@MPPEE.GOB.VE	APOYO TÉCNICO	32	2	92	TECNICO	141	OFICINA DE RECURSOS HUMANOS
184405963	15420849	DANIEL 	JOSE	ZAPATA	ALONZO	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	dzapata@mppee.gob.ve	TECNICO I	166	2	92	TECNICO	22	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184402981	2099160	LUIS 	ALBERTO 	FUENTES	TORRES	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	LFUENTES@MPPEE.GOB.VE	JUBILADO	3	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184403050	20604628	EUCARIS	YOSELYS	LINARES	CHAPARRO	CONTRATADO	DIRECCION DEL DESPACHO	elinares@mppee.gob.ve	APOYO TECNICO	668	2	92	TECNICO	28	DIRECCIÓN DEL DESPACHO
184398617	7544353	JOSE	RAFAEL	ZAVARCE	PEÑA	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	JZAVARCE@MPPEE.GOB.VE	APOYO PROFESIONAL	247	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403696	17983792	ANA	KRISTINA DEL VALLE	LOPEZ	RODRIGUEZ	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	alopezr@mppee.gob.ve	PROFESIONAL I	600080	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403465	6653822	ELIZABETH	DEL VALLE	RODRIGUEZ	RAMIREZ	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	EDRODRIGUEZ@MPPEE.GOB.VE	PROFESIONAL II	700117	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184403564	14203235	NATALY		CASTILLO	HERMOSO	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	NCASTILLO@MPPEE.GOB.VE	PROFESIONAL III	800104	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184404254	12220939	JONATHAN	ALEXANDER	ROMERO	MESA	EMPLEADO FIJO	AUDITORIA INTERNA	jaromero@mppee.gob.ve	PROFESIONAL III	800095	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184403710	18863956	PEDRO	MANUEL	QUIROZ	LOVERA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	pquiroz@mppee.gob.ve	PROFESIONAL I	600201	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184399705	11038941	ALEJANDRO 	JOSE	CASTILLO	HIDALGO	HONORARIOS PROFESIONALES	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	ALEJANDROCASTILLO@GMAIL.COM	HONORARIOS PROFESIONALES	2745	2	35	PROFESIONAL	53	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403427	7388774	EUCLIDES	RAFAEL	MORLES	VASQUEZ	ALTO NIVEL Y/O CONFIANZA	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	ermorles@mppee.gob.ve	COORDINADOR	2767	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184398513	15312012	ISEA		ESMIL		HONORARIOS PROFESIONALES	OFICINA DE GESTION ADMINISTRATIVA		APOYO PROFESIONAL	2703	1	35	PROFESIONAL	53	OFICINA DE GESTIÓN ADMINISTRATIVA
184404453	22382325	JENNER	AUGUSTO	JULCA	ORTEGA	PASANTE	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	JULCAJENNER@GMAIL.COM	PASANTE PROFESIONAL	119	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184403437	4169450	BETTY	YAJAIRA	BLANCO	DE BASTARDO	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	BBLANCO@MPPEE.GOB.VE	BACHILLER III	300004	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403416	6527677	EDGAR	ZAID	URBINA 	FERRER	EMPLEADO FIJO	DIRECCION DEL DESPACHO	eurbina@mppee.gob.ve	BACHILLER II	200003	1	93	ADMINISTRATIVO	12	DIRECCIÓN DEL DESPACHO
184397981	4637780	HELLA	OCTAVIA	MARTINEZ	SISO	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	HMARTINEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	1	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184405214	7778859	LUIS	FERNANDO 	UZCATEGUI	PEREDA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	LFUZCATEGUI@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	200	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184397595	2629191	EGGLIS	CIPRIANO	VILLARREAL	CARRASQUERO	CONTRATADO	AREA DE CORRESPONDENCIA Y ARCHIVO	EVILLARREAL@MPPEE.GOB.VE	APOYO PROFESIONAL	72	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184398571	6847132	MIRTHA	MARGARITA	ARTEAGA	PULIDO	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE PARTICIPACION POPULAR	MARTEAGA@MPPEE.GOB.VE	PROFESIONAL I	54	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184405800	17488341	ANYEL	JOHANNA	MONSALVE	MARQUINA	CONTRATADO	OFICINA DE RECURSOS HUMANOS	ANJOHAMM@HOTMAIL.COM	APOYO TECNICO	818	2	92	TECNICO	28	OFICINA DE RECURSOS HUMANOS
184403640	16554093	HECTOR	JOSE	ARAUJO 	LOPEZ	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	HARAUJO@MPPEE.GOB.VE	PROFESIONAL I	600208	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184393067	13031488	MARIELA	ANGELINA	HERNANDEZ	DE JIMENEZ	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	MHERNANDEZ@MPPEE.GOB.VE	BACHILLER I	100011	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403709	18714141	REYNALDO	JESUS	ROMERO	GONZALEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	rjromero@mppee.gob.ve	PROFESIONAL I	600194	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403528	13025272	EDUARDO	JOSE	ACURERO	RODRIGUEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	EACURERO@MPPEE.GOB.VE	PROFESIONAL I	600150	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405457	12265312	JUAN	CARLOS	CASTELLANOS	PACHECO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2791	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184402579	10489569	JESUS	DAVID	PARTIDA		CONTRATADO	DESPACHO DEL MINISTRO		APOYO PROFESIONAL	623	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184403707	18430471	FREDDY	XAVIER	CHAVEZ	SILVA	EMPLEADO FIJO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	FCHAVEZ@MPPEE.GOB.VE	PROFESIONAL I	600119	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184397991	6970313	ANA		MANEIRO	BRUMLIK	CONTRATADO	AREA DE COMUNICACION E INFORMACION	AMANEIRO@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	170	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184402572	12543214	LEIDA	YADIRA	PASTOR	RAMOS	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	lpastor@mppee.gob.ve	TECNICO I	119	2	92	TECNICO	22	OFICINA DE SEGURIDAD INTEGRAL
184400731	22019468	YNGRID	MARIA	RUIZ	PEÑALOZA	OBRERO FIJO	AREA DE COMPRAS	YRUIZ@MPPEE.GOB.VE	COCINERO	81	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405292	19759976	SONIA	DEL CARMEN	ESTEVEZ	GONZALEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	SESTEVEZ@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	278	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403719	19582338	SILEIDY	GABRIELA	PACHECO 	SEGOVIA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	spacheco@mppee.gob.ve	BACHILLER I	100016	1	93	ADMINISTRATIVO	12	OFICINA DE RECURSOS HUMANOS
184405834	3178496	CRISTINA	DE LA SOLEDAD	BELLO	SAHMKOW	PENSIONADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	CBELLO@MPPEE.GOB.VE	INCAPACITADO	2	1	102	PENSIONADOS	43	OFICINA DE RECURSOS HUMANOS
184403478	9099651	MILAGROS	ENRIQUETA 	FREITES	HENRIQUEZ	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	mfreites@mppee.gob.ve	PROFESIONAL II	700119	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184392444	15171081	PATRICIA	CAROLINA	GUTIERREZ	COVA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	PATRICIACGUTIERREZC@HOTMAIL.COM; PATRICIACGUTIERREZC@YAHOO.E	COORDINADOR	2222	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403423	14058150	HIGINIA	ADELAIDA	MALPICA	REAÑO	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	HMALPICA@MPPEE.GOB.VE	BACHILLER II	200016	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184405248	13528083	HIGINIO	JOSE	PANTE	BARCELO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	HPANTE200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	234	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404867	18858334	ANGEL	DANIEL	GOMES	CORRALES	CONTRATADO	CONSULTORIA JURIDICA	ANGELGOMESCORRALES@HOTMAIL.COM	APOYO PROFESIONAL	787	1	35	PROFESIONAL	28	CONSULTORÍA JURIDICA
184404512	9098270	PATRICIA	ELENA	OLLARVES	RUIZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA		AYUDANTE DE SERVICIOS GENERALES	166	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405200	6111839	GREGORIO	ANTONIO	HERNANDEZ	GONZALEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	GHERNANDEZ201@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	186	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405299	21718382	YULIMAR		ALVARADO		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	YALVARADO200@MPPEE.GOB.VE	ASEADOR	285	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184394734	10363849	CARMELIA	MARGARITA	FERNANDEZ	TOVAR	EMPLEADO FIJO	CONSULTORIA JURIDICA	CFERNANDEZ@MPPEE.GOB.VE	PROFESIONAL II	700020	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184405826	22900518	MARIA	GABRIELA	RONDON	ONTIVEROS	PASANTE	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES		PASANTE PROFESIONAL	175	2	35	PROFESIONAL	62	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405245	13143418	OSCAR	EDUARDO	PEREZ	PEREZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	OPEREZ207@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	231	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
3494	9956872	JOSE	IGNACIO	MUÑOZ	SOTO	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	JMUNOZ@MPPEE.GOB.VE	PROFESIONAL III	800038	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184400698	17305399	CARLOS 	ALBERTO	TERAN		OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	CTERAN@MPPEE.GOB.VE	VIGILANTE	65	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184401641	14486570	SALMA		KERBAGE	AZAR	CONTRATADO	CONSULTORIA JURIDICA	SALMAKERBAGEA@HOTMAIL.COM	APOYO PROFESIONAL	540	1	35	PROFESIONAL	28	CONSULTORÍA JURIDICA
184405124	19398081	ROSMAN	ALFREDO	TORRES	CASTRO	PASANTE	CENTRO NACIONAL DE DESPACHO	ROSMANTORRES@GMAIL.COM	PASANTE PROFESIONAL	138	2	35	PROFESIONAL	62	DESPACHO DEL MINISTRO
184403424	5527933	NORIS	HONORINA	AGUILERA	VILORIA	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	naguilera@mppee.gob.ve	BACHILLER II	200034	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184401923	16147708	MARIAN	CAROLINA	FERRER	AROCHA	CONTRATADO	DIRECCION DE ENERGIA ATOMICA	mferrer@mppee.gob.ve	APOYO TECNICO	584	2	92	TECNICO	28	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403464	6549637	MARIA	CAROLINA	PALACIOS	CASTRO	EMPLEADO FIJO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	MPALACIOS@MPPEE.GOB.VE	BACHILLER II	200017	1	93	ADMINISTRATIVO	12	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184399834	17704335	SELVA		DEL RIO	PEREIRA	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	sdelrio@mppee.gob.ve	APOYO ADMINISTRATIVO	400	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405270	16382267	DEIVIS	GREGORIO	TOVAR	SANCHEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	DTOVAR203@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	256	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400677	14036366	SIMON	ALEXANDER	CASTILLO	GONZALEZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	SCASTILLO@MPPEE.GOB.VE	ESCOLTA	44	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403748	19500295	ROSSANGEL	KATTE	HERNANDEZ	RUIZ	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	ROSSANGELHERNANDEZ13@HOTMAIL.COM	PROFESIONAL I	600033	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184404583	18020152	JOCELYN		O HARA	CASTRILLON	PASANTE	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA		PASANTE PROFESIONAL	126	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184400549	9883889	WILLIAMS	JOSE	ALVAREZ	BLANCO	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	JALVAREZ@MPPEE.GOB.VE	ASISTENTE	9910006	1	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184405720	20045954	NOIDI	COROMOTO	BARBOZA		OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO		ESCOLTA	56	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184405298	20799051	ENDER	OSCAR	BOLIVAR	INFANTE	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ENDERBOLIVAR1@HOTMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	284	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403674	17370206	RICHARD	ALEXANDER	ROMERO	PLATA	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	RROMERO@MPPEE.GOB.VE	PROFESIONAL I	600162	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184403815	8144810	MARCOS	ANTONIO	LÓPEZ	UZCATEGUI	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	MALOPEZ@MPPEE.GOB.VE	PROFESIONAL II	700059	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403930	14112115	JENIFER	JOHANNA	ROJAS	MARTINEZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	JROJAS@MPPEE.GOB.VE	PROFESIONAL II	700033	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184405006	9358810	YNES	BARBARA	PRIETO	FUENMAYOR	CONTRATADO	CENTRO NACIONAL DE DESPACHO	YPRIETO@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	798	1	93	ADMINISTRATIVO	28	DESPACHO DEL MINISTRO
184403562	14174747	JOEL	ENRIQUE	GOMEZ	BRITO	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JGOMEZ@MPPEE.GOB.VE	PROFESIONAL II	700045	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397938	5427913	RODOLFO		NAVARRO	DIAZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	RNAVARRO@MPPEE.GOB.VE	VICEMINISTRO	26	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184402338	13465458	ORANGEL	RAFAEL	SOLORZANO	JAVIER	OBRERO FIJO	AREA DE SERVICIOS GENERALES	osolorzano@mppee.gob.ve	MENSAJERO MOTORIZADO	129	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405564	18779678	ALEXANDER	RAFAEL	MENDOZA	PIÑERO	PASANTE	DIRECCION DEL DESPACHO	ALEXANDER.MENDOZA@GMAIL.COM	PASANTE PROFESIONAL	157	2	35	PROFESIONAL	62	DIRECCIÓN DEL DESPACHO
184403755	14032150	MARY	GABRIELA	FONSECA	CARTAYA	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	MFONSECA@MPPEE.GOB.VE	PROFESIONAL I	600071	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405231	10806536	HENRY	JOSE	ZAMBRANO		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	HJZAMBRANO@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	217	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404005	20067470	JESUS OMAR	ANTONIO	PADILLA	ROMERO	CONTRATADO	CENTRO NACIONAL DE DESPACHO	JESUS_PADILLA2007@HOTMAIL.COM	APOYO TECNICO	719	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184403567	14322444	ANGEL	LUIS	ROJAS	RINCONES	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	AROJAS@MPPEE.GOB.VE	PROFESIONAL I	600061	2	35	PROFESIONAL	12	OFICINA DE ATENCIÓN AL CIUDADANO
184402453	10390781	MANUEL 	JOSE	GUERRA		OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	MGUERRA@MPPEE.GOB.VE	VIGILANTE	144	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184402913	11042869	MIRIAN	MAGDALENA	DIAZ	RODRIGUEZ	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	MMDIAZ@MPPEE.GOB.VE	BACHILLER II	200009	1	93	ADMINISTRATIVO	12	OFICINA DE ATENCIÓN AL CIUDADANO
184397376	11763126	GUSTAVO	ADOLFO	HURTADO	GIMENEZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	GHURTADO@MPPEE.GOB.VE	PROFESIONAL II	2663	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184401833	16482965	RICHARD	MANUEL	YEPEZ	AGUILAR	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	564	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184399444	11638239	RITA	DEL CARMEN	OVALLES	BARRERA	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	RITAOVALLES@HOTMAIL.COM	APOYO PROFESIONAL	2738	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184400082	15587008	JULY	ZUHEY	ESPINOZA	GONZALEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	JESPINOZA@MPPEE.GOB.VE	PROFESIONAL II	74	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184398615	22017422	RUBY	CRISTINA	CAMARGO	GARZON	CONTRATADO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	RCAMARGO@MPPEE.GOB.VE	APOYO PROFESIONAL	245	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184402787	13847107	DENIS	RAQUEL	DELFIN 	MONROY	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2761	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184400546	7684588	DAVID	ALBERTO	MUÑOZ	BREA	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	DMUNOZ@MPPEE.GOB.VE	COORDINADOR	9920059	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184405892	19711926	JENNIFER	DEL CARMEN	VALDIVIESO	YUMISEBA	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION		PASANTE PROFESIONAL	176	2	35	PROFESIONAL	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405634	6961190	EDUARDO	JOSÉ	MEDINA	LAVADO	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL MINISTRO	MEDINALAVADO@GMAIL.COM	COORDINADOR	9950017	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL MINISTRO
184399287	13692408	YORMARY	FELICIA	LASTRA	SEPULVEDA	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	YORMARYLASTRA@HOTMAIL.COM	APOYO PROFESIONAL	2734	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184405632	4117929	TAILY AGUSTINA 	DEL PILAR	GALINDO	ÑAÑEZ	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	tgalindo@mppee.gob.ve	JUBILADO	10	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184405268	16263951	LEISMI	DANIEL	BELLO	MELO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	LBELLO201@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	254	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402917	10310188	YELITZA 	DEL VALLE	PACHECO		EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	yvpacheco@mppee.gob.ve	BACHILLER II	200027	1	93	ADMINISTRATIVO	12	OFICINA DE RECURSOS HUMANOS
184402972	12950109	NADEZHDA	PASTORA VICTORIA	PALENCIA	FERRER	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE GESTION ADMINISTRATIVA	NPALENCIA@MPPEE.GOB.VE	PROFESIONAL I	129	1	35	PROFESIONAL	22	OFICINA DE GESTIÓN ADMINISTRATIVA
184403572	14538485	ORLANDO	RAFAEL	MERGAREJO	SALINAS	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	omergarejo@mppee.gob.ve	PROFESIONAL I	600190	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184402998	9644372	CESAR	DAVID	LABRADOR	TOVAR	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	CLABRADOR@MPPEE.GOB.VE	DIRECTOR GENERAL	123	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SEGURIDAD INTEGRAL
184399286	17224280	ANYILIANA	COROMOTO	RODRIGUEZ	GOMEZ	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	2733	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184400710	6325327	LEICESTER		CEDEÑOS		OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	LCEDENO@MPPEE.GOB.VE	SUPERVISOR DE SEGURIDAD	13	4	111	OBRERO SUPERVISOR	13	OFICINA DE SEGURIDAD INTEGRAL
184403623	16130986	EDICSON	DANIEL	VELASQUEZ	CASANOVA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	EVELASQUEZ@MPPEE.GOB.VE	PROFESIONAL I	600142	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184406103	16105524	JULIO	CESAR	IZQUIERDO	RODRIGUEZ	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	SALA SITUACIONAL	JIZQUIERDO@MPPEE.GOB.VE	COORDINADOR	149	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DESPACHO DEL MINISTRO
184404131	20173840	YERELIN	SEYLIN	AGUIAR	RODRIGUEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	yaguiar@mppee.gob.ve	AYUDANTE DE SERVICIOS DE COCINA	164	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404139	4636835	ELIANA	ARLETTE	URBINA	MONSALVE	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	eaurbina@mppee.gob.ve	COORDINADOR	2771	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398128	6407339	MARIA	DEL ROSARIO	RODRIGUEZ	SOSA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE PARTICIPACION POPULAR	MRODRIGUEZ@MPPEE.GOB.VE	TECNICO II	36	2	92	TECNICO	22	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184399822	12971091	LENER	MANZUR	SAAVEDRA	BAUTISTA	OBRERO-LICENCIAS REMUNERADAS	OFICINA DE SEGURIDAD INTEGRAL	LSAAVEDRA@MPPEE.GOB.VE	ESCOLTA	4	4	24	OBRERO	93	OFICINA DE SEGURIDAD INTEGRAL
184396355	16876630	JESUS	RAFAEL	TORTOZA	CASAÑA	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	JRTORTOZA@MPPEE.GOB.VE	TECNICO II	500024	2	92	TECNICO	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184405256	14953496	INDIRA	CAROLINA	GONZALEZ	GONZALEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	IGONZALEZ201@MPPEE.GOB.VE	ASEADOR	242	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403474	7660878	ZULAY	JOSEFINA	PÉREZ	LOPEZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	ZPEREZ@MPPEE.GOB.VE	TECNICO I	400008	2	92	TECNICO	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184397463	10388476	MARIA	TERESA	CASTAÑO	DE VERA	EMPLEADO FIJO	DIRECCION DEL DESPACHO	MCASTANO@MPPEE.GOB.VE	PROFESIONAL I	600185	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184403723	20605113	RAFAEL 	ANDRES	FIGUEROA	BLANCO	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	rfigueroa@mppee.gob.ve	BACHILLER I	100015	1	93	ADMINISTRATIVO	12	OFICINA DE RECURSOS HUMANOS
184401648	8641827	MERCEDES	COROMOTO	GUTIERREZ	MUÑOZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL MINISTRO	MGUTIERREZM@MPPEE.GOB.VE	TECNICO II	111	2	92	TECNICO	22	DESPACHO DEL MINISTRO
184403414	6322629	YURY	COROMOTO	PACHECO		EMPLEADO FIJO	DIRECCION DEL DESPACHO	ypacheco@mppee.gob.ve	BACHILLER II	200002	1	93	ADMINISTRATIVO	12	DIRECCIÓN DEL DESPACHO
184397722	16285926	JOEL		GONZALEZ	GONZALEZ	EMPLEADO FIJO	AREA DE PLANIFICACION Y CONTROL DE PROYECTOS DE TECNOLOGIAS DE LA INFORMACION	JGONZALEZG@MPPEE.GOB.VE	COORDINADOR	2671	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404538	2980635	CARLOS	ARGENIS	MARTINEZ	VILLALTA	EGRESADOS	OFICINA DE RECURSOS HUMANOS		OFICIAL DE SEGURIDAD	26	4	24	OBRERO	141	OFICINA DE RECURSOS HUMANOS
184404567	5896710	RAUL	JOSE	LOPEZ	SILVIO	EGRESADOS	OFICINA DE RECURSOS HUMANOS		DIRECTOR DE LINEA	55	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184401269	14863583	FERNANDO	ENRIQUE	BRACHO 	FERRER	CONTRATADO	DIRECCION ESTADAL (ZULIA)	fbracho@mppee.gob.ve	APOYO ADMINISTRATIVO	497	1	93	ADMINISTRATIVO	28	DIRECCIONES ESTADALES
184402140	17642204	ALEJANDRO		FERNANDEZ	BELLORIN	PASANTE	DIRECCION GENERAL DE PARTICIPACION POPULAR		PASANTE TECNICO	75	2	92	TECNICO	62	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184405374	16685020	ANTONY 	JOSE	VALECILLOS	AGUIAR	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	AVALECILLOS@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	291	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184397724	10111892	ROSANGEL		ACEVEDO	DE ALVARADO	EMPLEADO FIJO	AREA DE COMPRAS	RACEVEDO@MPPEE.GOB.VE	COORDINADOR	2673	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403509	11900146	JOSE	RAMON	ECHENAGUCIA	GUTIERREZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	jechenagucia@mppee.gob.ve	TECNICO I	400019	2	92	TECNICO	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184404532	13099400	ILLICH	CANDELARIO	VIELMA	DIAZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	IVIELMA@MPPEE.GOB.VE	PROFESIONAL III	20	2	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184405373	14756849	LEONARDO	JOSE	CASTRO	LUCENA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	LCASTRO@MPPEE.GOB.VE	CHOFER	290	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184402859	13123569	WILMER	JOSE	CARAO	FERNANDEZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	WCARAO@MPPEE.GOB.VE	PROFESIONAL II	700012	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184404261	15782579	MARLON	RAUL	GARCIA	CASTILLO	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	mrgarcia@mppee.gob.ve	APOYO PROFESIONAL	733	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184402850	12234862	NELSON	JAVIER	JAIMES	URBINA	CONTRATADO	OFICINA DE RECURSOS HUMANOS		CHOFER	662	4	24	OBRERO	28	OFICINA DE RECURSOS HUMANOS
184402276	5113406	OSCAR	RAFAEL	LEHMANN	RAMIREZ	OBRERO FIJO	AREA DE SERVICIOS GENERALES	OLEHMANN@MPPEE.GOB.VE	CHOFER	117	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400024	19672337	ANGGY	CRISTIBEL	VALERA	PEREZ	PASANTE	OFICINA DE RECURSOS HUMANOS		PASANTE TECNICO	40	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184401901	8444751	PEDRO	JOSE	PATIÑO	DIAZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS		APOYO PROFESIONAL	572	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184404864	20801753	RODRIGO		YAÑEZ	PILGRIM	CONTRATADO	DESPACHO DEL MINISTRO	ROYANEZP@GAMIL.COM	APOYO PROFESIONAL	786	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184405968	17402278	DAVID	ALEJANDRO	MEJIAS	PINO	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	dmejias@mppee.gob.ve	PROFESIONAL I	171	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184398604	19163347	FRANCISCO	HUMBERTO	GONZALEZ	SANCHEZ	PASANTE	AREA DE DESARROLLO		PASANTE TECNICO	4	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184397557	5681139	MARBELIA	ESMERALDA	VIVAS		EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	MVIVAS@MPPEE.GOB.VE	BACHILLER II	200019	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184397956	11678675	YATMERY	MERLY	MONTILLA 	LOPEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	YMONTILLA@MPPEE.GOB.VE	DIRECTOR GENERAL	29	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184402333	10523069	MAGALY	COROMOTO	ITRIAGO	COVA	OBRERO FIJO	AREA DE SERVICIOS GENERALES	MITRIAGO@MPPEE.GOB.VE	ASEADOR	124	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398572	6498678	JESUS	EDUARDO	VILLARROEL	GONZÁLEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL MINISTRO	IVILLARROEL@MPEE@LAEDC.VE   /   JESUSVILL56@HOTMAIL.COM	COORDINADOR	55	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DESPACHO DEL MINISTRO
184406090	11569136	DENIS	ELENA	BENITEZ	DE RAMIREZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS		APOYO ADMINISTRATIVO	833	1	93	ADMINISTRATIVO	28	OFICINA DE RECURSOS HUMANOS
184397590	15021211	MIGUEL	ANGEL	BERNAT	RODRIGUEZ	CONTRATADO	AREA DE COMPRAS	MBERNAT@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	67	1	93	ADMINISTRATIVO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184403576	14743854	ERICA	ELIZABETH	BARRIOS	MENDOZA	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	EBARRIOS@MPPEE.GOB.VE	TECNICO I	400023	2	92	TECNICO	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397743	7223360	ANA	ISABEL	COLMENARES	CASTELLANOS	CONTRATADO	AREA DE COMPRAS	ACOLMENARES@MPPEE.GOB.VE	APOYO PROFESIONAL	103	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184403499	11203240	WILFREDO	JOSE	CASTILLO	RIOS	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	WCASTILLO@MPPEE.GOB.VE	BACHILLER I	100023	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405001	18830801	CARLOS 	STALIN	SARITAMA	ATOPO	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	CSARITAMA@HOTMAIL.COM  /  CSARITAMA1989@GMAIL.COM	APOYO PROFESIONAL	793	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397979	6427821	CARMEN	ELOINA	DIAZ	GARCIA	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CEDIAZ@MPPEE.GOB.VE	DIRECTOR	2694	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403426	13531880	MARIBEL 	MARBELY	MORENO	ARENAS	ALTO NIVEL Y/O CONFIANZA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	MMORENO@MPPEE.GOB.VE	DIRECTOR	2766	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184397664	12068943	ANA	ALEJANDRINA	LAZO	BORGES 	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	ALAZO@MPPEE.GOB.VE	APOYO TECNICO	90	2	92	TECNICO	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184390682	15182958	LUIS	MANUEL	REYES	CASTRO	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	LREYES@MPPEE.GOB.VE	PROFESIONAL I	600114	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184400591	17220879	CARMEN	YORELIS	RICO	FLORES	PASANTE	OFICINA DE GESTION ADMINISTRATIVA		PASANTE PROFESIONAL	51	2	35	PROFESIONAL	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184404535	1617698	RODOLFO	ENRIQUE	GALVIS	RUIZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	RGALVIS@MPPEE.GOB.VE	APOYO PROFESIONAL 	23	1	93	ADMINISTRATIVO	141	OFICINA DE RECURSOS HUMANOS
184398888	13946675	MANUEL	ARTURO	AGUACHE 	PAREDES	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	MAGUACHE@MPPEE.GOB.VE	APOYO TECNICO	285	2	92	TECNICO	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
3350	12640527	ISMALDO	JOSE	ZERPA	MARQUEZ	EMPLEADO FIJO	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	IZERPA@MPPEE.GOB.VE	PROFESIONAL II	700061	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184397738	14696252	ANA	LUCIA	REYES		CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	AREYES@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	98	1	93	ADMINISTRATIVO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184401902	84487566	LIKZA	DESIREE	SOSA	HERNANDEZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS	LITZA_SOSA@YAHOO.COM	APOYO PROFESIONAL	573	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184398885	18059864	CARMIN	VANESSA	GOMEZ	GARCIA	CONTRATADO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	CGOMEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	282	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184404120	18403203	MANUEL	ALEJANDRO	AGUILAR 	ACOSTA	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	KBALEJANDRO23@HOTMAIL.COM	PASANTE PROFESIONAL	110	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400702	4352367	ROMULO	JOSE	GEDLER	REDONDO	OBRERO FIJO	AREA DE COMPRAS	RGEDLER@MPPEE.GOB.VE	CHOFER	5	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184397908	8774056	BETSY	MARIA	CHIRINOS	PEREZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	BCHIRINOS@MPPEE.GOB.VE	PROFESIONAL II	700034	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184400701	4212260	OMAR 	ENRIQUE 	VARELA	OSORIO	OBRERO FIJO	AREA DE COMPRAS	OVARELA@MPPEE.GOB.VE	MESONERO	4	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400686	15118756	ROCKY	MACKEY	MALPICA	REAÑO	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	RMALPICA@MPPEE.GOB.VE	VIGILANTE	53	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184405375	20356435	ALEXIS	JAVIER	ALFONZO	RODRÍGUEZ	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	JAVIER_ALFONZO@HOTMAIL.COM	PASANTE PROFESIONAL	143	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184400541	5230259	ORLANDO	JOSE	MELO	URQUIOLA	ALTO NIVEL Y/O CONFIANZA	ÁREA DE REGISTRO Y CONTROL	OMELO@MPPEE.GOB.VE	DIRECTOR	2706	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184390627	13777587	HAROLD	RAMON	DELMORAL		EMPLEADO FIJO	DESPACHO DEL MINISTRO	HDELMORAL@MPPEE.GOB.VE	PROFESIONAL III	800002	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
3803	11486609	LETICIA	 	ORTEGA	OROPEZA	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	LORTEGA@MPPEE.GOB.VE	PROFESIONAL III	800082	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184398052	5598285	LIS	MARIA DE LAS NIEVES	SALAMIA	DE FEBLES	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	LSALAMIA@MPPEE.GOB.VE	APOYO PROFESIONAL	5	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184402262	11209270	FRANKLIN	ALEXANDER	CAPRIATA	ZAPATA	CONTRATADO	DIRECCION DEL DESPACHO	CAPRIATAS1@HOTMAIL.COM	CHOFER	615	4	24	OBRERO	28	DIRECCIÓN DEL DESPACHO
184405464	13261270	JUAN	FRANCISCO	SEGOVIA	ALVARADO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2798	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184392102	14588363	ILEANA	MORELBA	RIVAS	QUINTERO	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	IRIVAS@MPPEE.GOB.VE	PROFESIONAL I	600113	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184401831	5721675	MARIA	DE JESUS	GUILLEN	SAAVEDRA	CONTRATADO	DIRECCION ESTADAL (ZULIA)	MGUILLEN@MPPEE.GOB.VE	APOYO PROFESIONAL	562	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184403933	17224280	ANYILIANA	COROMOTO	RODRIGUEZ	GOMEZ	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO		APOYO TECNICO	701	2	92	TECNICO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184402143	18914932	ALEJANDRO	JOSE	ARAQUE	MARCANO	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA		PASANTE PROFESIONAL	78	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184406033	13069919	JOHNNY	ALBERTO	RINALDI	BARRIOS	ALTO NIVEL Y/O CONFIANZA	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS		COORDINADOR	9950037	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184403402	14743189	MEYLING		ROJAS	MENDOZA	ALTO NIVEL Y/O CONFIANZA	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	MROJASM@MPPEE.GOB.VE	DIRECTOR	2765	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184405503	6843416	LUCIANO		DÍAZ	DOMINGUEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE RECURSOS HUMANOS	LUCIANODIAZ2912@HOTMAIL.COM	BACHILLER I	160	1	93	ADMINISTRATIVO	22	OFICINA DE RECURSOS HUMANOS
184405255	14758302	OSMAR	JOSUE	CAMPOS	PACHECO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	OCAMPOS@MPPEE.GOB.VE	CHOFER	241	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405186	4299581	LUISA	JOSEFINA	GONZALEZ	DE SOSA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	LGONZALEZ213@MPPEE.GOB.VE	ASEADOR	172	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400835	15587381	NOLAN	ENRIQUE	MANZO	GOMEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	NMANZO@MPPEE.GOB.VE	MENSAJERO	91	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404847	16970030	LIVIA	ELENA	GAVIDIA	FERRER	CONTRATADO	CENTRO NACIONAL DE DESPACHO		APOYO ADMINISTRATIVO	780	1	93	ADMINISTRATIVO	28	DESPACHO DEL MINISTRO
184400722	19194146	ANDRES	LEONARDO	PARRA	CONTRERAS	OBRERO FIJO	AREA DE COMPRAS	APARRA@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	72	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184402663	19378034	ARIANA	CAROLINA	GONZALEZ	ERMINY	PASANTE	AREA DE ASUNTOS INTERNACIONALES		PASANTE PROFESIONAL	87	2	35	PROFESIONAL	62	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184397441	11491566	MARIO	ENRIQUE	SANCHEZ		COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL MINISTRO	MESANCHEZ@MPPEE.GOB.VE	ESCOLTA	1	4	24	OBRERO	22	DESPACHO DEL MINISTRO
184405377	15891221	NINOSKA 	DEL CARMEN 	ROSALES	PEÑA	PASANTE	OFICINA DE SEGURIDAD INTEGRAL	NINODELC_1981@HOTMAIL.COM	PASANTE TECNICO	145	2	92	TECNICO	62	OFICINA DE SEGURIDAD INTEGRAL
184405505	3797884	EDYS	ORLANDA	PERNIA	GUERRERO	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	epernia@mppee.gob.ve	JUBILADO	9	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184405064	17753543	LUIS 	RAFAEL	CALDERON	PAREJO	CONTRATADO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	LUISRCALDERON@GMAIL.COM	APOYO PROFESIONAL	806	1	35	PROFESIONAL	28	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184403679	17425567	LEONARDO	RUBEN	CARRILLO	MARTINEZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	LCARRILLO@MPPEE.GOB.VE	TECNICO II	500013	2	92	TECNICO	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403596	15390363	ROBINSON	ANTONIO	BAEZ	SAAVEDRA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	rbaez@mppee.gob.ve	PROFESIONAL I	600203	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184401997	11109727	AMIN	DUBRASKA	GONZALEZ	SANCHEZ	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	AMINGONZALEZ21@GMAIL.COM	DIRECTOR DE LINEA	83	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA DE SEGURIDAD INTEGRAL
184401183	12111546	LETICIA	YAMILET	RAMIREZ	MARTINEZ	CONTRATADO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	lyramirez@mppee.gob.ve	APOYO TECNICO	485	2	92	TECNICO	28	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184405293	20040573	RAFAEL	ANTONIO	SALAZAR	RUZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RSALAZAR202@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	279	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184397767	13072748	SIMAR	JOSE	ORTIZ	GALENO	CONTRATADO	AREA DE INFRAESTRUCTURA	SORTIZ@MPPEE.GOB.VE	APOYO PROFESIONAL	120	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405482	17472297	HECTOR 	ROBERTO	CASTILLO	PEREZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2816	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404006	12911583	CARLOS 	MIGUEL	ZARATE	LARA	CONTRATADO	CENTRO NACIONAL DE DESPACHO		APOYO TECNICO	720	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184405437	6967994	VICTOR	LUIS	MONCADA	AVILEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2771	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184398435	12727209	NATHAN	DAVID	QUIARO	VARGAS	CONTRATADO	DIRECCION GENERAL DE PARTICIPACION POPULAR	NQUIARO@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	214	1	93	ADMINISTRATIVO	28	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184402657	17160486	JIMY	JAVIER	ALONSO 	MANRIQUE	OBRERO FIJO	AREA DE SERVICIOS GENERALES	jjalonso@mppee.gob.ve	MESONERO	158	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184390681	12909192	JAIRO	RAFAEL	SESSA	PEREZ	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	JSESSA@MPPEE.GOB.VE	PROFESIONAL II	700080	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403694	17931370	MARIA	GABRIELA	CASTILLO	VIVAS	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	MGCASTILLO@MPPEE.GOB.VE	PROFESIONAL I	600145	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403689	17718940	WILMER	JOSE	NOEL	VENECIA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	WNOEL@MPPEE.GOB.VE	TECNICO I	400013	2	92	TECNICO	12	OFICINA DE RECURSOS HUMANOS
184400145	4796112	JUAN	FRANCISCO	ROMERO 	FIGUEROA	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL		DIRECTOR GENERAL	76	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE SEGURIDAD INTEGRAL
184403650	16778286	OSCAR	ENRIQUE	BLANCO	ORTIZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	oeblanco@mppee.gob.ve	PROFESIONAL I	600156	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397450	5312799	ARIANIZ		VILLASMIL		COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE RECURSOS HUMANOS		ASISTENTE	10	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE RECURSOS HUMANOS
184405068	17523630	JOHANNA	ALEJANDRA	VERGARA	PERNIA	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	JOHANNAV.P19@HOTMAIL.COM	PASANTE PROFESIONAL	135	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405226	10383177	RAFAEL 	ANTONIO	GONZÁLEZ 	CUELLO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ragonzalez@mppee.gob.ve	CHOFER	212	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405897	14709530	CARLOS	EDUARDO	PACHECO	SUAREZ	PASANTE	DIRECCION GENERAL DE PARTICIPACION POPULAR		PASANTE PROFESIONAL	181	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184398862	18708279	EDUARDO	ENRIQUE	HERNANDEZ	HERNANDEZ	PASANTE	AREA DE DESARROLLO	EHERNANDEZ@MPPEE.GOB.VE	PASANTE PROFESIONAL	10	2	35	PROFESIONAL	62	OFICINA DE RECURSOS HUMANOS
184404067	17710298	JUAN	CARLOS	GARCÍA	VILLEGAS	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	JUANGARCIA_64@HOTMAIL.COM	PASANTE PROFESIONAL	107	2	35	PROFESIONAL	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184403671	17352469	AMALBERIS	DEL CARMEN	LOPEZ	GARCIA	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	ALOPEZ@MPPEE.GOB.VE	PROFESIONAL I	600220	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184398871	6910129	JOSE	RAMON	ALTUNA	GARCIA	CONTRATADO	OFICINA DE RECURSOS HUMANOS	JALTUNA@MPPEE.GOB.VE	APOYO PROFESIONAL	275	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184403697	18010899	CRUZ	DANIEL	CUAURO	PONCE	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	CCUAURO@MPPEE.GOB.VE	BACHILLER II	200011	1	93	ADMINISTRATIVO	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405486	5682330	EDDIE	FREEDMAN	GONZALEZ	ZAMBRANO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2767	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403062	6972257	CARLOS	EDUARDO	ALVAREZ	OLBES	CONTRATADO	OFICINA DE RECURSOS HUMANOS		APOYO CULTURAL	670	1	93	ADMINISTRATIVO	28	OFICINA DE RECURSOS HUMANOS
184402002	14745080	JOSE 	GREGORIO	DE SOUSA	COSTA	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	JDESOUSA@MPPEE.GOB.VE	COORDINADOR	64	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184402003	27053085	NIEVES 	MARGARITA	PEREZ	DOMINGUES	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA		ASISTENTE	71	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184404673	3012544	VICENTA		RODRIGUEZ	PIÑANGO	OBRERO-CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	VRODRIGUEZ203@MPPEE.GOB.VE	OPERARIO(A) DE LIMPIEZA Y MANTENIMIENTO	437	4	24	OBRERO	92	OFICINA DE GESTIÓN ADMINISTRATIVA
184397462	6115728	JUAN	LUIS	HERNANDEZ	RODRIGUEZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JHERNANDEZ@MPPEE.GOB.VE	PROFESIONAL III	800031	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403676	17400516	DONALD	JOSE	NEIRA 	SUAREZ	EMPLEADO FIJO	DESPACHO DEL MINISTRO	dneira@mppee.gob.ve	PROFESIONAL I	600187	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184403074	12323044	HAROLD		AGUIN		EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	HAGUIN@MPPEE.GOB.VE	PROFESIONAL III	800006	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184405749	18238540	NILBETH	CAROLINA	CABRERA	MAIA	CONTRATADO	DESPACHO DEL MINISTRO		APOYO PROFESIONAL	817	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184400565	13969031	DAYANA 	CAROLINA	SOSA	CEDEÑO	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	DSOSA@MPPEE.GOB.VE	COORDINADOR	9920058	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184405125	22386651	DANIEL	SAMUEL	BENCOMO	MARTINEZ	PASANTE	OFICINA DE ASUNTOS INTERNACIONALES	D.BENCOMO@GMAIL.COM	PASANTE TECNICO	139	2	92	TECNICO	62	DESPACHO DEL MINISTRO
184398732	17652145	MAOLY	ALYANDRIS	MORALES	PADRINO	CONTRATADO	AREA DE SEGUIMIENTO DE GESTION	MOLLYMORALES@HOTMAIL.COM	APOYO PROFESIONAL	262	1	35	PROFESIONAL	28	DIRECCIÓN DEL DESPACHO
184400694	15872997	PEDRO	ALFONSO	MONTAÑA	SANCHEZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	PMONTANA@MPPEE.GOB.VE	VIGILANTE	61	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184405465	13357910	MICHAEL	ARGENIS	MONTOYA	MATUTE	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2799	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184402721	17963386	JUAN	ALBERTO	RODRIGUEZ	TERAN	CONTRATADO	CENTRO NACIONAL DE DESPACHO	JARODRIGUEZ@MPPEE.GOB.VE	APOYO PROFESIONAL	647	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184400653	9486607	JOSE	ANTONIO	CAMEJO	SIFONTE	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JCAMEJO@MPPEE.GOB.VE	VIGILANTE	20	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184404545	16663312	FRANCIS	DEL CARMEN	SANTIAGO	CERMEÑO	EGRESADOS	OFICINA DE RECURSOS HUMANOS	SANTIAGOCFC@GMAIL.COM	APOYO PROFESIONAL 	33	1	93	ADMINISTRATIVO	141	OFICINA DE RECURSOS HUMANOS
184402911	14935496	DOUGLAS	JESUS	DUNO	MORA	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	dduno@mppee.gob.ve	BACHILLER III	300003	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405504	4171597	ELIZABETH		MARQUEZ	CASTAÑEDA	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	emarquez@mppee.gob.ve	JUBILADO	8	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184405449	9726603	DOUGLAS		GONZALEZ	HUERTA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2783	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403870	12950109	NADEZHDA	PASTORA VICTORIA	PALENCIA	FERRER	EMPLEADO FIJO	DIRECCION DEL DESPACHO	NPALENCIA@MPPEE.GOB.VE	PROFESIONAL II	800143	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184403215	19023580	AIDELIS	CAROLINA	CALVO	LOPEZ	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	AIDELISCALVO@YAHOO.COM	PASANTE PROFESIONAL	102	2	35	PROFESIONAL	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184398449	5782360	DILCIA	MARIA	LEAL	DE PEÑA	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO		APOYO PROFESIONAL	227	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184406035	17555035	ROMINA	CAROLINA	MARTINEZ	HERNANDEZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS	ROMINACAROLINA2006@HOTMAIL.COM	APOYO PROFESIONAL	828	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184401256	11669545	THAYS	DEL VALLE	ZARRAGA		PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL	THAYS973@HOTAMIL.COM	HONORARIO PROFESIONAL	2758	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404848	18235136	CESAR JOSE	ANTONIO	YNCREDULO	MORA	CONTRATADO	CONSULTORIA JURIDICA	CESARYNCREDULO@HOTMAIL.COM	APOYO PROFESIONAL	781	1	35	PROFESIONAL	28	CONSULTORÍA JURIDICA
184402659	6078415	CASTOR	MANUEL	PINTO	GONZALEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	CASTROPINTO@HOTMAIL.COM	PROFESIONAL III	125	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404528	7413213	YELITZA	JOSEFINA	MANFREY		EGRESADOS	OFICINA DE RECURSOS HUMANOS	YMANFREY@MPPEE.GOB.VE	COORDINADOR	16	0	39	COORDINADOR	141	OFICINA DE RECURSOS HUMANOS
184402070	5146370	ARGENIS	JOSE	FRANQUIZ	BRICEÑO	CONTRATADO	OFICINA DE RECURSOS HUMANOS	AFRANQUIZ@MPPEE.GOB.VE	APOYO CULTURAL	595	1	93	ADMINISTRATIVO	28	OFICINA DE RECURSOS HUMANOS
184403811	14260574	DAVID	ENRIQUE	DIAZ	GUERRA	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	dediaz@mppee.gob.ve	PROFESIONAL I	600054	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184400200	15517734	DIEGO 	LUIS	MEYENDORFF	ALARCON	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	MEYENDORFFDIEGO@GMAIL.COM	PROFESIONAL I	80	1	35	PROFESIONAL	22	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184402149	8278911	ADEL	RAQUEL	SANTAELLA	MUÑOZ	CONTRATADO	DIRECCION DEL DESPACHO	ASANTAELLA@MPPEE.GOB.VE	APOYO TECNICO	607	2	92	TECNICO	28	DIRECCIÓN DEL DESPACHO
184400535	4170020	HELCIAS	MOISES	BENAIM	CASADO	ALTO NIVEL Y/O CONFIANZA	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	HBENAIM@MPPEE.GOB.VE	DIRECTOR	2667	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184403513	12067053	EDUARDO	ELIAS	GALINDO	VENTURA	EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	EEGALINDO@MPPEE.GOB.VE / GALINDO0574@HOTMAIL.COM	PROFESIONAL I	600133	2	35	PROFESIONAL	12	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184401701	5425523	JOSE 	ALBERTO	DELGADO		CONTRATADO	DESPACHO DEL MINISTRO	jadelgado@mppee.gob.ve	APOYO PROFESIONAL	548	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184399891	10428155	EDUARDO	FELIPE	RODRIGUEZ	PAEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	ERODRIGUEZ@MPPEE.GOB.VE	PROFESIONAL III	69	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184403643	16563224	NAHIR	ANDREINA	CANELON	GARCIA	EMPLEADO FIJO	CONSULTORIA JURIDICA	NCANELON@MPPEE.GOB.VE	PROFESIONAL II	700022	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184400966	3767414	RODULFO		RUIZ	PEREZ	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	rruiz@mppee.gob.ve	APOYO PROFESIONAL	465	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184405182	2988418	PEDRO		COLINA		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	PCOLINA@MPPEE.GOB.VE	VIGILANTE	168	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403559	14096849	LUIS 	ALBERTO	SISO	MARTINEZ	EMPLEADO FIJO	AUDITORIA INTERNA	LSISO@MPPEE.GOB.VE	PROFESIONAL II	700018	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184405189	4810221	RAMON	JOSE	LUGO	CISNERO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RLUGO200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	175	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184404571	9616770	ANDREA 		JIMENEZ	GUERRA	EGRESADOS	OFICINA DE RECURSOS HUMANOS	AJIMENEZ@MPPEE.GOB.VE	DIRECTOR	59	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184400724	19391519	FREJERMAN	STID	CASTILLO	ACOSTA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	FCASTILLO@MPPEE.GOB.VE	VIGILANTE	74	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403949	12398124	OSCAR	JOSE	TOVAR	PACHECO	CONTRATADO	CENTRO NACIONAL DE DESPACHO	OSCAR-TOVAR@HOTMAIL.COM	APOYO TECNICO	713	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184404573	10353172	VIVIAN		ALVARADO		EGRESADOS	OFICINA DE RECURSOS HUMANOS	VALVARADO@MPPEE.GOB.VE	DIRECTOR	61	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184404392	16368259	GIOVANNI	ARLEY	ARIAS	DIAZ	CONTRATADO	CENTRO NACIONAL DE DESPACHO	G.ARIAS16368259@YAHOO.COM	APOYO PROFESIONAL	750	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184404865	13533556	CARLOS	GUIDO	VELAZQUEZ	TOVAR	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	CARGUIDOV@GMAIL.COM / VELAZQUEZCARLOS31@YAHOO.COM	PROFESIONAL I	800153	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403734	16429260	JOHAN	ALEXIS	OCHOA	ALVARADO	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	JAOCHOA@MPPEE.GOB.VE	TECNICO I	400034	2	92	TECNICO	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184403638	16535689	KATHERINE	MERCED	CARRASQUERO	QUINTERO	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	KCARRASQUERO@MPPEE.GOB.VE	PROFESIONAL II	700070	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184403420	5118981	LIBIA	ROSA	CARRILLO	BRITO	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	lrcarrillo@mppee.gob.ve	BACHILLER II	200025	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404191	13210330	EFRELENIN		TORTOZA	PINEDA	OBRERO-LICENCIAS REMUNERADAS	OFICINA DE SEGURIDAD INTEGRAL		ESCOLTA	48	4	24	OBRERO	93	OFICINA DE SEGURIDAD INTEGRAL
184403819	8870228	FRANCISCO	ALBERTO	LIMARDO	ECHEVARRENETA	EMPLEADO FIJO	DIRECCION DEL DESPACHO	flimardo@mppee.gob.ve	BACHILLER II	200030	1	93	ADMINISTRATIVO	12	DIRECCIÓN DEL DESPACHO
184403600	15430503	JANIA	DEL VALLE	CARRASQUERO	GRATEROL	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	jcarrasquero@mppee.gob.ve	PROFESIONAL I	600204	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405259	15374621	JUNIOR	ENCARNACION	ESPINOZA	PACHECO	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JUNIOESPINOZA2@HOTMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	245	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403642	16562265	FREDDI	ALBERTO	VARGAS	MEDINA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	fvargas@mppee.gob.ve	PROFESIONAL I	600148	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404612	11564411	FRANCIS	ROSALIA	LANDAETA	CEDEÑO	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	FRANCIS_LANDAETA@HOTMAIL.COM	APOYO TECNICO	764	2	92	TECNICO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184404004	16883775	ELZO	HERMES	MENDEZ		CONTRATADO	CENTRO NACIONAL DE DESPACHO	SUPER_ZEROX@HOTMAIL.COM	APOYO TECNICO	718	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184404574	10729544	JUAN	CARLOS	CUBEROS	MONTES	EGRESADOS	OFICINA DE RECURSOS HUMANOS	JCUBEROS@MPPEE.GOB.VE	COORDINADOR	62	0	39	COORDINADOR	141	OFICINA DE RECURSOS HUMANOS
184399696	15071399	MARIA	GABRIELA	MENDOZA	ISTURIZ	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	MENDOZAMARIAGABRIELA@GMAIL.COM	APOYO PROFESIONAL	392	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403653	16886084	CARLOS	JOSE	PEREZ	NIETO	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	CPEREZ@MPPEE.GOB.VE	PROFESIONAL I	600143	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397559	6368417	JACQUELINE	MERCEDES	ZAMBRANO	DE VARGAS	EMPLEADO FIJO	DIRECCION DEL DESPACHO	JZAMBRANO@MPPEE.GOB.VE	BACHILLER I	100028	1	93	ADMINISTRATIVO	12	DIRECCIÓN DEL DESPACHO
184398854	13284338	ROBERTO	NICOLAS	GAGO	GONZALEZ	CONTRATADO	AREA DE COMUNICACION E INFORMACION	RGAGO@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	271	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403628	16251136	MARIA	EUGENIA	YANEZ	CARREÑO	EMPLEADO FIJO	DESPACHO DEL MINISTRO	MARIAEUGENIAYANEZ@YAHOO.ES	PROFESIONAL I	600186	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184402916	9094593	LUCIO	ANTONIO	D ARCANGELO	SENECHIA	EMPLEADO FIJO	AUDITORIA INTERNA	LDARCANGELO@MPPEE.GOB.VE	TECNICO II	500008	2	92	TECNICO	12	AUDITORÍA INTERNA
184401105	4084540	BETTY	RAMONA	MARTINEZ	DIAZ	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL MINISTRO	bmartinez@mppee.gob.ve	COORDINADOR	9920078	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL MINISTRO
184405480	17155102	JOSE	FRANCISCO	MAGDALENO	CARRASQUEL	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2814	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184398363	10376795	YSABEL	MARIA	DELGADO	DONIS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	YMDELGADO@MPPEE.GOB.VE	PROFESIONAL I	44	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184404863	13232694	JULIO	CESAR	MORA	DONALLEZ	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	MORAJULIOCESAR2008@HOTMAIL.COM	APOYO ADMINISTRATIVO	785	1	93	ADMINISTRATIVO	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184391591	11164171	ADRIANA	JOSEFINA	GARCIA	GONZALEZ	EMPLEADO FIJO	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL	AGARCIA@MPPEE.GOB.VE	BACHILLER II	200018	1	93	ADMINISTRATIVO	12	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184400655	10186103	DINORA	ISABEL	ASUAJE	DANIS	OBRERO FIJO	AREA DE COMPRAS	DASUAJE@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	22	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399815	16264777	JACKSON	JOSE	SEGOVIA	COLMERARES	OBRERO-CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	JSEGOVIA@MPPEE.GOB.VE	OFICIAL DE SEGURIDAD	146	4	24	OBRERO	92	OFICINA DE SEGURIDAD INTEGRAL
184405273	16805456	ALEXIS		ROJO	RIVEROS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	AROJO200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	259	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399562	7922552	GILDA	ZULAY	ANGULO	JIMENEZ	CONTRATADO	AREA DE COMPRAS	gangulo@mppee.gob.ve	APOYO PROFESIONAL	366	1	35	PROFESIONAL	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184403518	12300281	RUSBERT	ALEXANDER	ENCINOZA		EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	RENCINOZA@MPPEE.GOB.VE	PROFESIONAL II	700054	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184402576	5313075	ESPERANZA	DEL VALLE	COLON	CONTRERAS	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	ESPERANZACOLON@GMAIL.COM	PROFESIONAL III	123	1	35	PROFESIONAL	22	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184400667	12782171	NESTOR	ABRAHAM	PIMENTEL	ORTEGANO	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	NPIMENTEL@MPPEE.GOB.VE	SUPERVISOR DE SEGURIDAD	34	4	111	OBRERO SUPERVISOR	13	OFICINA DE SEGURIDAD INTEGRAL
184402142	15040587	MARYORYNNY	MARINA	CARTAYA	PEREZ	PASANTE	DIRECCION GENERAL DE PARTICIPACION POPULAR	MARYORYNNYLAULTIMAHEROE@HOTMAIL.COM	PASANTE TECNICO	77	2	92	TECNICO	62	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184401704	4687460	TERESA	DEL CARMEN	ALFONZO	DE SANZ	CONTRATADO	OFICINA DE RECURSOS HUMANOS	talfonso@mppee.gob.ve	APOYO PROFESIONAL	551	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184403411	16598989	RICARDO 	JAVIER	PICADO	DORANTE	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	RPICADO@MPPEE.GOB.VE	BACHILLER I	100024	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184397963	3432687	CARLOS	LUIS	FLORES	PADRON	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	CFLORES@MPPEE.GOB.VE	APOYO TECNICO	161	2	92	TECNICO	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184401113	9656558	RALID		CASTILLO 	GAZCON 	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RCASTILLO@MPPEE.GOB.VE	PROFESIONAL II	700043	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184405430	17693733	JHONY	ALBERTO	GRILLET	MEDINA	PASANTE	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA		PASANTE PROFESIONAL	148	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184404830	15508119	ZAIRA	ZOBEIDA	DIAZ	VOLCAN	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	DIAZ_ZAIRA1207@HOTMAIL.COM	APOYO PROFESIONAL	773	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184405448	9688557	RONALD	RENE	PAZ	GONZALEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2782	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403749	17474486	LILIAN	ROSANGELA	MOSQUERA	OLIVEROS	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	lmosquera@mppee.gob.ve	PROFESIONAL I	600035	2	35	PROFESIONAL	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184398861	12543935	DANNIS	THADEO	LOPEZ	TORRES	PASANTE	OFICINA DE RECURSOS HUMANOS		PASANTE PROFESIONAL	9	2	35	PROFESIONAL	62	OFICINA DE RECURSOS HUMANOS
184403695	17964859	LUCY	MARIBETH	RAMIREZ	ZAMBRANO	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	LRAMIREZ@MPPEE.GOB.VE	PROFESIONAL I	600196	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403486	9998673	JOSE 	LUIS	JIMENEZ	TORTOZA	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	JJIMENEZ@MPPEE.GOB.VE	TECNICO II	500027	2	92	TECNICO	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398792	12100499	BALMIRO	ANTONIO	VILLASMIL	MEDRANO	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGIA ELEC. Y GESTION PARA EL USO RACIONAL		DIRECTOR	57	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DESP. DEL VICEMINISTRO PARA NVAS. FUENTES DE ENERGÍA ELÉC. Y GESTIÓN PARA EL USO RACIONAL
184403459	6328753	JULIO	CESAR	GONZALEZ	HERNANDEZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	JCGONZALEZ@MPPEE.GOB.VE	PROFESIONAL II	700140	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184390680	12605344	OMAR	FERNANDO	VASQUEZ	CONTRERAS	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	OVASQUEZ@MPPEE.GOB.VE	PROFESIONAL II	700076	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405952	15107260	MARIA	GRABIELA	NATERA	PACHECO	CONTRATADO	DIRECCION DEL DESPACHO		APOYO TECNICO	823	2	92	TECNICO	28	DIRECCIÓN DEL DESPACHO
184405279	17651988	PITTER	JAVIER	MORENO	CARDENAS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	pmoreno@mppee.gob.ve	AUXILIAR DE SERVICIOS DE OFICINA	265	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405487	9149054	LUIS	ROBERTO	BARRIENTOS	SANCHEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2778	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184402014	17928978	ERICK	ANTONIO	DIAZ	PEREIRA	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	ERICKSON454@HOTMAIL.COM	PASANTE PROFESIONAL	71	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184402012	16067348	LORENA	ZULIMAR	GUILLEN	DAVILA	PASANTE	CENTRO NACIONAL DE DESPACHO	GUILLENGF@HOTMAIL.COM	PASANTE TECNICO	69	2	92	TECNICO	62	CENTRO NACIONAL DE DESPACHO
184403622	16130151	REYNA	JACQUELINE	RAMOS	HERNANDEZ	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	rramos@mppee.gob.ve	PROFESIONAL I	600074	2	35	PROFESIONAL	12	OFICINA DE SEGURIDAD INTEGRAL
184404397	3976495	EDITH	MARIA	LA CRUZ	DE GONZALEZ	CONTRATADO	AREA DE SEGUIMIENTO Y EVALUACION DE POLÍTICAS PÚBLICAS	ELACRUZ@MPPEE.GOB.VE	APOYO PROFESIONAL	755	1	35	PROFESIONAL	28	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184401273	16623233	YOENDRY	NEPTALI	VALENCIA	MONTIEL	CONTRATADO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	yvalencia@mppee.gob.ve	APOYO PROFESIONAL	499	1	35	PROFESIONAL	28	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184400834	12378412	JESUS	RICARDO	ESCOBAR	HERNANDEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	jescobar@mppee.gob.ve	ESCOLTA	90	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398306	16562667	MARICARMEN		BARBERA	SANCHEZ	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	MBARBERA@MPPEE.GOB.VE	PROFESIONAL I	600068	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184400555	11204087	JUNIOR	LEWIS	OCHOA 	SALAZAR	ALTO NIVEL Y/O CONFIANZA	OFICINA DE GESTION ADMINISTRATIVA	JOCHOA@MPPEE.GOB.VE	COORDINADOR	9920036	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE GESTIÓN ADMINISTRATIVA
184403491	10488991	YUBRASKA	KARELYS	CAMACARO	YEPEZ	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	YCAMACARO@MPPEE.GOB.VE	TECNICO II	500033	2	92	TECNICO	12	OFICINA DE RECURSOS HUMANOS
184397554	3766016	LUIS	ALFONSO	GONZALEZ	GONZALEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	LAGONZALEZ@MPPEE.GOB.VE	PROFESIONAL III	800061	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184397456	5164976	YOLANDA		DIAZ	MANTILLA	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS		PROFESIONAL III	1420	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184402647	13917974	YULEY	CRISTINA	CASTILLO	CARDENAS	CONTRATADO	AREA DE ASUNTOS INTERNACIONALES	YCASTILLO@MPPEE.GOB.VE	APOYO PROFESIONAL	637	1	35	PROFESIONAL	28	DESPACHO DEL MINISTRO
184404536	2159413	CARLOS	ALBERTO	GIL	RIVODO	EGRESADOS	OFICINA DE RECURSOS HUMANOS	CGIL@MPPEE.GOB.VE	FOTÓGRAFO	24	4	24	OBRERO	141	OFICINA DE RECURSOS HUMANOS
184404546	17251492	JOSE	RAFAEL	SILVA	LOPEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	JSILVA@MPPEE.GOB.VE	APOYO TÉCNICO	34	2	92	TECNICO	141	OFICINA DE RECURSOS HUMANOS
184400951	6325927	GRISEYDA	BETHZABE	AULAR	RODRIGUEZ	CONTRATADO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	GBAULAR@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	453	1	93	ADMINISTRATIVO	28	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403937	8611963	LEDYS	YUMIRY	FIGUEROA 	COLMENARES	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO		APOYO PROFESIONAL	705	1	35	PROFESIONAL	28	OFICINA DE ATENCIÓN AL CIUDADANO
184405220	9412669	ANDRES	APOSTOL	MARIN	CASTELLANOS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	MMARIN200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	206	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184390000	4351923	MARYSABEL		MORA	GARRIDO	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	MMORA@MPPEE.GOB.VE	BACHILLER II	200023	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184399504	9688820	LEONARDO 	ERNESTO	ALMAU	TRENARD	COMISION DE SERVICIOS Y/O ENCARGADURIA	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	LALMAU@MPPEE.GOB.VE	PROFESIONAL I	65	1	35	PROFESIONAL	22	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184402795	14780013	ELIZABETH	COROMOTO	GIRO	GODOY	CONTRATADO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	egiro@mppee.gob.ve	APOYO PROFESIONAL	659	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184398730	5129063	ROSA	YOLEIDA	MONTENEGRO	NUÑEZ	CONTRATADO	AREA DE INFORMACION Y DIVULGACION AL CIUDADANO	RMONTENEGRO@MPPEE.GOB.VE	APOYO PROFESIONAL	260	1	35	PROFESIONAL	28	OFICINA DE ATENCIÓN AL CIUDADANO
184403542	13659376	XIOMARIS	ANTONIA	SANCHEZ	RIVAS	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	xsanchez@mppee.gob.ve	TECNICO I	400040	2	92	TECNICO	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184403876	1873773	ANAYANSI		JIMENEZ	FEBRES	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	AJIMFE@GMAIL.COM      -     AJIMFE@HOTMAIL.COM	BACHILLER I	100022	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403444	5312815	INGRID	TERESA	VILLASMIL	RAMOS	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	ivillasmil@mppee.gob.ve	TECNICO II	500028	2	92	TECNICO	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184397749	16462685	ANDREA	ISABEL	GONZALEZ	OTTO	CONTRATADO	DESPACHO DEL MINISTRO	AGONZALEZ@MPPEE.GOB.VE	APOYO TECNICO	109	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184405208	6376341	OSCAR	FIARELO	PEREZ	VARGAS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	OPEREZ206@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	194	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403688	17704207	FEDORA	CRISTINA	GARCIA	ACEVEDO	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	FGARCIA@MPPEE.GOB.VE	PROFESIONAL I	600212	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184405484	17993286	SERGIO	PASTOR	ALGIERI	MORENO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2818	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405188	4806327	PETRA	ESPERANZA	ALEMAN		OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	APETRA200@MPPEE.GOB.VE	ASEADOR	174	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403521	12684566	JORGE	ISAAC	BLANCA 	BRITO	EMPLEADO FIJO	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	jblanca@mppee.gob.ve	PROFESIONAL I	600126	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184402274	3810546	ANA 	MARGARITA	BRICEÑO	GARCIA	OBRERO FIJO	AREA DE SERVICIOS GENERALES	ABRICENO@MPPEE.GOB.VE	ASEADOR	115	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405267	16134032	PASTOR	ALEJANDRO	MACHADO	RIOS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	ALEJNDRO_1881_6@HOTMAIL.COM	AYUDANTE DE SERVICIOS GENERALES	253	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403431	3975397	MARTIN	EDGAR	MALAVE	REBOLLEDO	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	MMALAVE@MPPEE.GOB.VE	PROFESIONAL III	800085	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184401036	19272953	CHRISTIAN 	MICHEL	CAMARA	MENDOZA	PASANTE	OFICINA DE RECURSOS HUMANOS	PABK16 17@HOTMAIL.COM	PASANTE TECNICO	55	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184406028	11935143	MIGUEL	ANGEL	LAFFE	ARMELLA	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	ODISEO.ONLINE@GMAIL.COM	APOYO ADMINISTRATIVO	826	1	93	ADMINISTRATIVO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403637	16532524	JOSE 	FRANCISCO	PORRAS 	SAMUEL 	EMPLEADO FIJO	DESPACHO DEL MINISTRO	JPORRAS@MPPEE.GOB.VE	PROFESIONAL I	600184	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184403461	6362703	RAUL	IGNACIO	SARACHE	GONZALEZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	RSARACHE@MPPEE.GOB.VE	PROFESIONAL III	800030	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184405568	19930594	ANDREA	LUCIA	LINARES	CAMACHO	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION		PASANTE TECNICO	161	2	92	TECNICO	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405454	11824576	ALEXANDER	JOSE	GODOY	MARQUEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2788	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184397907	8406685	JOSE	REMIGIO	CASTRO	BARRERA	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	JCASTRO@MPPEE.GOB.VE	APOYO TECNICO	141	2	92	TECNICO	28	OFICINA DE SEGURIDAD INTEGRAL
184405803	17423507	DOUGLAS	MIGUEL	LA ROSA	BARROLLETA	PASANTE	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA		PASANTE PROFESIONAL	171	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184403566	14277566	JOHANNA	LISBETH	SILVA 	VARGAS	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	JLSILVA@MPPEE.GOB.VE	TECNICO I	400038	2	92	TECNICO	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184401989	6498678	JESUS	EDUARDO	VILLARROEL	GONZÁLEZ	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DESPACHO DEL MINISTRO	IVILLARROEL@MPEE@LAEDC.VE   /   JESUSVILL56@HOTMAIL.COM	COORDINADOR	55	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DESPACHO DEL MINISTRO
184399903	20185860	ORIANA	IRISBEL	BELTRAN	ALVARADO	PASANTE	OFICINA DE RECURSOS HUMANOS	ORIANA1967IFY@GMAIL.COM	PASANTE TECNICO	32	2	92	TECNICO	62	OFICINA DE RECURSOS HUMANOS
184400742	5596143	JESUS	FRANCISCO	ROSAS	MATA	CONTRATADO	DIRECCION ESTADAL (ZULIA)	jrosas@mppee.gob.ve	APOYO ADMINISTRATIVO	442	1	93	ADMINISTRATIVO	28	DIRECCIONES ESTADALES
184403585	15040687	SANDRA	MAGDELINE	ACOSTA		EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	SMACOSTA@MPPEE.GOB.VE	TECNICO II	500026	2	92	TECNICO	12	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184397828	17560626	EDUARDO	ALEJANDRO	MUÑOZ		CONTRATADO	AREA DE PLANIFICACION Y CONTROL DE PROYECTOS DE TECNOLOGIAS DE LA INFORMACION	EAGMUNOZ@MPPEE.GOB.VE	APOYO PROFESIONAL	131	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405507	10167800	VICTOR	GONZALO	MORA	MORENO	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION DEL DESPACHO	VMORA@MPPEE.GOB.VE	DIRECTOR DEL DESPACHO	141	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN DEL DESPACHO
184400679	14155541	ELIOMAR	RAMON	TORTOZA	CEDEÑO	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	ETORTOZA@MPPEE.GOB.VE	VIGILANTE	46	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184401024	16868041	REINALDO	JOSE	LOPEZ	MARTI	OBRERO FIJO	AREA DE COMPRAS	RLOPEZ@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	107	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184398601	16130986	EDICSON	DANIEL	VELASQUEZ	CASANOVA	PASANTE	AREA DE DESARROLLO	EVELASQUEZ@MPPEE.GOB.VE	PASANTE PROFESIONAL	1	2	35	PROFESIONAL	62	OFICINA DE RECURSOS HUMANOS
184402912	6403965	NILDA	TERESA	OJEDA	CARDOZO	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	nojeda@mppee.gob.ve	PROFESIONAL III	800018	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184405493	19721488	NORKYS	BEATRIZ	SOLANO	PARRA	PASANTE	CONSULTORIA JURIDICA	BETTY_SOL57@HOTMAIL.COM	PASANTE PROFESIONAL	149	2	35	PROFESIONAL	62	CONSULTORÍA JURIDICA
184403878	6720840	TANIA 	AURORA	SALAZAR	SUAREZ	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	tsalazar@mppee.gob.ve	PROFESIONAL I	600020	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184400721	19012801	JOSE	GREGORIO	BARRIOS	TREMARIA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JBARRIOS@MPPEE.GOB.VE	VIGILANTE	71	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184405246	13187168	OSCARMEN		MARQUEZ	RAMOS	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	OMARQUEZ200@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	232	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403684	17633755	LOURDES	MARIA	CARMONA	COLOMINA	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	lcarmona@mppee.gob.ve	BACHILLER II	200036	1	93	ADMINISTRATIVO	12	OFICINA DE ATENCIÓN AL CIUDADANO
184399894	4075424	VLADIMIR		ADRIANZA	SALAS	HONORARIOS PROFESIONALES	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	VLADIMIRADR@CANTV.NET	HONORARIOS PROFESIONALES	2747	2	35	PROFESIONAL	53	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184399833	18041527	ENDER	ALEXANDER	GONZALEZ	GRANIERO	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	EAGONZALEZ@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	399	1	93	ADMINISTRATIVO	28	OFICINA DE SEGURIDAD INTEGRAL
184400666	12717444	EDGAR	ALEXANDER	SOTO 	LEDEZMA	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	EASOTO@MPPEE.GOB.VE	VIGILANTE	33	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184405636	6166450	HILDA		LOPEZ	GARCIA	ALTO NIVEL Y/O CONFIANZA	OFICINA DE GESTION ADMINISTRATIVA	HLOPEZG@MPPEE.GOB.VE	DIRECTOR GENERAL	9950019	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE GESTIÓN ADMINISTRATIVA
184405721	15340563	JOHAN	MANUEL	CHIRINOS 	JIMENEZ	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO		ESCOLTA	57	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184403538	13483597	JOSE	WLADIMIR	OCHOA	PINEDA	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	JWOCHOA@MPPEE.GOB.VE	BACHILLER III	300009	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184404522	27053085	NIEVES 	MARGARITA	PEREZ	DOMINGUES	EGRESADOS	OFICINA DE RECURSOS HUMANOS		ASISTENTE	10	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184405297	20753423	ERIKA	DANIELA	ARDILES	CARRASQUEL	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	EARDILES200@MPPEE.GOB.VE	ASEADOR	283	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403813	5427913	RODOLFO		NAVARRO	DIAZ	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	SALA DE MONITOREO	RNAVARRO@MPPEE.GOB.VE	DIRECTOR GENERAL	126	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DESPACHO DEL MINISTRO
184403589	15152688	ANAKARINE		GUEVARA	BLANCO	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	AGUEVARA@MPPEE.GOB.VE	BACHILLER I	100020	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405802	17297945	ERIKA	GUADALUPE	UZCATEGUI	HOLZHAUSER	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	ERIKA_UZCATEGUI_HOLZ@YAHOO.ES	PASANTE PROFESIONAL	170	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184390022	9164296	EDUARDO	JOSE	TERAN	OREGARENA	EMPLEADO FIJO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	ETERAN@MPPEE.GOB.VE	PROFESIONAL I	600012	2	35	PROFESIONAL	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184402571	1270756	ALI		RODRIGUEZ	ARAQUE	JUBILADO-EMPLEADO	OFICINA DE RECURSOS HUMANOS	ARODRIGUEZ@MPPEE.GOB.VE	JUBILADO	2	1	102	PENSIONADOS	41	OFICINA DE RECURSOS HUMANOS
184397484	16524570	AURA	MARINA	TOVAR	RAMIREZ	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	ATOVAR@MPPEE.GOB.VE	APOYO PROFESIONAL	39	1	35	PROFESIONAL	28	OFICINA DE ATENCIÓN AL CIUDADANO
184405443	8848827	LUIS	RAFAEL	GARCIA	CORONA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2777	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184403554	14044356	ANGEL	AUGUSTO	CAMPODONICO	MONJE	EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELECTRICO	acampodonico@mppee.gob.ve	PROFESIONAL II	700095	2	35	PROFESIONAL	12	DESPACHO DEL VICEMINISTRO DE SEGUIMIENTO Y CONTROL DEL SERVICIO ELÉCTRICO
184400663	11679935	CARLOS	JHONATAN	PEREZ	MARTINEZ	OBRERO FIJO	AREA DE COMPRAS	CJPEREZ@MPPEE.GOB.VE	CHOFER	30	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400723	19199167	MARGELIS		PALENCIA	MEJIA	OBRERO FIJO	AREA DE COMPRAS	MPALENCIA@MPPEE.GOB.VE	COCINERO	73	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405471	14514132	DENNY	ORLANGEL	NAVAS	CAMPOS	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2805	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405742	11739816	BEATRIZ	AIDA	MILMAN	RODRIGUEZ	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	BMILMAN@MPPEE.GOB.VE	BACHILLER I	800157	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403578	14789714	KARLA 	ALEJANDRA	GUEVARA	ARGUINZONES	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	kguevara@mppee.gob.ve	TECNICO II	500007	2	92	TECNICO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403413	14059551	NESTOR	JOSE	RODRIGUEZ	HIDALGO	EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	NRODRIGUEZ@MPPEE.GOB.VE	BACHILLER II	200013	1	93	ADMINISTRATIVO	12	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184397932	9239368	JESUS	SANTIAGO	BRITO	MANZANO	CONTRATADO	AREA DE DICTAMENES	JBRITO@MPPEE.GOB.VE	APOYO PROFESIONAL	151	1	35	PROFESIONAL	28	CONSULTORÍA JURIDICA
184399904	9276298	RAUL 	JOSE	ROJAS	GARCIA	PASANTE	OFICINA DE RECURSOS HUMANOS		PASANTE PROFESIONAL	33	2	35	PROFESIONAL	62	OFICINA DE RECURSOS HUMANOS
184399501	11792141	ENMANUEL	JESUS	ALVARADO	PATRIZZI	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE ESTUDIOS ELECTRICOS	EALVARADO@MPPEE.GOB.VE	PROFESIONAL I	62	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DE ESTUDIOS ELÉCTRICOS
184403731	19963740	LEONEL	ENRIQUE	TORRES	SANCHEZ	EMPLEADO FIJO	DESPACHO DEL MINISTRO	LTORRES@MPPEE.GOB.VE	PROFESIONAL I	600004	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184402668	15264171	NIDIAN	YAJAILI	PEREZ	VARGAS	PASANTE	AUDITORIA INTERNA		PASANTE TECNICO	92	2	92	TECNICO	62	AUDITORÍA INTERNA
184404553	10805678	ALEJANDRO	EMILIO	REQUENA	ABUNASSAR	EGRESADOS	OFICINA DE RECURSOS HUMANOS	AREQUENA@MPPEE.GOB.VE	PROFESIONAL I	41	1	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184401241	17974445	ELIEZER	MOISES	SANCHEZ	GUERRA	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO		PASANTE PROFESIONAL	63	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403948	12163630	ABIGAIL	JOSE	LOPEZ	GORRIN	CONTRATADO	CENTRO NACIONAL DE DESPACHO	ABIGALOPEZ@GMAIL.COM	APOYO TECNICO	712	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184403537	13472868	ADRIANA	LEIDY	CUELLO	MATA	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	acuello@mppee.gob.ve	PROFESIONAL I	600189	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184397901	17048706	MARIA	VIRGINIA	CONDE	LEON	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	MVCONDE@HOTMAIL.COM	PROFESIONAL I	19	1	35	PROFESIONAL	22	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184404529	11307062	VANESSA	CAROLINA	REQUENA	TIZZANI	EGRESADOS	OFICINA DE RECURSOS HUMANOS		BACHILLER III	17	1	23	BACHILLER	141	OFICINA DE RECURSOS HUMANOS
184397954	4862533	SADYS	CARLOTA	ORTEGA	DE RODRIGUEZ	EMPLEADO FIJO	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	SORTEGA@MPPEE.GOB.VE	DIRECTOR GENERAL	2685	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184404577	15506125	MICHELLE		DUNMETT	TOVAR	EGRESADOS	OFICINA DE RECURSOS HUMANOS	DUNMETTM@MPPEE.GOB.VE	DIRECTOR ADJUNTO	65	0	91	DIRECCION/GERENCIA/SUPERVISORES	141	OFICINA DE RECURSOS HUMANOS
184397585	16202556	FRANCISCO	JAVIER	REGALADO	CORONADO	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	REGALADOFJC@HOTMAIL.COM	OFICIAL DE SEGURIDAD	62	4	24	OBRERO	28	OFICINA DE SEGURIDAD INTEGRAL
184390340	6366201	MARLY	CELINA	CAMACHO	PEÑA	EMPLEADO FIJO	CONSULTORIA JURIDICA	MCAMACHO@MPPEE.GOB.VE	PROFESIONAL II	700023	2	35	PROFESIONAL	12	CONSULTORÍA JURIDICA
184405669	14304768	EDWIN	LENIN	GARCIA	GUTIERREZ	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO		ESCOLTA	55	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184404121	20614595	MAITE	ANDREINA	ROJAS	RUIZ	PASANTE	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES		PASANTE PROFESIONAL	111	2	35	PROFESIONAL	62	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403594	15370435	CESAR	ERNESTO	RODRIGUEZ	FIGUERA	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	CRODRIGUEZ@MPPEE.GOB.VE	PROFESIONAL I	600025	2	35	PROFESIONAL	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184403666	17168524	CATHERINE	PAOLA	LUCERO	ALVAREZ	EMPLEADO FIJO	AUDITORIA INTERNA	CLUCERO@MPPEE.GOB.VE	PROFESIONAL I	600039	2	35	PROFESIONAL	12	AUDITORÍA INTERNA
184403713	19265220	PIERINA	CECILIA	HENRIQUEZ	ZECCHETTI	EMPLEADO FIJO	OFICINA DE ATENCION AL CIUDADANO	PHENRIQUEZ@MPPEE.GOB.VE	PROFESIONAL I	600213	2	35	PROFESIONAL	12	OFICINA DE ATENCIÓN AL CIUDADANO
184402455	12616498	EDUARDO	ALFONZO	DIAZ	FLORES	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	eadiaz@mppee.gob.ve	VIGILANTE	146	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184396599	3752022	RAFAEL	DOMINGO	MEDINA	PEREZ	EMPLEADO FIJO	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS	RMEDINA@MPPEE.GOB.VE	PROFESIONAL II	700007	2	35	PROFESIONAL	12	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184404068	20628709	NATACHA	ALEJANDRA	VIDOVICH 	MURILLO	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	NATY6099@HOTMAIL.COM	PASANTE PROFESIONAL	108	2	35	PROFESIONAL	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184406026	14762168	MAJERLYN		MEDINA	CASANOVA	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO	MMAJERLYN@GMAIL.COM	ESCOLTA	60	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184397461	6039935	TANIA	GRACIELA	LOPEZ	ANDUEZA	EMPLEADO FIJO	DIRECCION DEL DESPACHO	TLOPEZ@MPPEE.GOB.VE	PROFESIONAL I	600006	2	35	PROFESIONAL	12	DIRECCIÓN DEL DESPACHO
184405233	11113504	NELLY	MARIELA	GELVIZ	CRUZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	NGELVIZ200@MPPEE.GOB.VE	ASEADOR	219	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405450	9996826	RONNY	ANTONIO	MARAPACUTO	BASTARDO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2784	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404549	25053254	JOSE		IGLESIAS 	DOMINGUEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS		OFICIAL DE SEGURIDAD	37	4	24	OBRERO	141	OFICINA DE RECURSOS HUMANOS
184400596	11109727	AMIN	DUBRASKA	GONZALEZ	SANCHEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	AMINGONZALEZ21@GMAIL.COM	DIRECTOR DE LINEA	83	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE SEGURIDAD INTEGRAL
184400140	19227589	ANGEL 	ESTEBAN	LABRADOR 	RIVAS	PASANTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	LABRADORRIVAS@GMAIL.COM	PASANTE PROFESIONAL	48	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404619	15649760	MAYERLING	CAROLINA	DOMINGUEZ	MORALES	EMPLEADO FIJO	DIRECCION DEL DESPACHO	MDOMINGUEZ@MPPEE.GOB.VE	BACHILLER II	800147	1	93	ADMINISTRATIVO	12	DIRECCIÓN DEL DESPACHO
184403563	14203075	RURAIMA	MARISOL	BRACAMONTE	ADALFIO	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	RBRACAMONTE@MPPEE.GOB.VE	TECNICO I	400028	2	92	TECNICO	12	OFICINA DE SEGURIDAD INTEGRAL
184397540	10544728	LORENA		ABOGADO	GALLARDO	CONTRATADO	AREA DE PLANIFICACION Y CONTROL DE PROYECTOS DE TECNOLOGIAS DE LA INFORMACION	LABOGADO@MPPEE.GOB.VE	APOYO PROFESIONAL	45	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184403635	16486179	MILAGROS	DEL VALLE	RODRIGUEZ	BRITO	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	MDRODRIGUEZ@MPPEE.GOB.VE	PROFESIONAL I	600146	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
3347	12057610	JIMMY	ALEXANDER	GOMEZ	CHACON	EMPLEADO FIJO	DIRECCION GENERAL DE ENERGIA ALTERNATIVA	JAGOMEZ@MPPEE.GOB.VE	PROFESIONAL II	700082	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184400893	15021735	ALIRIO	JOSE	VELIZ	RODRIGUEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	AVELIZ@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	99	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184399907	27053085	NIEVES 	MARGARITA	PEREZ	DOMINGUES	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA		ASISTENTE	71	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184399503	14745080	JOSE 	GREGORIO	DE SOUSA	COSTA	COMISION DE SERVICIOS Y/O ENCARGADURIA	DIRECCION GENERAL DE GESTION DEL USO DE LA ENERGIA	JDESOUSA@MPPEE.GOB.VE	COORDINADOR	64	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	DIRECCIÓN GENERAL DE GESTIÓN DEL USO DE LA ENERGÍA
184402656	12502764	WILLIAM	LEONARDO 	SABOLLA		OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	wsabolla@mppee.gob.ve	ESCOLTA	157	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184402086	16589717	KAIBY	KARILY	ACOSTA	GIL	CONTRATADO	OFICINA DE RECURSOS HUMANOS	KACOSTA@MPPEE.GOB.VE	APOYO TECNICO	605	2	92	TECNICO	28	OFICINA DE RECURSOS HUMANOS
184402664	17389814	WALTER	WILFREDO	JIMENEZ	JAIMES	PASANTE	DIRECCION GENERAL DE ENERGIA ALTERNATIVA		PASANTE PROFESIONAL	88	2	35	PROFESIONAL	62	DIRECCIÓN GENERAL DE ENERGÍA ALTERNATIVA
184405732	12553160	MILADY	INES	ORELLANA	DE GARCIA	ALTO NIVEL Y/O CONFIANZA	DIRECCION DEL DESPACHO	MILADYORELLANA@HOTMAIL.COM	COORDINADOR	9950024	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN DEL DESPACHO
184397553	742787	HUGO	RAMON	OCANDO	GONZALEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	HOCANDO@MPPEE.GOB.VE	PROFESIONAL II	700096	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184400719	18369595	JOSE	DAVID	RANGEL	PEREZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JRANGEL@MPPEE.GOB.VE	VIGILANTE	69	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184402729	10575108	RUTH	MARY	PADRON	RAMOS	CONTRATADO	OFICINA DE ATENCION AL CIUDADANO	RUTHMARIPADRON@HOTMAIL.COM	APOYO ADMINISTRATIVO	653	1	93	ADMINISTRATIVO	28	OFICINA DE ATENCIÓN AL CIUDADANO
184400695	15959288	ELIZABETH	DEL CARMEN	VIRGUEZ	DE TORRES	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	EVIRGUEZ@MPPEE.GOB.VE	RECEPTOR INFORMADOR	62	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184399901	17742995	BREINNER	NAZARET	LABANA	HERNANDEZ	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	blabana@mppee.gob.ve	PASANTE PROFESIONAL	30	2	35	PROFESIONAL	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404523	4680104	JUAN	CARLOS	CASTILLO	ZAMORA	EGRESADOS	OFICINA DE RECURSOS HUMANOS	JCASTILLO@MPPEE.GOB.VE	COORDINADOR	11	0	39	COORDINADOR	141	OFICINA DE RECURSOS HUMANOS
184398611	7589383	ALEXIS	ENRIQUE	TOVAR	PRADO	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	AETOVAR@MPPEE.GOB.VE	APOYO PROFESIONAL	241	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184404457	19215928	ANDREINA	DEL CARMEN	CHAVEZ	ALAVA	PASANTE	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES		PASANTE PROFESIONAL	123	2	35	PROFESIONAL	62	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184405891	16096935	BEYGLIS	ESTHER	MEDINA	REVERON	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	BEYGLIS@YAHOO.COM	ASISTENTE	9950031	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184405483	17690192	ALFREDO	ALEJANDRO	D ANGELO 	ROA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2817	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184405485	18212492	OSMEL	GREGORIO	BRUZUAL 	CORDOVA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2819	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404391	16089120	JOSE	PASTOR	RAMOS	COLMENAREZ 	CONTRATADO	CENTRO NACIONAL DE DESPACHO	jpramos@mppee.gob.ve	APOYO TECNICO	749	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184403061	6728111	YENIT	MARGARITA	PARRA		CONTRATADO	OFICINA DE GESTION ADMINISTRATIVA	yparra@mppee.gob.ve	APOYO ADMINISTRATIVO	669	1	93	ADMINISTRATIVO	28	OFICINA DE GESTIÓN ADMINISTRATIVA
184402392	16936889	RENNY	JESUS	MARTINEZ	GUTIERREZ	OBRERO FIJO	AREA DE SERVICIOS GENERALES	RJMARTINEZ@MPPEE.GOB.VE	MENSAJERO MOTORIZADO	133	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403597	15403489	ANDREA 	VIRGINIA	GAINZA 	JIMENEZ	EMPLEADO FIJO	DESPACHO DEL MINISTRO	AGAINZA@MPPEE.GOB.VE	PROFESIONAL I	600167	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184403700	18041486	ERIKA	ROSSANA	TARAZONA	CASTILLO	EMPLEADO FIJO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	ETARAZONA@MPPEE.GOB.VE	PROFESIONAL I	600219	2	35	PROFESIONAL	12	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184404195	10713270	EDUARDO		RONDON	DUGARTE	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	erondon@mppee.gob.ve	PROFESIONAL III	150	1	35	PROFESIONAL	22	OFICINA DE SEGURIDAD INTEGRAL
184399445	19122975	FELDALEE	DEL VALLE	PADILLA	QUIJADA	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	FELDALEEPADILLAQ@GMAIL.COM	APOYO PROFESIONAL	2739	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184400894	18142867	WINDER	WILLIANS	BELLO	MARTINEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	WBELLO@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	100	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400218	4596762	CAIRA	COROMOTO	ZAMORA	DE KESSLER	ALTO NIVEL Y/O CONFIANZA	OFICINA DE RECURSOS HUMANOS	KESSLER_ZAMORA@CANTV.NET	DIRECTOR	2717	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	OFICINA DE RECURSOS HUMANOS
184397074	15315193	HELIOS	PASTOR	ESPIN	DEL RIO	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	HESPIN@MPPEE.GOB.VE	DIRECTOR GENERAL	30	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184405376	25411967	ELGER	ORLANDO	ESCALONA	FERNANDEZ	PASANTE	OFICINA DE GESTION ADMINISTRATIVA	ELGER-17@HOTMAIL.COM	PASANTE BACHILLER	144	1	33	BACHILLER	62	OFICINA DE GESTIÓN ADMINISTRATIVA
184401261	14896899	XIOMARA	MARIA	DIAZ	SALAS	CONTRATADO	DIRECCION ESTADAL (ZULIA)	XDIAZ@MPPEE.GOB.VE	APOYO PROFESIONAL	489	1	35	PROFESIONAL	28	DIRECCIONES ESTADALES
184403711	19007778	FRANCIS	CAROLIS	GARCIA	JIMENEZ	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	fcgarcia@mppee.gob.ve	PROFESIONAL I	600131	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184402971	5427913	RODOLFO		NAVARRO	DIAZ	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	SALA DE MONITOREO	RNAVARRO@MPPEE.GOB.VE	DIRECTOR GENERAL	121	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DESPACHO DEL MINISTRO
184404198	21091684	SALVADOR		GONZALEZ	CLEMENTE	PASANTE	AREA DE ASUNTOS INTERNACIONALES	SALVADORGONZALEZC@HOTMAIL.COM	PASANTE TECNICO	112	2	92	TECNICO	62	DESPACHO DEL MINISTRO
184403662	17115226	YELITZA 	COROMOTO	VALERA	NELO	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	YVALERA@MPPEE.GOB.VE	PROFESIONAL I	600216	2	35	PROFESIONAL	12	OFICINA DE RECURSOS HUMANOS
184403630	16330193	DANIEL	MARTIN	MORON 	DIAZ	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	DMORON@MPPEE.GOB.VE	TECNICO I	400020	2	92	TECNICO	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184397072	11230675	TAWATA		ARAUJO	JUAN	EMPLEADO FIJO	DIRECCION DEL DESPACHO	TARAUJO@MPPEE.GOB.VE	DIRECTOR	2652	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	DIRECCIÓN DEL DESPACHO
184405314	15169806	DAYANA	JOSEFINA	CARMONA	HIGUEREY	CONTRATADO	OFICINA DE SEGURIDAD INTEGRAL	DAY_CARMONA@HOTMAIL.COM	APOYO PROFESIONAL	807	1	35	PROFESIONAL	28	OFICINA DE SEGURIDAD INTEGRAL
184400838	3984287	CARLOS	ALBERTO	ZAMBRANO 	AGUILAR	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CZAMBRANO@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	94	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184405665	15769992	JOSE	MATEO	SOTELDO 	RONDON	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO		ESCOLTA	51	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184405664	11987200	DARWIN	RAFAEL	RIOS	ORTEGA	OBRERO-LICENCIAS REMUNERADAS	DESPACHO DEL MINISTRO		ESCOLTA	50	4	24	OBRERO	93	DESPACHO DEL MINISTRO
184403704	18261234	KEIBERT	JOSE	DORANTE	VALERA	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	KDORANTE@MPPEE.GOB.VE	PROFESIONAL II	700137	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403608	15587918	YAISMIR	ARLENIS	GUZMAN	GOMEZ	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	yguzman@mppee.gob.ve	PROFESIONAL II	700069	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184397721	5529914	OSCAR	MANUEL	MARVAL	AGUERO	EMPLEADO FIJO	OFICINA DE PLANIFICACION, PRESUPUESTO Y ORGANIZACION	OSCAR_MARVAL@YAHOO.ES	COORDINADOR	2670	0	91	DIRECCION/GERENCIA/SUPERVISORES	12	OFICINA DE PLANIFICACIÓN, PRESUPUESTO Y ORGANIZACIÓN
184397465	16777912	ORIANA	GIZEH	MOLINA	GALINDO	EMPLEADO FIJO	OFICINA DE GESTION ADMINISTRATIVA	OMOLINA@MPPEE.GOB.VE	PROFESIONAL II	700040	2	35	PROFESIONAL	12	OFICINA DE GESTIÓN ADMINISTRATIVA
184403515	12170354	JOSE	ALEXANDER	MARTINEZ	REQUENA	EMPLEADO FIJO	OFICINA DE SEGURIDAD INTEGRAL	JAMARTINEZ@MPPEE.GOB.VE	BACHILLER II	200012	1	93	ADMINISTRATIVO	12	OFICINA DE SEGURIDAD INTEGRAL
184400484	3555645	JESUS	RAFAEL	VILLARROEL		CONTRATADO	OFICINA DE RECURSOS HUMANOS		OFICIAL DE SEGURIDAD	188	4	24	OBRERO	28	OFICINA DE RECURSOS HUMANOS
184402334	10797339	JOSE 	FREDDY	CONTRERAS 	ROJAS	OBRERO FIJO	AREA DE SERVICIOS GENERALES	JCONTRERAS@MPPEE.GOB.VE	MENSAJERO	125	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400708	6201835	MARCIAL	ALFREDO	SANCHEZ	CARRILLO	OBRERO FIJO	AREA DE COMPRAS	MSANCHEZ@MPPEE.GOB.VE	SUPERVISOR DE SERVICIOS INTERNOS	11	4	111	OBRERO SUPERVISOR	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184400538	4862533	SADYS	CARLOTA	ORTEGA	DE RODRIGUEZ	ALTO NIVEL Y/O CONFIANZA	DIRECCION GENERAL DE EVALUACION DE LOS ENTES ADSCRITOS	SORTEGA@MPPEE.GOB.VE	DIRECTOR GENERAL	9940020	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DIRECCIÓN GENERAL DE EVALUACIÓN DE LOS ENTES ADSCRITOS
184405262	15492107	CESAR	AUGUSTO	JARA	MARTINEZ	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	CJARA200@MPPEE.GOB.VE	AYUDANTE DE SERVICIOS GENERALES	248	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184401251	7995732	FRANK	OMAR	HERNANDEZ	CUDEMO	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL	FCUDEMOS@MPPEE.GOB.VE	HONORARIO PROFESIONAL	2753	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184398364	11309043	LUIS	ERNESTO	VERDE	GOMEZ	COMISION DE SERVICIOS Y/O ENCARGADURIA	AREA DE DICTAMENES	LVERDE@MPPEE.GOB.VE	COORDINADOR	45	0	91	DIRECCION/GERENCIA/SUPERVISORES	22	CONSULTORÍA JURIDICA
184400277	17387059	YOLIMAR	ALEJANDRA	GARCIA	BRICEÑO	SUPLENTE	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	YOLINACHO@HOTMAIL.COM	BACHILLER I	3	1	93	ADMINISTRATIVO	73	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184401425	6966663	HILDEBERTO		MENDEZ	ORTUÑO	COMISION DE SERVICIOS Y/O ENCARGADURIA	AREA DE COMPRAS	HMENDEZ@MPPEE.GOB.VE	TECNICO II	107	2	92	TECNICO	22	OFICINA DE GESTIÓN ADMINISTRATIVA
184390626	14478814	MARAHAIZA	ELVIRA	LUCES	NARANJO	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	MLUCES@MPPEE.GOB.VE	PROFESIONAL II	700099	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405620	24215668	SORAIMA	COROMOTO	TORRES	SANCHEZ	PASANTE	OFICINA DE RECURSOS HUMANOS	SORAIMITATORRES@HOTMAIL.COM	PASANTE BACHILLER	163	1	33	BACHILLER	62	OFICINA DE RECURSOS HUMANOS
184404274	13331567	ANDREINA	COROMOTO	PEÑA 	LINARES	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	acpena@mppee.gob.ve	APOYO ADMINISTRATIVO	736	1	93	ADMINISTRATIVO	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184405961	25676369	PABLO	EDUARDO	ROMERO		(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	OFICINA ESTRATEGICA DE SEGUIMIENTO Y EVALUACION DE POLITICAS PUBLICAS		DIRECTOR GENERAL	148	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	OFICINA ESTRATÉGICA DE SEGUIMIENTO Y EVALUACIÓN DE POLÍTICAS PÚBLICAS
184403466	6855936	MIGUEL	ANGEL	SALAZAR	MARCANO	EMPLEADO FIJO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	MASALAZAR@MPPEE.GOB.VE	BACHILLER II	200004	1	93	ADMINISTRATIVO	12	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184400729	20291493	LUIS	EDUARDO	RINCON	MENDEZ	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	LRINCON@MPPEE.GOB.VE	AUXILIAR DE SERVICIOS DE OFICINA	79	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184403446	5427913	RODOLFO		NAVARRO	DIAZ	EMPLEADO FIJO	DESPACHO DEL MINISTRO	RNAVARRO@MPPEE.GOB.VE	PROFESIONAL III	800101	2	35	PROFESIONAL	12	DESPACHO DEL MINISTRO
184399029	10334373	MARIA	CAROLINA	RAMOS	RANGEL	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	MRAMOS@MPPEE.GOB.VE	APOYO PROFESIONAL	306	1	35	PROFESIONAL	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184403158	9097746	JOSE	ANTONIO	ANGULO	CARICO	CONTRATADO	OFICINA DE COMUNICACION Y RELACIONES INSTITUCIONALES	jangulo@mppee.gob.ve	APOYO TECNICO	689	2	92	TECNICO	28	OFICINA DE COMUNICACIÓN Y RELACIONES INSTITUCIONALES
184390930	7928582	LUCY	ESPERANZA	AGUDELO	DE BOLIVAR	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	LAGUDELO@MPPEE.GOB.VE	BACHILLER II	200014	1	93	ADMINISTRATIVO	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184405447	9489377	CARLOS	ENRIQUE	BIRBAL	ARRAIZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2781	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184404557	18121146	NAYRETH	MILAGROS	MONTIEL	GONZALEZ	EGRESADOS	OFICINA DE RECURSOS HUMANOS	NAYRETHMONTIEL@HOTMAIL.COM	PROFESIONAL I	45	1	35	PROFESIONAL	141	OFICINA DE RECURSOS HUMANOS
184404932	13520965	ARELIS	COROMOTO	GONZALEZ	LOMBANO	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE RECURSOS HUMANOS	AREGON23@HOTMAIL.COM / AREGON23LOMBANO@GMAIL.COM	PROFESIONAL II	157	1	35	PROFESIONAL	22	OFICINA DE RECURSOS HUMANOS
184403501	11308633	OSCAR	ALBERTO	GUTIERREZ	RIOS	EMPLEADO FIJO	DIRECCION GENERAL DEL SISTEMA ELECTRICO	OGUTIERREZ@MPPEE.GOB.VE	PROFESIONAL II	700055	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403338	15929711	MARELVY	ELVIRA	ARCE	SUAREZ	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	MARCE@MPPEE.GOB.VE	APOYO ADMINISTRATIVO	699	1	93	ADMINISTRATIVO	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184401244	19163601	PATRICIA	ANDREINA	DAVID	FERNANDEZ	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	PDAVID@MPPEE.GOB.VE	PASANTE TECNICO	66	2	92	TECNICO	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184400586	645417	JARCEL	ANIBAL	IZTURIZ	ALMEIDA	ALTO NIVEL Y/O CONFIANZA	DESPACHO DEL MINISTRO	JISTURIZ@MPPEE.GOB.VE	COORDINADOR	9920001	0	91	DIRECCION/GERENCIA/SUPERVISORES	82	DESPACHO DEL MINISTRO
184403624	16159800	JUAN	CARLOS ALFONZO	VIRLA	MARQUEZ	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	JVIRLA@MPPEE.GOB.VE	PROFESIONAL I	600195	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403150	16515795	GUSTAVO	MANUEL	GILLY	CASTILLO	CONTRATADO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	ggilly@mppee.gob.ve	APOYO PROFESIONAL	681	1	35	PROFESIONAL	28	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184403732	14388215	LUIS 	EDUARDO	SARMIENTO	LARA	EMPLEADO FIJO	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELECTRICO	LSARMIENTO@MPPEE.GOB.VE	PROFESIONAL I	600076	2	35	PROFESIONAL	12	DESPACHO DEL VICEMINISTRO DE DESARROLLO DEL SERVICIO ELÉCTRICO
184403744	14774794	JUAN 	CARLOS	SALAZAR	ZAYAS	EMPLEADO FIJO	DIRECCION GENERAL DE NORMALIZACION DEL SERVICIO ELECTRICO	JCSALAZAR@MPPEE.GOB.VE	TECNICO II	500022	2	92	TECNICO	12	DIRECCIÓN GENERAL DE NORMALIZACIÓN DEL SERVICIO ELÉCTRICO
184404616	18577023	VERONICA	PAOLA	SANCHEZ	LEON	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	VEROPS20@GMAIL.COM	ASISTENTE	130	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403497	11030208	ANNAYE	DEL CARMEN	CARRIZO	AGUILERA	EMPLEADO FIJO	DIRECCION GENERAL DE PARTICIPACION POPULAR	acarrizo@mppee.gob.ve	PROFESIONAL III	800059	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE PARTICIPACIÓN POPULAR
184404133	18939453	RAFAEL	ANTONIO	DIAZ	MALAVER	CONTRATADO	CENTRO NACIONAL DE DESPACHO	RAFA.2612@HOTMAIL.COM	APOYO TECNICO	728	2	92	TECNICO	28	DESPACHO DEL MINISTRO
184404334	6362337	CARLOS	JULIO	FIGUEROA	BARCELO	COMISION DE SERVICIOS Y/O ENCARGADURIA	OFICINA DE SEGURIDAD INTEGRAL	CFIGUEROA@MPPEE.GOB.VE	TECNICO II	154	2	92	TECNICO	22	OFICINA DE SEGURIDAD INTEGRAL
184405459	12726257	WILVER		SANCHEZ	SANCHEZ	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2793	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184399505	84487566	LIKZA	DESIREE	SOSA	HERNANDEZ	HONORARIOS PROFESIONALES	OFICINA DE RECURSOS HUMANOS	LITZA_SOSA@YAHOO.COM	APOYO PROFESIONAL	2741	1	35	PROFESIONAL	53	OFICINA DE RECURSOS HUMANOS
184400583	16706738	JENNIFER	CAROLINA	MALDONADO	MUÑOZ	CONTRATADO	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	JCMM986@GMAIL.COM	APOYO PROFESIONAL	428	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184403665	17160613	ALEIBYS	DEL VALLE	MUÑOZ	MARCANO	EMPLEADO FIJO	OFICINA DE RECURSOS HUMANOS	AMUNOZ@MPPEE.GOB.VE	BACHILLER I	100026	1	93	ADMINISTRATIVO	12	OFICINA DE RECURSOS HUMANOS
184398187	17561278	MAYRA	ALEJANDRA	MORALES	SERRANO	CONTRATADO	AREA DE SEGUIMIENTO DE GESTION	MAMS_MAYRA@CANTV.NET	APOYO ADMINISTRATIVO	192	1	93	ADMINISTRATIVO	28	DIRECCIÓN DEL DESPACHO
184405439	7396472	LUIS 	ALFREDO	TORRELLES	GARCIA	PAGO ESPECIAL	OFICINA DE SEGURIDAD INTEGRAL		HONORARIO PROFESIONAL	2773	2	35	PROFESIONAL	102	OFICINA DE SEGURIDAD INTEGRAL
184398881	6620177	JUVENAL		VILLASMIL	TOVAR	CONTRATADO	ÁREA DE REGISTRO Y CONTROL	JVILLASMIL@MPPEE.GOB.VE	APOYO PROFESIONAL	278	1	35	PROFESIONAL	28	OFICINA DE RECURSOS HUMANOS
184402456	13490452	OSCAR 	EDUARDO	RODRIGUEZ	DURAN	OBRERO FIJO	OFICINA DE SEGURIDAD INTEGRAL	ORODRIGUEZ@MPPEE.GOB.VE	VIGILANTE	147	4	24	OBRERO	13	OFICINA DE SEGURIDAD INTEGRAL
184405209	6427051	OLIVIA		HERNANDEZ	DE OTAIZA	OBRERO FIJO	OFICINA DE GESTION ADMINISTRATIVA	OHERNANDEZ201@MPPEE.GOB.VE	ASEADOR	195	4	24	OBRERO	13	OFICINA DE GESTIÓN ADMINISTRATIVA
184403874	12465538	ORLANDO	RAFAEL	GONZALEZ	TORTOLEDO	EMPLEADO FIJO	DIRECCION GENERAL DE FISCALIZACION DEL SERVICIO ELECTRICO	orgonzalez@mppee.gob.ve	PROFESIONAL II	700113	2	35	PROFESIONAL	12	DIRECCIÓN GENERAL DE FISCALIZACIÓN DEL SERVICIO ELÉCTRICO
184398066	17144060	GABRIELA	ALEJANDRA	ILARRETA	REYES	CONTRATADO	AREA DE SISTEMAS	GILARRETA@MPPEE.GOB.VE	APOYO PROFESIONAL	177	1	35	PROFESIONAL	28	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
184402655	4845971	NELY	MARIA	MATAMOROS	CARRASQUEL	(ALTO NIVEL) COMISION DE SERVICIO Y/O ENCARGADURIA	DIRECCION GENERAL DEL SISTEMA ELECTRICO	NMATAMOROS@MPPEE.GOB.VE	DIRECTOR GENERAL	120	0	91	DIRECCION/GERENCIA/SUPERVISORES	121	DIRECCIÓN GENERAL DEL SISTEMA ELÉCTRICO
184403214	19289341	DALILA	TIBISAY	PEREZ	GALLARDO	PASANTE	OFICINA DE SISTEMAS Y TECNOLOGIA DE LA INFORMACION	dperez@mppee.gob.ve	PASANTE PROFESIONAL	101	2	35	PROFESIONAL	62	OFICINA DE SISTEMAS Y TECNOLOGÍA DE LA INFORMACIÓN
\.


--
-- Name: id_conf_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conf
    ADD CONSTRAINT id_conf_pk PRIMARY KEY (id_conf);


--
-- Name: pk_co_detalle_respuestas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalle_respuestas
    ADD CONSTRAINT pk_co_detalle_respuestas PRIMARY KEY (co_detalle_respuestas);


--
-- Name: pk_criterios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY criterios
    ADD CONSTRAINT pk_criterios PRIMARY KEY (co_criterio);


--
-- Name: pk_estado_evaluacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_evaluacion
    ADD CONSTRAINT pk_estado_evaluacion PRIMARY KEY (id_estado_evaluacion);


--
-- Name: pk_evaluacion_general; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evaluacion_general
    ADD CONSTRAINT pk_evaluacion_general PRIMARY KEY (id_evaluacion_general);


--
-- Name: pk_factores; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY factores
    ADD CONSTRAINT pk_factores PRIMARY KEY (co_factor);


--
-- Name: pk_id_bitacora_evaluacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bitacora_evaluacion
    ADD CONSTRAINT pk_id_bitacora_evaluacion PRIMARY KEY (id_bitacora_evaluacion);


--
-- Name: pk_id_evaluado; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evaluados
    ADD CONSTRAINT pk_id_evaluado PRIMARY KEY (id_evaluado);


--
-- Name: pk_id_evaluadores; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evaluadores
    ADD CONSTRAINT pk_id_evaluadores PRIMARY KEY (id_evaluador);


--
-- Name: pk_periodos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY periodos
    ADD CONSTRAINT pk_periodos PRIMARY KEY (id_periodos);


--
-- Name: pk_rango; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rango
    ADD CONSTRAINT pk_rango PRIMARY KEY (id_rango);


--
-- Name: fki_co_factor; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_factor ON detalle_respuestas USING btree (co_factor);


--
-- Name: fki_id_evaluacion_general; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_id_evaluacion_general ON bitacora_evaluacion USING btree (id_evaluacion_general);


--
-- Name: fki_id_evaluacion_general_respuestas; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_id_evaluacion_general_respuestas ON detalle_respuestas USING btree (id_evaluacion_general);


--
-- Name: fki_id_evaluador; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_id_evaluador ON evaluados USING btree (id_evaluador);


--
-- Name: fki_id_periodo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_id_periodo ON bitacora_evaluacion USING btree (id_periodos);


--
-- Name: fki_id_periodos; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_id_periodos ON bitacora_evaluacion USING btree (id_periodos);


--
-- Name: fki_periodo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_periodo ON evaluadores USING btree (periodo);


--
-- Name: fki_periodo1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_periodo1 ON evaluados USING btree (periodo);


--
-- Name: fki_periodos; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_periodos ON evaluacion_general USING btree (periodo);


--
-- Name: fki_rango; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_rango ON evaluacion_general USING btree (id_rango);


--
-- Name: fk_co_criterio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_respuestas
    ADD CONSTRAINT fk_co_criterio FOREIGN KEY (co_criterio) REFERENCES criterios(co_criterio);


--
-- Name: fk_co_factor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_respuestas
    ADD CONSTRAINT fk_co_factor FOREIGN KEY (co_factor) REFERENCES factores(co_factor);


--
-- Name: fk_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluacion_general
    ADD CONSTRAINT fk_estado FOREIGN KEY (estado) REFERENCES estado_evaluacion(id_estado_evaluacion);


--
-- Name: fk_evaluado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluacion_general
    ADD CONSTRAINT fk_evaluado FOREIGN KEY (id_evaluado) REFERENCES evaluados(id_evaluado);


--
-- Name: fk_evaluador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluacion_general
    ADD CONSTRAINT fk_evaluador FOREIGN KEY (id_evaluador) REFERENCES evaluadores(id_evaluador);


--
-- Name: fk_factor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY criterios
    ADD CONSTRAINT fk_factor FOREIGN KEY (co_factor) REFERENCES factores(co_factor);


--
-- Name: fk_id_evaluacion_general; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora_evaluacion
    ADD CONSTRAINT fk_id_evaluacion_general FOREIGN KEY (id_evaluacion_general) REFERENCES evaluacion_general(id_evaluacion_general);


--
-- Name: fk_id_evaluacion_general_respuestas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_respuestas
    ADD CONSTRAINT fk_id_evaluacion_general_respuestas FOREIGN KEY (id_evaluacion_general) REFERENCES evaluacion_general(id_evaluacion_general);


--
-- Name: fk_id_evaluador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluados
    ADD CONSTRAINT fk_id_evaluador FOREIGN KEY (id_evaluador) REFERENCES evaluadores(id_evaluador);


--
-- Name: fk_periodos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluacion_general
    ADD CONSTRAINT fk_periodos FOREIGN KEY (periodo) REFERENCES periodos(id_periodos);


--
-- Name: fk_rango; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evaluacion_general
    ADD CONSTRAINT fk_rango FOREIGN KEY (id_rango) REFERENCES rango(id_rango);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: bitacora_evaluacion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE bitacora_evaluacion FROM PUBLIC;
REVOKE ALL ON TABLE bitacora_evaluacion FROM postgres;
GRANT ALL ON TABLE bitacora_evaluacion TO postgres;


--
-- Name: conf; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE conf FROM PUBLIC;
REVOKE ALL ON TABLE conf FROM postgres;
GRANT ALL ON TABLE conf TO postgres;


--
-- Name: criterios; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE criterios FROM PUBLIC;
REVOKE ALL ON TABLE criterios FROM postgres;
GRANT ALL ON TABLE criterios TO postgres;


--
-- Name: detalle_respuestas; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE detalle_respuestas FROM PUBLIC;
REVOKE ALL ON TABLE detalle_respuestas FROM postgres;
GRANT ALL ON TABLE detalle_respuestas TO postgres;


--
-- Name: estado_evaluacion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE estado_evaluacion FROM PUBLIC;
REVOKE ALL ON TABLE estado_evaluacion FROM postgres;
GRANT ALL ON TABLE estado_evaluacion TO postgres;
GRANT ALL ON TABLE estado_evaluacion TO PUBLIC;


--
-- Name: evaluacion_general; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE evaluacion_general FROM PUBLIC;
REVOKE ALL ON TABLE evaluacion_general FROM postgres;
GRANT ALL ON TABLE evaluacion_general TO postgres;
GRANT ALL ON TABLE evaluacion_general TO PUBLIC;


--
-- Name: evaluadores; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE evaluadores FROM PUBLIC;
REVOKE ALL ON TABLE evaluadores FROM postgres;
GRANT ALL ON TABLE evaluadores TO postgres;


--
-- Name: evaluados; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE evaluados FROM PUBLIC;
REVOKE ALL ON TABLE evaluados FROM postgres;
GRANT ALL ON TABLE evaluados TO postgres;


--
-- Name: factores; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE factores FROM PUBLIC;
REVOKE ALL ON TABLE factores FROM postgres;
GRANT ALL ON TABLE factores TO postgres;


--
-- Name: periodos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE periodos FROM PUBLIC;
REVOKE ALL ON TABLE periodos FROM postgres;
GRANT ALL ON TABLE periodos TO postgres;


--
-- Name: rango; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE rango FROM PUBLIC;
REVOKE ALL ON TABLE rango FROM postgres;
GRANT ALL ON TABLE rango TO postgres;
GRANT ALL ON TABLE rango TO PUBLIC;


--
-- Name: tmp_v_datos_personales_evaluacion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tmp_v_datos_personales_evaluacion FROM PUBLIC;
REVOKE ALL ON TABLE tmp_v_datos_personales_evaluacion FROM postgres;
GRANT ALL ON TABLE tmp_v_datos_personales_evaluacion TO postgres;


--
-- PostgreSQL database dump complete
--

