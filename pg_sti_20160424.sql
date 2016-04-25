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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: c004t_acta_aie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c004t_acta_aie (
    co_aie bigint NOT NULL,
    fe_emision date,
    co_forense bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_elabora bigint,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    in_registro boolean,
    tx_cladificacion character varying
);


ALTER TABLE public.c004t_acta_aie OWNER TO postgres;

--
-- Name: c004t_acta_aie_co_aie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c004t_acta_aie_co_aie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c004t_acta_aie_co_aie_seq OWNER TO postgres;

--
-- Name: c004t_acta_aie_co_aie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c004t_acta_aie_co_aie_seq OWNED BY c004t_acta_aie.co_aie;


--
-- Name: c024t_recurso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c024t_recurso (
    tx_descripcion character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint,
    co_recurso bigint NOT NULL
);


ALTER TABLE public.c024t_recurso OWNER TO postgres;

--
-- Name: c024t_recurso_co_recurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c024t_recurso_co_recurso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c024t_recurso_co_recurso_seq OWNER TO postgres;

--
-- Name: c024t_recurso_co_recurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c024t_recurso_co_recurso_seq OWNED BY c024t_recurso.co_recurso;


--
-- Name: j001t_alcance_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j001t_alcance_forense (
    co_alcance_forense bigint NOT NULL,
    tx_descripcion character varying
);


ALTER TABLE public.j001t_alcance_forense OWNER TO postgres;

--
-- Name: j001t_menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j001t_menu (
    co_menu bigint NOT NULL,
    tx_menu character varying,
    co_padre bigint,
    tx_href character varying,
    tx_icono character varying,
    nu_orden bigint,
    tx_sigla character varying
);


ALTER TABLE public.j001t_menu OWNER TO postgres;

--
-- Name: j001t_menu_co_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j001t_menu_co_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j001t_menu_co_menu_seq OWNER TO postgres;

--
-- Name: j001t_menu_co_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j001t_menu_co_menu_seq OWNED BY j001t_menu.co_menu;


--
-- Name: j002t_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j002t_usuario (
    co_usuario bigint NOT NULL,
    tx_indicador character varying,
    nb_empleado character varying,
    ap_empleado character varying,
    co_division bigint,
    co_rol bigint,
    co_region bigint,
    co_negocio bigint
);


ALTER TABLE public.j002t_usuario OWNER TO postgres;

--
-- Name: j002t_usuario_co_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j002t_usuario_co_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j002t_usuario_co_usuario_seq OWNER TO postgres;

--
-- Name: j002t_usuario_co_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j002t_usuario_co_usuario_seq OWNED BY j002t_usuario.co_usuario;


--
-- Name: j003t_rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j003t_rol (
    co_rol bigint NOT NULL,
    tx_rol character varying
);


ALTER TABLE public.j003t_rol OWNER TO postgres;

--
-- Name: j003_rol_co_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j003_rol_co_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j003_rol_co_rol_seq OWNER TO postgres;

--
-- Name: j003_rol_co_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j003_rol_co_rol_seq OWNED BY j003t_rol.co_rol;


--
-- Name: j004t_rol_menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j004t_rol_menu (
    co_rol_menu bigint NOT NULL,
    co_rol bigint,
    co_menu bigint,
    in_ver boolean
);


ALTER TABLE public.j004t_rol_menu OWNER TO postgres;

--
-- Name: j004t_rol_menu_co_rol_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j004t_rol_menu_co_rol_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j004t_rol_menu_co_rol_menu_seq OWNER TO postgres;

--
-- Name: j004t_rol_menu_co_rol_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j004t_rol_menu_co_rol_menu_seq OWNED BY j004t_rol_menu.co_rol_menu;


--
-- Name: j005t_transaccion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j005t_transaccion (
    co_transaccion bigint NOT NULL,
    fe_transaccion date,
    co_usuario bigint,
    tx_ruta character varying,
    nb_archivo character varying
);


ALTER TABLE public.j005t_transaccion OWNER TO postgres;

--
-- Name: j005t_transaccion_co_transaccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j005t_transaccion_co_transaccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j005t_transaccion_co_transaccion_seq OWNER TO postgres;

--
-- Name: j005t_transaccion_co_transaccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j005t_transaccion_co_transaccion_seq OWNED BY j005t_transaccion.co_transaccion;


--
-- Name: j006t_solicitud; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j006t_solicitud (
    co_solicitud bigint NOT NULL,
    tx_serial character varying,
    tx_solicitud character varying,
    fe_solicitud date,
    co_tipo_solicitud bigint,
    archivo bytea,
    mime character varying,
    co_transaccion bigint,
    co_usuario bigint,
    co_region bigint,
    tx_ruta character varying,
    nb_archivo character varying
);


ALTER TABLE public.j006t_solicitud OWNER TO postgres;

--
-- Name: j006t_solicitud_co_solicitud_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j006t_solicitud_co_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j006t_solicitud_co_solicitud_seq OWNER TO postgres;

--
-- Name: j006t_solicitud_co_solicitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j006t_solicitud_co_solicitud_seq OWNED BY j006t_solicitud.co_solicitud;


--
-- Name: j007t_region; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j007t_region (
    co_region bigint NOT NULL,
    tx_region character varying,
    tx_sigla character varying
);


ALTER TABLE public.j007t_region OWNER TO postgres;

--
-- Name: j007t_region_co_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j007t_region_co_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j007t_region_co_region_seq OWNER TO postgres;

--
-- Name: j007t_region_co_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j007t_region_co_region_seq OWNED BY j007t_region.co_region;


--
-- Name: j008t_division; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j008t_division (
    co_division bigint NOT NULL,
    tx_division character varying,
    tx_sigla character varying,
    co_negocio bigint
);


ALTER TABLE public.j008t_division OWNER TO postgres;

--
-- Name: j008t_division_co_division_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j008t_division_co_division_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j008t_division_co_division_seq OWNER TO postgres;

--
-- Name: j008t_division_co_division_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j008t_division_co_division_seq OWNED BY j008t_division.co_division;


--
-- Name: j009t_serial; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j009t_serial (
    co_tp_documento bigint,
    nu_serial bigint,
    nu_anio numeric,
    co_serial bigint NOT NULL,
    tx_nomenclatura character varying,
    co_region bigint
);


ALTER TABLE public.j009t_serial OWNER TO postgres;

--
-- Name: j009t_serial_co_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j009t_serial_co_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j009t_serial_co_serial_seq OWNER TO postgres;

--
-- Name: j009t_serial_co_serial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j009t_serial_co_serial_seq OWNED BY j009t_serial.co_serial;


--
-- Name: j010t_evaluacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j010t_evaluacion (
    co_evaluacion bigint NOT NULL,
    tx_serial character varying,
    tx_titulo character varying,
    fe_evaluacion date,
    co_transaccion bigint,
    co_usuario bigint,
    co_region bigint,
    tx_ruta character varying,
    nb_archivo character varying,
    co_solicitud bigint
);


ALTER TABLE public.j010t_evaluacion OWNER TO postgres;

--
-- Name: j010t_evaluacion_co_evaluacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j010t_evaluacion_co_evaluacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j010t_evaluacion_co_evaluacion_seq OWNER TO postgres;

--
-- Name: j010t_evaluacion_co_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j010t_evaluacion_co_evaluacion_seq OWNED BY j010t_evaluacion.co_evaluacion;


--
-- Name: j011t_vulnerabilidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j011t_vulnerabilidad (
    co_vulnerabilidad bigint NOT NULL,
    tx_vulnerabilidad character varying,
    fe_vulnerabilidad date,
    co_transaccion bigint NOT NULL,
    in_aplicacion boolean,
    in_cerrado boolean
);


ALTER TABLE public.j011t_vulnerabilidad OWNER TO postgres;

--
-- Name: j011t_vulnerabilidad_co_vulnerabilidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j011t_vulnerabilidad_co_vulnerabilidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j011t_vulnerabilidad_co_vulnerabilidad_seq OWNER TO postgres;

--
-- Name: j011t_vulnerabilidad_co_vulnerabilidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j011t_vulnerabilidad_co_vulnerabilidad_seq OWNED BY j011t_vulnerabilidad.co_vulnerabilidad;


--
-- Name: j012t_cronograma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j012t_cronograma (
    co_cronograma bigint NOT NULL,
    tx_descripcion character varying,
    fe_cronograma date,
    co_transaccion_enlace bigint,
    co_transaccion bigint,
    tx_serial character varying,
    co_usuario bigint
);


ALTER TABLE public.j012t_cronograma OWNER TO postgres;

--
-- Name: j012t_cronograma_co_cronograma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j012t_cronograma_co_cronograma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j012t_cronograma_co_cronograma_seq OWNER TO postgres;

--
-- Name: j012t_cronograma_co_cronograma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j012t_cronograma_co_cronograma_seq OWNED BY j012t_cronograma.co_cronograma;


--
-- Name: j013t_vul_cronograma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j013t_vul_cronograma (
    co_vulnerabilidad bigint NOT NULL,
    co_cronograma bigint NOT NULL,
    in_cerrada boolean,
    co_vul_cronograma bigint NOT NULL
);


ALTER TABLE public.j013t_vul_cronograma OWNER TO postgres;

--
-- Name: j013t_vul_cronograma_co_vul_cronograma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j013t_vul_cronograma_co_vul_cronograma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j013t_vul_cronograma_co_vul_cronograma_seq OWNER TO postgres;

--
-- Name: j013t_vul_cronograma_co_vul_cronograma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j013t_vul_cronograma_co_vul_cronograma_seq OWNED BY j013t_vul_cronograma.co_vul_cronograma;


--
-- Name: j014t_negocio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j014t_negocio (
    co_negocio bigint NOT NULL,
    tx_negocio character varying,
    tx_sigla character varying
);


ALTER TABLE public.j014t_negocio OWNER TO postgres;

--
-- Name: j014t_negocio_co_negocio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j014t_negocio_co_negocio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j014t_negocio_co_negocio_seq OWNER TO postgres;

--
-- Name: j014t_negocio_co_negocio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j014t_negocio_co_negocio_seq OWNED BY j014t_negocio.co_negocio;


--
-- Name: j015t_region_negocio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j015t_region_negocio (
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_region_negocio bigint NOT NULL,
    co_division bigint
);


ALTER TABLE public.j015t_region_negocio OWNER TO postgres;

--
-- Name: j016t_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j016t_forense (
    co_forense bigint NOT NULL,
    fe_apertura date,
    fe_cierre date,
    co_usuario_apertura bigint,
    co_usuario_cierre bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    in_abierto boolean,
    tx_descripcion_solicitud character varying,
    tx_caso_aaii character varying,
    co_alcance_forense bigint,
    tx_descripcion_entorno character varying,
    tx_metologia_herramientas character varying,
    tx_observaciones character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint
);


ALTER TABLE public.j016t_forense OWNER TO postgres;

--
-- Name: j016t_forense_co_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j016t_forense_co_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j016t_forense_co_forense_seq OWNER TO postgres;

--
-- Name: j016t_forense_co_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j016t_forense_co_forense_seq OWNED BY j016t_forense.co_forense;


--
-- Name: j017t_alcance_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j017t_alcance_forense (
    co_alcance_forense bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at date,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j017t_alcance_forense OWNER TO postgres;

--
-- Name: j018t_informe_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j018t_informe_forense (
    co_informe_forense bigint NOT NULL,
    fe_emision date,
    co_forense bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_revisa bigint,
    co_aprueba bigint,
    tx_resultados character varying,
    tx_conclusiones character varying,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint
);


ALTER TABLE public.j018t_informe_forense OWNER TO postgres;

--
-- Name: j018t_informe_forense_co_informe_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j018t_informe_forense_co_informe_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j018t_informe_forense_co_informe_forense_seq OWNER TO postgres;

--
-- Name: j018t_informe_forense_co_informe_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j018t_informe_forense_co_informe_forense_seq OWNED BY j018t_informe_forense.co_informe_forense;


--
-- Name: j019t_participantes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j019t_participantes (
    co_participante bigint NOT NULL,
    co_usuario_elabora bigint,
    co_forense bigint,
    co_informe_recomendaciones bigint,
    co_informe_incidente bigint,
    co_informe_forense bigint,
    co_informe_depuracion bigint,
    co_mantenimiento bigint,
    co_doumento_normativo bigint
);


ALTER TABLE public.j019t_participantes OWNER TO postgres;

--
-- Name: j020t_acta_acc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j020t_acta_acc (
    co_acc bigint NOT NULL,
    fe_emision date,
    co_forense bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_elabora bigint,
    fe_destruye date,
    co_destruye bigint,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint,
    in_abierta boolean
);


ALTER TABLE public.j020t_acta_acc OWNER TO postgres;

--
-- Name: j020t_acta_acc_co_acc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j020t_acta_acc_co_acc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j020t_acta_acc_co_acc_seq OWNER TO postgres;

--
-- Name: j020t_acta_acc_co_acc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j020t_acta_acc_co_acc_seq OWNED BY j020t_acta_acc.co_acc;


--
-- Name: j021t_acta_aie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j021t_acta_aie (
    co_aie bigint NOT NULL,
    fe_emision date,
    co_forense bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_elabora bigint,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint
);


ALTER TABLE public.j021t_acta_aie OWNER TO postgres;

--
-- Name: j021t_acta_aie_co_aie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j021t_acta_aie_co_aie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j021t_acta_aie_co_aie_seq OWNER TO postgres;

--
-- Name: j021t_acta_aie_co_aie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j021t_acta_aie_co_aie_seq OWNED BY j021t_acta_aie.co_aie;


--
-- Name: j022t_acta_anie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j022t_acta_anie (
    co_anie bigint NOT NULL,
    fe_emision date,
    co_forense bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_elabora bigint,
    co_custodio_niega bigint,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint,
    in_abierta boolean
);


ALTER TABLE public.j022t_acta_anie OWNER TO postgres;

--
-- Name: j022t_acta_anie_co_anie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j022t_acta_anie_co_anie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j022t_acta_anie_co_anie_seq OWNER TO postgres;

--
-- Name: j022t_acta_anie_co_anie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j022t_acta_anie_co_anie_seq OWNED BY j022t_acta_anie.co_anie;


--
-- Name: j023t_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j023t_evidencia (
    co_evidencia bigint NOT NULL,
    fe_registro date,
    co_registro bigint,
    co_acc bigint,
    co_aie bigint,
    tx_descripcion_coleccion text,
    fe_coleccion_evidencia date,
    co_colecta bigint,
    co_recurso bigint,
    tx_nombre_recurso bigint,
    tx_serial_recurso bigint,
    tx_marca_recurso text,
    tx_modelo_recurso bigint,
    tx_numero_activo bigint,
    co_tipo_evidencia bigint,
    co_estado_evidencia bigint,
    co_lugar_seguro bigint,
    co_repositorio bigint,
    co_custodio_sti bigint,
    tx_observaciones text,
    update_at timestamp without time zone,
    co_update_at bigint
);


ALTER TABLE public.j023t_evidencia OWNER TO postgres;

--
-- Name: j025t_tipo_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j025t_tipo_evidencia (
    co_tipo_evidencia bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j025t_tipo_evidencia OWNER TO postgres;

--
-- Name: j026t_estado_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j026t_estado_evidencia (
    co_estado_evidencia bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j026t_estado_evidencia OWNER TO postgres;

--
-- Name: j027t_lugar_seguro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j027t_lugar_seguro (
    co_lugar_seguro bigint NOT NULL,
    tx_ubicacion_fisica character varying,
    tx_gerencia_custodia character varying,
    co_custodio bigint,
    tx_observaciones character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j027t_lugar_seguro OWNER TO postgres;

--
-- Name: j028t_repositorio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j028t_repositorio (
    co_repositorio bigint NOT NULL,
    tx_nombre character varying,
    tx_direccion_ip character varying,
    co_custodio bigint,
    tx_observaciones character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j028t_repositorio OWNER TO postgres;

--
-- Name: j029t_historico_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j029t_historico_evidencia (
    co_historico_evidencia bigint,
    co_evidencia bigint,
    fe_cambio_estado date,
    co_cambia_estado bigint,
    tx_estado_anterior character varying,
    tx_lugar_anterior character varying,
    tx_custodio_anterior character varying,
    tx_repositorio_anterior character varying,
    tx_observaciones character varying,
    update_at timestamp without time zone
);


ALTER TABLE public.j029t_historico_evidencia OWNER TO postgres;

--
-- Name: j030t_informe_recomendaciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j030t_informe_recomendaciones (
    co_informe_recomendaciones bigint NOT NULL,
    fe_emision date,
    co_accion bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_revisa bigint,
    co_aprueba bigint,
    tx_resumen_ejecutivo character varying,
    tx_antecedentes text,
    tx_situacion_actual text,
    tx_preocupacion text,
    tx_recomendaciones text,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint
);


ALTER TABLE public.j030t_informe_recomendaciones OWNER TO postgres;

--
-- Name: j030t_informe_recomendaciones_co_informe_recomendaciones_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j030t_informe_recomendaciones_co_informe_recomendaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j030t_informe_recomendaciones_co_informe_recomendaciones_seq OWNER TO postgres;

--
-- Name: j030t_informe_recomendaciones_co_informe_recomendaciones_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j030t_informe_recomendaciones_co_informe_recomendaciones_seq OWNED BY j030t_informe_recomendaciones.co_informe_recomendaciones;


--
-- Name: j031t_accion_recomendada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j031t_accion_recomendada (
    co_accion bigint NOT NULL,
    tx_descripcion character varying,
    tx_responsable_ejecutar character varying,
    co_responsable_sti_ejecutar bigint,
    fecha_a_ejecutar date,
    fecha_ejecutada date,
    tx_seguimiento text,
    tx_observaciones character varying,
    in_abierto boolean,
    created_at date,
    co_created_at bigint,
    updated_at timestamp without time zone,
    co_update_at bigint,
    co_incidente bigint,
    co_forense bigint,
    co_monitoreo bigint,
    co_depuracion bigint
);


ALTER TABLE public.j031t_accion_recomendada OWNER TO postgres;

--
-- Name: j032t_seriales_enlaces_ir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j032t_seriales_enlaces_ir (
    co_enlaces_ir bigint NOT NULL,
    co_informe_recomendaciones bigint,
    co_forense bigint,
    co_incidente bigint,
    co_depuracion bigint
);


ALTER TABLE public.j032t_seriales_enlaces_ir OWNER TO postgres;

--
-- Name: j033t_procesos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j033t_procesos (
    co_proceso bigint NOT NULL,
    tx_proceso character varying,
    tx_sigla character varying
);


ALTER TABLE public.j033t_procesos OWNER TO postgres;

--
-- Name: j033t_procesos_co_proceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j033t_procesos_co_proceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j033t_procesos_co_proceso_seq OWNER TO postgres;

--
-- Name: j033t_procesos_co_proceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j033t_procesos_co_proceso_seq OWNED BY j033t_procesos.co_proceso;


--
-- Name: j034t_incidente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j034t_incidente (
    co_incidente bigint NOT NULL,
    fe_apertura date,
    fe_escalado date,
    fe_cierre date,
    co_usuario_apertura bigint,
    co_usuario_escala bigint,
    co_usuario_cierre bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_estado bigint,
    co_tipo_incidente bigint,
    co_tipo_hecho bigint,
    tx_descripcion character varying,
    fe_incio_hecho date,
    fe_fin_hecho date,
    tx_causa character varying,
    tx_metologia_herramientas character varying,
    tx_observaciones character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint,
    tx_acciones_tomadas character varying
);


ALTER TABLE public.j034t_incidente OWNER TO postgres;

--
-- Name: j034t_incidente_co_incidente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j034t_incidente_co_incidente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j034t_incidente_co_incidente_seq OWNER TO postgres;

--
-- Name: j034t_incidente_co_incidente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j034t_incidente_co_incidente_seq OWNED BY j034t_incidente.co_incidente;


--
-- Name: j035t_servicios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j035t_servicios (
    co_servicios bigint NOT NULL,
    tx_servicio character varying,
    tx_valor_impacto bigint,
    co_created_at bigint,
    co_updated_at bigint,
    created_at date,
    update_at timestamp without time zone
);


ALTER TABLE public.j035t_servicios OWNER TO postgres;

--
-- Name: j036t_principio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j036t_principio (
    co_principio bigint NOT NULL,
    tx_principio character varying,
    tx_descripcion character varying
);


ALTER TABLE public.j036t_principio OWNER TO postgres;

--
-- Name: j037t_incidente_principio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j037t_incidente_principio (
    co_incidente_principio bigint NOT NULL,
    co_incidente bigint,
    co_principio bigint
);


ALTER TABLE public.j037t_incidente_principio OWNER TO postgres;

--
-- Name: j038t_incidente_servicios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j038t_incidente_servicios (
    co_incidente_servicios bigint NOT NULL,
    co_incidente bigint,
    co_servicios bigint
);


ALTER TABLE public.j038t_incidente_servicios OWNER TO postgres;

--
-- Name: j039t_herramienta_utilizada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j039t_herramienta_utilizada (
    co_herramienta_utilizada bigint,
    co_herramientas bigint,
    co_incidente bigint,
    co_forense bigint,
    co_inventario bigint,
    co_created_at bigint,
    co_updated_at bigint,
    created_at date,
    update_at timestamp without time zone
);


ALTER TABLE public.j039t_herramienta_utilizada OWNER TO postgres;

--
-- Name: j040t_tipo_herramientas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j040t_tipo_herramientas (
    co_tipo_herramientas bigint NOT NULL,
    tx_tipo_herramienta bigint,
    co_created_at bigint,
    co_update_at bigint,
    created_at date,
    updated_at timestamp without time zone
);


ALTER TABLE public.j040t_tipo_herramientas OWNER TO postgres;

--
-- Name: j041t_herramientas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j041t_herramientas (
    co_herramientas bigint NOT NULL,
    tx_herramienta bigint,
    co_tipo_herramientas bigint,
    created_at date,
    updated_at timestamp without time zone
);


ALTER TABLE public.j041t_herramientas OWNER TO postgres;

--
-- Name: j042t_estado_incidente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j042t_estado_incidente (
    co_estado_incidente bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j042t_estado_incidente OWNER TO postgres;

--
-- Name: j043t_tipo_incidentes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j043t_tipo_incidentes (
    co_tipo_incidentes bigint NOT NULL,
    co_created_at bigint,
    co_update_at bigint,
    created_at date,
    updated_at timestamp without time zone,
    tx_tipo_incidentes character varying
);


ALTER TABLE public.j043t_tipo_incidentes OWNER TO postgres;

--
-- Name: j044t_tipo_hechos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j044t_tipo_hechos (
    co_tipo_hechos bigint NOT NULL,
    co_created_at bigint,
    co_update_at bigint,
    created_at date,
    updated_at timestamp without time zone,
    tx_tipo_hechos character varying,
    co_tipo_incidente bigint
);


ALTER TABLE public.j044t_tipo_hechos OWNER TO postgres;

--
-- Name: j045t_referencia_marco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j045t_referencia_marco (
    co_referencia_marco bigint NOT NULL,
    co_marco_normativo bigint,
    co_incidente bigint,
    co_recomendaciones bigint,
    co_monitoreo bigint,
    co_forense bigint,
    co_depuracion bigint,
    co_cumple boolean,
    co_accion bigint
);


ALTER TABLE public.j045t_referencia_marco OWNER TO postgres;

--
-- Name: j046t_marco_normativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j046t_marco_normativo (
    co_marco_normativo bigint NOT NULL,
    co_documento bigint,
    tx_codigo_marco character varying,
    tx_descripcion bigint,
    co_created_at bigint,
    co_updated_at bigint,
    created_at date,
    update_at timestamp without time zone
);


ALTER TABLE public.j046t_marco_normativo OWNER TO postgres;

--
-- Name: j047t_documento_normativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j047t_documento_normativo (
    co_documento_normativo bigint NOT NULL,
    co_tipo_marco bigint,
    tx_titulo character varying,
    tx_descripcion character varying,
    tx_revision bigint,
    co_estado bigint,
    fe_aprueba1 date,
    co_aprueba1 bigint,
    fe_aprueba2 date,
    co_aprueba2 bigint,
    fe_elimina1 date,
    co_elimina1 bigint,
    fe_elimina2 date,
    co_elimina2 bigint,
    tx_observaciones text,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j047t_documento_normativo OWNER TO postgres;

--
-- Name: j048t_estado_documento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j048t_estado_documento (
    co_estado_documento bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j048t_estado_documento OWNER TO postgres;

--
-- Name: j049t_tipo_marco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j049t_tipo_marco (
    co_tipo_marco bigint NOT NULL,
    tx_descripcion character varying,
    tx_siglas character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j049t_tipo_marco OWNER TO postgres;

--
-- Name: j050t_informe_marco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j050t_informe_marco (
    co_informe_marco bigint NOT NULL,
    fe_emision date,
    tx_serial character varying,
    co_tipo_revision bigint,
    tx_version bigint,
    co_tipo_documento bigint,
    tx_titulo character varying,
    co_justificacion bigint,
    tx_justificacion character varying,
    tx_descripcion text,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint
);


ALTER TABLE public.j050t_informe_marco OWNER TO postgres;

--
-- Name: j050t_informe_marco_co_informe_marco_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j050t_informe_marco_co_informe_marco_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j050t_informe_marco_co_informe_marco_seq OWNER TO postgres;

--
-- Name: j050t_informe_marco_co_informe_marco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j050t_informe_marco_co_informe_marco_seq OWNED BY j050t_informe_marco.co_informe_marco;


--
-- Name: j051t_tipo_revision; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j051t_tipo_revision (
    co_tipo_revision bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at date,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j051t_tipo_revision OWNER TO postgres;

--
-- Name: j052t_tipo_justificacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j052t_tipo_justificacion (
    co_tipo_justificacion bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at date,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j052t_tipo_justificacion OWNER TO postgres;

--
-- Name: negocio_division; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW negocio_division AS
 SELECT j014t_negocio.tx_negocio AS "Negocio",
    j008t_division.tx_division AS "Division"
   FROM j014t_negocio,
    j008t_division
  WHERE (j014t_negocio.co_negocio = j008t_division.co_negocio)
  ORDER BY j014t_negocio.co_negocio;


ALTER TABLE public.negocio_division OWNER TO postgres;

--
-- Name: co_aie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie ALTER COLUMN co_aie SET DEFAULT nextval('c004t_acta_aie_co_aie_seq'::regclass);


--
-- Name: co_recurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c024t_recurso ALTER COLUMN co_recurso SET DEFAULT nextval('c024t_recurso_co_recurso_seq'::regclass);


--
-- Name: co_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j001t_menu ALTER COLUMN co_menu SET DEFAULT nextval('j001t_menu_co_menu_seq'::regclass);


--
-- Name: co_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_usuario ALTER COLUMN co_usuario SET DEFAULT nextval('j002t_usuario_co_usuario_seq'::regclass);


--
-- Name: co_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j003t_rol ALTER COLUMN co_rol SET DEFAULT nextval('j003_rol_co_rol_seq'::regclass);


--
-- Name: co_rol_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j004t_rol_menu ALTER COLUMN co_rol_menu SET DEFAULT nextval('j004t_rol_menu_co_rol_menu_seq'::regclass);


--
-- Name: co_transaccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j005t_transaccion ALTER COLUMN co_transaccion SET DEFAULT nextval('j005t_transaccion_co_transaccion_seq'::regclass);


--
-- Name: co_solicitud; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_solicitud ALTER COLUMN co_solicitud SET DEFAULT nextval('j006t_solicitud_co_solicitud_seq'::regclass);


--
-- Name: co_region; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j007t_region ALTER COLUMN co_region SET DEFAULT nextval('j007t_region_co_region_seq'::regclass);


--
-- Name: co_division; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j008t_division ALTER COLUMN co_division SET DEFAULT nextval('j008t_division_co_division_seq'::regclass);


--
-- Name: co_serial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j009t_serial ALTER COLUMN co_serial SET DEFAULT nextval('j009t_serial_co_serial_seq'::regclass);


--
-- Name: co_evaluacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j010t_evaluacion ALTER COLUMN co_evaluacion SET DEFAULT nextval('j010t_evaluacion_co_evaluacion_seq'::regclass);


--
-- Name: co_vulnerabilidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j011t_vulnerabilidad ALTER COLUMN co_vulnerabilidad SET DEFAULT nextval('j011t_vulnerabilidad_co_vulnerabilidad_seq'::regclass);


--
-- Name: co_cronograma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j012t_cronograma ALTER COLUMN co_cronograma SET DEFAULT nextval('j012t_cronograma_co_cronograma_seq'::regclass);


--
-- Name: co_vul_cronograma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j013t_vul_cronograma ALTER COLUMN co_vul_cronograma SET DEFAULT nextval('j013t_vul_cronograma_co_vul_cronograma_seq'::regclass);


--
-- Name: co_negocio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j014t_negocio ALTER COLUMN co_negocio SET DEFAULT nextval('j014t_negocio_co_negocio_seq'::regclass);


--
-- Name: co_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense ALTER COLUMN co_forense SET DEFAULT nextval('j016t_forense_co_forense_seq'::regclass);


--
-- Name: co_informe_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense ALTER COLUMN co_informe_forense SET DEFAULT nextval('j018t_informe_forense_co_informe_forense_seq'::regclass);


--
-- Name: co_acc; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc ALTER COLUMN co_acc SET DEFAULT nextval('j020t_acta_acc_co_acc_seq'::regclass);


--
-- Name: co_aie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie ALTER COLUMN co_aie SET DEFAULT nextval('j021t_acta_aie_co_aie_seq'::regclass);


--
-- Name: co_anie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie ALTER COLUMN co_anie SET DEFAULT nextval('j022t_acta_anie_co_anie_seq'::regclass);


--
-- Name: co_informe_recomendaciones; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones ALTER COLUMN co_informe_recomendaciones SET DEFAULT nextval('j030t_informe_recomendaciones_co_informe_recomendaciones_seq'::regclass);


--
-- Name: co_proceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j033t_procesos ALTER COLUMN co_proceso SET DEFAULT nextval('j033t_procesos_co_proceso_seq'::regclass);


--
-- Name: co_incidente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente ALTER COLUMN co_incidente SET DEFAULT nextval('j034t_incidente_co_incidente_seq'::regclass);


--
-- Name: co_informe_marco; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco ALTER COLUMN co_informe_marco SET DEFAULT nextval('j050t_informe_marco_co_informe_marco_seq'::regclass);


--
-- Data for Name: c004t_acta_aie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c004t_acta_aie (co_aie, fe_emision, co_forense, co_region, co_negocio, co_division, tx_serial, co_elabora, tx_observaciones, tx_ruta, nb_archivo, in_registro, tx_cladificacion) FROM stdin;
\.


--
-- Name: c004t_acta_aie_co_aie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c004t_acta_aie_co_aie_seq', 1, false);


--
-- Data for Name: c024t_recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c024t_recurso (tx_descripcion, created_at, update_at, co_usuario_created, co_usuario_updated, co_recurso) FROM stdin;
LAPTOP	\N	\N	\N	\N	1
DESKTOP	\N	\N	\N	\N	2
ALL IN ONE	\N	\N	\N	\N	3
DISCO DURO EXTERNO	\N	\N	\N	\N	4
TABLETA	\N	\N	\N	\N	5
TELEFONO	\N	\N	\N	\N	6
PENDRIVE	\N	\N	\N	\N	7
MEMORIA EXTERNA	\N	\N	\N	\N	8
CAMARA FOTOGRAFICA	\N	\N	\N	\N	9
CAMARA DE VIDEO	\N	\N	\N	\N	10
GPS	\N	\N	\N	\N	11
IMPRESORA	\N	\N	\N	\N	12
SERVIDOR	\N	\N	\N	\N	13
APLICACION	\N	\N	\N	\N	14
BASE DE DATOS	\N	\N	\N	\N	15
ROUTER	\N	\N	\N	\N	16
ROUTER INALAMBRICO	\N	\N	\N	\N	17
SWITCH	\N	\N	\N	\N	18
IDS / IPS	\N	\N	\N	\N	19
FIREWALL	\N	\N	\N	\N	20
FILTRADO DE CONTENIDO WEB	\N	\N	\N	\N	21
UPS	\N	\N	\N	\N	22
\.


--
-- Name: c024t_recurso_co_recurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c024t_recurso_co_recurso_seq', 22, true);


--
-- Data for Name: j001t_alcance_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j001t_alcance_forense (co_alcance_forense, tx_descripcion) FROM stdin;
\.


--
-- Data for Name: j001t_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j001t_menu (co_menu, tx_menu, co_padre, tx_href, tx_icono, nu_orden, tx_sigla) FROM stdin;
47	Permisologia de Acceso Logico	50	\N	\N	1	PAL
25	Lista de Chequeo para la Evaluación de Planes	5	\N	\N	6	\N
26	Lista de Chequeo para la Prueba de Planes	5	\N	\N	7	\N
52	Inventario de la Plataforma de Seguridad	48	\N	\N	1	\N
29	Bitácora	6	\N	\N	3	\N
30	Identificación de contenedores de medios de respaldo	6	\N	\N	4	\N
31	Autorización de traslado de medios de respaldo	6	J041tHerramientas	\N	5	\N
32	Bitácora de entrada/salida de medios de respaldo	6	\N	\N	6	\N
33	Pruebas de Respaldo de Data Crítica	6	\N	\N	7	\N
34	Acta Escenarios de Contingencia	6	\N	\N	8	\N
35	Cronograma de Mitigación de Vulnerabilidades	4	\N	\N	3	CMV
27	Claves de Máximo Privilegio	6	\N	\N	1	CMP
22	Plan de Contingencia	5	\N	\N	3	PC
23	Plan Operativo	5	\N	\N	4	PO
1	Evaluación de STI	36	../../	AS	1	ESTI
18	Solicitud de Análisis de Riesgo Lógico	4	\N	\N	1	SARL
19	Informe de Análisis de Riesgo Lógico	4	\N	\N	2	IARL
20	Solicitud de Planes de Continuidad	5	\N	\N	1	SPC
13	Solicitud de Autorización de Análisis de Impacto	3	\N	\N	1	SAI
58	Control Licencias Lenel	50	\N	\N	3	\N
53	Planes de Contigencia de la Plataforma de Seguridad	48	\N	\N	3	\N
54	Mantenimientos de la Plataforma de Seguridad	48	\N	\N	2	\N
55	Planes Operativos de la Plataforma de Seguridad	48	\N	\N	3	\N
38	Incidentes de Seguridad	37	\N	\N	1	IS
50	Control de Acceso Logico	37	\N	\N	4	\N
48	Gestion de Plataforma de Seguridad	37	\N	\N	5	IPS
70	Regiones STI	67	J007tRegion	\N	2	\N
65	Lugares para Resguardo de Evidencias Fisicas	60	J027tLugarSeguro	\N	2	LREF
37	Protección Lógica	0	\N	\N	2	PL
66	Repositorios para Resguardo de Evidencias Digitales	60	J028tRepositorio	\N	1	RED
68	Negocios STI	67	J014tNegocio	\N	3	\N
15	Cuestionario de Análisis de Impacto 	3	\N	\N	3	\N
63	Tipos de Evidencias	60	J025tTipoEvidencia	\N	4	\N
59	Registro de Evidencias 	40	J023tEvidencia	\N	6	\N
64	Estados de las Evidencias	60	J026tEstadoEvidencia	\N	5	\N
69	Divisiones STI	67	J008tDivision	\N	4	\N
11	Autorización para Prueba de Penetración	2	\N	\N	1	APP
12	Informe de Prueba de Penetración	2	\N	\N	2	IPP
14	Informe de Análisis de Impacto	3	\N	\N	2	IAIP
16	Matriz de Impacto de Activos de Información	3	\N	\N	4	MIA
17	Matriz de Dependencia Activos Intangibles	3	\N	\N	5	MD
21	Plan Maestro de Continuidad	5	\N	\N	2	PMC
24	Informe de Evaluación/Prueba a Planes	5	\N	\N	5	IEPC
28	Identificación de sobre y seguimiento	6	\N	\N	2	SCMP
8	Solicitud de Evaluación de STI	1	IEL/solicitud	\N	1	SEL
9	Informe de Evaluación de STI.	1	IEL/listaInforme	\N	2	IEL
2	Prueba de Penetración	36	\N	\N	2	\N
3	Análisis de Impacto del Negocio	36	\N	\N	3	\N
4	Análisis de Riesgo Lógico	36	\N	\N	4	\N
5	Planes de Continuidad	36	\N	\N	5	\N
6	Resguardo de claves de máximo privilegio	36	\N	\N	6	\N
7	Traslado, Resguardo y Prueba de los medios de respaldo	36	\N	\N	7	\N
45	Informe de Analisis Forense	40	J018tInformeForense	\N	2	IAF
36	Evaluación,Respuesta y Contingencia	0	\N	\N	1	\N
44	Acta de Negación de Inspección de Equipos	40	J022tActaAnie	\N	5	ANIE
76	DM - Marco Normativo	73	\N	\N	7	\N
43	Acta de Inspección de Equipos	40	J021tActaAie	\N	4	AIE
42	Acta de Cadena de Custodia	40	J020tActaAcc	\N	3	ACC
39	Informe de Incidente de Seguridad	38	\N	\N	2	IIS
40	Analisis Forense	37	\N	\N	2	AF
46	Informe de Depuracion de Acceso Logico	50	\N	\N	2	IDAL
49	Registro de Analisis Forense	40	J016tForense 	\N	1	RAF
72	Negocios por Region	67	J015tRegionNegocio	\N	5	\N
57	Seguimiento de Acciones Recomendadas - AF	40	\N	\N	8	 
56	Seguimiento de Acciones Recomendadas - IS	38	\N	\N	3	\N
60	DM - Analisis Forense	40	\N	\N	9	\N
61	Alcance de los Analisis Forense	60	J017tAlcanceForense	\N	6	\N
41	Informe de Recomendaciones	40	\N	\N	7	IR
71	Procesos STI	67	J033tProcesos	\N	1	\N
62	Tipos de Recursos Tecnologicos	60	J024tRecurso	\N	3	\N
67	Datos Maestros	0	\N	\N	3	\N
74	Documento de Marco Normativo	73	J047tDocumentoNormativo	\N	1	\N
80	Tipo de Justificación del Informe de Marco Normativo	76	J052tTipoJustificacion	\N	4	\N
79	Tipo de Informe de Marco Normativo	76	J051tTipoRevision	\N	3	\N
78	Estado del Documento de Marco Normativo	76	J048tEstadoDocumento	\N	2	\N
81	Detalle del Marco Normativo	73	J046tMarcoNormativo	\N	3	\N
51	Registro de Incidente de Seguridad	38	J034tIncidente	\N	1	RIS
75	Informe de Marco Normativo	73	J050tInformeMarco	\N	2	\N
77	Tipo de Documento Normativo	76	J049tTipoMarco	\N	1	\N
73	Arquitectura Preventiva de Seguridad	0	\N	\N	4	\N
10	Cronograma de Mitigación de Vulnerabilidades	69	htttt	h	3	CMV
83	Tipificacion de Incidentes de Seguridad	82	J043tTipoIncidentes	\N	1	\N
84	Tipificacion de Hechos	82	J044tTipoHechos	\N	2	\N
85	Estado del Incidente	82	J042tEstadoIncidente	\N	3	\N
89	Principios de Seguridad	67	J036tPrincipio	\N	6	\N
86	Tipo de Plataforma de Seguridad	90	J040tTipoHerramientas	\N	1	\N
87	Listado de Herramienta de Seguridad	90	J041tHerramientas	\N	2	\N
88	Tipos de Servicios Tecnologicos	67	J035tServicios	\N	7	\N
82	DM - Incidentes de Seguridad	38	\N	\N	8	\N
90	DM - Plataforma de Seguridad	48	\N	\N	3	\N
91	Principios Afectados por Incidente	38	J037tIncidentePrincipio	\N	\N	\N
92	Servicios Afectados en el Incidente	38	J038tIncidenteServicios	\N	\N	\N
93	Herramientas de Seguridad Utilizadas	38	J039tHerramientaUtilizada	\N	\N	\N
94	Marco Normativo Referenciado	38	J045tReferenciaMarco	\N	\N	\N
0	Raiz	0	//	img	12	ABC
\.


--
-- Name: j001t_menu_co_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j001t_menu_co_menu_seq', 51, true);


--
-- Data for Name: j002t_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j002t_usuario (co_usuario, tx_indicador, nb_empleado, ap_empleado, co_division, co_rol, co_region, co_negocio) FROM stdin;
5	parisra	Rafael	Paris	1	1	3	1
13	AAA	SSS	DDD	14	1	2	9
18	wwwss	qqq	qqq	14	2	2	9
2	vivasts	Tibisay	Vivas	11	1	1	13
4	carrilloaw	Adam	Carrillo	10	2	3	13
7	cortesmmmmm	Joel	Cortes	13	1	1	14
23	""""""22222	BBB	CCC	2	3	3	1
1	camarilloj	Joel	Camarillo	13	1	1	9
6	dubuca	Andres	Dubuc	10	1	3	13
24	ZXASQW	CVDFER	XCSDWE	4	3	2	5
\.


--
-- Name: j002t_usuario_co_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j002t_usuario_co_usuario_seq', 24, true);


--
-- Name: j003_rol_co_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j003_rol_co_rol_seq', 1, true);


--
-- Data for Name: j003t_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j003t_rol (co_rol, tx_rol) FROM stdin;
1	Administrador
2	Consulta
3	Registrador
4	Aprobador
\.


--
-- Data for Name: j004t_rol_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j004t_rol_menu (co_rol_menu, co_rol, co_menu, in_ver) FROM stdin;
35	1	35	t
37	1	37	t
92	1	92	t
40	1	40	t
41	1	41	t
42	1	42	t
43	1	43	t
38	1	38	t
39	1	39	t
44	1	44	t
45	1	45	t
46	1	46	t
47	1	47	t
48	1	48	t
49	1	49	t
50	1	50	t
51	1	51	t
52	1	52	t
53	1	53	t
54	1	54	t
55	1	55	t
57	1	57	t
56	1	56	t
58	1	58	t
59	1	59	t
1	1	23	t
2	1	24	t
3	1	25	t
4	1	26	t
5	1	27	t
6	1	28	t
7	1	29	t
8	1	30	t
9	1	31	t
10	1	32	t
11	1	33	t
12	1	34	t
13	1	1	t
14	1	2	t
15	1	3	t
16	1	4	t
17	1	5	t
18	1	6	t
19	1	7	t
20	1	8	t
21	1	9	t
22	1	10	t
23	1	11	t
24	1	12	t
25	1	13	t
26	1	14	t
27	1	15	t
28	1	16	t
29	1	17	t
30	1	18	t
31	1	19	t
32	1	20	t
33	1	21	t
34	1	22	t
61	1	61	t
60	1	60	t
62	1	62	t
63	1	63	t
64	1	64	t
65	1	65	t
66	1	66	t
67	1	67	t
93	1	93	t
94	1	94	t
36	1	36	t
72	1	72	t
68	1	68	t
69	1	69	t
70	1	70	t
71	1	71	t
73	1	73	t
74	1	74	t
75	1	75	t
76	1	76	t
77	1	77	t
78	1	78	t
79	1	79	t
80	1	80	t
81	1	81	t
82	1	82	t
83	1	83	t
84	1	84	t
85	1	85	t
86	1	86	t
87	1	87	t
88	1	88	t
89	1	89	t
90	1	90	t
91	1	90	t
\.


--
-- Name: j004t_rol_menu_co_rol_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j004t_rol_menu_co_rol_menu_seq', 35, true);


--
-- Data for Name: j005t_transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j005t_transaccion (co_transaccion, fe_transaccion, co_usuario, tx_ruta, nb_archivo) FROM stdin;
1	2014-10-06	1	/var/www/html/sti/documentos/IEL/2014/10/solicitud/EPOC-COC-SEL-14-10-06.doc	EPOC-COC-SEL-14-10-06.doc
4	2014-10-06	1	/var/www/html/sti/documentos/IEL/2014/10/Informe/EPOC-COC-IEL-14-10-06.doc	EPOC-COC-IEL-14-10-06.doc
5	2014-10-07	1	\N	\N
6	2014-10-07	1	\N	\N
7	2014-10-07	1	/var/www/html/sti/documentos/IEL/2014/10/Informe/EPOC-COC-IEL-14-10-07.pdf	EPOC-COC-IEL-14-10-07.pdf
8	2014-10-08	1	\N	\N
9	2014-10-08	1	\N	\N
10	2014-10-08	1	\N	\N
11	2014-10-08	1	\N	\N
12	2014-10-08	1	\N	\N
13	2014-10-08	1	\N	\N
14	2014-10-08	1	\N	\N
15	2014-10-08	1	\N	\N
16	2014-10-08	1	\N	\N
17	2014-10-08	1	\N	\N
18	2014-10-08	1	\N	\N
19	2014-10-08	1	\N	\N
21	2014-10-08	1	\N	\N
22	2014-10-08	1	\N	\N
20	2014-10-08	1	/var/www/html/sti/documentos/CMV/2014/10//EPOC-COC-CMV-14-10-13.doc	EPOC-COC-CMV-14-10-13.doc
23	2014-10-08	1	/var/www/html/sti/documentos/CMV/2014/10/EPOC-COC-CMV-14-10-16.pdf	EPOC-COC-CMV-14-10-16.pdf
24	2014-10-09	1	/var/www/html/sti/documentos/CMV/2014/10/EPOC-COC-CMV-14-10-17.pdf	EPOC-COC-CMV-14-10-17.pdf
25	2014-10-27	1	\N	\N
26	2014-11-04	1	\N	\N
27	2014-11-12	1	\N	\N
28	2014-11-12	1	\N	\N
29	2014-11-12	1	\N	\N
30	2014-12-30	1	/var/www/html/sti/documentos/IEL/2014/12/solicitudEPOC-COC-SEL-2014-12-011.doc	EPOC-COC-SEL-2014-12-011.doc
31	2014-12-30	1	\N	\N
32	2015-04-17	1	/var/www/html/sti/documentos/IEL/2015/04/solicitudEPOC-COC-SEL-2015-04-001.txt	EPOC-COC-SEL-2015-04-001.txt
33	2015-04-17	1	\N	\N
34	2015-04-17	1	\N	\N
35	2015-04-22	1	\N	\N
36	2015-04-22	1	\N	\N
37	2015-05-15	1	/var/www/html/sti/documentos/IEL/2015/05/solicitudEPOC-COC-SEL-2015-05-003.DOC	EPOC-COC-SEL-2015-05-003.DOC
38	2015-05-15	1	/var/www/html/sti/documentos/IEL/2015/05/solicitudEPOC-COC-SEL-2015-05-004.pdf	EPOC-COC-SEL-2015-05-004.pdf
39	2015-05-15	1	/var/www/html/sti/documentos/IEL/2015/05/InformeEPOC-COC-IEL-2015-05-003.pdf	EPOC-COC-IEL-2015-05-003.pdf
40	2015-07-28	1	\N	\N
41	2015-07-28	1	\N	\N
42	2015-07-28	1	\N	\N
43	2015-07-28	1	\N	\N
44	2015-09-28	1	\N	\N
45	2015-09-30	1	\N	\N
\.


--
-- Name: j005t_transaccion_co_transaccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j005t_transaccion_co_transaccion_seq', 45, true);


--
-- Data for Name: j006t_solicitud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j006t_solicitud (co_solicitud, tx_serial, tx_solicitud, fe_solicitud, co_tipo_solicitud, archivo, mime, co_transaccion, co_usuario, co_region, tx_ruta, nb_archivo) FROM stdin;
21	EPOC-COC-SEL-14-09-04	centinela	2014-09-30	8	\N	\N	\N	1	1	/var/www/html/sti/documentos/IEL/2014/09/solicitud/E5000_OCCP04_OLEO_V1.0.pdf	E5000_OCCP04_OLEO_V1.0.pdf
19	EPOC-COC-SEL-14-09-02	SISGEM	2014-09-30	8	\N	\N	\N	1	1	/var/www/html/sti/documentos/IEL/2014/10/solicitud/EPOC-COR-CMV-2014-08-026.pdf	EPOC-COR-CMV-2014-08-026.pdf
20	EPOC-COC-SEL-14-09-03	WINDOWS	2014-09-30	8	\N	\N	\N	1	1	/var/www/html/sti/documentos/IEL/2014/10/solicitud/minuta reunion E25K.pdf.pgp	minuta reunion E25K.pdf.pgp
18	EPOC-COC-SEL-14-09-01	HP EVA2d	2014-09-30	8	\N	\N	\N	1	1	/var/www/html/sti/documentos/IEL/2014/09/solicitud/EPOC-COC-CMV-2014-09-027.doc	EPOC-COC-CMV-2014-09-027.doc
22	EPOC-COC-SEL-14-10-05	HP EVA2d	2014-10-01	8	\N	\N	\N	1	1	/var/www/html/sti/documentos/IEL/2014/10/solicitud/Solicitud-ARL-E25K.pdf.pgp	Solicitud-ARL-E25K.pdf.pgp
23	EPOC-COC-SEL-14-10-06	prueba	2014-10-06	8	\N	\N	1	1	1	\N	\N
24	EPOC-COC-SEL-14-10-07	\N	2014-10-07	8	\N	\N	5	1	1	\N	\N
25	EPOC-COC-SEL-14-10-08	\N	2014-10-07	8	\N	\N	6	1	1	\N	\N
26	EPOC-COC-SEL-2014-11-009	ARL HOSPITAL COROMOTO	2014-11-04	8	\N	\N	26	1	1	\N	\N
27	EPOC-COC-SEL-2014-11-010	KAli	2014-11-12	8	\N	\N	27	1	1	\N	\N
28	EPOC-COC-SEL-2014-12-011	Seguridad en Tecnologías de Información para Exploración y Producción Occidente	2014-12-30	8	\N	\N	30	1	1	\N	\N
29	EPOC-COC-SEL-2015-04-001	SISCOMBF LA SALINA	2015-04-17	8	\N	\N	32	1	1	\N	\N
30	EPOC-COC-SEL-2015-04-002	fffffff	2015-04-22	8	\N	\N	35	1	1	\N	\N
31	EPOC-COC-SEL-2015-05-003	evaluacion xspoc	2015-05-15	8	\N	\N	37	1	1	\N	\N
32	EPOC-COC-SEL-2015-05-004	sicombf	2015-05-15	8	\N	\N	38	1	1	\N	\N
33	EPOC-COC-SEL-2015-07-005	Evaluación Xspoc	2015-07-28	8	\N	\N	40	1	1	\N	\N
\.


--
-- Name: j006t_solicitud_co_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j006t_solicitud_co_solicitud_seq', 33, true);


--
-- Data for Name: j007t_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j007t_region (co_region, tx_region, tx_sigla) FROM stdin;
1	Centro	CEN
2	Oriente	ORI
3	Occidente	OCC
\.


--
-- Name: j007t_region_co_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j007t_region_co_region_seq', 3, true);


--
-- Data for Name: j008t_division; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j008t_division (co_division, tx_division, tx_sigla, co_negocio) FROM stdin;
1	Costa Occidental	COC	1
2	Costa Orienta	COR	1
3	Costa Afuera	CAF	5
4	Furrial	FUR	5
5	Punta de Mata	PDM	5
6	Ayacucho	AYA	4
7	Boyaca	BOY	4
8	Carabobo	CAR	4
9	Mejoramiento	MEJ	4
10	Complejo Refinador Paraguana	CRP	13
11	El Palito	PAL	13
12	Puerto La Cruz	PLC	13
13	Metro Occidente	MOC	9
14	Oriente	ORI	9
16	Junin	JUN	4
15	Centro Occidente	OCC	9
\.


--
-- Name: j008t_division_co_division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j008t_division_co_division_seq', 2, true);


--
-- Data for Name: j009t_serial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j009t_serial (co_tp_documento, nu_serial, nu_anio, co_serial, tx_nomenclatura, co_region) FROM stdin;
8	1	2014	23	EPOC-COC-SEL-14-09-01	1
8	2	2014	24	EPOC-COC-SEL-14-09-02	1
8	3	2014	25	EPOC-COC-SEL-14-09-03	1
8	4	2014	26	EPOC-COC-SEL-14-09-04	1
8	5	2014	27	EPOC-COC-SEL-14-10-05	1
8	1	2014	28	EPOC-COC-IEL-14-10-01	1
8	1	2014	29	EPOC-COC-IEL-14-10-01	1
8	1	2014	30	EPOC-COC-IEL-14-10-01	1
8	1	2014	31	EPOC-COC-IEL-14-10-01	1
8	1	2014	32	EPOC-COC-IEL-14-10-01	1
8	1	2014	33	EPOC-COC-IEL-14-10-01	1
9	1	2014	34	EPOC-COC-IEL-14-10-01	1
9	2	2014	35	EPOC-COC-IEL-14-10-02	1
9	3	2014	36	EPOC-COC-IEL-14-10-03	1
9	4	2014	37	EPOC-COC-IEL-14-10-04	1
9	5	2014	38	EPOC-COC-IEL-14-10-05	1
8	6	2014	39	EPOC-COC-SEL-14-10-06	1
9	6	2014	42	EPOC-COC-IEL-14-10-06	1
8	7	2014	43	EPOC-COC-SEL-14-10-07	1
8	8	2014	44	EPOC-COC-SEL-14-10-08	1
9	7	2014	45	EPOC-COC-IEL-14-10-07	1
10	1	2014	46	EPOC-COC-CMV-14-10-01	1
10	2	2014	47	EPOC-COC-CMV-14-10-02	1
10	3	2014	48	EPOC-COC-CMV-14-10-03	1
10	4	2014	49	EPOC-COC-CMV-14-10-04	1
10	5	2014	50	EPOC-COC-CMV-14-10-05	1
10	6	2014	51	EPOC-COC-CMV-14-10-06	1
10	7	2014	52	EPOC-COC-CMV-14-10-07	1
10	8	2014	53	EPOC-COC-CMV-14-10-08	1
10	9	2014	54	EPOC-COC-CMV-14-10-09	1
10	10	2014	55	EPOC-COC-CMV-14-10-10	1
10	11	2014	56	EPOC-COC-CMV-14-10-11	1
10	12	2014	57	EPOC-COC-CMV-14-10-12	1
10	13	2014	58	EPOC-COC-CMV-14-10-13	1
10	14	2014	59	EPOC-COC-CMV-14-10-14	1
10	15	2014	60	EPOC-COC-CMV-14-10-15	1
10	16	2014	61	EPOC-COC-CMV-14-10-16	1
10	17	2014	62	EPOC-COC-CMV-14-10-17	1
10	18	2014	63	EPOC-COC-CMV-14-10-18	1
8	9	2014	64	EPOC-COC-SEL-2014-11-009	1
8	10	2014	65	EPOC-COC-SEL-2014-11-010	1
9	8	2014	66	EPOC-COC-IEL-2014-11-008	1
10	19	2014	67	EPOC-COC-CMV-2014-11-019	1
8	11	2014	68	EPOC-COC-SEL-2014-12-011	1
9	9	2014	69	EPOC-COC-IEL-2014-12-009	1
8	1	2015	70	EPOC-COC-SEL-2015-04-001	1
9	1	2015	71	EPOC-COC-IEL-2015-04-001	1
10	1	2015	72	EPOC-COC-CMV-2015-04-001	1
8	2	2015	73	EPOC-COC-SEL-2015-04-002	1
9	2	2015	74	EPOC-COC-IEL-2015-04-002	1
8	3	2015	75	EPOC-COC-SEL-2015-05-003	1
8	4	2015	76	EPOC-COC-SEL-2015-05-004	1
9	3	2015	77	EPOC-COC-IEL-2015-05-003	1
8	5	2015	78	EPOC-COC-SEL-2015-07-005	1
9	4	2015	79	EPOC-COC-IEL-2015-07-004	1
10	2	2015	80	EPOC-COC-CMV-2015-07-002	1
10	3	2015	81	EPOC-COC-CMV-2015-07-003	1
9	5	2015	82	CEN-COC-IEL-2015-09-005	1
9	6	2015	83	CEN-COC-IEL-2015-09-006	1
\.


--
-- Name: j009t_serial_co_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j009t_serial_co_serial_seq', 83, true);


--
-- Data for Name: j010t_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j010t_evaluacion (co_evaluacion, tx_serial, tx_titulo, fe_evaluacion, co_transaccion, co_usuario, co_region, tx_ruta, nb_archivo, co_solicitud) FROM stdin;
3	EPOC-COC-IEL-14-10-01	dddddd	2014-10-03	\N	1	1	\N	\N	20
4	EPOC-COC-IEL-14-10-01	sds	2014-10-03	\N	1	1	\N	\N	18
5	EPOC-COC-IEL-14-10-02	sdsdsd	2014-10-03	\N	1	1	\N	\N	22
6	EPOC-COC-IEL-14-10-03	sss	2014-10-03	\N	1	1	\N	\N	18
7	EPOC-COC-IEL-14-10-04	sdfds	2014-10-03	\N	1	1	\N	\N	18
8	EPOC-COC-IEL-14-10-05	asdasd	2014-10-03	\N	1	1	\N	\N	20
1	EPOC-COC-IEL-14-10-01	sdfsdf	2014-10-03	\N	1	1	/var/www/html/sti/documentos/IEL/2014/10/Informe/minuta reunion E25K.pdf.pgp	minuta reunion E25K.pdf.pgp	21
2	EPOC-COC-IEL-14-10-01	sdfdsf	2014-10-03	\N	1	1	/var/www/html/sti/documentos/IEL/2014/10/Informe/Solicitud-ARL-E25K.pdf.pgp	Solicitud-ARL-E25K.pdf.pgp	19
11	EPOC-COC-IEL-14-10-06	sdfsf	2014-10-06	4	1	1	\N	\N	19
12	EPOC-COC-IEL-14-10-07	sdddddd	2014-10-07	7	1	1	\N	\N	22
13	EPOC-COC-IEL-2014-11-008	IEL Kali	2014-11-12	28	1	1	\N	\N	27
14	EPOC-COC-IEL-2014-12-009	Seguridad en Tecnologías de Información para Exploración y Producción Occidente	2014-12-30	31	1	1	\N	\N	28
15	EPOC-COC-IEL-2015-04-001	IEL SISCOMBF	2015-04-17	33	1	1	\N	\N	29
16	EPOC-COC-IEL-2015-04-002	ggggggg	2015-04-22	36	1	1	\N	\N	30
17	EPOC-COC-IEL-2015-05-003	IEL SISCOMBF	2015-05-15	39	1	1	\N	\N	32
18	EPOC-COC-IEL-2015-07-004	IES xspoc	2015-07-28	41	1	1	\N	\N	33
19	CEN-COC-IEL-2015-09-005	Informe de ERC	2015-09-28	44	1	1	\N	\N	19
20	CEN-COC-IEL-2015-09-006	Informe 1	2015-09-30	45	1	1	\N	\N	20
\.


--
-- Name: j010t_evaluacion_co_evaluacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j010t_evaluacion_co_evaluacion_seq', 20, true);


--
-- Data for Name: j011t_vulnerabilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j011t_vulnerabilidad (co_vulnerabilidad, tx_vulnerabilidad, fe_vulnerabilidad, co_transaccion, in_aplicacion, in_cerrado) FROM stdin;
12	delibjdjjjj	2014-10-07	7	t	f
13	aaa	2014-10-07	4	t	f
14	sdfs	2014-10-08	7	f	f
15	ffff	2014-10-08	7	f	f
16	sssssss	2014-10-08	7	f	f
17	fffffff	2014-10-08	7	f	f
18	sssssss	2014-10-08	7	f	f
19	ssdsddsdssds	2014-10-08	7	f	f
20	sddfdfd	2014-10-08	7	f	f
21	ssssss	2014-10-08	7	f	f
22	ssssssss	2014-10-08	7	f	f
23	sssssss	2014-10-08	7	f	f
24	ddasasdsadsa	2014-10-08	7	f	f
25	sddffdsfsdf	2014-10-08	7	f	f
26	sddsddsdsds	2014-10-08	7	f	f
27	sddfsdfdsf	2014-10-08	7	f	f
28	vvvvvvvvvvvvvvvvv	2014-10-08	7	f	f
29	jjjjjjjjjjjjjjjjjjjj	2014-10-08	7	f	f
30	qqqqqqqqqqqqqqqqq	2014-10-08	7	f	f
31	aaaaaaaaaaaaaaaaaaaa	2014-10-08	7	f	f
32	ASDSADSA	2015-04-17	33	f	f
\.


--
-- Name: j011t_vulnerabilidad_co_vulnerabilidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j011t_vulnerabilidad_co_vulnerabilidad_seq', 32, true);


--
-- Data for Name: j012t_cronograma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j012t_cronograma (co_cronograma, tx_descripcion, fe_cronograma, co_transaccion_enlace, co_transaccion, tx_serial, co_usuario) FROM stdin;
13	HP EVA	2014-10-08	4	20	EPOC-COC-CMV-14-10-13	1
16	SISGEM	2014-10-08	7	23	EPOC-COC-CMV-14-10-16	1
17	hhhhhh	2014-10-09	7	24	EPOC-COC-CMV-14-10-17	1
18	HHH	2014-10-27	4	25	EPOC-COC-CMV-14-10-18	1
19	dfdsfds	2014-11-12	28	29	EPOC-COC-CMV-2014-11-019	1
20	LA SALINA	2015-04-17	33	34	EPOC-COC-CMV-2015-04-001	1
21	ddddd	2015-07-28	41	42	EPOC-COC-CMV-2015-07-002	1
22	ddddd	2015-07-28	41	43	EPOC-COC-CMV-2015-07-003	1
\.


--
-- Name: j012t_cronograma_co_cronograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j012t_cronograma_co_cronograma_seq', 22, true);


--
-- Data for Name: j013t_vul_cronograma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j013t_vul_cronograma (co_vulnerabilidad, co_cronograma, in_cerrada, co_vul_cronograma) FROM stdin;
13	13	f	23
12	16	f	26
14	16	f	27
15	16	f	28
16	16	f	29
17	16	f	30
18	16	f	31
19	16	f	32
20	16	f	33
21	16	f	34
22	16	f	35
23	16	f	36
24	16	f	37
25	16	f	38
26	16	f	39
27	16	f	40
28	16	f	41
29	16	f	42
30	16	f	43
31	16	f	44
12	17	f	45
14	17	f	46
15	17	f	47
16	17	f	48
17	17	f	49
18	17	f	50
19	17	f	51
20	17	f	52
21	17	f	53
22	17	f	54
23	17	f	55
24	17	f	56
25	17	f	57
26	17	f	58
27	17	f	59
28	17	f	60
29	17	f	61
30	17	f	62
31	17	f	63
13	18	f	64
\.


--
-- Name: j013t_vul_cronograma_co_vul_cronograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j013t_vul_cronograma_co_vul_cronograma_seq', 64, true);


--
-- Data for Name: j014t_negocio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j014t_negocio (co_negocio, tx_negocio, tx_sigla) FROM stdin;
1	Exploración y Producción Occidente	EPOC
2	Bariven	BRV
3	Comercio y Suministro	CYS
4	Exploración y Producción  Faja	EPFA
5	Exploración y Producción Oriente	EPOR
6	Ingenieria en Construcción	IYC
7	Intevep	INTVP
8	Metropolitana	MET
9	Gas	GAS
10	PDVSA Industrial	PDV-IND
11	PDVSA Naval	PDV-NAV
12	PDVSA Servicios	PDV-SER
13	Refinacion	REF
14	Corporativo	COR
15	Exploración y Producción Costa Afuera	EP
\.


--
-- Name: j014t_negocio_co_negocio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j014t_negocio_co_negocio_seq', 2, true);


--
-- Data for Name: j015t_region_negocio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j015t_region_negocio (co_region, co_negocio, co_region_negocio, co_division) FROM stdin;
2	5	14	4
1	6	16	\N
1	7	17	\N
1	8	18	\N
3	10	23	\N
1	11	25	\N
2	10	22	\N
3	1	1	1
3	13	30	10
3	1	2	2
1	13	28	11
2	13	29	12
1	14	31	\N
2	15	32	\N
1	2	3	\N
3	4	9	6
2	4	11	8
2	4	12	9
2	4	13	16
3	9	21	15
2	9	20	14
1	9	19	13
2	5	15	7
3	2	5	\N
2	4	10	5
1	3	6	\N
3	10	26	\N
3	12	27	\N
2	3	7	\N
2	2	4	\N
3	3	8	\N
\.


--
-- Data for Name: j016t_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j016t_forense (co_forense, fe_apertura, fe_cierre, co_usuario_apertura, co_usuario_cierre, co_region, co_negocio, co_division, tx_serial, in_abierto, tx_descripcion_solicitud, tx_caso_aaii, co_alcance_forense, tx_descripcion_entorno, tx_metologia_herramientas, tx_observaciones, created_at, update_at, co_usuario_created, co_usuario_update) FROM stdin;
1	2015-07-01	2015-07-01	1	1	2	1	1	2222	f	222	222	1	22	22	222	2015-07-16	2015-07-30 00:00:00	2222	1
2	2015-07-09	2015-07-16	1	1	3	2	6	222	f	222	222	1	22	22	sdfsd	2015-07-15	2015-07-30 00:00:00	33323	1
\.


--
-- Name: j016t_forense_co_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j016t_forense_co_forense_seq', 2, true);


--
-- Data for Name: j017t_alcance_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j017t_alcance_forense (co_alcance_forense, tx_descripcion, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
1	Coleccion de Evidencia	\N	\N	\N	\N
2	Analisis de Evidencias	\N	\N	\N	\N
3	Coleccion y Analisis	\N	\N	\N	\N
4	Recuperacion de Informacion sin Analizar	\N	\N	\N	\N
\.


--
-- Data for Name: j018t_informe_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j018t_informe_forense (co_informe_forense, fe_emision, co_forense, co_region, co_negocio, co_division, tx_serial, co_revisa, co_aprueba, tx_resultados, tx_conclusiones, tx_observaciones, tx_ruta, nb_archivo, created_at, update_at, co_usuario_created, co_usuario_update) FROM stdin;
\.


--
-- Name: j018t_informe_forense_co_informe_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j018t_informe_forense_co_informe_forense_seq', 1, false);


--
-- Data for Name: j019t_participantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j019t_participantes (co_participante, co_usuario_elabora, co_forense, co_informe_recomendaciones, co_informe_incidente, co_informe_forense, co_informe_depuracion, co_mantenimiento, co_doumento_normativo) FROM stdin;
\.


--
-- Data for Name: j020t_acta_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j020t_acta_acc (co_acc, fe_emision, co_forense, co_region, co_negocio, co_division, tx_serial, co_elabora, fe_destruye, co_destruye, tx_observaciones, tx_ruta, nb_archivo, created_at, update_at, co_usuario_created, co_usuario_update, in_abierta) FROM stdin;
\.


--
-- Name: j020t_acta_acc_co_acc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j020t_acta_acc_co_acc_seq', 1, false);


--
-- Data for Name: j021t_acta_aie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j021t_acta_aie (co_aie, fe_emision, co_forense, co_region, co_negocio, co_division, tx_serial, co_elabora, tx_observaciones, tx_ruta, nb_archivo, created_at, update_at, co_usuario_created, co_usuario_update) FROM stdin;
\.


--
-- Name: j021t_acta_aie_co_aie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j021t_acta_aie_co_aie_seq', 1, false);


--
-- Data for Name: j022t_acta_anie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j022t_acta_anie (co_anie, fe_emision, co_forense, co_region, co_negocio, co_division, tx_serial, co_elabora, co_custodio_niega, tx_observaciones, tx_ruta, nb_archivo, created_at, update_at, co_usuario_created, co_usuario_update, in_abierta) FROM stdin;
\.


--
-- Name: j022t_acta_anie_co_anie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j022t_acta_anie_co_anie_seq', 1, false);


--
-- Data for Name: j023t_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j023t_evidencia (co_evidencia, fe_registro, co_registro, co_acc, co_aie, tx_descripcion_coleccion, fe_coleccion_evidencia, co_colecta, co_recurso, tx_nombre_recurso, tx_serial_recurso, tx_marca_recurso, tx_modelo_recurso, tx_numero_activo, co_tipo_evidencia, co_estado_evidencia, co_lugar_seguro, co_repositorio, co_custodio_sti, tx_observaciones, update_at, co_update_at) FROM stdin;
\.


--
-- Data for Name: j025t_tipo_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j025t_tipo_evidencia (co_tipo_evidencia, tx_descripcion, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
1	FISICA ORIGINAL	\N	\N	\N	\N
2	FISICA CON EVIDENCIA DIGITAL	\N	\N	\N	\N
3	IMAGEN FORENSE ORIGINAL	\N	\N	\N	\N
4	IMAGEN FORENSE COPIA	\N	\N	\N	\N
5	ARCHIVOS COLECTADOS ORIGINALES	\N	\N	\N	\N
6	ARCHIVOS RECUPERADOS DESDE LA IMAGEN ORIGINALES	\N	\N	\N	\N
7	ARCHIVOS COPIADOS PARA RESGUARDO	\N	\N	\N	\N
8	ARCHIVOS COPIADOS PARA ENTREGA FUERA DE STI	\N	\N	\N	\N
\.


--
-- Data for Name: j026t_estado_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j026t_estado_evidencia (co_estado_evidencia, tx_descripcion, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
1	EN CUSTODIA PERSONAL DE STI	\N	\N	\N	\N
2	RESGUARDADA EN LUGAR SEGURO	\N	\N	\N	\N
3	ENTREGADA FUERA DE STI	\N	\N	\N	\N
4	DESTRUIDA	\N	\N	\N	\N
5	RESGUARDADA EN REPOSITORIO DIGITAL	\N	\N	\N	\N
\.


--
-- Data for Name: j027t_lugar_seguro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j027t_lugar_seguro (co_lugar_seguro, tx_ubicacion_fisica, tx_gerencia_custodia, co_custodio, tx_observaciones, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
\.


--
-- Data for Name: j028t_repositorio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j028t_repositorio (co_repositorio, tx_nombre, tx_direccion_ip, co_custodio, tx_observaciones, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
\.


--
-- Data for Name: j029t_historico_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j029t_historico_evidencia (co_historico_evidencia, co_evidencia, fe_cambio_estado, co_cambia_estado, tx_estado_anterior, tx_lugar_anterior, tx_custodio_anterior, tx_repositorio_anterior, tx_observaciones, update_at) FROM stdin;
\.


--
-- Data for Name: j030t_informe_recomendaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j030t_informe_recomendaciones (co_informe_recomendaciones, fe_emision, co_accion, co_region, co_negocio, co_division, tx_serial, co_revisa, co_aprueba, tx_resumen_ejecutivo, tx_antecedentes, tx_situacion_actual, tx_preocupacion, tx_recomendaciones, tx_observaciones, tx_ruta, nb_archivo, created_at, update_at, co_usuario_created, co_usuario_update) FROM stdin;
\.


--
-- Name: j030t_informe_recomendaciones_co_informe_recomendaciones_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j030t_informe_recomendaciones_co_informe_recomendaciones_seq', 1, false);


--
-- Data for Name: j031t_accion_recomendada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j031t_accion_recomendada (co_accion, tx_descripcion, tx_responsable_ejecutar, co_responsable_sti_ejecutar, fecha_a_ejecutar, fecha_ejecutada, tx_seguimiento, tx_observaciones, in_abierto, created_at, co_created_at, updated_at, co_update_at, co_incidente, co_forense, co_monitoreo, co_depuracion) FROM stdin;
\.


--
-- Data for Name: j032t_seriales_enlaces_ir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j032t_seriales_enlaces_ir (co_enlaces_ir, co_informe_recomendaciones, co_forense, co_incidente, co_depuracion) FROM stdin;
\.


--
-- Data for Name: j033t_procesos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j033t_procesos (co_proceso, tx_proceso, tx_sigla) FROM stdin;
1	Evaluacion, Respuesta y Contingencia	ERC
2	Protección Lógica	PL
3	Arquitectura Preventiva de Seguridad	APS
4	Inteligencia Aplicada a Datos	IAD
\.


--
-- Name: j033t_procesos_co_proceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j033t_procesos_co_proceso_seq', 4, true);


--
-- Data for Name: j034t_incidente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j034t_incidente (co_incidente, fe_apertura, fe_escalado, fe_cierre, co_usuario_apertura, co_usuario_escala, co_usuario_cierre, co_region, co_negocio, co_division, tx_serial, co_estado, co_tipo_incidente, co_tipo_hecho, tx_descripcion, fe_incio_hecho, fe_fin_hecho, tx_causa, tx_metologia_herramientas, tx_observaciones, tx_ruta, nb_archivo, created_at, update_at, co_usuario_created, co_usuario_update, tx_acciones_tomadas) FROM stdin;
\.


--
-- Name: j034t_incidente_co_incidente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j034t_incidente_co_incidente_seq', 1, false);


--
-- Data for Name: j035t_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j035t_servicios (co_servicios, tx_servicio, tx_valor_impacto, co_created_at, co_updated_at, created_at, update_at) FROM stdin;
\.


--
-- Data for Name: j036t_principio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j036t_principio (co_principio, tx_principio, tx_descripcion) FROM stdin;
1	Disponibilidad	\N
2	Integridad	\N
3	Confidencialidad	\N
4	Autenticidad	\N
5	Autenticación	\N
6	No Repudio	\N
\.


--
-- Data for Name: j037t_incidente_principio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j037t_incidente_principio (co_incidente_principio, co_incidente, co_principio) FROM stdin;
\.


--
-- Data for Name: j038t_incidente_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j038t_incidente_servicios (co_incidente_servicios, co_incidente, co_servicios) FROM stdin;
\.


--
-- Data for Name: j039t_herramienta_utilizada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j039t_herramienta_utilizada (co_herramienta_utilizada, co_herramientas, co_incidente, co_forense, co_inventario, co_created_at, co_updated_at, created_at, update_at) FROM stdin;
\.


--
-- Data for Name: j040t_tipo_herramientas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j040t_tipo_herramientas (co_tipo_herramientas, tx_tipo_herramienta, co_created_at, co_update_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: j041t_herramientas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j041t_herramientas (co_herramientas, tx_herramienta, co_tipo_herramientas, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: j042t_estado_incidente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j042t_estado_incidente (co_estado_incidente, tx_descripcion, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
1	Abierto	\N	\N	2	2
2	Escalado	\N	\N	2	2
3	Cerrado	\N	\N	2	2
\.


--
-- Data for Name: j043t_tipo_incidentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j043t_tipo_incidentes (co_tipo_incidentes, co_created_at, co_update_at, created_at, updated_at, tx_tipo_incidentes) FROM stdin;
1	\N	\N	\N	\N	Acceso No Autorizado
3	\N	\N	\N	\N	Denegación de Servicios
2	\N	\N	\N	\N	Código Malicioso
4	\N	\N	\N	\N	Error Humano
5	\N	\N	\N	\N	Falla de Infraestructura
6	\N	\N	\N	\N	Insumo Interno
7	\N	\N	\N	\N	Uso Indebido
8	\N	\N	\N	\N	Uso No Autorizado
9	\N	\N	\N	\N	Coacción
\.


--
-- Data for Name: j044t_tipo_hechos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j044t_tipo_hechos (co_tipo_hechos, co_created_at, co_update_at, created_at, updated_at, tx_tipo_hechos, co_tipo_incidente) FROM stdin;
1	\N	\N	\N	\N	Acceso Indebido\n	1
2	\N	\N	\N	\N	Conexión de equipos de terceros sin autorización\n	1
3	\N	\N	\N	\N	Evasión de los controles de seguridad en Internet, utilizando software y herramientas calificadas para tal fin.  \n	1
4	\N	\N	\N	\N	Exploración desde red externa(escaneos)\n	1
5	\N	\N	\N	\N	Exploración desde red PDVSA(escaneos)\n	1
6	\N	\N	\N	\N	Código Malicioso   (virus, troyanos, gusanos, script maliciosos, etc.)\n	2
7	\N	\N	\N	\N	Denegación de Servicios desde red externa\n	3
8	\N	\N	\N	\N	Denegación de Servicios desde red PDVSA\n	3
9	\N	\N	\N	\N	Desconexión de Equipos de la Plataforma sin Autorización\n	4
10	\N	\N	\N	\N	Desconexión de Equipos de Seguridad\n	4
11	\N	\N	\N	\N	Mala Configuración de Equipos (recursos compartidos, claves por defecto, fuera de estandar ,etc)\n	4
12	\N	\N	\N	\N	Capacidad del sistema/recurso desbordada \n	4
13	\N	\N	\N	\N	Falla de Aplicación\n	4
14	\N	\N	\N	\N	Falla de Base de Datos\n	4
15	\N	\N	\N	\N	Falla de Dispositivo de Red\n	4
16	\N	\N	\N	\N	Falla de Medio de Transmisión (cable, radio, microondas)\n	4
17	\N	\N	\N	\N	Falla de Servidor\n	4
18	\N	\N	\N	\N	Falla del Sistema de Energía Alterno\n	4
19	\N	\N	\N	\N	Falla Eléctrica\n	4
20	\N	\N	\N	\N	Falla en el sistema de refrigeración \n	4
21	\N	\N	\N	\N	Acceso a sitios Web prohibidos\n	5
22	\N	\N	\N	\N	Falso Positivo \n	5
23	\N	\N	\N	\N	Suplantación de correo electrónico externo\n	5
24	\N	\N	\N	\N	Alto consumo de ancho de banda en visitas a sitios Web\n	6
25	\N	\N	\N	\N	Almacenamiento de archivos pornográficos en servidores\n	6
26	\N	\N	\N	\N	Almacenamiento de archivos con fines publicitarios en servidores\n	6
27	\N	\N	\N	\N	Almacenamiento de Información Confidencial ó Estrictamente Confidencial, en servidores públicos\n	6
28	\N	\N	\N	\N	Almacenamiento de música, video o imágenes no autorizadas en servidores y equipos de la Corporación\n	6
29	\N	\N	\N	\N	Almacenamiento y/o uso de software no autorizado\n	6
30	\N	\N	\N	\N	Uso compartido de cuentas de acceso lógicos\n	6
31	\N	\N	\N	\N	Uso indebido de privilegios de acceso lógico\n	6
32	\N	\N	\N	\N	Uso indebido de servidores públicos\n	6
33	\N	\N	\N	\N	Correo electrónico\n	6
34	\N	\N	\N	\N	Instalación o uso de dispositivos no autorizados.\n	6
35	\N	\N	\N	\N	Cambio no autorizado en la Plataforma Tecnológica\n	6
36	\N	\N	\N	\N	Acceso y uso bajo coacción\n	6
\.


--
-- Data for Name: j045t_referencia_marco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j045t_referencia_marco (co_referencia_marco, co_marco_normativo, co_incidente, co_recomendaciones, co_monitoreo, co_forense, co_depuracion, co_cumple, co_accion) FROM stdin;
\.


--
-- Data for Name: j046t_marco_normativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j046t_marco_normativo (co_marco_normativo, co_documento, tx_codigo_marco, tx_descripcion, co_created_at, co_updated_at, created_at, update_at) FROM stdin;
\.


--
-- Data for Name: j047t_documento_normativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j047t_documento_normativo (co_documento_normativo, co_tipo_marco, tx_titulo, tx_descripcion, tx_revision, co_estado, fe_aprueba1, co_aprueba1, fe_aprueba2, co_aprueba2, fe_elimina1, co_elimina1, fe_elimina2, co_elimina2, tx_observaciones, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
\.


--
-- Data for Name: j048t_estado_documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j048t_estado_documento (co_estado_documento, tx_descripcion, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
1	Creado	\N	\N	\N	\N
2	Aprobado	\N	\N	\N	\N
3	Eliminado	\N	\N	\N	\N
\.


--
-- Data for Name: j049t_tipo_marco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j049t_tipo_marco (co_tipo_marco, tx_descripcion, tx_siglas, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
1	Politicas de Seguridad de Información	PSI	\N	\N	\N	\N
2	Normativas de Seguridad de Información	NSI	\N	\N	\N	\N
3	Lineamientos de Seguridad de Información	LSI	\N	\N	\N	\N
\.


--
-- Data for Name: j050t_informe_marco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j050t_informe_marco (co_informe_marco, fe_emision, tx_serial, co_tipo_revision, tx_version, co_tipo_documento, tx_titulo, co_justificacion, tx_justificacion, tx_descripcion, tx_observaciones, tx_ruta, nb_archivo, created_at, update_at, co_usuario_created, co_usuario_update) FROM stdin;
\.


--
-- Name: j050t_informe_marco_co_informe_marco_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j050t_informe_marco_co_informe_marco_seq', 1, false);


--
-- Data for Name: j051t_tipo_revision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j051t_tipo_revision (co_tipo_revision, tx_descripcion, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
1	Creación de Marco Normativo	\N	\N	\N	\N
2	Actualización de Marco Normativo	\N	\N	\N	\N
3	Eliminación de Marco Normativo	\N	\N	\N	\N
\.


--
-- Data for Name: j052t_tipo_justificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j052t_tipo_justificacion (co_tipo_justificacion, tx_descripcion, created_at, update_at, co_usuario_created, co_usuario_updated) FROM stdin;
1	Planificado	\N	\N	\N	\N
2	Cambio Significativo	\N	\N	\N	\N
\.


--
-- Name: co_alcance_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j017t_alcance_forense
    ADD CONSTRAINT co_alcance_forense PRIMARY KEY (co_alcance_forense);


--
-- Name: co_documento_normativo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT co_documento_normativo PRIMARY KEY (co_documento_normativo);


--
-- Name: co_estado_documento; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j048t_estado_documento
    ADD CONSTRAINT co_estado_documento PRIMARY KEY (co_estado_documento);


--
-- Name: co_estado_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j026t_estado_evidencia
    ADD CONSTRAINT co_estado_evidencia PRIMARY KEY (co_estado_evidencia);


--
-- Name: co_estado_incidente; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j042t_estado_incidente
    ADD CONSTRAINT co_estado_incidente PRIMARY KEY (co_estado_incidente);


--
-- Name: co_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT co_evidencia PRIMARY KEY (co_evidencia);


--
-- Name: co_lugar_seguro; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j027t_lugar_seguro
    ADD CONSTRAINT co_lugar_seguro PRIMARY KEY (co_lugar_seguro);


--
-- Name: co_participantes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j019t_participantes
    ADD CONSTRAINT co_participantes PRIMARY KEY (co_participante);


--
-- Name: co_repositorio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j028t_repositorio
    ADD CONSTRAINT co_repositorio PRIMARY KEY (co_repositorio);


--
-- Name: co_tipo_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j025t_tipo_evidencia
    ADD CONSTRAINT co_tipo_evidencia PRIMARY KEY (co_tipo_evidencia);


--
-- Name: co_tipo_justificacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j052t_tipo_justificacion
    ADD CONSTRAINT co_tipo_justificacion PRIMARY KEY (co_tipo_justificacion);


--
-- Name: co_tipo_marco; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j049t_tipo_marco
    ADD CONSTRAINT co_tipo_marco PRIMARY KEY (co_tipo_marco);


--
-- Name: co_tipo_revision; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j051t_tipo_revision
    ADD CONSTRAINT co_tipo_revision PRIMARY KEY (co_tipo_revision);


--
-- Name: fk_co_referencia_marco; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT fk_co_referencia_marco PRIMARY KEY (co_referencia_marco);


--
-- Name: j001t_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j001t_menu
    ADD CONSTRAINT j001t_menu_pkey PRIMARY KEY (co_menu);


--
-- Name: j002t_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT j002t_usuario_pkey PRIMARY KEY (co_usuario);


--
-- Name: j003_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j003t_rol
    ADD CONSTRAINT j003_rol_pkey PRIMARY KEY (co_rol);


--
-- Name: j004t_rol_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j004t_rol_menu
    ADD CONSTRAINT j004t_rol_menu_pkey PRIMARY KEY (co_rol_menu);


--
-- Name: j005t_transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j005t_transaccion
    ADD CONSTRAINT j005t_transaccion_pkey PRIMARY KEY (co_transaccion);


--
-- Name: j006t_solicitud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j006t_solicitud
    ADD CONSTRAINT j006t_solicitud_pkey PRIMARY KEY (co_solicitud);


--
-- Name: j007t_region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j007t_region
    ADD CONSTRAINT j007t_region_pkey PRIMARY KEY (co_region);


--
-- Name: j008t_division_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j008t_division
    ADD CONSTRAINT j008t_division_pkey PRIMARY KEY (co_division);


--
-- Name: j009t_serial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j009t_serial
    ADD CONSTRAINT j009t_serial_pkey PRIMARY KEY (co_serial);


--
-- Name: j010t_evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j010t_evaluacion
    ADD CONSTRAINT j010t_evaluacion_pkey PRIMARY KEY (co_evaluacion);


--
-- Name: j012t_cronograma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j012t_cronograma
    ADD CONSTRAINT j012t_cronograma_pkey PRIMARY KEY (co_cronograma);


--
-- Name: j013t_vul_cronograma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j013t_vul_cronograma
    ADD CONSTRAINT j013t_vul_cronograma_pkey PRIMARY KEY (co_vul_cronograma);


--
-- Name: j014t_negocio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j014t_negocio
    ADD CONSTRAINT j014t_negocio_pkey PRIMARY KEY (co_negocio);


--
-- Name: j033t_procesos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j033t_procesos
    ADD CONSTRAINT j033t_procesos_pkey PRIMARY KEY (co_proceso);


--
-- Name: pk_co_acc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT pk_co_acc PRIMARY KEY (co_acc);


--
-- Name: pk_co_accion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT pk_co_accion PRIMARY KEY (co_accion);


--
-- Name: pk_co_aie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT pk_co_aie PRIMARY KEY (co_aie);


--
-- Name: pk_co_anie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT pk_co_anie PRIMARY KEY (co_anie);


--
-- Name: pk_co_enlaces_ir; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j032t_seriales_enlaces_ir
    ADD CONSTRAINT pk_co_enlaces_ir PRIMARY KEY (co_enlaces_ir);


--
-- Name: pk_co_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT pk_co_forense PRIMARY KEY (co_forense);


--
-- Name: pk_co_herramienta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j041t_herramientas
    ADD CONSTRAINT pk_co_herramienta PRIMARY KEY (co_herramientas);


--
-- Name: pk_co_incidente; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT pk_co_incidente PRIMARY KEY (co_incidente);


--
-- Name: pk_co_incidente_servicios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j038t_incidente_servicios
    ADD CONSTRAINT pk_co_incidente_servicios PRIMARY KEY (co_incidente_servicios);


--
-- Name: pk_co_informe_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT pk_co_informe_forense PRIMARY KEY (co_informe_forense);


--
-- Name: pk_co_informe_marco; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT pk_co_informe_marco PRIMARY KEY (co_informe_marco);


--
-- Name: pk_co_informe_recomendaciones; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT pk_co_informe_recomendaciones PRIMARY KEY (co_informe_recomendaciones);


--
-- Name: pk_co_marco_normativo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j046t_marco_normativo
    ADD CONSTRAINT pk_co_marco_normativo PRIMARY KEY (co_marco_normativo);


--
-- Name: pk_co_principio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j036t_principio
    ADD CONSTRAINT pk_co_principio PRIMARY KEY (co_principio);


--
-- Name: pk_co_recurso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c024t_recurso
    ADD CONSTRAINT pk_co_recurso PRIMARY KEY (co_recurso);


--
-- Name: pk_co_region_negocio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j015t_region_negocio
    ADD CONSTRAINT pk_co_region_negocio PRIMARY KEY (co_region_negocio);


--
-- Name: pk_co_servicios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j035t_servicios
    ADD CONSTRAINT pk_co_servicios PRIMARY KEY (co_servicios);


--
-- Name: pk_co_tipo_hechos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j044t_tipo_hechos
    ADD CONSTRAINT pk_co_tipo_hechos PRIMARY KEY (co_tipo_hechos);


--
-- Name: pk_co_tipo_herramienta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j040t_tipo_herramientas
    ADD CONSTRAINT pk_co_tipo_herramienta PRIMARY KEY (co_tipo_herramientas);


--
-- Name: pk_co_tipo_incidentes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j043t_tipo_incidentes
    ADD CONSTRAINT pk_co_tipo_incidentes PRIMARY KEY (co_tipo_incidentes);


--
-- Name: pk_co_vulnerabilidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j011t_vulnerabilidad
    ADD CONSTRAINT pk_co_vulnerabilidad PRIMARY KEY (co_vulnerabilidad);


--
-- Name: pk_incidente_principio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j037t_incidente_principio
    ADD CONSTRAINT pk_incidente_principio PRIMARY KEY (co_incidente_principio);


--
-- Name: uk_tx_indicador; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT uk_tx_indicador UNIQUE (tx_indicador);


--
-- Name: fki_co_acc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_acc ON j023t_evidencia USING btree (co_acc);


--
-- Name: fki_co_accion; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_accion ON j030t_informe_recomendaciones USING btree (co_accion);


--
-- Name: fki_co_accion17; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_accion17 ON j045t_referencia_marco USING btree (co_accion);


--
-- Name: fki_co_aie; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aie ON j023t_evidencia USING btree (co_aie);


--
-- Name: fki_co_alcance; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_alcance ON j016t_forense USING btree (co_alcance_forense);


--
-- Name: fki_co_aprueba; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aprueba ON j018t_informe_forense USING btree (co_aprueba);


--
-- Name: fki_co_aprueba10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aprueba10 ON j047t_documento_normativo USING btree (co_aprueba1);


--
-- Name: fki_co_aprueba20; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aprueba20 ON j047t_documento_normativo USING btree (co_aprueba2);


--
-- Name: fki_co_aprueba8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aprueba8 ON j030t_informe_recomendaciones USING btree (co_aprueba);


--
-- Name: fki_co_colecta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_colecta ON j023t_evidencia USING btree (co_colecta);


--
-- Name: fki_co_created_at10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at10 ON j027t_lugar_seguro USING btree (co_usuario_created);


--
-- Name: fki_co_created_at11; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at11 ON j028t_repositorio USING btree (co_usuario_created);


--
-- Name: fki_co_created_at12; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at12 ON j031t_accion_recomendada USING btree (co_created_at);


--
-- Name: fki_co_created_at15; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at15 ON j048t_estado_documento USING btree (co_usuario_created);


--
-- Name: fki_co_created_at18; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at18 ON j042t_estado_incidente USING btree (co_usuario_created);


--
-- Name: fki_co_created_at20; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at20 ON j047t_documento_normativo USING btree (co_usuario_created);


--
-- Name: fki_co_created_at24; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at24 ON j049t_tipo_marco USING btree (co_usuario_created);


--
-- Name: fki_co_created_at7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at7 ON c024t_recurso USING btree (co_usuario_created);


--
-- Name: fki_co_created_at8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at8 ON j025t_tipo_evidencia USING btree (co_usuario_created);


--
-- Name: fki_co_created_at9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at9 ON j026t_estado_evidencia USING btree (co_usuario_created);


--
-- Name: fki_co_cronograma_vul; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_cronograma_vul ON j013t_vul_cronograma USING btree (co_cronograma);


--
-- Name: fki_co_custodio_sti; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio_sti ON j023t_evidencia USING btree (co_custodio_sti);


--
-- Name: fki_co_destruye4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_destruye4 ON j020t_acta_acc USING btree (co_destruye);


--
-- Name: fki_co_division; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division ON j002t_usuario USING btree (co_division);


--
-- Name: fki_co_division100; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division100 ON j015t_region_negocio USING btree (co_division);


--
-- Name: fki_co_division16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division16 ON j034t_incidente USING btree (co_division);


--
-- Name: fki_co_division2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division2 ON j016t_forense USING btree (co_division);


--
-- Name: fki_co_division3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division3 ON j018t_informe_forense USING btree (co_division);


--
-- Name: fki_co_division4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division4 ON j020t_acta_acc USING btree (co_division);


--
-- Name: fki_co_division5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division5 ON j021t_acta_aie USING btree (co_division);


--
-- Name: fki_co_division6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division6 ON j022t_acta_anie USING btree (co_division);


--
-- Name: fki_co_division8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division8 ON j030t_informe_recomendaciones USING btree (co_division);


--
-- Name: fki_co_elimina20; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_elimina20 ON j047t_documento_normativo USING btree (co_elimina1);


--
-- Name: fki_co_elimina22; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_elimina22 ON j047t_documento_normativo USING btree (co_elimina2);


--
-- Name: fki_co_estado_documento; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_documento ON j047t_documento_normativo USING btree (co_estado);


--
-- Name: fki_co_estado_evidencia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_evidencia ON j023t_evidencia USING btree (co_estado_evidencia);


--
-- Name: fki_co_estado_incidente; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_incidente ON j034t_incidente USING btree (co_estado);


--
-- Name: fki_co_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense ON j018t_informe_forense USING btree (co_forense);


--
-- Name: fki_co_forense12; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense12 ON j031t_accion_recomendada USING btree (co_forense);


--
-- Name: fki_co_forense17; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense17 ON j045t_referencia_marco USING btree (co_forense);


--
-- Name: fki_co_forense3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense3 ON j019t_participantes USING btree (co_forense);


--
-- Name: fki_co_forense4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense4 ON j020t_acta_acc USING btree (co_forense);


--
-- Name: fki_co_forense5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense5 ON j021t_acta_aie USING btree (co_forense);


--
-- Name: fki_co_forense6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense6 ON j022t_acta_anie USING btree (co_forense);


--
-- Name: fki_co_forense8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense8 ON j032t_seriales_enlaces_ir USING btree (co_forense);


--
-- Name: fki_co_incidente17; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_incidente17 ON j045t_referencia_marco USING btree (co_incidente);


--
-- Name: fki_co_incidente5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_incidente5 ON j031t_accion_recomendada USING btree (co_incidente);


--
-- Name: fki_co_informe_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_informe_forense ON j019t_participantes USING btree (co_informe_forense);


--
-- Name: fki_co_informe_recomendaciones2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_informe_recomendaciones2 ON j032t_seriales_enlaces_ir USING btree (co_informe_recomendaciones);


--
-- Name: fki_co_lugar_seguro; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_lugar_seguro ON j023t_evidencia USING btree (co_lugar_seguro);


--
-- Name: fki_co_marco_normativo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_marco_normativo ON j045t_referencia_marco USING btree (co_marco_normativo);


--
-- Name: fki_co_menu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_menu ON j009t_serial USING btree (co_tp_documento);


--
-- Name: fki_co_menu_rol_menu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_menu_rol_menu ON j004t_rol_menu USING btree (co_rol);


--
-- Name: fki_co_negocio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio ON j008t_division USING btree (co_negocio);


--
-- Name: fki_co_negocio13; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio13 ON j002t_usuario USING btree (co_negocio);


--
-- Name: fki_co_negocio16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio16 ON j034t_incidente USING btree (co_negocio);


--
-- Name: fki_co_negocio2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio2 ON j016t_forense USING btree (co_negocio);


--
-- Name: fki_co_negocio3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio3 ON j018t_informe_forense USING btree (co_negocio);


--
-- Name: fki_co_negocio4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio4 ON j020t_acta_acc USING btree (co_negocio);


--
-- Name: fki_co_negocio5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio5 ON j021t_acta_aie USING btree (co_negocio);


--
-- Name: fki_co_negocio6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio6 ON j022t_acta_anie USING btree (co_negocio);


--
-- Name: fki_co_negocio8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio8 ON j030t_informe_recomendaciones USING btree (co_negocio);


--
-- Name: fki_co_recurso; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_recurso ON j023t_evidencia USING btree (co_recurso);


--
-- Name: fki_co_region; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region ON j016t_forense USING btree (co_region);


--
-- Name: fki_co_region16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region16 ON j034t_incidente USING btree (co_region);


--
-- Name: fki_co_region3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region3 ON j018t_informe_forense USING btree (co_region);


--
-- Name: fki_co_region4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region4 ON j020t_acta_acc USING btree (co_region);


--
-- Name: fki_co_region5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region5 ON j021t_acta_aie USING btree (co_region);


--
-- Name: fki_co_region6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region6 ON j022t_acta_anie USING btree (co_region);


--
-- Name: fki_co_region8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region8 ON j030t_informe_recomendaciones USING btree (co_region);


--
-- Name: fki_co_region_eva; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region_eva ON j010t_evaluacion USING btree (co_region);


--
-- Name: fki_co_region_serial; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region_serial ON j009t_serial USING btree (co_region);


--
-- Name: fki_co_region_sol; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region_sol ON j006t_solicitud USING btree (co_region);


--
-- Name: fki_co_region_usuario; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region_usuario ON j002t_usuario USING btree (co_region);


--
-- Name: fki_co_registro; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_registro ON j023t_evidencia USING btree (co_registro);


--
-- Name: fki_co_repositorio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_repositorio ON j023t_evidencia USING btree (co_repositorio);


--
-- Name: fki_co_responsable_sti; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_responsable_sti ON j031t_accion_recomendada USING btree (co_responsable_sti_ejecutar);


--
-- Name: fki_co_revisa3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_revisa3 ON j018t_informe_forense USING btree (co_revisa);


--
-- Name: fki_co_revisa8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_revisa8 ON j030t_informe_recomendaciones USING btree (co_revisa);


--
-- Name: fki_co_rol; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_rol ON j002t_usuario USING btree (co_rol);


--
-- Name: fki_co_rol_menu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_rol_menu ON j004t_rol_menu USING btree (co_menu);


--
-- Name: fki_co_tipo_documento; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_documento ON j050t_informe_marco USING btree (co_tipo_documento);


--
-- Name: fki_co_tipo_evidencia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_evidencia ON j023t_evidencia USING btree (co_tipo_evidencia);


--
-- Name: fki_co_tipo_hechos; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_hechos ON j034t_incidente USING btree (co_tipo_hecho);


--
-- Name: fki_co_tipo_herramienta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_herramienta ON j041t_herramientas USING btree (co_tipo_herramientas);


--
-- Name: fki_co_tipo_incidente; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_incidente ON j044t_tipo_hechos USING btree (co_tipo_incidente);


--
-- Name: fki_co_tipo_incidentes; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_incidentes ON j034t_incidente USING btree (co_tipo_incidente);


--
-- Name: fki_co_tipo_justificacion; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_justificacion ON j050t_informe_marco USING btree (co_justificacion);


--
-- Name: fki_co_tipo_revision12; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_revision12 ON j050t_informe_marco USING btree (co_tipo_revision);


--
-- Name: fki_co_tipo_solicitud; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_solicitud ON j006t_solicitud USING btree (co_tipo_solicitud);


--
-- Name: fki_co_transaccion_enlace; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion_enlace ON j012t_cronograma USING btree (co_transaccion_enlace);


--
-- Name: fki_co_transaccion_eva; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion_eva ON j010t_evaluacion USING btree (co_transaccion);


--
-- Name: fki_co_transaccion_local; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion_local ON j012t_cronograma USING btree (co_transaccion);


--
-- Name: fki_co_transaccion_sol; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion_sol ON j006t_solicitud USING btree (co_transaccion);


--
-- Name: fki_co_update_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at ON j023t_evidencia USING btree (co_update_at);


--
-- Name: fki_co_update_at10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at10 ON j027t_lugar_seguro USING btree (co_usuario_updated);


--
-- Name: fki_co_update_at11; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at11 ON j028t_repositorio USING btree (co_usuario_updated);


--
-- Name: fki_co_update_at15; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at15 ON j048t_estado_documento USING btree (co_usuario_updated);


--
-- Name: fki_co_update_at18; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at18 ON j042t_estado_incidente USING btree (co_usuario_updated);


--
-- Name: fki_co_update_at20; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at20 ON j047t_documento_normativo USING btree (co_usuario_updated);


--
-- Name: fki_co_update_at24; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at24 ON j049t_tipo_marco USING btree (co_usuario_updated);


--
-- Name: fki_co_update_at7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at7 ON c024t_recurso USING btree (co_usuario_updated);


--
-- Name: fki_co_update_at8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at8 ON j025t_tipo_evidencia USING btree (co_usuario_updated);


--
-- Name: fki_co_update_at9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at9 ON j026t_estado_evidencia USING btree (co_usuario_updated);


--
-- Name: fki_co_updated_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_updated_at ON j031t_accion_recomendada USING btree (co_update_at);


--
-- Name: fki_co_usuario_apertura; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_apertura ON j016t_forense USING btree (co_usuario_apertura);


--
-- Name: fki_co_usuario_apertura16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_apertura16 ON j034t_incidente USING btree (co_usuario_apertura);


--
-- Name: fki_co_usuario_cierre; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_cierre ON j016t_forense USING btree (co_usuario_cierre);


--
-- Name: fki_co_usuario_cierre16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_cierre16 ON j034t_incidente USING btree (co_usuario_cierre);


--
-- Name: fki_co_usuario_created; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created ON j016t_forense USING btree (co_usuario_update);


--
-- Name: fki_co_usuario_created16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created16 ON j034t_incidente USING btree (co_usuario_update);


--
-- Name: fki_co_usuario_created27; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created27 ON j051t_tipo_revision USING btree (co_usuario_created);


--
-- Name: fki_co_usuario_created28; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created28 ON j050t_informe_marco USING btree (co_usuario_created);


--
-- Name: fki_co_usuario_created29; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created29 ON j051t_tipo_revision USING btree (co_usuario_created);


--
-- Name: fki_co_usuario_created3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created3 ON j017t_alcance_forense USING btree (co_usuario_created);


--
-- Name: fki_co_usuario_created4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created4 ON j018t_informe_forense USING btree (co_usuario_created);


--
-- Name: fki_co_usuario_created5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created5 ON j020t_acta_acc USING btree (co_usuario_created);


--
-- Name: fki_co_usuario_created6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created6 ON j021t_acta_aie USING btree (co_usuario_created);


--
-- Name: fki_co_usuario_created7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created7 ON j022t_acta_anie USING btree (co_usuario_created);


--
-- Name: fki_co_usuario_created8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created8 ON j030t_informe_recomendaciones USING btree (co_usuario_created);


--
-- Name: fki_co_usuario_cron; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_cron ON j012t_cronograma USING btree (co_usuario);


--
-- Name: fki_co_usuario_elabora; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_elabora ON j019t_participantes USING btree (co_usuario_elabora);


--
-- Name: fki_co_usuario_escala; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_escala ON j034t_incidente USING btree (co_usuario_escala);


--
-- Name: fki_co_usuario_eva; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_eva ON j010t_evaluacion USING btree (co_usuario);


--
-- Name: fki_co_usuario_tran; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_tran ON j005t_transaccion USING btree (co_usuario);


--
-- Name: fki_co_usuario_update27; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update27 ON j051t_tipo_revision USING btree (co_usuario_updated);


--
-- Name: fki_co_usuario_update28; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update28 ON j050t_informe_marco USING btree (co_usuario_update);


--
-- Name: fki_co_usuario_update29; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update29 ON j051t_tipo_revision USING btree (co_usuario_updated);


--
-- Name: fki_co_usuario_update3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update3 ON j017t_alcance_forense USING btree (co_usuario_updated);


--
-- Name: fki_co_usuario_update4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update4 ON j018t_informe_forense USING btree (co_usuario_update);


--
-- Name: fki_co_usuario_update5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update5 ON j020t_acta_acc USING btree (co_usuario_update);


--
-- Name: fki_co_usuario_update6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update6 ON j021t_acta_aie USING btree (co_usuario_update);


--
-- Name: fki_co_usuario_update7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update7 ON j022t_acta_anie USING btree (co_usuario_update);


--
-- Name: fki_co_usuario_update8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update8 ON j030t_informe_recomendaciones USING btree (co_usuario_update);


--
-- Name: fki_co_vulnerabilidad; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_vulnerabilidad ON j013t_vul_cronograma USING btree (co_vulnerabilidad);


--
-- Name: fki_incidente; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_incidente ON j037t_incidente_principio USING btree (co_incidente);


--
-- Name: fki_incidente8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_incidente8 ON j038t_incidente_servicios USING btree (co_incidente);


--
-- Name: fki_negocio_reg; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_negocio_reg ON j015t_region_negocio USING btree (co_negocio);


--
-- Name: fki_padre; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_padre ON j001t_menu USING btree (co_padre);


--
-- Name: fki_principio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_principio ON j037t_incidente_principio USING btree (co_principio);


--
-- Name: fki_recomendaciones; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_recomendaciones ON j045t_referencia_marco USING btree (co_recomendaciones);


--
-- Name: fki_servicios2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_servicios2 ON j038t_incidente_servicios USING btree (co_servicios);


--
-- Name: fki_tipo_marco; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_tipo_marco ON j047t_documento_normativo USING btree (co_tipo_marco);


--
-- Name: co_accion17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT co_accion17 FOREIGN KEY (co_accion) REFERENCES j031t_accion_recomendada(co_accion);


--
-- Name: fk_co_acc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_acc FOREIGN KEY (co_acc) REFERENCES j020t_acta_acc(co_acc);


--
-- Name: fk_co_accion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_accion FOREIGN KEY (co_accion) REFERENCES j031t_accion_recomendada(co_accion);


--
-- Name: fk_co_aie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_aie FOREIGN KEY (co_aie) REFERENCES j021t_acta_aie(co_aie);


--
-- Name: fk_co_alcance; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_alcance FOREIGN KEY (co_alcance_forense) REFERENCES j017t_alcance_forense(co_alcance_forense);


--
-- Name: fk_co_aprueba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_aprueba FOREIGN KEY (co_aprueba) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_aprueba10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_aprueba10 FOREIGN KEY (co_aprueba1) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_aprueba20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_aprueba20 FOREIGN KEY (co_aprueba2) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_aprueba8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_aprueba8 FOREIGN KEY (co_aprueba) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_colecta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_colecta FOREIGN KEY (co_colecta) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_created_at10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j027t_lugar_seguro
    ADD CONSTRAINT fk_co_created_at10 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_created_at11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j028t_repositorio
    ADD CONSTRAINT fk_co_created_at11 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_created_at12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT fk_co_created_at12 FOREIGN KEY (co_created_at) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_created_at15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j048t_estado_documento
    ADD CONSTRAINT fk_co_created_at15 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_created_at18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j042t_estado_incidente
    ADD CONSTRAINT fk_co_created_at18 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_created_at20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_created_at20 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_created_at24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j049t_tipo_marco
    ADD CONSTRAINT fk_co_created_at24 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_created_at7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c024t_recurso
    ADD CONSTRAINT fk_co_created_at7 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_created_at8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j025t_tipo_evidencia
    ADD CONSTRAINT fk_co_created_at8 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_created_at9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j026t_estado_evidencia
    ADD CONSTRAINT fk_co_created_at9 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_cronograma_vul; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j013t_vul_cronograma
    ADD CONSTRAINT fk_co_cronograma_vul FOREIGN KEY (co_cronograma) REFERENCES j012t_cronograma(co_cronograma);


--
-- Name: fk_co_custodio_niega; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_custodio_niega FOREIGN KEY (co_custodio_niega) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_custodio_sti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_custodio_sti FOREIGN KEY (co_custodio_sti) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_destruye; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_destruye FOREIGN KEY (co_destruye) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_division; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT fk_co_division FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- Name: fk_co_division100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j015t_region_negocio
    ADD CONSTRAINT fk_co_division100 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- Name: fk_co_division16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_division16 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- Name: fk_co_division2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_division2 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- Name: fk_co_division3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_division3 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- Name: fk_co_division4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_division4 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- Name: fk_co_division5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_division5 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- Name: fk_co_division6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_division6 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- Name: fk_co_division8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_division8 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- Name: fk_co_elabora4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_elabora4 FOREIGN KEY (co_elabora) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_elabora5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_elabora5 FOREIGN KEY (co_elabora) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_elabora6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_elabora6 FOREIGN KEY (co_elabora) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_elimina10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_elimina10 FOREIGN KEY (co_elimina1) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_elimina22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_elimina22 FOREIGN KEY (co_elimina2) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_estado_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_estado_documento FOREIGN KEY (co_estado) REFERENCES j048t_estado_documento(co_estado_documento);


--
-- Name: fk_co_estado_evidencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_estado_evidencia FOREIGN KEY (co_estado_evidencia) REFERENCES j026t_estado_evidencia(co_estado_evidencia);


--
-- Name: fk_co_estado_incidente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_estado_incidente FOREIGN KEY (co_estado) REFERENCES j042t_estado_incidente(co_estado_incidente);


--
-- Name: fk_co_forense; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_forense FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- Name: fk_co_forense12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT fk_co_forense12 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- Name: fk_co_forense17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT fk_co_forense17 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- Name: fk_co_forense3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j019t_participantes
    ADD CONSTRAINT fk_co_forense3 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- Name: fk_co_forense4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_forense4 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- Name: fk_co_forense5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_forense5 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- Name: fk_co_forense6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_forense6 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- Name: fk_co_forense8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j032t_seriales_enlaces_ir
    ADD CONSTRAINT fk_co_forense8 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- Name: fk_co_incidente17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT fk_co_incidente17 FOREIGN KEY (co_incidente) REFERENCES j034t_incidente(co_incidente);


--
-- Name: fk_co_incidente5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT fk_co_incidente5 FOREIGN KEY (co_incidente) REFERENCES j034t_incidente(co_incidente);


--
-- Name: fk_co_informe_forense; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j019t_participantes
    ADD CONSTRAINT fk_co_informe_forense FOREIGN KEY (co_informe_forense) REFERENCES j018t_informe_forense(co_informe_forense);


--
-- Name: fk_co_informe_recomendaciones; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j019t_participantes
    ADD CONSTRAINT fk_co_informe_recomendaciones FOREIGN KEY (co_usuario_elabora) REFERENCES j030t_informe_recomendaciones(co_informe_recomendaciones);


--
-- Name: fk_co_informe_recomendaciones2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j032t_seriales_enlaces_ir
    ADD CONSTRAINT fk_co_informe_recomendaciones2 FOREIGN KEY (co_informe_recomendaciones) REFERENCES j030t_informe_recomendaciones(co_informe_recomendaciones);


--
-- Name: fk_co_lugar_seguro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_lugar_seguro FOREIGN KEY (co_lugar_seguro) REFERENCES j027t_lugar_seguro(co_lugar_seguro);


--
-- Name: fk_co_marco_normativo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT fk_co_marco_normativo FOREIGN KEY (co_marco_normativo) REFERENCES j046t_marco_normativo(co_marco_normativo);


--
-- Name: fk_co_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j009t_serial
    ADD CONSTRAINT fk_co_menu FOREIGN KEY (co_tp_documento) REFERENCES j001t_menu(co_menu);


--
-- Name: fk_co_menu_rol_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j004t_rol_menu
    ADD CONSTRAINT fk_co_menu_rol_menu FOREIGN KEY (co_rol) REFERENCES j003t_rol(co_rol);


--
-- Name: fk_co_negocio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j008t_division
    ADD CONSTRAINT fk_co_negocio FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- Name: fk_co_negocio13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT fk_co_negocio13 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- Name: fk_co_negocio16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_negocio16 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- Name: fk_co_negocio2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_negocio2 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- Name: fk_co_negocio3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_negocio3 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- Name: fk_co_negocio4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_negocio4 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- Name: fk_co_negocio5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_negocio5 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- Name: fk_co_negocio6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_negocio6 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- Name: fk_co_negocio8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_negocio8 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- Name: fk_co_region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_region FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_region16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_region16 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_region3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_region3 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_region4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_region4 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_region5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_region5 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_region6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_region6 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_region8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_region8 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_region_eva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j010t_evaluacion
    ADD CONSTRAINT fk_co_region_eva FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_region_serial; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j009t_serial
    ADD CONSTRAINT fk_co_region_serial FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_region_sol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_solicitud
    ADD CONSTRAINT fk_co_region_sol FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_region_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT fk_co_region_usuario FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_co_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_registro FOREIGN KEY (co_registro) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_repositorio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_repositorio FOREIGN KEY (co_repositorio) REFERENCES j028t_repositorio(co_repositorio);


--
-- Name: fk_co_responsable_sti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT fk_co_responsable_sti FOREIGN KEY (co_responsable_sti_ejecutar) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_revisa3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_revisa3 FOREIGN KEY (co_revisa) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_revisa8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_revisa8 FOREIGN KEY (co_revisa) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT fk_co_rol FOREIGN KEY (co_rol) REFERENCES j003t_rol(co_rol);


--
-- Name: fk_co_rol_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j004t_rol_menu
    ADD CONSTRAINT fk_co_rol_menu FOREIGN KEY (co_menu) REFERENCES j001t_menu(co_menu);


--
-- Name: fk_co_tipo_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT fk_co_tipo_documento FOREIGN KEY (co_tipo_documento) REFERENCES j046t_marco_normativo(co_marco_normativo);


--
-- Name: fk_co_tipo_evidencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_tipo_evidencia FOREIGN KEY (co_tipo_evidencia) REFERENCES j025t_tipo_evidencia(co_tipo_evidencia);


--
-- Name: fk_co_tipo_hechos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_tipo_hechos FOREIGN KEY (co_tipo_hecho) REFERENCES j044t_tipo_hechos(co_tipo_hechos);


--
-- Name: fk_co_tipo_herramienta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j041t_herramientas
    ADD CONSTRAINT fk_co_tipo_herramienta FOREIGN KEY (co_tipo_herramientas) REFERENCES j040t_tipo_herramientas(co_tipo_herramientas);


--
-- Name: fk_co_tipo_incidente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j044t_tipo_hechos
    ADD CONSTRAINT fk_co_tipo_incidente FOREIGN KEY (co_tipo_incidente) REFERENCES j043t_tipo_incidentes(co_tipo_incidentes);


--
-- Name: fk_co_tipo_incidentes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_tipo_incidentes FOREIGN KEY (co_tipo_incidente) REFERENCES j043t_tipo_incidentes(co_tipo_incidentes);


--
-- Name: fk_co_tipo_justificacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT fk_co_tipo_justificacion FOREIGN KEY (co_justificacion) REFERENCES j052t_tipo_justificacion(co_tipo_justificacion);


--
-- Name: fk_co_tipo_revision12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT fk_co_tipo_revision12 FOREIGN KEY (co_tipo_revision) REFERENCES j051t_tipo_revision(co_tipo_revision);


--
-- Name: fk_co_tipo_solicitud; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_solicitud
    ADD CONSTRAINT fk_co_tipo_solicitud FOREIGN KEY (co_tipo_solicitud) REFERENCES j001t_menu(co_menu);


--
-- Name: fk_co_transaccion_enlace; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j012t_cronograma
    ADD CONSTRAINT fk_co_transaccion_enlace FOREIGN KEY (co_transaccion_enlace) REFERENCES j005t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion_eva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j010t_evaluacion
    ADD CONSTRAINT fk_co_transaccion_eva FOREIGN KEY (co_transaccion) REFERENCES j005t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion_local; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j012t_cronograma
    ADD CONSTRAINT fk_co_transaccion_local FOREIGN KEY (co_transaccion) REFERENCES j005t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion_sol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_solicitud
    ADD CONSTRAINT fk_co_transaccion_sol FOREIGN KEY (co_transaccion) REFERENCES j005t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion_vul; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j011t_vulnerabilidad
    ADD CONSTRAINT fk_co_transaccion_vul FOREIGN KEY (co_transaccion) REFERENCES j005t_transaccion(co_transaccion);


--
-- Name: fk_co_update_at; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_update_at FOREIGN KEY (co_update_at) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_update_at10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j027t_lugar_seguro
    ADD CONSTRAINT fk_co_update_at10 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_update_at11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j028t_repositorio
    ADD CONSTRAINT fk_co_update_at11 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_update_at15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j048t_estado_documento
    ADD CONSTRAINT fk_co_update_at15 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_update_at18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j042t_estado_incidente
    ADD CONSTRAINT fk_co_update_at18 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_update_at20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_update_at20 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_update_at24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j049t_tipo_marco
    ADD CONSTRAINT fk_co_update_at24 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_update_at7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c024t_recurso
    ADD CONSTRAINT fk_co_update_at7 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_update_at8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j025t_tipo_evidencia
    ADD CONSTRAINT fk_co_update_at8 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_update_at9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j026t_estado_evidencia
    ADD CONSTRAINT fk_co_update_at9 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_updated_at; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT fk_co_updated_at FOREIGN KEY (co_update_at) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_apertura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_usuario_apertura FOREIGN KEY (co_usuario_apertura) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_apertura16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_usuario_apertura16 FOREIGN KEY (co_usuario_apertura) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_cierre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_usuario_cierre FOREIGN KEY (co_usuario_cierre) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_cierre16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_usuario_cierre16 FOREIGN KEY (co_usuario_cierre) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_usuario_created FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_usuario_created16 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j052t_tipo_justificacion
    ADD CONSTRAINT fk_co_usuario_created27 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT fk_co_usuario_created28 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j051t_tipo_revision
    ADD CONSTRAINT fk_co_usuario_created29 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j017t_alcance_forense
    ADD CONSTRAINT fk_co_usuario_created3 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_usuario_created4 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_usuario_created5 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_usuario_created6 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_usuario_created7 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_created8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_usuario_created8 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_cron; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j012t_cronograma
    ADD CONSTRAINT fk_co_usuario_cron FOREIGN KEY (co_usuario) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_elabora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j019t_participantes
    ADD CONSTRAINT fk_co_usuario_elabora FOREIGN KEY (co_usuario_elabora) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_escala; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_usuario_escala FOREIGN KEY (co_usuario_escala) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_eva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j010t_evaluacion
    ADD CONSTRAINT fk_co_usuario_eva FOREIGN KEY (co_usuario) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_tran; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j005t_transaccion
    ADD CONSTRAINT fk_co_usuario_tran FOREIGN KEY (co_usuario) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_usuario_update FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_usuario_update16 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j052t_tipo_justificacion
    ADD CONSTRAINT fk_co_usuario_update27 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT fk_co_usuario_update28 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j051t_tipo_revision
    ADD CONSTRAINT fk_co_usuario_update29 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j017t_alcance_forense
    ADD CONSTRAINT fk_co_usuario_update3 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_usuario_update4 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_usuario_update5 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_usuario_update6 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_usuario_update7 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_usuario_update8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_usuario_update8 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- Name: fk_co_vulnerabilidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j013t_vul_cronograma
    ADD CONSTRAINT fk_co_vulnerabilidad FOREIGN KEY (co_vulnerabilidad) REFERENCES j011t_vulnerabilidad(co_vulnerabilidad);


--
-- Name: fk_incidente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j037t_incidente_principio
    ADD CONSTRAINT fk_incidente FOREIGN KEY (co_incidente) REFERENCES j034t_incidente(co_incidente);


--
-- Name: fk_incidente8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j038t_incidente_servicios
    ADD CONSTRAINT fk_incidente8 FOREIGN KEY (co_incidente) REFERENCES j034t_incidente(co_incidente);


--
-- Name: fk_negocio_reg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j015t_region_negocio
    ADD CONSTRAINT fk_negocio_reg FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- Name: fk_padre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j001t_menu
    ADD CONSTRAINT fk_padre FOREIGN KEY (co_padre) REFERENCES j001t_menu(co_menu);


--
-- Name: fk_principio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j037t_incidente_principio
    ADD CONSTRAINT fk_principio FOREIGN KEY (co_principio) REFERENCES j036t_principio(co_principio);


--
-- Name: fk_recomendaciones; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT fk_recomendaciones FOREIGN KEY (co_recomendaciones) REFERENCES j030t_informe_recomendaciones(co_informe_recomendaciones);


--
-- Name: fk_region_neg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j015t_region_negocio
    ADD CONSTRAINT fk_region_neg FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- Name: fk_servicios2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j038t_incidente_servicios
    ADD CONSTRAINT fk_servicios2 FOREIGN KEY (co_servicios) REFERENCES j035t_servicios(co_servicios);


--
-- Name: fk_tipo_marco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_tipo_marco FOREIGN KEY (co_tipo_marco) REFERENCES j049t_tipo_marco(co_tipo_marco);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

