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
-- Name: sgsti; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE sgsti IS 'Base de Datos del Sistema de Gestión de Seguridad en Tecnologías de Informaciín (SGSTI)';


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
-- Name: actualizar_menu(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION actualizar_menu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
  BEGIN

   IF NEW.in_ver = true then
	   update j810t_rol_producto j810t set in_ver = true
		from  j808t_producto j808t
		 where j810t.co_producto = j808t.co_producto and 
		       j808t.co_producto in (select co_padre from j808t_producto where co_producto = NEW.co_producto)
		       and j810t.in_ver = true;
   end if;
      
   RETURN NEW;
  END;
$$;


ALTER FUNCTION public.actualizar_menu() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: c001t_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c001t_forense (
    co_forense bigint NOT NULL,
    fe_apertura date,
    fe_cierre date,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    tx_serial character varying,
    tx_titulo character varying NOT NULL,
    tx_descripcion_solicitud text,
    tx_caso_aaii character varying,
    co_alcance_forense bigint NOT NULL,
    tx_metologia_herramientas text,
    tx_observaciones text,
    co_transaccion bigint,
    co_clasificacion bigint NOT NULL,
    in_abierto boolean,
    created_at timestamp with time zone,
    update_at timestamp with time zone,
    co_estado_forense bigint NOT NULL
);


ALTER TABLE public.c001t_forense OWNER TO postgres;

--
-- Name: c001t_forense_co_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c001t_forense_co_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c001t_forense_co_forense_seq OWNER TO postgres;

--
-- Name: c001t_forense_co_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c001t_forense_co_forense_seq OWNED BY c001t_forense.co_forense;


--
-- Name: c002t_informe_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c002t_informe_forense (
    co_informe_forense bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    co_estado_informe bigint NOT NULL,
    tx_serial character varying,
    tx_titulo character varying NOT NULL,
    tx_descripcion_entorno text,
    tx_resultados text,
    tx_conclusiones text,
    tx_observaciones character varying,
    tx_ruta_pdf character varying,
    nb_archivo_pdf character varying,
    co_transaccion bigint NOT NULL,
    co_clasificacion bigint NOT NULL,
    in_abierto boolean,
    created_at timestamp with time zone,
    update_at timestamp with time zone,
    co_forense bigint NOT NULL,
    nb_archivo_soporte character varying,
    tx_ruta_soporte character varying
);


ALTER TABLE public.c002t_informe_forense OWNER TO postgres;

--
-- Name: c002t_informe_forense_co_informe_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c002t_informe_forense_co_informe_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c002t_informe_forense_co_informe_forense_seq OWNER TO postgres;

--
-- Name: c002t_informe_forense_co_informe_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c002t_informe_forense_co_informe_forense_seq OWNED BY c002t_informe_forense.co_informe_forense;


--
-- Name: c003t_acta_acc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c003t_acta_acc (
    co_acc bigint NOT NULL,
    fe_emision date NOT NULL,
    co_forense bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    tx_serial character varying,
    co_estado_acta bigint NOT NULL,
    fe_destruye date,
    co_destruye bigint,
    tx_observaciones character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    in_abierta boolean,
    co_clasificacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    created_at timestamp with time zone,
    co_elabora bigint NOT NULL,
    co_custodio bigint NOT NULL,
    co_tipo_recurso bigint NOT NULL,
    co_ciudad_acta bigint NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.c003t_acta_acc OWNER TO postgres;

--
-- Name: c003t_acta_acc_co_acc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c003t_acta_acc_co_acc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c003t_acta_acc_co_acc_seq OWNER TO postgres;

--
-- Name: c003t_acta_acc_co_acc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c003t_acta_acc_co_acc_seq OWNED BY c003t_acta_acc.co_acc;


--
-- Name: c004t_acta_aie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c004t_acta_aie (
    co_aie bigint NOT NULL,
    fe_emision date NOT NULL,
    co_forense bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    tx_serial character varying,
    tx_observaciones character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    in_abierta boolean,
    co_clasificacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at time without time zone,
    co_elabora bigint NOT NULL,
    co_custodio bigint NOT NULL,
    co_recurso bigint NOT NULL,
    co_ciudad_acta bigint NOT NULL
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
-- Name: c005t_acta_anie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c005t_acta_anie (
    co_anie bigint NOT NULL,
    fe_emision date NOT NULL,
    co_forense bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    tx_serial character varying,
    co_elabora bigint NOT NULL,
    co_niega bigint NOT NULL,
    tx_observaciones character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    in_abierta boolean,
    co_clasificacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at time without time zone
);


ALTER TABLE public.c005t_acta_anie OWNER TO postgres;

--
-- Name: c005t_acta_anie_co_anie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c005t_acta_anie_co_anie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c005t_acta_anie_co_anie_seq OWNER TO postgres;

--
-- Name: c005t_acta_anie_co_anie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c005t_acta_anie_co_anie_seq OWNED BY c005t_acta_anie.co_anie;


--
-- Name: c006t_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c006t_evidencia (
    co_evidencia bigint NOT NULL,
    fe_registro date,
    co_registra bigint NOT NULL,
    co_acc bigint,
    co_aie bigint,
    tx_descripcion_coleccion character varying,
    fe_coleccion_evidencia date,
    co_colecta bigint NOT NULL,
    co_recurso bigint NOT NULL,
    tx_nombre_recurso character varying,
    tx_serial_recurso character varying,
    tx_marca_recurso character varying,
    tx_modelo_recurso character varying,
    tx_numero_activo character varying,
    co_tipo_evidencia bigint NOT NULL,
    co_estado_evidencia bigint NOT NULL,
    co_lugar_seguro bigint,
    co_repositorio bigint,
    co_custodio_sti bigint,
    tx_observaciones character varying,
    in_abierta boolean,
    co_clasificacion bigint,
    co_transaccion bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    co_entregado_fuera_sti bigint,
    co_custodio bigint NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.c006t_evidencia OWNER TO postgres;

--
-- Name: c006t_evidencia_co_evidencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c006t_evidencia_co_evidencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c006t_evidencia_co_evidencia_seq OWNER TO postgres;

--
-- Name: c006t_evidencia_co_evidencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c006t_evidencia_co_evidencia_seq OWNED BY c006t_evidencia.co_evidencia;


--
-- Name: c007t_figuras_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c007t_figuras_forense (
    co_figuras_forense bigint NOT NULL,
    co_informe_forense bigint,
    tx_titulo character varying,
    tx_descripcion character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    co_clasificacion bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.c007t_figuras_forense OWNER TO postgres;

--
-- Name: c007t_figuras_forense_co_anexos_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c007t_figuras_forense_co_anexos_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c007t_figuras_forense_co_anexos_forense_seq OWNER TO postgres;

--
-- Name: c007t_figuras_forense_co_anexos_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c007t_figuras_forense_co_anexos_forense_seq OWNED BY c007t_figuras_forense.co_figuras_forense;


--
-- Name: c008t_anexos_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c008t_anexos_forense (
    co_anexos_forense bigint NOT NULL,
    co_informe_forense bigint,
    tx_titulo character varying,
    tx_descripcion character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    co_clasificacion bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.c008t_anexos_forense OWNER TO postgres;

--
-- Name: c008t_anexos_forense_co_anexos_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c008t_anexos_forense_co_anexos_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c008t_anexos_forense_co_anexos_forense_seq OWNER TO postgres;

--
-- Name: c008t_anexos_forense_co_anexos_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c008t_anexos_forense_co_anexos_forense_seq OWNED BY c008t_anexos_forense.co_anexos_forense;


--
-- Name: c805t_rel_transaccion_principio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c805t_rel_transaccion_principio (
    co_relacion bigint NOT NULL,
    co_transaccion bigint,
    co_principio bigint
);


ALTER TABLE public.c805t_rel_transaccion_principio OWNER TO postgres;

--
-- Name: c009t_rel_forense_principio_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c009t_rel_forense_principio_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c009t_rel_forense_principio_co_relacion_seq OWNER TO postgres;

--
-- Name: c009t_rel_forense_principio_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c009t_rel_forense_principio_co_relacion_seq OWNED BY c805t_rel_transaccion_principio.co_relacion;


--
-- Name: c806t_rel_transaccion_marco_normativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c806t_rel_transaccion_marco_normativo (
    co_relacion bigint NOT NULL,
    co_transaccion bigint,
    co_marco_normativo bigint
);


ALTER TABLE public.c806t_rel_transaccion_marco_normativo OWNER TO postgres;

--
-- Name: c010t_rel_forense_marco_normativo_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c010t_rel_forense_marco_normativo_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c010t_rel_forense_marco_normativo_co_relacion_seq OWNER TO postgres;

--
-- Name: c010t_rel_forense_marco_normativo_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c010t_rel_forense_marco_normativo_co_relacion_seq OWNED BY c806t_rel_transaccion_marco_normativo.co_relacion;


--
-- Name: c020t_incidente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c020t_incidente (
    co_incidente bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    tx_serial character varying,
    co_estado_incidente bigint NOT NULL,
    co_tipo_incidente bigint NOT NULL,
    co_tipo_hecho bigint NOT NULL,
    tx_descripcion character varying,
    fe_incio_hecho date,
    fe_fin_hecho date,
    tx_causa character varying,
    tx_metologia_herramientas character varying,
    tx_observaciones character varying,
    tx_ruta_pdf character varying,
    nb_archivo_pdf character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint NOT NULL,
    co_usuario_update bigint NOT NULL,
    tx_acciones_tomadas character varying
);


ALTER TABLE public.c020t_incidente OWNER TO postgres;

--
-- Name: c020t_incidente_co_incidente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c020t_incidente_co_incidente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c020t_incidente_co_incidente_seq OWNER TO postgres;

--
-- Name: c020t_incidente_co_incidente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c020t_incidente_co_incidente_seq OWNED BY c020t_incidente.co_incidente;


--
-- Name: c021t_rel_incidente_servicio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c021t_rel_incidente_servicio (
    co_relacion bigint NOT NULL,
    co_incidente bigint,
    co_servicio bigint
);


ALTER TABLE public.c021t_rel_incidente_servicio OWNER TO postgres;

--
-- Name: c021t_rel_incidente_servicio_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c021t_rel_incidente_servicio_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c021t_rel_incidente_servicio_co_relacion_seq OWNER TO postgres;

--
-- Name: c021t_rel_incidente_servicio_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c021t_rel_incidente_servicio_co_relacion_seq OWNED BY c021t_rel_incidente_servicio.co_relacion;


--
-- Name: c060_inventario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c060_inventario (
    co_equipo bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    co_tipo bigint NOT NULL,
    co_custodio bigint NOT NULL,
    tx_etiqueta_sti character varying NOT NULL,
    co_estado bigint NOT NULL,
    tx_nombre_equipo character varying NOT NULL,
    tx_funsion_equipo character varying NOT NULL,
    co_so bigint NOT NULL,
    tx_etiqueta_activo character varying NOT NULL,
    tx_serial_hardware character varying NOT NULL,
    tx_marca_hardware character varying NOT NULL,
    tx_modelo_hardware character varying NOT NULL,
    co_ciudad bigint NOT NULL,
    co_edificio bigint NOT NULL,
    tx_direccion_ubicacion character varying NOT NULL,
    tx_detalle_ubicacion character varying NOT NULL,
    co_centro_dato bigint NOT NULL,
    co_rack bigint NOT NULL,
    tx_ubicacion_llave character varying NOT NULL,
    in_respaldo_automatizado boolean NOT NULL,
    in_bloqueo_inactividad boolean NOT NULL,
    in_adiministradores_personalizados boolean NOT NULL,
    in_politica_password boolean NOT NULL,
    in_sincronizacion_reloj boolean NOT NULL,
    in_monitoreado boolean NOT NULL,
    in_inf_actualizada boolean NOT NULL,
    in_log_activo boolean NOT NULL,
    co_nivel_criticidad bigint NOT NULL,
    tx_observaciones text,
    tx_ruta_respaldo_configuraciones character varying NOT NULL,
    co_num_inventario bigint NOT NULL
);


ALTER TABLE public.c060_inventario OWNER TO postgres;

--
-- Name: COLUMN c060_inventario.tx_direccion_ubicacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c060_inventario.tx_direccion_ubicacion IS 'ciudad-edificio-piso/oficina';


--
-- Name: c060_inventario_co_centro_dato_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_centro_dato_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_centro_dato_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_centro_dato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_centro_dato_seq OWNED BY c060_inventario.co_centro_dato;


--
-- Name: c060_inventario_co_ciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_ciudad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_ciudad_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_ciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_ciudad_seq OWNED BY c060_inventario.co_ciudad;


--
-- Name: c060_inventario_co_custodio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_custodio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_custodio_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_custodio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_custodio_seq OWNED BY c060_inventario.co_custodio;


--
-- Name: c060_inventario_co_division_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_division_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_division_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_division_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_division_seq OWNED BY c060_inventario.co_division;


--
-- Name: c060_inventario_co_edificio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_edificio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_edificio_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_edificio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_edificio_seq OWNED BY c060_inventario.co_edificio;


--
-- Name: c060_inventario_co_equipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_equipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_equipo_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_equipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_equipo_seq OWNED BY c060_inventario.co_equipo;


--
-- Name: c060_inventario_co_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_estado_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_estado_seq OWNED BY c060_inventario.co_estado;


--
-- Name: c060_inventario_co_negocio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_negocio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_negocio_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_negocio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_negocio_seq OWNED BY c060_inventario.co_negocio;


--
-- Name: c060_inventario_co_nivel_criticidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_nivel_criticidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_nivel_criticidad_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_nivel_criticidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_nivel_criticidad_seq OWNED BY c060_inventario.co_nivel_criticidad;


--
-- Name: c060_inventario_co_num_inventario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_num_inventario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_num_inventario_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_num_inventario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_num_inventario_seq OWNED BY c060_inventario.co_num_inventario;


--
-- Name: c060_inventario_co_rack_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_rack_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_rack_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_rack_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_rack_seq OWNED BY c060_inventario.co_rack;


--
-- Name: c060_inventario_co_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_region_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_region_seq OWNED BY c060_inventario.co_region;


--
-- Name: c060_inventario_co_so_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_so_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_so_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_so_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_so_seq OWNED BY c060_inventario.co_so;


--
-- Name: c060_inventario_co_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_tipo_seq OWNER TO postgres;

--
-- Name: c060_inventario_co_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_tipo_seq OWNED BY c060_inventario.co_tipo;


--
-- Name: c120t_aprobacion_acceso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c120t_aprobacion_acceso (
    co_aprobacion_acceso bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    co_tipo_acceso bigint NOT NULL,
    co_perfil_solicitado bigint NOT NULL,
    tx_indicador_solicitante character varying NOT NULL,
    co_gerencia_solicitante bigint NOT NULL,
    tx_justificacion character varying NOT NULL,
    tx_gerente_aprobador_solicitante character varying NOT NULL,
    num_caso_siga numeric NOT NULL,
    co_estado_aprobador bigint NOT NULL,
    nb_ruta_soporte character varying,
    tx_observacion text
);


ALTER TABLE public.c120t_aprobacion_acceso OWNER TO postgres;

--
-- Name: c120t_aprobacion_acceso_co_aprobacion_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_aprobacion_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_aprobacion_acceso_seq OWNER TO postgres;

--
-- Name: c120t_aprobacion_acceso_co_aprobacion_acceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_aprobacion_acceso_seq OWNED BY c120t_aprobacion_acceso.co_aprobacion_acceso;


--
-- Name: c120t_aprobacion_acceso_co_division_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_division_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_division_seq OWNER TO postgres;

--
-- Name: c120t_aprobacion_acceso_co_division_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_division_seq OWNED BY c120t_aprobacion_acceso.co_division;


--
-- Name: c120t_aprobacion_acceso_co_estado_aprobador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_estado_aprobador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_estado_aprobador_seq OWNER TO postgres;

--
-- Name: c120t_aprobacion_acceso_co_estado_aprobador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_estado_aprobador_seq OWNED BY c120t_aprobacion_acceso.co_estado_aprobador;


--
-- Name: c120t_aprobacion_acceso_co_gerencia_solicitante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_gerencia_solicitante_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_gerencia_solicitante_seq OWNER TO postgres;

--
-- Name: c120t_aprobacion_acceso_co_gerencia_solicitante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_gerencia_solicitante_seq OWNED BY c120t_aprobacion_acceso.co_gerencia_solicitante;


--
-- Name: c120t_aprobacion_acceso_co_negocio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_negocio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_negocio_seq OWNER TO postgres;

--
-- Name: c120t_aprobacion_acceso_co_negocio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_negocio_seq OWNED BY c120t_aprobacion_acceso.co_negocio;


--
-- Name: c120t_aprobacion_acceso_co_perfil_solicitado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_perfil_solicitado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_perfil_solicitado_seq OWNER TO postgres;

--
-- Name: c120t_aprobacion_acceso_co_perfil_solicitado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_perfil_solicitado_seq OWNED BY c120t_aprobacion_acceso.co_perfil_solicitado;


--
-- Name: c120t_aprobacion_acceso_co_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_region_seq OWNER TO postgres;

--
-- Name: c120t_aprobacion_acceso_co_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_region_seq OWNED BY c120t_aprobacion_acceso.co_region;


--
-- Name: c120t_aprobacion_acceso_co_tipo_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_tipo_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_tipo_acceso_seq OWNER TO postgres;

--
-- Name: c120t_aprobacion_acceso_co_tipo_acceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_tipo_acceso_seq OWNED BY c120t_aprobacion_acceso.co_tipo_acceso;


--
-- Name: c140t_depuracion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c140t_depuracion (
    co_depuracion bigint NOT NULL,
    co_region integer NOT NULL,
    co_negocio integer NOT NULL,
    co_division integer NOT NULL,
    co_tipo_depuracion integer NOT NULL,
    co_equipo integer NOT NULL,
    co_sistema integer NOT NULL,
    co_estado_depuracion integer NOT NULL,
    fe_mes_planificado date,
    tx_serial_depuracion character varying,
    fe_depuracion date,
    tx_indicador_responsable character varying,
    tx_resumen text,
    nu_total_accesos numeric,
    nu_total_depuracion numeric,
    tx_observaciones text,
    co_clasificacion integer,
    nb_anexos_soporte character varying,
    tx_ruta_anexo_soporte character varying,
    nb_anexos_informe character varying,
    tx_ruta_anexo_informe character varying,
    created_at date,
    updated_at date,
    co_transaccion integer,
    ar_anexo_soporte bytea,
    mime_anexo_soporte character varying
);


ALTER TABLE public.c140t_depuracion OWNER TO postgres;

--
-- Name: TABLE c140t_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE c140t_depuracion IS 'Tabla de Depuracion de Accesos Logicos';


--
-- Name: COLUMN c140t_depuracion.co_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_depuracion IS 'clave primaria autoincremental';


--
-- Name: COLUMN c140t_depuracion.co_region; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_region IS 'clave primaria de la tabla region';


--
-- Name: COLUMN c140t_depuracion.co_negocio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_negocio IS 'clave primaria de la tabla negocio';


--
-- Name: COLUMN c140t_depuracion.co_division; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_division IS 'clave primaria de la tabla division';


--
-- Name: COLUMN c140t_depuracion.co_tipo_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_tipo_depuracion IS 'Codigo tipo de depuracion';


--
-- Name: COLUMN c140t_depuracion.co_equipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_equipo IS 'Codigo tipo de equipo';


--
-- Name: COLUMN c140t_depuracion.co_sistema; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_sistema IS 'Codigo tipo de sistemas';


--
-- Name: COLUMN c140t_depuracion.co_estado_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_estado_depuracion IS 'Codigo tipo de Estado de la depuracion';


--
-- Name: COLUMN c140t_depuracion.fe_mes_planificado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.fe_mes_planificado IS 'Mes planificado de la depuracion';


--
-- Name: COLUMN c140t_depuracion.tx_serial_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_serial_depuracion IS 'Serial de informe de depuracion';


--
-- Name: COLUMN c140t_depuracion.fe_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.fe_depuracion IS 'Fecha del informe de depuracion';


--
-- Name: COLUMN c140t_depuracion.tx_indicador_responsable; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_indicador_responsable IS 'Indicador del responsable de la depuracion';


--
-- Name: COLUMN c140t_depuracion.tx_resumen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_resumen IS 'Resumen ejecutivo de la depueracion';


--
-- Name: COLUMN c140t_depuracion.nu_total_accesos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.nu_total_accesos IS 'Numero total de accesos logicos de la apliacion o del sistema';


--
-- Name: COLUMN c140t_depuracion.nu_total_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.nu_total_depuracion IS 'Numero total de accesos o cuentas a depurar';


--
-- Name: COLUMN c140t_depuracion.tx_observaciones; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_observaciones IS 'Observaciones adicionales de la depuracion';


--
-- Name: COLUMN c140t_depuracion.co_clasificacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_clasificacion IS 'Codigo de la clasificacion del informe';


--
-- Name: COLUMN c140t_depuracion.nb_anexos_soporte; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.nb_anexos_soporte IS 'Anexos o Sorte que van al final del informe';


--
-- Name: COLUMN c140t_depuracion.tx_ruta_anexo_soporte; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_ruta_anexo_soporte IS 'Ruta de Anexos o Sorte que van al final del informe';


--
-- Name: COLUMN c140t_depuracion.nb_anexos_informe; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.nb_anexos_informe IS 'Anexos o Sorte que van dentro del informe';


--
-- Name: COLUMN c140t_depuracion.tx_ruta_anexo_informe; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_ruta_anexo_informe IS 'Ruta Anexos o Sorte que van dentro del informe';


--
-- Name: COLUMN c140t_depuracion.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.created_at IS 'Fecha de la cracion del regitro';


--
-- Name: COLUMN c140t_depuracion.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.updated_at IS 'Fecha de modificiacion del registro';


--
-- Name: COLUMN c140t_depuracion.co_transaccion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_transaccion IS 'Codigo de la transaccion';


--
-- Name: c140t_depuracion_co_depuracion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c140t_depuracion_co_depuracion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c140t_depuracion_co_depuracion_seq OWNER TO postgres;

--
-- Name: c140t_depuracion_co_depuracion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c140t_depuracion_co_depuracion_seq OWNED BY c140t_depuracion.co_depuracion;


--
-- Name: c141t_rel_criterio_depuracion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c141t_rel_criterio_depuracion (
    co_relacion bigint NOT NULL,
    co_depuracion integer NOT NULL,
    co_criterio integer NOT NULL,
    nu_depurar numeric NOT NULL,
    created_at date NOT NULL,
    update_at date
);


ALTER TABLE public.c141t_rel_criterio_depuracion OWNER TO postgres;

--
-- Name: TABLE c141t_rel_criterio_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE c141t_rel_criterio_depuracion IS 'Tabla relacion de la tabla criterio de depuracion con la tabla depuracion';


--
-- Name: COLUMN c141t_rel_criterio_depuracion.co_relacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.co_relacion IS 'Clave primaria de la tabla relacion';


--
-- Name: COLUMN c141t_rel_criterio_depuracion.co_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.co_depuracion IS 'codigo de la clave primara de la tabla depuracion';


--
-- Name: COLUMN c141t_rel_criterio_depuracion.co_criterio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.co_criterio IS 'codigo de la clave primara de la tabla criterio';


--
-- Name: COLUMN c141t_rel_criterio_depuracion.nu_depurar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.nu_depurar IS 'Numero a depurar';


--
-- Name: COLUMN c141t_rel_criterio_depuracion.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.created_at IS 'Fecha de creacion de registro';


--
-- Name: COLUMN c141t_rel_criterio_depuracion.update_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.update_at IS 'fecha de modificacion del registro';


--
-- Name: c141t_rel_criterio_depuracion_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c141t_rel_criterio_depuracion_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c141t_rel_criterio_depuracion_co_relacion_seq OWNER TO postgres;

--
-- Name: c141t_rel_criterio_depuracion_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c141t_rel_criterio_depuracion_co_relacion_seq OWNED BY c141t_rel_criterio_depuracion.co_relacion;


--
-- Name: c200t_evaluacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c200t_evaluacion (
    co_evaluacion bigint NOT NULL,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_gerencia_solicitante bigint,
    co_persona_solicitante bigint,
    co_clasificacion bigint,
    tx_observaciones character varying,
    co_transaccion bigint
);


ALTER TABLE public.c200t_evaluacion OWNER TO postgres;

--
-- Name: c160t_evaluacion_co_evaluacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c160t_evaluacion_co_evaluacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c160t_evaluacion_co_evaluacion_seq OWNER TO postgres;

--
-- Name: c160t_evaluacion_co_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c160t_evaluacion_co_evaluacion_seq OWNED BY c200t_evaluacion.co_evaluacion;


--
-- Name: c201t_rel_evaluacion_activo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c201t_rel_evaluacion_activo (
    co_relacion bigint NOT NULL,
    co_evaluacion bigint,
    co_activo bigint
);


ALTER TABLE public.c201t_rel_evaluacion_activo OWNER TO postgres;

--
-- Name: c201t_rel_evaluacion_activo_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c201t_rel_evaluacion_activo_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c201t_rel_evaluacion_activo_co_relacion_seq OWNER TO postgres;

--
-- Name: c201t_rel_evaluacion_activo_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c201t_rel_evaluacion_activo_co_relacion_seq OWNED BY c201t_rel_evaluacion_activo.co_relacion;


--
-- Name: c203t_rel_informe_evaluacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c203t_rel_informe_evaluacion (
    co_informe bigint NOT NULL,
    co_evaluacion bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_estado_informe bigint,
    tx_titulo character varying
);


ALTER TABLE public.c203t_rel_informe_evaluacion OWNER TO postgres;

--
-- Name: c203t_rel_informe_evaluacion_co_informe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c203t_rel_informe_evaluacion_co_informe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c203t_rel_informe_evaluacion_co_informe_seq OWNER TO postgres;

--
-- Name: c203t_rel_informe_evaluacion_co_informe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c203t_rel_informe_evaluacion_co_informe_seq OWNED BY c203t_rel_informe_evaluacion.co_informe;


--
-- Name: c801t_transaccion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c801t_transaccion (
    co_transaccion bigint NOT NULL,
    co_producto bigint,
    nu_valor bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.c801t_transaccion OWNER TO postgres;

--
-- Name: c801t_transaccion_co_transaccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c801t_transaccion_co_transaccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c801t_transaccion_co_transaccion_seq OWNER TO postgres;

--
-- Name: c801t_transaccion_co_transaccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c801t_transaccion_co_transaccion_seq OWNED BY c801t_transaccion.co_transaccion;


--
-- Name: c802t_cadena_aprobacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c802t_cadena_aprobacion (
    co_cadena_aprobacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    co_persona bigint NOT NULL,
    co_accion bigint NOT NULL,
    fe_accion date,
    tx_observacion character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.c802t_cadena_aprobacion OWNER TO postgres;

--
-- Name: c802t_cadena_aprobacion_co_cadena_aprobacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c802t_cadena_aprobacion_co_cadena_aprobacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c802t_cadena_aprobacion_co_cadena_aprobacion_seq OWNER TO postgres;

--
-- Name: c802t_cadena_aprobacion_co_cadena_aprobacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c802t_cadena_aprobacion_co_cadena_aprobacion_seq OWNED BY c802t_cadena_aprobacion.co_cadena_aprobacion;


--
-- Name: c803t_accion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c803t_accion (
    co_accion bigint NOT NULL,
    co_transaccion bigint,
    tx_descripcion character varying,
    co_tipo_control bigint,
    co_categoria_accion character varying,
    in_abierto boolean,
    created_at timestamp with time zone,
    update_at timestamp with time zone,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.c803t_accion OWNER TO postgres;

--
-- Name: c803t_accion_co_accion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c803t_accion_co_accion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c803t_accion_co_accion_seq OWNER TO postgres;

--
-- Name: c803t_accion_co_accion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c803t_accion_co_accion_seq OWNED BY c803t_accion.co_accion;


--
-- Name: c804t_seguimiento_accion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c804t_seguimiento_accion (
    co_seguimiento_accion bigint NOT NULL,
    co_accion bigint,
    co_estado_accion bigint,
    co_responsable_sti bigint,
    co_responsable_ejecutar bigint,
    co_gerencia_responsable bigint,
    fe_planificada_ejecutar date,
    fe_seguimiento_sti date,
    tx_respuesta_responsable text,
    tx_observaciones character varying,
    nb_archivo_evidencia character varying,
    tx_ruta_evidencia character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.c804t_seguimiento_accion OWNER TO postgres;

--
-- Name: c804t_seguimiento_accion_co_seguimiento_accion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c804t_seguimiento_accion_co_seguimiento_accion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c804t_seguimiento_accion_co_seguimiento_accion_seq OWNER TO postgres;

--
-- Name: c804t_seguimiento_accion_co_seguimiento_accion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c804t_seguimiento_accion_co_seguimiento_accion_seq OWNED BY c804t_seguimiento_accion.co_seguimiento_accion;


--
-- Name: j001t_alcance_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j001t_alcance_forense (
    co_alcance_forense bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j001t_alcance_forense OWNER TO postgres;

--
-- Name: j001t_alcance_forense_co_alcance_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j001t_alcance_forense_co_alcance_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j001t_alcance_forense_co_alcance_forense_seq OWNER TO postgres;

--
-- Name: j001t_alcance_forense_co_alcance_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j001t_alcance_forense_co_alcance_forense_seq OWNED BY j001t_alcance_forense.co_alcance_forense;


--
-- Name: j002t_tipo_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j002t_tipo_evidencia (
    co_tipo_evidencia bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j002t_tipo_evidencia OWNER TO postgres;

--
-- Name: j002t_tipo_evidencia_co_tipo_evidencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j002t_tipo_evidencia_co_tipo_evidencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j002t_tipo_evidencia_co_tipo_evidencia_seq OWNER TO postgres;

--
-- Name: j002t_tipo_evidencia_co_tipo_evidencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j002t_tipo_evidencia_co_tipo_evidencia_seq OWNED BY j002t_tipo_evidencia.co_tipo_evidencia;


--
-- Name: j003t_estado_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j003t_estado_evidencia (
    co_estado_evidencia bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j003t_estado_evidencia OWNER TO postgres;

--
-- Name: j003t_estado_evidencia_co_estado_evidencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j003t_estado_evidencia_co_estado_evidencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j003t_estado_evidencia_co_estado_evidencia_seq OWNER TO postgres;

--
-- Name: j003t_estado_evidencia_co_estado_evidencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j003t_estado_evidencia_co_estado_evidencia_seq OWNED BY j003t_estado_evidencia.co_estado_evidencia;


--
-- Name: j004t_estado_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j004t_estado_forense (
    co_estado_forense bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j004t_estado_forense OWNER TO postgres;

--
-- Name: j004t_estado_forense_co_estado_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j004t_estado_forense_co_estado_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j004t_estado_forense_co_estado_forense_seq OWNER TO postgres;

--
-- Name: j004t_estado_forense_co_estado_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j004t_estado_forense_co_estado_forense_seq OWNED BY j004t_estado_forense.co_estado_forense;


--
-- Name: j005t_estado_acta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j005t_estado_acta (
    co_estado_acta bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j005t_estado_acta OWNER TO postgres;

--
-- Name: j005t_estado_acta_co_estado_acta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j005t_estado_acta_co_estado_acta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j005t_estado_acta_co_estado_acta_seq OWNER TO postgres;

--
-- Name: j005t_estado_acta_co_estado_acta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j005t_estado_acta_co_estado_acta_seq OWNED BY j005t_estado_acta.co_estado_acta;


--
-- Name: j006t_lugar_seguro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j006t_lugar_seguro (
    co_lugar_seguro bigint NOT NULL,
    tx_titulo character varying NOT NULL,
    tx_ubicacion_fisica character varying,
    co_gerencia bigint NOT NULL,
    co_custodio bigint NOT NULL,
    tx_observaciones character varying,
    co_clasificacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_ciudad bigint,
    co_localidad bigint
);


ALTER TABLE public.j006t_lugar_seguro OWNER TO postgres;

--
-- Name: j006t_lugar_seguro_co_lugar_seguro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j006t_lugar_seguro_co_lugar_seguro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j006t_lugar_seguro_co_lugar_seguro_seq OWNER TO postgres;

--
-- Name: j006t_lugar_seguro_co_lugar_seguro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j006t_lugar_seguro_co_lugar_seguro_seq OWNED BY j006t_lugar_seguro.co_lugar_seguro;


--
-- Name: j007t_repositorio_digital; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j007t_repositorio_digital (
    co_repositorio_digital bigint NOT NULL,
    tx_titulo character varying NOT NULL,
    tx_direccion_ip character varying,
    co_gerencia bigint NOT NULL,
    co_custodio bigint NOT NULL,
    tx_observaciones character varying,
    co_clasificacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    update_at timestamp with time zone NOT NULL
);


ALTER TABLE public.j007t_repositorio_digital OWNER TO postgres;

--
-- Name: j007t_repositorio_digital_co_repositorio_digital_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j007t_repositorio_digital_co_repositorio_digital_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j007t_repositorio_digital_co_repositorio_digital_seq OWNER TO postgres;

--
-- Name: j007t_repositorio_digital_co_repositorio_digital_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j007t_repositorio_digital_co_repositorio_digital_seq OWNED BY j007t_repositorio_digital.co_repositorio_digital;


--
-- Name: j061_sistema_operativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j061_sistema_operativo (
    co_so bigint NOT NULL,
    tx_nombre_sistema_operativo_version text NOT NULL
);


ALTER TABLE public.j061_sistema_operativo OWNER TO postgres;

--
-- Name: j061_sistema_operativo_co_so_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j061_sistema_operativo_co_so_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j061_sistema_operativo_co_so_seq OWNER TO postgres;

--
-- Name: j061_sistema_operativo_co_so_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j061_sistema_operativo_co_so_seq OWNED BY j061_sistema_operativo.co_so;


--
-- Name: j062_interfaces; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j062_interfaces (
    co_interfaz bigint NOT NULL,
    tx_nombre_interfaz character varying NOT NULL,
    tx_ip character varying NOT NULL,
    tx_mac character varying NOT NULL,
    co_equipo bigint NOT NULL,
    co_equipo_conectado bigint NOT NULL,
    tx_observaciones character varying
);


ALTER TABLE public.j062_interfaces OWNER TO postgres;

--
-- Name: j062_interfaces_co_equipo_conectado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j062_interfaces_co_equipo_conectado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j062_interfaces_co_equipo_conectado_seq OWNER TO postgres;

--
-- Name: j062_interfaces_co_equipo_conectado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j062_interfaces_co_equipo_conectado_seq OWNED BY j062_interfaces.co_equipo_conectado;


--
-- Name: j062_interfaces_co_equipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j062_interfaces_co_equipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j062_interfaces_co_equipo_seq OWNER TO postgres;

--
-- Name: j062_interfaces_co_equipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j062_interfaces_co_equipo_seq OWNED BY j062_interfaces.co_equipo;


--
-- Name: j062_interfaces_co_interfaz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j062_interfaces_co_interfaz_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j062_interfaces_co_interfaz_seq OWNER TO postgres;

--
-- Name: j062_interfaces_co_interfaz_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j062_interfaces_co_interfaz_seq OWNED BY j062_interfaces.co_interfaz;


--
-- Name: j063_aplicacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j063_aplicacion (
    co_aplicacion bigint NOT NULL,
    tx_nombre_aplicacion character varying NOT NULL
);


ALTER TABLE public.j063_aplicacion OWNER TO postgres;

--
-- Name: j063_aplicacion_co_aplicacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j063_aplicacion_co_aplicacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j063_aplicacion_co_aplicacion_seq OWNER TO postgres;

--
-- Name: j063_aplicacion_co_aplicacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j063_aplicacion_co_aplicacion_seq OWNED BY j063_aplicacion.co_aplicacion;


--
-- Name: j140t_criterio_depuracion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j140t_criterio_depuracion (
    tx_descripcoin text NOT NULL,
    created_at date NOT NULL,
    updated_at date,
    co_criterio bigint NOT NULL
);


ALTER TABLE public.j140t_criterio_depuracion OWNER TO postgres;

--
-- Name: TABLE j140t_criterio_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE j140t_criterio_depuracion IS 'Tabla de criterios de depuracion';


--
-- Name: COLUMN j140t_criterio_depuracion.tx_descripcoin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j140t_criterio_depuracion.tx_descripcoin IS 'Descricion del criterio de depuracion';


--
-- Name: COLUMN j140t_criterio_depuracion.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j140t_criterio_depuracion.created_at IS 'fecha de creacion del registro';


--
-- Name: COLUMN j140t_criterio_depuracion.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j140t_criterio_depuracion.updated_at IS 'Fecha de modificacion del registro';


--
-- Name: COLUMN j140t_criterio_depuracion.co_criterio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j140t_criterio_depuracion.co_criterio IS 'clave primaria de la tabla criterio ';


--
-- Name: j140t_criterio_depuracion_co_criterio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j140t_criterio_depuracion_co_criterio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j140t_criterio_depuracion_co_criterio_seq OWNER TO postgres;

--
-- Name: j140t_criterio_depuracion_co_criterio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j140t_criterio_depuracion_co_criterio_seq OWNED BY j140t_criterio_depuracion.co_criterio;


--
-- Name: j141t_tipo_acceso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j141t_tipo_acceso (
    co_acceso bigint NOT NULL,
    tx_tipo_acceso text NOT NULL,
    created_at date NOT NULL,
    update_at date
);


ALTER TABLE public.j141t_tipo_acceso OWNER TO postgres;

--
-- Name: TABLE j141t_tipo_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE j141t_tipo_acceso IS 'Tipos de accesos que se usan en la depuracion';


--
-- Name: COLUMN j141t_tipo_acceso.co_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j141t_tipo_acceso.co_acceso IS 'clave primaria de la tabla de tipos de accesos';


--
-- Name: COLUMN j141t_tipo_acceso.tx_tipo_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j141t_tipo_acceso.tx_tipo_acceso IS 'Descripcion del tipo de acceso';


--
-- Name: COLUMN j141t_tipo_acceso.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j141t_tipo_acceso.created_at IS 'Fecha de creacion del registro';


--
-- Name: COLUMN j141t_tipo_acceso.update_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j141t_tipo_acceso.update_at IS 'Fecha de modificacion del registro';


--
-- Name: j141t_tipo_acceso_co_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j141t_tipo_acceso_co_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j141t_tipo_acceso_co_acceso_seq OWNER TO postgres;

--
-- Name: j141t_tipo_acceso_co_acceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j141t_tipo_acceso_co_acceso_seq OWNED BY j141t_tipo_acceso.co_acceso;


--
-- Name: j142t_estado_depuracion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j142t_estado_depuracion (
    co_estado_depuracion bigint NOT NULL,
    tx_estado_depuracion character varying NOT NULL,
    created_at date NOT NULL,
    updated_at date
);


ALTER TABLE public.j142t_estado_depuracion OWNER TO postgres;

--
-- Name: TABLE j142t_estado_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE j142t_estado_depuracion IS 'Tabla del estado de las depuraciones';


--
-- Name: COLUMN j142t_estado_depuracion.co_estado_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j142t_estado_depuracion.co_estado_depuracion IS 'Clave primaria de estado de depuraciones';


--
-- Name: COLUMN j142t_estado_depuracion.tx_estado_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j142t_estado_depuracion.tx_estado_depuracion IS 'descripcion del estado de la depuracion';


--
-- Name: COLUMN j142t_estado_depuracion.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j142t_estado_depuracion.created_at IS 'Fecha de creacion del registro';


--
-- Name: COLUMN j142t_estado_depuracion.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j142t_estado_depuracion.updated_at IS 'Fecha de modificacon del registro';


--
-- Name: j142t_estado_depuracion_co_estado_depuracion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j142t_estado_depuracion_co_estado_depuracion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j142t_estado_depuracion_co_estado_depuracion_seq OWNER TO postgres;

--
-- Name: j142t_estado_depuracion_co_estado_depuracion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j142t_estado_depuracion_co_estado_depuracion_seq OWNED BY j142t_estado_depuracion.co_estado_depuracion;


--
-- Name: j801t_principio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j801t_principio (
    co_principio bigint NOT NULL,
    tx_principio character varying
);


ALTER TABLE public.j801t_principio OWNER TO postgres;

--
-- Name: j801t_principio_co_principio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j801t_principio_co_principio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j801t_principio_co_principio_seq OWNER TO postgres;

--
-- Name: j801t_principio_co_principio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j801t_principio_co_principio_seq OWNED BY j801t_principio.co_principio;


--
-- Name: j802t_clasificacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j802t_clasificacion (
    co_clasificacion bigint NOT NULL,
    tx_clasificacion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j802t_clasificacion OWNER TO postgres;

--
-- Name: j802t_clasificacion_co_clasificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j802t_clasificacion_co_clasificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j802t_clasificacion_co_clasificacion_seq OWNER TO postgres;

--
-- Name: j802t_clasificacion_co_clasificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j802t_clasificacion_co_clasificacion_seq OWNED BY j802t_clasificacion.co_clasificacion;


--
-- Name: j803t_estado_informe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j803t_estado_informe (
    co_estado_informe bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j803t_estado_informe OWNER TO postgres;

--
-- Name: j803t_estado_informe_co_estado_informe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j803t_estado_informe_co_estado_informe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j803t_estado_informe_co_estado_informe_seq OWNER TO postgres;

--
-- Name: j803t_estado_informe_co_estado_informe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j803t_estado_informe_co_estado_informe_seq OWNED BY j803t_estado_informe.co_estado_informe;


--
-- Name: j804t_gerencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j804t_gerencia (
    co_gerencia bigint NOT NULL,
    tx_descripcion character varying,
    tx_sigla character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j804t_gerencia OWNER TO postgres;

--
-- Name: j804t_gerencia_co_gerencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j804t_gerencia_co_gerencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j804t_gerencia_co_gerencia_seq OWNER TO postgres;

--
-- Name: j804t_gerencia_co_gerencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j804t_gerencia_co_gerencia_seq OWNED BY j804t_gerencia.co_gerencia;


--
-- Name: j805t_tipo_recurso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j805t_tipo_recurso (
    co_tipo_recurso bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint
);


ALTER TABLE public.j805t_tipo_recurso OWNER TO postgres;

--
-- Name: j805t_tipo_recurso_co_tipo_recurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j805t_tipo_recurso_co_tipo_recurso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j805t_tipo_recurso_co_tipo_recurso_seq OWNER TO postgres;

--
-- Name: j805t_tipo_recurso_co_tipo_recurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j805t_tipo_recurso_co_tipo_recurso_seq OWNED BY j805t_tipo_recurso.co_tipo_recurso;


--
-- Name: j806t_ciudad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j806t_ciudad (
    co_ciudad bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j806t_ciudad OWNER TO postgres;

--
-- Name: TABLE j806t_ciudad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE j806t_ciudad IS 'Listado de Ciudades';


--
-- Name: COLUMN j806t_ciudad.co_ciudad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j806t_ciudad.co_ciudad IS 'clave primaria';


--
-- Name: j806t_ciudad_co_ciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j806t_ciudad_co_ciudad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j806t_ciudad_co_ciudad_seq OWNER TO postgres;

--
-- Name: j806t_ciudad_co_ciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j806t_ciudad_co_ciudad_seq OWNED BY j806t_ciudad.co_ciudad;


--
-- Name: j807t_localidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j807t_localidad (
    co_localidad bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    co_transaccion bigint
);


ALTER TABLE public.j807t_localidad OWNER TO postgres;

--
-- Name: j807t_localidad_co_localidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j807t_localidad_co_localidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j807t_localidad_co_localidad_seq OWNER TO postgres;

--
-- Name: j807t_localidad_co_localidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j807t_localidad_co_localidad_seq OWNED BY j807t_localidad.co_localidad;


--
-- Name: j808t_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j808t_producto (
    co_producto bigint NOT NULL,
    tx_producto character varying,
    co_padre bigint,
    tx_href character varying,
    tx_icono character varying,
    nu_orden bigint,
    tx_sigla character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    co_transaccion bigint
);


ALTER TABLE public.j808t_producto OWNER TO postgres;

--
-- Name: j808t_producto_co_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j808t_producto_co_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j808t_producto_co_producto_seq OWNER TO postgres;

--
-- Name: j808t_producto_co_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j808t_producto_co_producto_seq OWNED BY j808t_producto.co_producto;


--
-- Name: j809t_rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j809t_rol (
    co_rol bigint NOT NULL,
    tx_rol character varying
);


ALTER TABLE public.j809t_rol OWNER TO postgres;

--
-- Name: j809t_rol_co_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j809t_rol_co_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j809t_rol_co_rol_seq OWNER TO postgres;

--
-- Name: j809t_rol_co_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j809t_rol_co_rol_seq OWNED BY j809t_rol.co_rol;


--
-- Name: j810t_rol_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j810t_rol_producto (
    co_rol_producto bigint NOT NULL,
    co_rol bigint,
    co_producto bigint,
    in_ver boolean
);


ALTER TABLE public.j810t_rol_producto OWNER TO postgres;

--
-- Name: j810t_rol_producto_co_rol_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j810t_rol_producto_co_rol_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j810t_rol_producto_co_rol_producto_seq OWNER TO postgres;

--
-- Name: j810t_rol_producto_co_rol_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j810t_rol_producto_co_rol_producto_seq OWNED BY j810t_rol_producto.co_rol_producto;


--
-- Name: j811t_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j811t_usuario (
    co_usuario bigint NOT NULL,
    tx_indicador character varying,
    co_persona bigint,
    co_rol bigint
);


ALTER TABLE public.j811t_usuario OWNER TO postgres;

--
-- Name: j811t_usuario_co_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j811t_usuario_co_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j811t_usuario_co_usuario_seq OWNER TO postgres;

--
-- Name: j811t_usuario_co_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j811t_usuario_co_usuario_seq OWNED BY j811t_usuario.co_usuario;


--
-- Name: j812_persona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j812_persona (
    co_persona bigint NOT NULL,
    nb_persona character varying,
    ap_persona character varying,
    co_division bigint NOT NULL,
    co_rol bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL
);


ALTER TABLE public.j812_persona OWNER TO postgres;

--
-- Name: j812_persona_co_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j812_persona_co_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j812_persona_co_persona_seq OWNER TO postgres;

--
-- Name: j812_persona_co_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j812_persona_co_persona_seq OWNED BY j812_persona.co_persona;


--
-- Name: j813t_region; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j813t_region (
    co_region bigint NOT NULL,
    tx_region character varying,
    tx_sigla character varying
);


ALTER TABLE public.j813t_region OWNER TO postgres;

--
-- Name: j813t_region_co_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j813t_region_co_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j813t_region_co_region_seq OWNER TO postgres;

--
-- Name: j813t_region_co_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j813t_region_co_region_seq OWNED BY j813t_region.co_region;


--
-- Name: j814t_negocio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j814t_negocio (
    co_negocio bigint NOT NULL,
    tx_negocio character varying,
    tx_sigla character varying
);


ALTER TABLE public.j814t_negocio OWNER TO postgres;

--
-- Name: j814t_negocio_co_negocio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j814t_negocio_co_negocio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j814t_negocio_co_negocio_seq OWNER TO postgres;

--
-- Name: j814t_negocio_co_negocio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j814t_negocio_co_negocio_seq OWNED BY j814t_negocio.co_negocio;


--
-- Name: j815t_division; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j815t_division (
    co_division bigint NOT NULL,
    tx_division character varying,
    tx_sigla character varying
);


ALTER TABLE public.j815t_division OWNER TO postgres;

--
-- Name: j815t_division_co_division_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j815t_division_co_division_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j815t_division_co_division_seq OWNER TO postgres;

--
-- Name: j815t_division_co_division_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j815t_division_co_division_seq OWNED BY j815t_division.co_division;


--
-- Name: j816t_rel_region_negocio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j816t_rel_region_negocio (
    co_relacion bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint
);


ALTER TABLE public.j816t_rel_region_negocio OWNER TO postgres;

--
-- Name: j816t_rel_region_negocio_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j816t_rel_region_negocio_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j816t_rel_region_negocio_co_relacion_seq OWNER TO postgres;

--
-- Name: j816t_rel_region_negocio_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j816t_rel_region_negocio_co_relacion_seq OWNED BY j816t_rel_region_negocio.co_relacion;


--
-- Name: j817t_proceso_sti; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j817t_proceso_sti (
    co_proceso_sti bigint NOT NULL,
    tx_descripcion character varying,
    tx_sigla character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j817t_proceso_sti OWNER TO postgres;

--
-- Name: j817t_proceso_sti_co_proceso_sti_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j817t_proceso_sti_co_proceso_sti_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j817t_proceso_sti_co_proceso_sti_seq OWNER TO postgres;

--
-- Name: j817t_proceso_sti_co_proceso_sti_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j817t_proceso_sti_co_proceso_sti_seq OWNED BY j817t_proceso_sti.co_proceso_sti;


--
-- Name: j818t_categoria_control; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j818t_categoria_control (
    co_categoria_control bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j818t_categoria_control OWNER TO postgres;

--
-- Name: j818t_tipo_control_co_tipo_control_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j818t_tipo_control_co_tipo_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j818t_tipo_control_co_tipo_control_seq OWNER TO postgres;

--
-- Name: j818t_tipo_control_co_tipo_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j818t_tipo_control_co_tipo_control_seq OWNED BY j818t_categoria_control.co_categoria_control;


--
-- Name: j819t_estado_control; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j819t_estado_control (
    co_estado_control bigint NOT NULL,
    tx_descripcion character varying,
    nu_valor bigint,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint,
    tx_estado_control character varying
);


ALTER TABLE public.j819t_estado_control OWNER TO postgres;

--
-- Name: j819t_estado_control_co_estado_control_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j819t_estado_control_co_estado_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j819t_estado_control_co_estado_control_seq OWNER TO postgres;

--
-- Name: j819t_estado_control_co_estado_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j819t_estado_control_co_estado_control_seq OWNED BY j819t_estado_control.co_estado_control;


--
-- Name: j820t_tipo_accion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j820t_tipo_accion (
    co_tipo_accion bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j820t_tipo_accion OWNER TO postgres;

--
-- Name: j820t_tipo_accion_co_tipo_accion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j820t_tipo_accion_co_tipo_accion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j820t_tipo_accion_co_tipo_accion_seq OWNER TO postgres;

--
-- Name: j820t_tipo_accion_co_tipo_accion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j820t_tipo_accion_co_tipo_accion_seq OWNED BY j820t_tipo_accion.co_tipo_accion;


--
-- Name: j821t_estado_accion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j821t_estado_accion (
    co_estado_accion bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j821t_estado_accion OWNER TO postgres;

--
-- Name: j821t_estado_accion_co_estado_accion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j821t_estado_accion_co_estado_accion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j821t_estado_accion_co_estado_accion_seq OWNER TO postgres;

--
-- Name: j821t_estado_accion_co_estado_accion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j821t_estado_accion_co_estado_accion_seq OWNED BY j821t_estado_accion.co_estado_accion;


--
-- Name: j822t_nivel_riesgo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j822t_nivel_riesgo (
    co_nivel_riesgo bigint NOT NULL,
    tx_nivel_riesgo character varying,
    nu_valor bigint,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j822t_nivel_riesgo OWNER TO postgres;

--
-- Name: j822t_nivel_riesgo_co_nivel_riesgo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j822t_nivel_riesgo_co_nivel_riesgo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j822t_nivel_riesgo_co_nivel_riesgo_seq OWNER TO postgres;

--
-- Name: j822t_nivel_riesgo_co_nivel_riesgo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j822t_nivel_riesgo_co_nivel_riesgo_seq OWNED BY j822t_nivel_riesgo.co_nivel_riesgo;


--
-- Name: j823t_nivel_impacto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j823t_nivel_impacto (
    co_nivel_impacto bigint NOT NULL,
    tx_nivel_impacto character varying,
    nu_valor bigint,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j823t_nivel_impacto OWNER TO postgres;

--
-- Name: j823t_nivel_impacto_co_nivel_impacto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j823t_nivel_impacto_co_nivel_impacto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j823t_nivel_impacto_co_nivel_impacto_seq OWNER TO postgres;

--
-- Name: j823t_nivel_impacto_co_nivel_impacto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j823t_nivel_impacto_co_nivel_impacto_seq OWNED BY j823t_nivel_impacto.co_nivel_impacto;


--
-- Name: j824t_nivel_amenaza; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j824t_nivel_amenaza (
    co_nivel_amenaza bigint NOT NULL,
    tx_nivel_amenaza character varying,
    nu_valor bigint,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j824t_nivel_amenaza OWNER TO postgres;

--
-- Name: j824t_nivel_amenaza_co_nivel_amenaza_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j824t_nivel_amenaza_co_nivel_amenaza_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j824t_nivel_amenaza_co_nivel_amenaza_seq OWNER TO postgres;

--
-- Name: j824t_nivel_amenaza_co_nivel_amenaza_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j824t_nivel_amenaza_co_nivel_amenaza_seq OWNED BY j824t_nivel_amenaza.co_nivel_amenaza;


--
-- Name: j825t_matriz_riesgo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j825t_matriz_riesgo (
    co_matriz_riesgo bigint NOT NULL,
    co_impacto bigint,
    co_amenaza bigint,
    co_riesgo bigint,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j825t_matriz_riesgo OWNER TO postgres;

--
-- Name: j825t_matriz_riesgo_co_matriz_riesgo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j825t_matriz_riesgo_co_matriz_riesgo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j825t_matriz_riesgo_co_matriz_riesgo_seq OWNER TO postgres;

--
-- Name: j825t_matriz_riesgo_co_matriz_riesgo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j825t_matriz_riesgo_co_matriz_riesgo_seq OWNED BY j825t_matriz_riesgo.co_matriz_riesgo;


--
-- Name: j826t_opciones_riesgo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j826t_opciones_riesgo (
    co_opciones_riesgo bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j826t_opciones_riesgo OWNER TO postgres;

--
-- Name: j826t_opciones_riesgo_co_opciones_riesgo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j826t_opciones_riesgo_co_opciones_riesgo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j826t_opciones_riesgo_co_opciones_riesgo_seq OWNER TO postgres;

--
-- Name: j826t_opciones_riesgo_co_opciones_riesgo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j826t_opciones_riesgo_co_opciones_riesgo_seq OWNED BY j826t_opciones_riesgo.co_opciones_riesgo;


--
-- Name: j827t_tipo_riesgo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j827t_tipo_riesgo (
    co_tipo_riesgo bigint NOT NULL,
    tx_tipo_riesgo character varying,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint,
    co_valor_riesgo bigint NOT NULL
);


ALTER TABLE public.j827t_tipo_riesgo OWNER TO postgres;

--
-- Name: j827t_tipo_riesgo_co_tipo_riesgo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j827t_tipo_riesgo_co_tipo_riesgo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j827t_tipo_riesgo_co_tipo_riesgo_seq OWNER TO postgres;

--
-- Name: j827t_tipo_riesgo_co_tipo_riesgo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j827t_tipo_riesgo_co_tipo_riesgo_seq OWNED BY j827t_tipo_riesgo.co_tipo_riesgo;


--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session (
    sess_id bigint NOT NULL,
    sess_data character varying,
    sess_time time with time zone
);


ALTER TABLE public.session OWNER TO postgres;

--
-- Name: session_sess_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_sess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_sess_id_seq OWNER TO postgres;

--
-- Name: session_sess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_sess_id_seq OWNED BY session.sess_id;


--
-- Name: vista_rol_producto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vista_rol_producto AS
 SELECT j810.co_rol_producto,
    j810.co_rol,
    j808.co_producto,
    ( SELECT count(j808t_producto.co_producto) AS count
           FROM j808t_producto
          WHERE (j808t_producto.co_padre = j808.co_producto)) AS cant
   FROM (j810t_rol_producto j810
     JOIN j808t_producto j808 ON ((j810.co_producto = j808.co_producto)));


ALTER TABLE public.vista_rol_producto OWNER TO postgres;

--
-- Name: co_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense ALTER COLUMN co_forense SET DEFAULT nextval('c001t_forense_co_forense_seq'::regclass);


--
-- Name: co_informe_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense ALTER COLUMN co_informe_forense SET DEFAULT nextval('c002t_informe_forense_co_informe_forense_seq'::regclass);


--
-- Name: co_acc; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc ALTER COLUMN co_acc SET DEFAULT nextval('c003t_acta_acc_co_acc_seq'::regclass);


--
-- Name: co_aie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie ALTER COLUMN co_aie SET DEFAULT nextval('c004t_acta_aie_co_aie_seq'::regclass);


--
-- Name: co_anie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie ALTER COLUMN co_anie SET DEFAULT nextval('c005t_acta_anie_co_anie_seq'::regclass);


--
-- Name: co_evidencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia ALTER COLUMN co_evidencia SET DEFAULT nextval('c006t_evidencia_co_evidencia_seq'::regclass);


--
-- Name: co_figuras_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c007t_figuras_forense ALTER COLUMN co_figuras_forense SET DEFAULT nextval('c007t_figuras_forense_co_anexos_forense_seq'::regclass);


--
-- Name: co_anexos_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c008t_anexos_forense ALTER COLUMN co_anexos_forense SET DEFAULT nextval('c008t_anexos_forense_co_anexos_forense_seq'::regclass);


--
-- Name: co_incidente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c020t_incidente ALTER COLUMN co_incidente SET DEFAULT nextval('c020t_incidente_co_incidente_seq'::regclass);


--
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c021t_rel_incidente_servicio ALTER COLUMN co_relacion SET DEFAULT nextval('c021t_rel_incidente_servicio_co_relacion_seq'::regclass);


--
-- Name: co_equipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_equipo SET DEFAULT nextval('c060_inventario_co_equipo_seq'::regclass);


--
-- Name: co_region; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_region SET DEFAULT nextval('c060_inventario_co_region_seq'::regclass);


--
-- Name: co_negocio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_negocio SET DEFAULT nextval('c060_inventario_co_negocio_seq'::regclass);


--
-- Name: co_division; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_division SET DEFAULT nextval('c060_inventario_co_division_seq'::regclass);


--
-- Name: co_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_tipo SET DEFAULT nextval('c060_inventario_co_tipo_seq'::regclass);


--
-- Name: co_custodio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_custodio SET DEFAULT nextval('c060_inventario_co_custodio_seq'::regclass);


--
-- Name: co_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_estado SET DEFAULT nextval('c060_inventario_co_estado_seq'::regclass);


--
-- Name: co_so; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_so SET DEFAULT nextval('c060_inventario_co_so_seq'::regclass);


--
-- Name: co_ciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_ciudad SET DEFAULT nextval('c060_inventario_co_ciudad_seq'::regclass);


--
-- Name: co_edificio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_edificio SET DEFAULT nextval('c060_inventario_co_edificio_seq'::regclass);


--
-- Name: co_centro_dato; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_centro_dato SET DEFAULT nextval('c060_inventario_co_centro_dato_seq'::regclass);


--
-- Name: co_rack; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_rack SET DEFAULT nextval('c060_inventario_co_rack_seq'::regclass);


--
-- Name: co_nivel_criticidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_nivel_criticidad SET DEFAULT nextval('c060_inventario_co_nivel_criticidad_seq'::regclass);


--
-- Name: co_num_inventario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_num_inventario SET DEFAULT nextval('c060_inventario_co_num_inventario_seq'::regclass);


--
-- Name: co_aprobacion_acceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c120t_aprobacion_acceso ALTER COLUMN co_aprobacion_acceso SET DEFAULT nextval('c120t_aprobacion_acceso_co_aprobacion_acceso_seq'::regclass);


--
-- Name: co_depuracion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c140t_depuracion ALTER COLUMN co_depuracion SET DEFAULT nextval('c140t_depuracion_co_depuracion_seq'::regclass);


--
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c141t_rel_criterio_depuracion ALTER COLUMN co_relacion SET DEFAULT nextval('c141t_rel_criterio_depuracion_co_relacion_seq'::regclass);


--
-- Name: co_evaluacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c200t_evaluacion ALTER COLUMN co_evaluacion SET DEFAULT nextval('c160t_evaluacion_co_evaluacion_seq'::regclass);


--
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c201t_rel_evaluacion_activo ALTER COLUMN co_relacion SET DEFAULT nextval('c201t_rel_evaluacion_activo_co_relacion_seq'::regclass);


--
-- Name: co_informe; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c203t_rel_informe_evaluacion ALTER COLUMN co_informe SET DEFAULT nextval('c203t_rel_informe_evaluacion_co_informe_seq'::regclass);


--
-- Name: co_transaccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c801t_transaccion ALTER COLUMN co_transaccion SET DEFAULT nextval('c801t_transaccion_co_transaccion_seq'::regclass);


--
-- Name: co_cadena_aprobacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c802t_cadena_aprobacion ALTER COLUMN co_cadena_aprobacion SET DEFAULT nextval('c802t_cadena_aprobacion_co_cadena_aprobacion_seq'::regclass);


--
-- Name: co_accion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c803t_accion ALTER COLUMN co_accion SET DEFAULT nextval('c803t_accion_co_accion_seq'::regclass);


--
-- Name: co_seguimiento_accion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c804t_seguimiento_accion ALTER COLUMN co_seguimiento_accion SET DEFAULT nextval('c804t_seguimiento_accion_co_seguimiento_accion_seq'::regclass);


--
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c805t_rel_transaccion_principio ALTER COLUMN co_relacion SET DEFAULT nextval('c009t_rel_forense_principio_co_relacion_seq'::regclass);


--
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c806t_rel_transaccion_marco_normativo ALTER COLUMN co_relacion SET DEFAULT nextval('c010t_rel_forense_marco_normativo_co_relacion_seq'::regclass);


--
-- Name: co_alcance_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j001t_alcance_forense ALTER COLUMN co_alcance_forense SET DEFAULT nextval('j001t_alcance_forense_co_alcance_forense_seq'::regclass);


--
-- Name: co_tipo_evidencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_tipo_evidencia ALTER COLUMN co_tipo_evidencia SET DEFAULT nextval('j002t_tipo_evidencia_co_tipo_evidencia_seq'::regclass);


--
-- Name: co_estado_evidencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j003t_estado_evidencia ALTER COLUMN co_estado_evidencia SET DEFAULT nextval('j003t_estado_evidencia_co_estado_evidencia_seq'::regclass);


--
-- Name: co_estado_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j004t_estado_forense ALTER COLUMN co_estado_forense SET DEFAULT nextval('j004t_estado_forense_co_estado_forense_seq'::regclass);


--
-- Name: co_estado_acta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j005t_estado_acta ALTER COLUMN co_estado_acta SET DEFAULT nextval('j005t_estado_acta_co_estado_acta_seq'::regclass);


--
-- Name: co_lugar_seguro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro ALTER COLUMN co_lugar_seguro SET DEFAULT nextval('j006t_lugar_seguro_co_lugar_seguro_seq'::regclass);


--
-- Name: co_repositorio_digital; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j007t_repositorio_digital ALTER COLUMN co_repositorio_digital SET DEFAULT nextval('j007t_repositorio_digital_co_repositorio_digital_seq'::regclass);


--
-- Name: co_so; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j061_sistema_operativo ALTER COLUMN co_so SET DEFAULT nextval('j061_sistema_operativo_co_so_seq'::regclass);


--
-- Name: co_interfaz; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j062_interfaces ALTER COLUMN co_interfaz SET DEFAULT nextval('j062_interfaces_co_interfaz_seq'::regclass);


--
-- Name: co_equipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j062_interfaces ALTER COLUMN co_equipo SET DEFAULT nextval('j062_interfaces_co_equipo_seq'::regclass);


--
-- Name: co_equipo_conectado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j062_interfaces ALTER COLUMN co_equipo_conectado SET DEFAULT nextval('j062_interfaces_co_equipo_conectado_seq'::regclass);


--
-- Name: co_aplicacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j063_aplicacion ALTER COLUMN co_aplicacion SET DEFAULT nextval('j063_aplicacion_co_aplicacion_seq'::regclass);


--
-- Name: co_criterio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j140t_criterio_depuracion ALTER COLUMN co_criterio SET DEFAULT nextval('j140t_criterio_depuracion_co_criterio_seq'::regclass);


--
-- Name: co_acceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j141t_tipo_acceso ALTER COLUMN co_acceso SET DEFAULT nextval('j141t_tipo_acceso_co_acceso_seq'::regclass);


--
-- Name: co_estado_depuracion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j142t_estado_depuracion ALTER COLUMN co_estado_depuracion SET DEFAULT nextval('j142t_estado_depuracion_co_estado_depuracion_seq'::regclass);


--
-- Name: co_principio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j801t_principio ALTER COLUMN co_principio SET DEFAULT nextval('j801t_principio_co_principio_seq'::regclass);


--
-- Name: co_clasificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j802t_clasificacion ALTER COLUMN co_clasificacion SET DEFAULT nextval('j802t_clasificacion_co_clasificacion_seq'::regclass);


--
-- Name: co_estado_informe; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j803t_estado_informe ALTER COLUMN co_estado_informe SET DEFAULT nextval('j803t_estado_informe_co_estado_informe_seq'::regclass);


--
-- Name: co_gerencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j804t_gerencia ALTER COLUMN co_gerencia SET DEFAULT nextval('j804t_gerencia_co_gerencia_seq'::regclass);


--
-- Name: co_tipo_recurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j805t_tipo_recurso ALTER COLUMN co_tipo_recurso SET DEFAULT nextval('j805t_tipo_recurso_co_tipo_recurso_seq'::regclass);


--
-- Name: co_ciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j806t_ciudad ALTER COLUMN co_ciudad SET DEFAULT nextval('j806t_ciudad_co_ciudad_seq'::regclass);


--
-- Name: co_localidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j807t_localidad ALTER COLUMN co_localidad SET DEFAULT nextval('j807t_localidad_co_localidad_seq'::regclass);


--
-- Name: co_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j808t_producto ALTER COLUMN co_producto SET DEFAULT nextval('j808t_producto_co_producto_seq'::regclass);


--
-- Name: co_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j809t_rol ALTER COLUMN co_rol SET DEFAULT nextval('j809t_rol_co_rol_seq'::regclass);


--
-- Name: co_rol_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j810t_rol_producto ALTER COLUMN co_rol_producto SET DEFAULT nextval('j810t_rol_producto_co_rol_producto_seq'::regclass);


--
-- Name: co_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j811t_usuario ALTER COLUMN co_usuario SET DEFAULT nextval('j811t_usuario_co_usuario_seq'::regclass);


--
-- Name: co_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j812_persona ALTER COLUMN co_persona SET DEFAULT nextval('j812_persona_co_persona_seq'::regclass);


--
-- Name: co_region; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j813t_region ALTER COLUMN co_region SET DEFAULT nextval('j813t_region_co_region_seq'::regclass);


--
-- Name: co_negocio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j814t_negocio ALTER COLUMN co_negocio SET DEFAULT nextval('j814t_negocio_co_negocio_seq'::regclass);


--
-- Name: co_division; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j815t_division ALTER COLUMN co_division SET DEFAULT nextval('j815t_division_co_division_seq'::regclass);


--
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j816t_rel_region_negocio ALTER COLUMN co_relacion SET DEFAULT nextval('j816t_rel_region_negocio_co_relacion_seq'::regclass);


--
-- Name: co_proceso_sti; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j817t_proceso_sti ALTER COLUMN co_proceso_sti SET DEFAULT nextval('j817t_proceso_sti_co_proceso_sti_seq'::regclass);


--
-- Name: co_categoria_control; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j818t_categoria_control ALTER COLUMN co_categoria_control SET DEFAULT nextval('j818t_tipo_control_co_tipo_control_seq'::regclass);


--
-- Name: co_estado_control; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j819t_estado_control ALTER COLUMN co_estado_control SET DEFAULT nextval('j819t_estado_control_co_estado_control_seq'::regclass);


--
-- Name: co_tipo_accion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j820t_tipo_accion ALTER COLUMN co_tipo_accion SET DEFAULT nextval('j820t_tipo_accion_co_tipo_accion_seq'::regclass);


--
-- Name: co_estado_accion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j821t_estado_accion ALTER COLUMN co_estado_accion SET DEFAULT nextval('j821t_estado_accion_co_estado_accion_seq'::regclass);


--
-- Name: co_nivel_riesgo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j822t_nivel_riesgo ALTER COLUMN co_nivel_riesgo SET DEFAULT nextval('j822t_nivel_riesgo_co_nivel_riesgo_seq'::regclass);


--
-- Name: co_nivel_impacto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j823t_nivel_impacto ALTER COLUMN co_nivel_impacto SET DEFAULT nextval('j823t_nivel_impacto_co_nivel_impacto_seq'::regclass);


--
-- Name: co_nivel_amenaza; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j824t_nivel_amenaza ALTER COLUMN co_nivel_amenaza SET DEFAULT nextval('j824t_nivel_amenaza_co_nivel_amenaza_seq'::regclass);


--
-- Name: co_matriz_riesgo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j825t_matriz_riesgo ALTER COLUMN co_matriz_riesgo SET DEFAULT nextval('j825t_matriz_riesgo_co_matriz_riesgo_seq'::regclass);


--
-- Name: co_opciones_riesgo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j826t_opciones_riesgo ALTER COLUMN co_opciones_riesgo SET DEFAULT nextval('j826t_opciones_riesgo_co_opciones_riesgo_seq'::regclass);


--
-- Name: co_tipo_riesgo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j827t_tipo_riesgo ALTER COLUMN co_tipo_riesgo SET DEFAULT nextval('j827t_tipo_riesgo_co_tipo_riesgo_seq'::regclass);


--
-- Name: sess_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session ALTER COLUMN sess_id SET DEFAULT nextval('session_sess_id_seq'::regclass);


--
-- Data for Name: c001t_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c001t_forense (co_forense, fe_apertura, fe_cierre, co_region, co_negocio, co_division, tx_serial, tx_titulo, tx_descripcion_solicitud, tx_caso_aaii, co_alcance_forense, tx_metologia_herramientas, tx_observaciones, co_transaccion, co_clasificacion, in_abierto, created_at, update_at, co_estado_forense) FROM stdin;
2	2015-10-02	\N	2	2	1	\N	Prueba	ssss	ffff	1	\N	ssss	\N	1	t	2015-10-02 13:19:05-04:30	\N	1
3	2015-10-02	\N	3	1	1	\N	laptop 	Solicitaron recuperar archivos borrados de una laptop	xxx	1	\N	Datos de Prueba	\N	1	t	2015-10-02 00:00:00-04:30	\N	1
4	2015-10-05	\N	1	2	1	\N	Verificación maquina rafael	Problema con visitas de paginas no autorizadas	123456	1	\N	Verificar la maquina del usuario	4	1	t	2015-10-05 16:42:07-04:30	\N	1
5	2015-11-09	\N	1	2	1	\N	ssssss	ddddd	22222	1	\N	ddddd	5	2	t	2015-11-09 15:12:06-04:30	\N	1
\.


--
-- Name: c001t_forense_co_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c001t_forense_co_forense_seq', 5, true);


--
-- Data for Name: c002t_informe_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c002t_informe_forense (co_informe_forense, co_region, co_negocio, co_division, co_estado_informe, tx_serial, tx_titulo, tx_descripcion_entorno, tx_resultados, tx_conclusiones, tx_observaciones, tx_ruta_pdf, nb_archivo_pdf, co_transaccion, co_clasificacion, in_abierto, created_at, update_at, co_forense, nb_archivo_soporte, tx_ruta_soporte) FROM stdin;
\.


--
-- Name: c002t_informe_forense_co_informe_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c002t_informe_forense_co_informe_forense_seq', 1, false);


--
-- Data for Name: c003t_acta_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c003t_acta_acc (co_acc, fe_emision, co_forense, co_region, co_negocio, co_division, tx_serial, co_estado_acta, fe_destruye, co_destruye, tx_observaciones, tx_ruta, nb_archivo, in_abierta, co_clasificacion, co_transaccion, created_at, co_elabora, co_custodio, co_tipo_recurso, co_ciudad_acta, updated_at) FROM stdin;
1	2015-10-02	2	1	1	1	COR-ACC-2015-10-001	1	\N	1	Datos de Prueba	/var/sgsti/corporativo/octubre/	\N	t	1	1	\N	1	1	1	1	\N
2	2015-10-03	2	3	1	1	MET-ACC-2015-10-002	1	\N	1	Datos de Prueba	/var/sgsti/metro/	\N	t	1	1	\N	1	1	1	1	\N
\.


--
-- Name: c003t_acta_acc_co_acc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c003t_acta_acc_co_acc_seq', 1, false);


--
-- Data for Name: c004t_acta_aie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c004t_acta_aie (co_aie, fe_emision, co_forense, co_region, co_negocio, co_division, tx_serial, tx_observaciones, tx_ruta, nb_archivo, in_abierta, co_clasificacion, co_transaccion, created_at, updated_at, co_elabora, co_custodio, co_recurso, co_ciudad_acta) FROM stdin;
\.


--
-- Name: c004t_acta_aie_co_aie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c004t_acta_aie_co_aie_seq', 1, false);


--
-- Data for Name: c005t_acta_anie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c005t_acta_anie (co_anie, fe_emision, co_forense, co_region, co_negocio, co_division, tx_serial, co_elabora, co_niega, tx_observaciones, tx_ruta, nb_archivo, in_abierta, co_clasificacion, co_transaccion, created_at, updated_at) FROM stdin;
\.


--
-- Name: c005t_acta_anie_co_anie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c005t_acta_anie_co_anie_seq', 1, false);


--
-- Data for Name: c006t_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c006t_evidencia (co_evidencia, fe_registro, co_registra, co_acc, co_aie, tx_descripcion_coleccion, fe_coleccion_evidencia, co_colecta, co_recurso, tx_nombre_recurso, tx_serial_recurso, tx_marca_recurso, tx_modelo_recurso, tx_numero_activo, co_tipo_evidencia, co_estado_evidencia, co_lugar_seguro, co_repositorio, co_custodio_sti, tx_observaciones, in_abierta, co_clasificacion, co_transaccion, created_at, updated_at, co_entregado_fuera_sti, co_custodio, co_created_at, co_updated_at) FROM stdin;
\.


--
-- Name: c006t_evidencia_co_evidencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c006t_evidencia_co_evidencia_seq', 1, false);


--
-- Data for Name: c007t_figuras_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c007t_figuras_forense (co_figuras_forense, co_informe_forense, tx_titulo, tx_descripcion, tx_ruta, nb_archivo, co_clasificacion, created_at, updated_at) FROM stdin;
\.


--
-- Name: c007t_figuras_forense_co_anexos_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c007t_figuras_forense_co_anexos_forense_seq', 1, false);


--
-- Data for Name: c008t_anexos_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c008t_anexos_forense (co_anexos_forense, co_informe_forense, tx_titulo, tx_descripcion, tx_ruta, nb_archivo, co_clasificacion, created_at, updated_at) FROM stdin;
\.


--
-- Name: c008t_anexos_forense_co_anexos_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c008t_anexos_forense_co_anexos_forense_seq', 1, false);


--
-- Name: c009t_rel_forense_principio_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c009t_rel_forense_principio_co_relacion_seq', 1, false);


--
-- Name: c010t_rel_forense_marco_normativo_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c010t_rel_forense_marco_normativo_co_relacion_seq', 1, false);


--
-- Data for Name: c020t_incidente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c020t_incidente (co_incidente, co_region, co_negocio, co_division, tx_serial, co_estado_incidente, co_tipo_incidente, co_tipo_hecho, tx_descripcion, fe_incio_hecho, fe_fin_hecho, tx_causa, tx_metologia_herramientas, tx_observaciones, tx_ruta_pdf, nb_archivo_pdf, created_at, update_at, co_usuario_created, co_usuario_update, tx_acciones_tomadas) FROM stdin;
\.


--
-- Name: c020t_incidente_co_incidente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c020t_incidente_co_incidente_seq', 1, false);


--
-- Data for Name: c021t_rel_incidente_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c021t_rel_incidente_servicio (co_relacion, co_incidente, co_servicio) FROM stdin;
\.


--
-- Name: c021t_rel_incidente_servicio_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c021t_rel_incidente_servicio_co_relacion_seq', 1, false);


--
-- Data for Name: c060_inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c060_inventario (co_equipo, co_region, co_negocio, co_division, co_tipo, co_custodio, tx_etiqueta_sti, co_estado, tx_nombre_equipo, tx_funsion_equipo, co_so, tx_etiqueta_activo, tx_serial_hardware, tx_marca_hardware, tx_modelo_hardware, co_ciudad, co_edificio, tx_direccion_ubicacion, tx_detalle_ubicacion, co_centro_dato, co_rack, tx_ubicacion_llave, in_respaldo_automatizado, in_bloqueo_inactividad, in_adiministradores_personalizados, in_politica_password, in_sincronizacion_reloj, in_monitoreado, in_inf_actualizada, in_log_activo, co_nivel_criticidad, tx_observaciones, tx_ruta_respaldo_configuraciones, co_num_inventario) FROM stdin;
\.


--
-- Name: c060_inventario_co_centro_dato_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_centro_dato_seq', 1, false);


--
-- Name: c060_inventario_co_ciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_ciudad_seq', 1, false);


--
-- Name: c060_inventario_co_custodio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_custodio_seq', 1, false);


--
-- Name: c060_inventario_co_division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_division_seq', 1, false);


--
-- Name: c060_inventario_co_edificio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_edificio_seq', 1, false);


--
-- Name: c060_inventario_co_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_equipo_seq', 1, false);


--
-- Name: c060_inventario_co_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_estado_seq', 1, false);


--
-- Name: c060_inventario_co_negocio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_negocio_seq', 1, false);


--
-- Name: c060_inventario_co_nivel_criticidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_nivel_criticidad_seq', 1, false);


--
-- Name: c060_inventario_co_num_inventario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_num_inventario_seq', 1, false);


--
-- Name: c060_inventario_co_rack_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_rack_seq', 1, false);


--
-- Name: c060_inventario_co_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_region_seq', 1, false);


--
-- Name: c060_inventario_co_so_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_so_seq', 1, false);


--
-- Name: c060_inventario_co_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_tipo_seq', 1, false);


--
-- Data for Name: c120t_aprobacion_acceso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c120t_aprobacion_acceso (co_aprobacion_acceso, co_region, co_negocio, co_division, co_tipo_acceso, co_perfil_solicitado, tx_indicador_solicitante, co_gerencia_solicitante, tx_justificacion, tx_gerente_aprobador_solicitante, num_caso_siga, co_estado_aprobador, nb_ruta_soporte, tx_observacion) FROM stdin;
\.


--
-- Name: c120t_aprobacion_acceso_co_aprobacion_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_aprobacion_acceso_seq', 1, false);


--
-- Name: c120t_aprobacion_acceso_co_division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_division_seq', 1, false);


--
-- Name: c120t_aprobacion_acceso_co_estado_aprobador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_estado_aprobador_seq', 1, false);


--
-- Name: c120t_aprobacion_acceso_co_gerencia_solicitante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_gerencia_solicitante_seq', 1, false);


--
-- Name: c120t_aprobacion_acceso_co_negocio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_negocio_seq', 1, false);


--
-- Name: c120t_aprobacion_acceso_co_perfil_solicitado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_perfil_solicitado_seq', 1, false);


--
-- Name: c120t_aprobacion_acceso_co_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_region_seq', 1, false);


--
-- Name: c120t_aprobacion_acceso_co_tipo_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_tipo_acceso_seq', 1, false);


--
-- Data for Name: c140t_depuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c140t_depuracion (co_depuracion, co_region, co_negocio, co_division, co_tipo_depuracion, co_equipo, co_sistema, co_estado_depuracion, fe_mes_planificado, tx_serial_depuracion, fe_depuracion, tx_indicador_responsable, tx_resumen, nu_total_accesos, nu_total_depuracion, tx_observaciones, co_clasificacion, nb_anexos_soporte, tx_ruta_anexo_soporte, nb_anexos_informe, tx_ruta_anexo_informe, created_at, updated_at, co_transaccion, ar_anexo_soporte, mime_anexo_soporte) FROM stdin;
\.


--
-- Name: c140t_depuracion_co_depuracion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c140t_depuracion_co_depuracion_seq', 1, false);


--
-- Data for Name: c141t_rel_criterio_depuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c141t_rel_criterio_depuracion (co_relacion, co_depuracion, co_criterio, nu_depurar, created_at, update_at) FROM stdin;
\.


--
-- Name: c141t_rel_criterio_depuracion_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c141t_rel_criterio_depuracion_co_relacion_seq', 1, false);


--
-- Name: c160t_evaluacion_co_evaluacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c160t_evaluacion_co_evaluacion_seq', 1, false);


--
-- Data for Name: c200t_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c200t_evaluacion (co_evaluacion, co_region, co_negocio, co_division, tx_serial, co_gerencia_solicitante, co_persona_solicitante, co_clasificacion, tx_observaciones, co_transaccion) FROM stdin;
\.


--
-- Data for Name: c201t_rel_evaluacion_activo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c201t_rel_evaluacion_activo (co_relacion, co_evaluacion, co_activo) FROM stdin;
\.


--
-- Name: c201t_rel_evaluacion_activo_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c201t_rel_evaluacion_activo_co_relacion_seq', 1, false);


--
-- Data for Name: c203t_rel_informe_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c203t_rel_informe_evaluacion (co_informe, co_evaluacion, co_region, co_negocio, co_division, tx_serial, co_estado_informe, tx_titulo) FROM stdin;
\.


--
-- Name: c203t_rel_informe_evaluacion_co_informe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c203t_rel_informe_evaluacion_co_informe_seq', 1, false);


--
-- Data for Name: c801t_transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c801t_transaccion (co_transaccion, co_producto, nu_valor, created_at, updated_at) FROM stdin;
1	1	1	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30
2	2	1	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30
4	49	\N	2015-10-05 16:42:07-04:30	2015-10-05 16:42:07-04:30
5	49	\N	2015-11-09 15:12:06-04:30	2015-11-09 15:12:06-04:30
\.


--
-- Name: c801t_transaccion_co_transaccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c801t_transaccion_co_transaccion_seq', 5, true);


--
-- Data for Name: c802t_cadena_aprobacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c802t_cadena_aprobacion (co_cadena_aprobacion, co_transaccion, co_persona, co_accion, fe_accion, tx_observacion, created_at, updated_at) FROM stdin;
\.


--
-- Name: c802t_cadena_aprobacion_co_cadena_aprobacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c802t_cadena_aprobacion_co_cadena_aprobacion_seq', 1, false);


--
-- Data for Name: c803t_accion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c803t_accion (co_accion, co_transaccion, tx_descripcion, co_tipo_control, co_categoria_accion, in_abierto, created_at, update_at, co_created_at, co_updated_at) FROM stdin;
\.


--
-- Name: c803t_accion_co_accion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c803t_accion_co_accion_seq', 1, false);


--
-- Data for Name: c804t_seguimiento_accion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c804t_seguimiento_accion (co_seguimiento_accion, co_accion, co_estado_accion, co_responsable_sti, co_responsable_ejecutar, co_gerencia_responsable, fe_planificada_ejecutar, fe_seguimiento_sti, tx_respuesta_responsable, tx_observaciones, nb_archivo_evidencia, tx_ruta_evidencia, created_at, updated_at, co_created_at, co_updated_at) FROM stdin;
\.


--
-- Name: c804t_seguimiento_accion_co_seguimiento_accion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c804t_seguimiento_accion_co_seguimiento_accion_seq', 1, false);


--
-- Data for Name: c805t_rel_transaccion_principio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c805t_rel_transaccion_principio (co_relacion, co_transaccion, co_principio) FROM stdin;
\.


--
-- Data for Name: c806t_rel_transaccion_marco_normativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY c806t_rel_transaccion_marco_normativo (co_relacion, co_transaccion, co_marco_normativo) FROM stdin;
\.


--
-- Data for Name: j001t_alcance_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j001t_alcance_forense (co_alcance_forense, tx_descripcion, created_at, update_at, co_transaccion) FROM stdin;
1	Coleccion de Evidencia	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
4	Recuperacion de Informacion sin Analizar	2015-10-01 00:00:00-04:30	2015-01-01 00:00:00-04:30	1
2	Analisis de Evidencias	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
3	Coleccion y Analisis	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
\.


--
-- Name: j001t_alcance_forense_co_alcance_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j001t_alcance_forense_co_alcance_forense_seq', 1, false);


--
-- Data for Name: j002t_tipo_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j002t_tipo_evidencia (co_tipo_evidencia, tx_descripcion, created_at, update_at, co_transaccion) FROM stdin;
1	FISICA ORIGINAL	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
2	FISICA CON EVIDENCIA DIGITAL	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
3	IMAGEN FORENSE ORIGINAL	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
4	IMAGEN FORENSE COPIA	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
5	ARCHIVOS COLECTADOS ORIGINALES	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
6	ARCHIVOS RECUPERADOS DESDE LA IMAGEN ORIGINALES	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
7	ARCHIVOS COPIADOS PARA RESGUARDO	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
8	ARCHIVOS COPIADOS PARA ENTREGA FUERA DE STI	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
\.


--
-- Name: j002t_tipo_evidencia_co_tipo_evidencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j002t_tipo_evidencia_co_tipo_evidencia_seq', 1, false);


--
-- Data for Name: j003t_estado_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j003t_estado_evidencia (co_estado_evidencia, tx_descripcion, created_at, update_at, co_transaccion) FROM stdin;
1	EN CUSTODIA PERSONAL DE STI\r\n	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
2	RESGUARDADA EN LUGAR SEGURO	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
3	ENTREGADA FUERA DE STI	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
4	RESGUARDADA EN REPOSITORIO DIGITAL	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
5	DESTRIUDA	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
\.


--
-- Name: j003t_estado_evidencia_co_estado_evidencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j003t_estado_evidencia_co_estado_evidencia_seq', 1, false);


--
-- Data for Name: j004t_estado_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j004t_estado_forense (co_estado_forense, tx_descripcion, created_at, update_at, co_transaccion) FROM stdin;
1	Abierto	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
2	Cerrado con Resguardos	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
3	Cerrado	2015-10-01 00:00:00-04:30	2001-10-01 00:00:00-04	1
\.


--
-- Name: j004t_estado_forense_co_estado_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j004t_estado_forense_co_estado_forense_seq', 1, false);


--
-- Data for Name: j005t_estado_acta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j005t_estado_acta (co_estado_acta, tx_descripcion, created_at, update_at, co_transaccion) FROM stdin;
1	Activa	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
2	Destruida	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
\.


--
-- Name: j005t_estado_acta_co_estado_acta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j005t_estado_acta_co_estado_acta_seq', 1, false);


--
-- Data for Name: j006t_lugar_seguro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j006t_lugar_seguro (co_lugar_seguro, tx_titulo, tx_ubicacion_fisica, co_gerencia, co_custodio, tx_observaciones, co_clasificacion, co_transaccion, created_at, update_at, co_ciudad, co_localidad) FROM stdin;
1	Laboratorio Forense Canarias	Torre Canarias, Mezzanina, Oficina STI	1	1	Datos de Prueba	1	1	2015-10-01 00:00:00	2015-10-01 00:00:00-04:30	1	1
2	Laboratorio Forense Maracaibo	Edif Miranda	1	1	Datos de Prueba	1	1	2015-10-01 00:00:00	2015-10-01 00:00:00-04:30	2	3
\.


--
-- Name: j006t_lugar_seguro_co_lugar_seguro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j006t_lugar_seguro_co_lugar_seguro_seq', 1, false);


--
-- Data for Name: j007t_repositorio_digital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j007t_repositorio_digital (co_repositorio_digital, tx_titulo, tx_direccion_ip, co_gerencia, co_custodio, tx_observaciones, co_clasificacion, co_transaccion, created_at, update_at) FROM stdin;
1	Repositorio OCCIDENTE	162.0.0.0	1	1	Datos de Prueba	1	1	2015-10-01 00:00:00	2015-10-01 00:00:00-04:30
2	Repositorio Centro	167.134.0.0	1	1	Datos de Prueba	1	2	2015-10-01 00:00:00	2015-10-01 00:00:00-04:30
3	Repositorio ORIENTE	10.0.0.0	1	1	Datos de Prueba	1	3	2015-10-01 00:00:00	2015-10-01 00:00:00-04:30
\.


--
-- Name: j007t_repositorio_digital_co_repositorio_digital_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j007t_repositorio_digital_co_repositorio_digital_seq', 1, false);


--
-- Data for Name: j061_sistema_operativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j061_sistema_operativo (co_so, tx_nombre_sistema_operativo_version) FROM stdin;
\.


--
-- Name: j061_sistema_operativo_co_so_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j061_sistema_operativo_co_so_seq', 1, false);


--
-- Data for Name: j062_interfaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j062_interfaces (co_interfaz, tx_nombre_interfaz, tx_ip, tx_mac, co_equipo, co_equipo_conectado, tx_observaciones) FROM stdin;
\.


--
-- Name: j062_interfaces_co_equipo_conectado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j062_interfaces_co_equipo_conectado_seq', 1, false);


--
-- Name: j062_interfaces_co_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j062_interfaces_co_equipo_seq', 1, false);


--
-- Name: j062_interfaces_co_interfaz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j062_interfaces_co_interfaz_seq', 1, false);


--
-- Data for Name: j063_aplicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j063_aplicacion (co_aplicacion, tx_nombre_aplicacion) FROM stdin;
\.


--
-- Name: j063_aplicacion_co_aplicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j063_aplicacion_co_aplicacion_seq', 1, false);


--
-- Data for Name: j140t_criterio_depuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j140t_criterio_depuracion (tx_descripcoin, created_at, updated_at, co_criterio) FROM stdin;
\.


--
-- Name: j140t_criterio_depuracion_co_criterio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j140t_criterio_depuracion_co_criterio_seq', 1, false);


--
-- Data for Name: j141t_tipo_acceso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j141t_tipo_acceso (co_acceso, tx_tipo_acceso, created_at, update_at) FROM stdin;
\.


--
-- Name: j141t_tipo_acceso_co_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j141t_tipo_acceso_co_acceso_seq', 1, false);


--
-- Data for Name: j142t_estado_depuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j142t_estado_depuracion (co_estado_depuracion, tx_estado_depuracion, created_at, updated_at) FROM stdin;
\.


--
-- Name: j142t_estado_depuracion_co_estado_depuracion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j142t_estado_depuracion_co_estado_depuracion_seq', 1, false);


--
-- Data for Name: j801t_principio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j801t_principio (co_principio, tx_principio) FROM stdin;
\.


--
-- Name: j801t_principio_co_principio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j801t_principio_co_principio_seq', 1, false);


--
-- Data for Name: j802t_clasificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j802t_clasificacion (co_clasificacion, tx_clasificacion, created_at, updated_at, co_transaccion) FROM stdin;
1	Extrictamente Confidencia	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
2	Confidencia	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
3	Uso Interno	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
4	Uso Publico	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
\.


--
-- Name: j802t_clasificacion_co_clasificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j802t_clasificacion_co_clasificacion_seq', 1, false);


--
-- Data for Name: j803t_estado_informe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j803t_estado_informe (co_estado_informe, tx_descripcion, created_at, updated_at, co_transaccion) FROM stdin;
1	Registrado	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
2	Pendiente por Revision	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
3	Pendiente por Aprobacion	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
4	Revisado con Comentarios	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
5	Aprobado	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
6	No Aprobado	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
\.


--
-- Name: j803t_estado_informe_co_estado_informe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j803t_estado_informe_co_estado_informe_seq', 1, false);


--
-- Data for Name: j804t_gerencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j804t_gerencia (co_gerencia, tx_descripcion, tx_sigla, created_at, updated_at, co_transaccion) FROM stdin;
1	Gerencia Funcional de Seguridad en Tecnologias de Informacion	STI	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
2	Prevencion y Control de Pérdidas	PCP	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
3	Automatización, Infomática y Telecomunicaciones	AIT	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
4	Otra	N/A	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
\.


--
-- Name: j804t_gerencia_co_gerencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j804t_gerencia_co_gerencia_seq', 1, false);


--
-- Data for Name: j805t_tipo_recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j805t_tipo_recurso (co_tipo_recurso, tx_descripcion, created_at, updated_at, co_transaccion) FROM stdin;
2	Laptop	2015-10-02 00:00:00-04:30	2015-10-02 00:00:00-04:30	2
1	Desktop	2015-10-02 00:00:00-04:30	2015-10-02 00:00:00-04:30	1
\.


--
-- Name: j805t_tipo_recurso_co_tipo_recurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j805t_tipo_recurso_co_tipo_recurso_seq', 2, true);


--
-- Data for Name: j806t_ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j806t_ciudad (co_ciudad, tx_descripcion, created_at, updated_at, co_transaccion) FROM stdin;
1	Caracas	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
2	Maracaibo	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
3	Puerto La Cruz	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
4	San Tomé	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
5	Maturín	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
6	Valencia	2015-10-01 00:00:00-04:30	2015-10-01 00:00:00-04:30	1
\.


--
-- Name: j806t_ciudad_co_ciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j806t_ciudad_co_ciudad_seq', 1, false);


--
-- Data for Name: j807t_localidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) FROM stdin;
1	Campiña	\N	\N	\N
2	AMUAY	\N	\N	\N
3	ANACO	\N	\N	\N
4	APURE	\N	\N	\N
5	BARINAS 	\N	\N	\N
6	LA SALINA	\N	\N	\N
7	CARACAS	\N	\N	\N
8	CUMANA COSTA AFUERA	\N	\N	\N
9	EL  PALITO	\N	\N	\N
10	LA QUIZANDA 	\N	\N	\N
11	LAGUNILLAS EDO ZULIA	\N	\N	\N
12	LOS TEQUES 	\N	\N	\N
13	MARACAIBO	\N	\N	\N
14	ORIENTE	\N	\N	\N
15	PORLAMAR	\N	\N	\N
16	PUERTO LA CRUZ 	\N	\N	\N
17	JOSÉ	\N	\N	\N
\.


--
-- Name: j807t_localidad_co_localidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j807t_localidad_co_localidad_seq', 17, true);


--
-- Data for Name: j808t_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) FROM stdin;
47	Permisologia de Acceso Logico	50	\N	\N	1	PAL	\N	\N	\N
25	Lista de Chequeo para la Evaluación de Planes	5	\N	\N	6	\N	\N	\N	\N
26	Lista de Chequeo para la Prueba de Planes	5	\N	\N	7	\N	\N	\N	\N
52	Inventario de la Plataforma de Seguridad	48	\N	\N	1	\N	\N	\N	\N
29	Bitácora	6	\N	\N	3	\N	\N	\N	\N
30	Identificación de contenedores de medios de respaldo	6	\N	\N	4	\N	\N	\N	\N
32	Bitácora de entrada/salida de medios de respaldo	6	\N	\N	6	\N	\N	\N	\N
33	Pruebas de Respaldo de Data Crítica	6	\N	\N	7	\N	\N	\N	\N
34	Acta Escenarios de Contingencia	6	\N	\N	8	\N	\N	\N	\N
35	Cronograma de Mitigación de Vulnerabilidades	4	\N	\N	3	CMV	\N	\N	\N
27	Claves de Máximo Privilegio	6	\N	\N	1	CMP	\N	\N	\N
22	Plan de Contingencia	5	\N	\N	3	PC	\N	\N	\N
23	Plan Operativo	5	\N	\N	4	PO	\N	\N	\N
10	Cronograma de Mitigación de Vulnerabilidades	1	\N	\N	3	CMV	\N	\N	\N
18	Solicitud de Análisis de Riesgo Lógico	4	\N	\N	1	SARL	\N	\N	\N
19	Informe de Análisis de Riesgo Lógico	4	\N	\N	2	IARL	\N	\N	\N
20	Solicitud de Planes de Continuidad	5	\N	\N	1	SPC	\N	\N	\N
13	Solicitud de Autorización de Análisis de Impacto	3	\N	\N	1	SAI	\N	\N	\N
58	Control Licencias Lenel	50	\N	\N	3	\N	\N	\N	\N
53	Planes de Contigencia de la Plataforma de Seguridad	48	\N	\N	3	\N	\N	\N	\N
54	Mantenimientos de la Plataforma de Seguridad	48	\N	\N	2	\N	\N	\N	\N
55	Planes Operativos de la Plataforma de Seguridad	48	\N	\N	3	\N	\N	\N	\N
38	Incidentes de Seguridad	37	\N	\N	1	IS	\N	\N	\N
50	Control de Acceso Logico	37	\N	\N	4	\N	\N	\N	\N
48	Gestion de Plataforma de Seguridad	37	\N	\N	5	IPS	\N	\N	\N
37	Protección Lógica	0	\N	\N	2	PL	\N	\N	\N
15	Cuestionario de Análisis de Impacto 	3	\N	\N	3	\N	\N	\N	\N
11	Autorización para Prueba de Penetración	2	\N	\N	1	APP	\N	\N	\N
12	Informe de Prueba de Penetración	2	\N	\N	2	IPP	\N	\N	\N
14	Informe de Análisis de Impacto	3	\N	\N	2	IAIP	\N	\N	\N
16	Matriz de Impacto de Activos de Información	3	\N	\N	4	MIA	\N	\N	\N
17	Matriz de Dependencia Activos Intangibles	3	\N	\N	5	MD	\N	\N	\N
21	Plan Maestro de Continuidad	5	\N	\N	2	PMC	\N	\N	\N
24	Informe de Evaluación/Prueba a Planes	5	\N	\N	5	IEPC	\N	\N	\N
28	Identificación de sobre y seguimiento	6	\N	\N	2	SCMP	\N	\N	\N
8	Solicitud de Evaluación de STI	1	IEL/solicitud	\N	1	SEL	\N	\N	\N
9	Informe de Evaluación de STI.	1	IEL/listaInforme	\N	2	IEL	\N	\N	\N
1	Evaluación de STI	36	\N	\N	1	\N	\N	\N	\N
2	Prueba de Penetración	36	\N	\N	2	\N	\N	\N	\N
3	Análisis de Impacto del Negocio	36	\N	\N	3	\N	\N	\N	\N
4	Análisis de Riesgo Lógico	36	\N	\N	4	\N	\N	\N	\N
5	Planes de Continuidad	36	\N	\N	5	\N	\N	\N	\N
6	Resguardo de claves de máximo privilegio	36	\N	\N	6	\N	\N	\N	\N
7	Traslado, Resguardo y Prueba de los medios de respaldo	36	\N	\N	7	\N	\N	\N	\N
36	Evaluación,Respuesta y Contingencia	0	\N	\N	1	\N	\N	\N	\N
39	Informe de Incidente de Seguridad	38	\N	\N	2	IIS	\N	\N	\N
46	Informe de Depuracion de Acceso Logico	50	\N	\N	2	IDAL	\N	\N	\N
57	Seguimiento de Acciones Recomendadas - AF	40	\N	\N	8	 	\N	\N	\N
56	Seguimiento de Acciones Recomendadas - IS	38	\N	\N	3	\N	\N	\N	\N
44	Acta de Negación de Inspección de Equipos	40	C005tActaAnie	\N	5	ANIE	\N	\N	\N
45	Control de Evidencias	40	C006tEvidencia	\N	2	IAF	\N	\N	\N
71	Procesos STI	75	J817tProcesoSti 	\N	\N	\N	\N	\N	\N
51	Registro de Incidente de Seguridad	38	\N	\N	1	RIS	\N	\N	\N
59	Registro de Evidencias 	40	\N	\N	6	\N	\N	\N	\N
80	Tipo de Justificación del Informe de Marco Normativo	\N	\N	\N	4	\N	\N	\N	\N
79	Tipo de Informe de Marco Normativo	\N	\N	\N	3	\N	\N	\N	\N
66	Repositorios para Resguardo de Evidencias Digitales	60	J007tRepositorioDigital	\N	\N	RED	\N	\N	\N
78	Estado del Documento de Marco Normativo	\N	\N	\N	2	\N	\N	\N	\N
73	Personas	75	J812Persona	\N	\N	\N	\N	\N	\N
67	Estados de los Casos Forense	60	J004tEstadoForense	\N	\N	\N	\N	\N	\N
69	Divisiones STI	75	J815tDivision	\N	\N	\N	\N	\N	\N
74	Usuario del Sistema	75	J811tUsuario	\N	\N	\N	\N	\N	\N
70	Regiones STI	75	J813tRegion	\N	\N	\N	\N	\N	\N
72	Negocios por Region	75	J816tRelRegionNegocio	\N	\N	\N	\N	\N	\N
83	Tipificacion de Incidentes de Seguridad	82	\N	\N	1	\N	\N	\N	\N
65	Lugares para Resguardo de Evidencias Fisicas	60	J006tLugarSeguro	\N	\N	LREF	\N	\N	\N
64	Estados de las Evidencias	60	J003tEstadoEvidencia	\N	\N	\N	\N	\N	\N
63	Tipos de Evidencias	60	J002tTipoEvidencia	\N	\N	\N	\N	\N	\N
62	Tipos de Recursos Tecnologicos	60	J805tTipoRecurso	\N	\N	\N	\N	\N	\N
68	Negocios STI	75	J814tNegocio	\N	\N	\N	\N	\N	\N
31	Autorización de traslado de medios de respaldo	6	\N	\N	5	\N	\N	\N	\N
49	Registro de Analisis Forense	40	C001tForense	\N	1	RAF	\N	\N	\N
40	Analisis Forense	37	\N	\N	2	AF	\N	\N	\N
81	Detalle del Marco Normativo	\N	\N	\N	3	\N	\N	\N	\N
76	DM - Marco Normativo	\N	\N	\N	7	\N	\N	\N	\N
84	Tipificacion de Hechos	82	\N	\N	2	\N	\N	\N	\N
85	Estado del Incidente	82	\N	\N	3	\N	\N	\N	\N
89	Principios de Seguridad	67	\N	\N	6	\N	\N	\N	\N
61	Alcance de los Analisis Forense	60	J001tAlcanceForense	\N	\N	\N	\N	\N	\N
60	DM - Analisis Forense	95	\N	\N	9	\N	\N	\N	\N
77	Tipo de Documento Normativo	\N	\N	\N	1	\N	\N	\N	\N
75	DM - Generales	95	\N	\N	2	\N	\N	\N	\N
43	Acta de Inspección de Equipos	40	C004tActaAie	\N	4	AIE	\N	\N	\N
41	Informe de Analisis Forense	40	C002tInformeForense	\N	7	IR	\N	\N	\N
95	Configuración	0	\N	\N	5	\N	\N	\N	\N
96	Privilegios	95	rol	\N	1	\N	\N	\N	\N
86	Tipo de Plataforma de Seguridad	90	\N	\N	1	\N	\N	\N	\N
87	Listado de Herramienta de Seguridad	90	\N	\N	2	\N	\N	\N	\N
88	Tipos de Servicios Tecnologicos	67	\N	\N	7	\N	\N	\N	\N
91	Principios Afectados por Incidente	38	\N	\N	\N	\N	\N	\N	\N
92	Servicios Afectados en el Incidente	38	\N	\N	\N	\N	\N	\N	\N
93	Herramientas de Seguridad Utilizadas	38	\N	\N	\N	\N	\N	\N	\N
94	Marco Normativo Referenciado	38	\N	\N	\N	\N	\N	\N	\N
82	DM - Incidentes de Seguridad	95	\N	\N	8	\N	\N	\N	\N
90	DM - Plataforma de Seguridad	95	\N	\N	3	\N	\N	\N	\N
42	Acta de Cadena de Custodia	40	C003tActaAcc	\N	3	ACC	\N	\N	\N
0	raiz	\N	\N	\N	\N	\N	\N	\N	\N
97	Menu	95	J808tProducto	\N	6	\N	\N	\N	\N
98	Usuarios Adam	95	J811tUsuario	\N	6	\N	\N	\N	\N
\.


--
-- Name: j808t_producto_co_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j808t_producto_co_producto_seq', 98, true);


--
-- Data for Name: j809t_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j809t_rol (co_rol, tx_rol) FROM stdin;
1	Administrador
\.


--
-- Name: j809t_rol_co_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j809t_rol_co_rol_seq', 1, true);


--
-- Data for Name: j810t_rol_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) FROM stdin;
91	1	90	t
90	1	90	t
67	1	67	t
16	1	4	t
48	1	48	t
82	1	82	t
50	1	50	t
17	1	5	t
18	1	6	t
15	1	3	t
76	1	76	f
1	1	23	f
10	1	32	f
79	1	79	f
26	1	14	f
42	1	42	f
13	1	1	t
36	1	36	t
49	1	49	t
40	1	40	t
37	1	37	t
73	1	73	t
71	1	71	t
70	1	70	t
68	1	68	t
69	1	69	t
72	1	72	t
97	1	97	t
66	1	66	t
65	1	65	t
62	1	62	t
63	1	63	t
64	1	64	t
61	1	61	t
60	1	60	t
95	1	95	t
38	1	38	t
14	1	2	t
23	1	11	f
20	1	8	t
22	1	10	t
8	1	30	f
11	1	33	f
80	1	80	f
39	1	39	f
54	1	54	f
47	1	47	f
3	1	25	f
86	1	86	f
9	1	31	f
87	1	87	f
24	1	12	f
45	1	45	f
46	1	46	f
55	1	55	f
27	1	15	f
28	1	16	f
83	1	83	f
94	1	94	f
84	1	84	f
88	1	88	f
77	1	77	f
4	1	26	f
30	1	18	f
89	1	89	f
33	1	21	f
6	1	28	f
56	1	56	f
53	1	53	f
19	1	7	f
29	1	17	f
93	1	93	f
2	1	24	f
57	1	57	f
51	1	51	f
92	1	92	f
41	1	41	f
35	1	35	f
31	1	19	f
52	1	52	f
5	1	27	f
44	1	44	f
7	1	29	f
85	1	85	f
34	1	22	f
81	1	81	f
32	1	20	f
25	1	13	f
12	1	34	f
58	1	58	f
59	1	59	f
78	1	78	f
21	1	9	t
96	1	96	t
74	1	74	t
75	1	75	t
43	1	43	f
98	1	98	\N
\.


--
-- Name: j810t_rol_producto_co_rol_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j810t_rol_producto_co_rol_producto_seq', 98, true);


--
-- Data for Name: j811t_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j811t_usuario (co_usuario, tx_indicador, co_persona, co_rol) FROM stdin;
2	carrilloaw	1	1
1	camarilloj	1	1
\.


--
-- Name: j811t_usuario_co_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j811t_usuario_co_usuario_seq', 2, true);


--
-- Data for Name: j812_persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j812_persona (co_persona, nb_persona, ap_persona, co_division, co_rol, co_region, co_negocio) FROM stdin;
1	Joel	Camarillo	1	1	1	1
2	Tibisay	Vivas	1	1	3	1
\.


--
-- Name: j812_persona_co_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j812_persona_co_persona_seq', 2, true);


--
-- Data for Name: j813t_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j813t_region (co_region, tx_region, tx_sigla) FROM stdin;
2	Oriente	ORI
1	Occidente	OCC
3	Centro	CEN
\.


--
-- Name: j813t_region_co_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j813t_region_co_region_seq', 3, true);


--
-- Data for Name: j814t_negocio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j814t_negocio (co_negocio, tx_negocio, tx_sigla) FROM stdin;
1	Exploración y Producción Occidente	EPOC
4	Exploración y Producción Costa Afuera	EP
5	Refinación 	REF
6	Comercio y Suministro	CYS
7	Gas	GAS
8	Intevep	INTVP
9	Bariven	BRV
10	Ingeniería y Construcción	IYC
2	Exploración y Producción Oriente	EPOR
3	Exploración y Producción Faja	EPFA
11	Pdvsa Servicios	PDV-SER
12	Pdvsa Naval	PDV-NAV
13	Pdvsa Industrial	PDV-IND
14	Gas Comunal	GAS-COM
15	Metropolitana	MET
16	Corporativo	COR
\.


--
-- Name: j814t_negocio_co_negocio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j814t_negocio_co_negocio_seq', 5, true);


--
-- Data for Name: j815t_division; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j815t_division (co_division, tx_division, tx_sigla) FROM stdin;
16	Oriente	ORI
1	Costa Oriental	COR
2	Costa Occidental	COC
3	Costa Afuera	CAF
4	Furrial	FUR
5	Punta de Mata	PDM
6	Ayacucho	AYA
7	Boyaca	BOY
8	Carabobo	CAR
9	Junin	JUN
10	Mejoramiento	MEJ
11	Complejo Refinador Paraguana	CRP
12	El Palito	PAL
13	Puerto La Cruz	PLC
14	Metro Occidente	MOC
15	Occidente	OCC
\.


--
-- Name: j815t_division_co_division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j815t_division_co_division_seq', 18, true);


--
-- Data for Name: j816t_rel_region_negocio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) FROM stdin;
1	1	1	1
2	1	1	2
3	2	2	4
4	2	2	5
7	2	3	8
8	2	3	9
9	2	3	10
5	2	3	6
6	2	2	7
10	2	4	3
11	1	5	11
12	3	5	12
13	2	5	13
14	1	6	\N
15	2	6	\N
16	3	6	\N
17	1	7	14
18	2	7	15
19	3	7	16
20	3	8	\N
21	1	9	\N
22	2	9	\N
23	3	9	\N
24	1	10	\N
25	2	10	\N
26	3	10	\N
27	1	11	\N
28	2	11	\N
29	3	11	\N
30	3	12	\N
31	3	13	\N
32	3	14	\N
33	3	15	\N
34	3	16	\N
\.


--
-- Name: j816t_rel_region_negocio_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j816t_rel_region_negocio_co_relacion_seq', 1, true);


--
-- Data for Name: j817t_proceso_sti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j817t_proceso_sti (co_proceso_sti, tx_descripcion, tx_sigla, created_at, updated_at, co_transaccion) FROM stdin;
\.


--
-- Name: j817t_proceso_sti_co_proceso_sti_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j817t_proceso_sti_co_proceso_sti_seq', 1, false);


--
-- Data for Name: j818t_categoria_control; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j818t_categoria_control (co_categoria_control, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) FROM stdin;
1	Preventivo	2015-11-06 00:00:00-04:30	2016-11-06 00:00:00-04:30	1	1
3	Correctivo	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
2	Detectivo	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
4	Disuasivo	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
\.


--
-- Name: j818t_tipo_control_co_tipo_control_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j818t_tipo_control_co_tipo_control_seq', 1, false);


--
-- Data for Name: j819t_estado_control; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j819t_estado_control (co_estado_control, tx_descripcion, nu_valor, created_at, updated_at, co_created_at, co_updated_at, tx_estado_control) FROM stdin;
1	El control no existe\t\t\t\t\t\t\t\t\t\t\t\t	0	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1	Inexistente
2	El control existe, pero sin procedimiento, se hace de manera empírica y no en todos los negocios	1	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1	Inicial
3	El control puede estar procedimientado, pero no esta estandarizado, se aplica en un lugar y en otro no	2	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1	Repetible
4	El control esta documentado, tiene su politica de atención, se encuentra estandarizado e implantado en todas partes	3	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1	Implantado
5	El control ya fue auditado exitosamente	4	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1	Auditado
6	El control ha sido optimizado en su funcionamiento, ya tiene muchas metricas que han permitido su mejora. Se gestiona de manera oportuna	5	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1	Gestionado
\.


--
-- Name: j819t_estado_control_co_estado_control_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j819t_estado_control_co_estado_control_seq', 1, false);


--
-- Data for Name: j820t_tipo_accion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) FROM stdin;
2	Entonación de Herramienta de STI	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
1	Notificación al Usuario	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
3	Solicitud de Mitigación al Centro de Servicios	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
4	Solicitud Estrategia Educativa	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
6	Solicitud de Consultoría de Seguridad	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
7	Solicitud de Analisis Forense	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
5	Solicitud de Evaluación de Seguridad	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
8	Solicitud de Analisis de Riesgo	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
9	Solicitud de Depuración de Accesos	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
10	Solicitud de Reunión 	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
11	Solicitud de Marco Normativo	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
\.


--
-- Name: j820t_tipo_accion_co_tipo_accion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j820t_tipo_accion_co_tipo_accion_seq', 1, false);


--
-- Data for Name: j821t_estado_accion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j821t_estado_accion (co_estado_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) FROM stdin;
1	Abierto	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
2	Gestionada	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
3	Cerrada	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
\.


--
-- Name: j821t_estado_accion_co_estado_accion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j821t_estado_accion_co_estado_accion_seq', 1, false);


--
-- Data for Name: j822t_nivel_riesgo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j822t_nivel_riesgo (co_nivel_riesgo, tx_nivel_riesgo, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) FROM stdin;
1	Alto	4	Si durante el proceso de observación se encuentra una riesgo Alto, hay una fuerte necesidad de medidas correctivas. Un sistema existente puede continuar operativo, pero el plan de acción correctivo debe ser incorporado lo más pronto posible 	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
3	Bajo	2	Si durante el proceso de observación es descrito el riego como Bajo, el personal de Control de Cambios de los sistemas debe determinar cuales son las acciones correctivas que se requieren o se decide asumir el riesgo	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
2	Medio	3	Si durante el proceso de observación se determina el rango de riesgo Medio, las acciones correctivas son necesarias y un plan debe ser desarrollado para ser incorporado, estas acciones deben hacerse en un periodo de tiempo\r\nrazonable\t\t\t\t\t\t\t\t\tPDV-PCP-FSTI-023.2: Informe de Análisis de Riesgo Lógico \t\t\t\r\n	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
\.


--
-- Name: j822t_nivel_riesgo_co_nivel_riesgo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j822t_nivel_riesgo_co_nivel_riesgo_seq', 1, false);


--
-- Data for Name: j823t_nivel_impacto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j823t_nivel_impacto (co_nivel_impacto, tx_nivel_impacto, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) FROM stdin;
1	Alto	4	Al ocurrir una incidencia puede resultar en pérdidas altamente costosas de gran cantidad de activos o recursos y puede significativamente violar, dañar o impedir el cumplimiento de la misión de la organización, reputación o intereses	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
2	Medio	3	Al ocurrir una incidencia puede resultar en pérdidas costosas de activos o recursos puede violar, dañar o impedir el cumplimiento de la misión de la organización, reputación o intereses	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
3	Bajo	2	Al explotar una vulnerabilidad puede resultar en pérdidas de algunos activos o recursos puede afectar la misión de la organización, reputación o intereses	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
\.


--
-- Name: j823t_nivel_impacto_co_nivel_impacto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j823t_nivel_impacto_co_nivel_impacto_seq', 1, false);


--
-- Data for Name: j824t_nivel_amenaza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j824t_nivel_amenaza (co_nivel_amenaza, tx_nivel_amenaza, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) FROM stdin;
1	Alto	4	La amenaza es alta (posee alta motivación y capacidad) y los controles para prevenir que la vulnerabilidad sea explotada son ineficientes o no existen	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
3	Bajo	2	La amenaza es baja y los controles están en un lugar que previenen o al menos impiden significativamente que la vulnerabilidad sea explotada	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
2	Medio	3	La amenaza es media, pero los controles están en un lugar que pueden impedir que sea explotada de manera exitosa la vulnerabilidad	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
\.


--
-- Name: j824t_nivel_amenaza_co_nivel_amenaza_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j824t_nivel_amenaza_co_nivel_amenaza_seq', 1, false);


--
-- Data for Name: j825t_matriz_riesgo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j825t_matriz_riesgo (co_matriz_riesgo, co_impacto, co_amenaza, co_riesgo, created_at, updated_at, co_created_at, co_updated_at) FROM stdin;
1	1	3	3	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
2	1	2	2	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
3	1	1	1	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
4	2	3	3	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
5	2	2	2	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
6	2	1	2	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
7	3	3	3	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
8	3	2	3	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
9	3	1	3	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
\.


--
-- Name: j825t_matriz_riesgo_co_matriz_riesgo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j825t_matriz_riesgo_co_matriz_riesgo_seq', 1, false);


--
-- Data for Name: j826t_opciones_riesgo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j826t_opciones_riesgo (co_opciones_riesgo, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) FROM stdin;
2	Evitar	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
1	Asumir	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
3	Reducir	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
4	Transferir	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1
\.


--
-- Name: j826t_opciones_riesgo_co_opciones_riesgo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j826t_opciones_riesgo_co_opciones_riesgo_seq', 1, false);


--
-- Data for Name: j827t_tipo_riesgo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY j827t_tipo_riesgo (co_tipo_riesgo, tx_tipo_riesgo, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at, co_valor_riesgo) FROM stdin;
1	Riesgo Potencial	Riesgo sin ningún tipo de medida/control de seguridad implementado	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1	1
2	Riesgo Residual	Resultado hipotético del riesgo una vez todas las medidas de seguridad son efectivas y eficaces, luego de su implementación	2015-11-06 00:00:00-04:30	2015-11-06 00:00:00-04:30	1	1	3
\.


--
-- Name: j827t_tipo_riesgo_co_tipo_riesgo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j827t_tipo_riesgo_co_tipo_riesgo_seq', 1, false);


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY session (sess_id, sess_data, sess_time) FROM stdin;
\.


--
-- Name: session_sess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('session_sess_id_seq', 1, false);


--
-- Name: co_lugar_seguro; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT co_lugar_seguro PRIMARY KEY (co_lugar_seguro);


--
-- Name: j808t_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j808t_producto
    ADD CONSTRAINT j808t_producto_pkey PRIMARY KEY (co_producto);


--
-- Name: j809_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j809t_rol
    ADD CONSTRAINT j809_rol_pkey PRIMARY KEY (co_rol);


--
-- Name: j810t_rol_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j810t_rol_producto
    ADD CONSTRAINT j810t_rol_producto_pkey PRIMARY KEY (co_rol_producto);


--
-- Name: j813t_region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j813t_region
    ADD CONSTRAINT j813t_region_pkey PRIMARY KEY (co_region);


--
-- Name: j814t_negocio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j814t_negocio
    ADD CONSTRAINT j814t_negocio_pkey PRIMARY KEY (co_negocio);


--
-- Name: j815t_division_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j815t_division
    ADD CONSTRAINT j815t_division_pkey PRIMARY KEY (co_division);


--
-- Name: pk_co_acc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT pk_co_acc PRIMARY KEY (co_acc);


--
-- Name: pk_co_acceso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j141t_tipo_acceso
    ADD CONSTRAINT pk_co_acceso PRIMARY KEY (co_acceso);


--
-- Name: CONSTRAINT pk_co_acceso ON j141t_tipo_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_co_acceso ON j141t_tipo_acceso IS 'Clave primaria de la tabla tipo de acceso que se usa en la depuracion';


--
-- Name: pk_co_aie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT pk_co_aie PRIMARY KEY (co_aie);


--
-- Name: pk_co_alcance_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j001t_alcance_forense
    ADD CONSTRAINT pk_co_alcance_forense PRIMARY KEY (co_alcance_forense);


--
-- Name: pk_co_anexos_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c008t_anexos_forense
    ADD CONSTRAINT pk_co_anexos_forense PRIMARY KEY (co_anexos_forense);


--
-- Name: pk_co_anie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT pk_co_anie PRIMARY KEY (co_anie);


--
-- Name: pk_co_categoria_control; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j818t_categoria_control
    ADD CONSTRAINT pk_co_categoria_control PRIMARY KEY (co_categoria_control);


--
-- Name: pk_co_ciudad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j806t_ciudad
    ADD CONSTRAINT pk_co_ciudad PRIMARY KEY (co_ciudad);


--
-- Name: pk_co_clasificacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j802t_clasificacion
    ADD CONSTRAINT pk_co_clasificacion PRIMARY KEY (co_clasificacion);


--
-- Name: pk_co_criterio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j140t_criterio_depuracion
    ADD CONSTRAINT pk_co_criterio PRIMARY KEY (co_criterio);


--
-- Name: pk_co_depuracion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c140t_depuracion
    ADD CONSTRAINT pk_co_depuracion PRIMARY KEY (co_depuracion);


--
-- Name: CONSTRAINT pk_co_depuracion ON c140t_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_co_depuracion ON c140t_depuracion IS 'Clave primaria de la tabla depuracion';


--
-- Name: pk_co_estado_accion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j821t_estado_accion
    ADD CONSTRAINT pk_co_estado_accion PRIMARY KEY (co_estado_accion);


--
-- Name: pk_co_estado_acta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j005t_estado_acta
    ADD CONSTRAINT pk_co_estado_acta PRIMARY KEY (co_estado_acta);


--
-- Name: pk_co_estado_control; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j819t_estado_control
    ADD CONSTRAINT pk_co_estado_control PRIMARY KEY (co_estado_control);


--
-- Name: pk_co_estado_depuracion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j142t_estado_depuracion
    ADD CONSTRAINT pk_co_estado_depuracion PRIMARY KEY (co_estado_depuracion);


--
-- Name: CONSTRAINT pk_co_estado_depuracion ON j142t_estado_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_co_estado_depuracion ON j142t_estado_depuracion IS 'Clave primaria de la tabla de estado de depuracion';


--
-- Name: pk_co_estado_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j003t_estado_evidencia
    ADD CONSTRAINT pk_co_estado_evidencia PRIMARY KEY (co_estado_evidencia);


--
-- Name: pk_co_estado_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j004t_estado_forense
    ADD CONSTRAINT pk_co_estado_forense PRIMARY KEY (co_estado_forense);


--
-- Name: pk_co_estado_informe; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j803t_estado_informe
    ADD CONSTRAINT pk_co_estado_informe PRIMARY KEY (co_estado_informe);


--
-- Name: pk_co_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT pk_co_evidencia PRIMARY KEY (co_evidencia);


--
-- Name: pk_co_figuras_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c007t_figuras_forense
    ADD CONSTRAINT pk_co_figuras_forense PRIMARY KEY (co_figuras_forense);


--
-- Name: pk_co_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT pk_co_forense PRIMARY KEY (co_forense);


--
-- Name: pk_co_gerencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j804t_gerencia
    ADD CONSTRAINT pk_co_gerencia PRIMARY KEY (co_gerencia);


--
-- Name: pk_co_incidente; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c020t_incidente
    ADD CONSTRAINT pk_co_incidente PRIMARY KEY (co_incidente);


--
-- Name: pk_co_informe_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT pk_co_informe_forense PRIMARY KEY (co_informe_forense);


--
-- Name: pk_co_localidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j807t_localidad
    ADD CONSTRAINT pk_co_localidad PRIMARY KEY (co_localidad);


--
-- Name: CONSTRAINT pk_co_localidad ON j807t_localidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_co_localidad ON j807t_localidad IS 'clave de la tabla';


--
-- Name: pk_co_matriz_riesgo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j825t_matriz_riesgo
    ADD CONSTRAINT pk_co_matriz_riesgo PRIMARY KEY (co_matriz_riesgo);


--
-- Name: pk_co_nivel_amenaza; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j824t_nivel_amenaza
    ADD CONSTRAINT pk_co_nivel_amenaza PRIMARY KEY (co_nivel_amenaza);


--
-- Name: pk_co_nivel_impacto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j823t_nivel_impacto
    ADD CONSTRAINT pk_co_nivel_impacto PRIMARY KEY (co_nivel_impacto);


--
-- Name: pk_co_nivel_riesgo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j822t_nivel_riesgo
    ADD CONSTRAINT pk_co_nivel_riesgo PRIMARY KEY (co_nivel_riesgo);


--
-- Name: pk_co_num_inventario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c060_inventario
    ADD CONSTRAINT pk_co_num_inventario PRIMARY KEY (co_num_inventario);


--
-- Name: pk_co_opciones_riesgo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j826t_opciones_riesgo
    ADD CONSTRAINT pk_co_opciones_riesgo PRIMARY KEY (co_opciones_riesgo);


--
-- Name: pk_co_principio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j801t_principio
    ADD CONSTRAINT pk_co_principio PRIMARY KEY (co_principio);


--
-- Name: pk_co_proceso_sti; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j817t_proceso_sti
    ADD CONSTRAINT pk_co_proceso_sti PRIMARY KEY (co_proceso_sti);


--
-- Name: pk_co_relacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c141t_rel_criterio_depuracion
    ADD CONSTRAINT pk_co_relacion PRIMARY KEY (co_relacion);


--
-- Name: CONSTRAINT pk_co_relacion ON c141t_rel_criterio_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_co_relacion ON c141t_rel_criterio_depuracion IS 'Clave primaria de la tabla relacion criterio de depuracion';


--
-- Name: pk_co_relacion1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c805t_rel_transaccion_principio
    ADD CONSTRAINT pk_co_relacion1 PRIMARY KEY (co_relacion);


--
-- Name: pk_co_relacion10; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j816t_rel_region_negocio
    ADD CONSTRAINT pk_co_relacion10 PRIMARY KEY (co_relacion);


--
-- Name: pk_co_relacion2; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c806t_rel_transaccion_marco_normativo
    ADD CONSTRAINT pk_co_relacion2 PRIMARY KEY (co_relacion);


--
-- Name: pk_co_repositorio_digital; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j007t_repositorio_digital
    ADD CONSTRAINT pk_co_repositorio_digital PRIMARY KEY (co_repositorio_digital);


--
-- Name: pk_co_tipo_accion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j820t_tipo_accion
    ADD CONSTRAINT pk_co_tipo_accion PRIMARY KEY (co_tipo_accion);


--
-- Name: pk_co_tipo_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j002t_tipo_evidencia
    ADD CONSTRAINT pk_co_tipo_evidencia PRIMARY KEY (co_tipo_evidencia);


--
-- Name: pk_co_tipo_recurso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j805t_tipo_recurso
    ADD CONSTRAINT pk_co_tipo_recurso PRIMARY KEY (co_tipo_recurso);


--
-- Name: pk_co_tipo_riesgo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j827t_tipo_riesgo
    ADD CONSTRAINT pk_co_tipo_riesgo PRIMARY KEY (co_tipo_riesgo);


--
-- Name: pk_co_transaccion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c801t_transaccion
    ADD CONSTRAINT pk_co_transaccion PRIMARY KEY (co_transaccion);


--
-- Name: pk_co_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j811t_usuario
    ADD CONSTRAINT pk_co_usuario PRIMARY KEY (co_usuario);


--
-- Name: pk_session_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session
    ADD CONSTRAINT pk_session_id PRIMARY KEY (sess_id);


--
-- Name: pks_co_persona; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j812_persona
    ADD CONSTRAINT pks_co_persona PRIMARY KEY (co_persona);


--
-- Name: fki_co_acc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_acc ON c006t_evidencia USING btree (co_acc);


--
-- Name: fki_co_aie; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aie ON c006t_evidencia USING btree (co_aie);


--
-- Name: fki_co_alcance_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_alcance_forense ON c001t_forense USING btree (co_alcance_forense);


--
-- Name: fki_co_amenaza; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_amenaza ON j825t_matriz_riesgo USING btree (co_amenaza);


--
-- Name: fki_co_ciudad; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_ciudad ON j006t_lugar_seguro USING btree (co_ciudad);


--
-- Name: fki_co_ciudad3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_ciudad3 ON c003t_acta_acc USING btree (co_ciudad_acta);


--
-- Name: fki_co_ciudad_acta4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_ciudad_acta4 ON c004t_acta_aie USING btree (co_ciudad_acta);


--
-- Name: fki_co_clasificacion; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion ON c001t_forense USING btree (co_clasificacion);


--
-- Name: fki_co_clasificacion0; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion0 ON c006t_evidencia USING btree (co_clasificacion);


--
-- Name: fki_co_clasificacion01; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion01 ON j006t_lugar_seguro USING btree (co_clasificacion);


--
-- Name: fki_co_clasificacion1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion1 ON c002t_informe_forense USING btree (co_clasificacion);


--
-- Name: fki_co_clasificacion100; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion100 ON c007t_figuras_forense USING btree (co_clasificacion);


--
-- Name: fki_co_clasificacion2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion2 ON c003t_acta_acc USING btree (co_clasificacion);


--
-- Name: fki_co_clasificacion200; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion200 ON c008t_anexos_forense USING btree (co_clasificacion);


--
-- Name: fki_co_clasificacion4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion4 ON c004t_acta_aie USING btree (co_clasificacion);


--
-- Name: fki_co_clasificacion5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion5 ON c005t_acta_anie USING btree (co_clasificacion);


--
-- Name: fki_co_colecta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_colecta ON c006t_evidencia USING btree (co_colecta);


--
-- Name: fki_co_created_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at ON c006t_evidencia USING btree (co_created_at);


--
-- Name: fki_co_custodio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio ON j006t_lugar_seguro USING btree (co_custodio);


--
-- Name: fki_co_custodio02; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio02 ON c006t_evidencia USING btree (co_custodio);


--
-- Name: fki_co_custodio2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio2 ON j007t_repositorio_digital USING btree (co_custodio);


--
-- Name: fki_co_custodio3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio3 ON c003t_acta_acc USING btree (co_custodio);


--
-- Name: fki_co_custodio4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio4 ON c004t_acta_aie USING btree (co_custodio);


--
-- Name: fki_co_destruye; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_destruye ON c003t_acta_acc USING btree (co_destruye);


--
-- Name: fki_co_division; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division ON j812_persona USING btree (co_division);


--
-- Name: fki_co_division1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division1 ON c001t_forense USING btree (co_division);


--
-- Name: fki_co_division10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division10 ON j816t_rel_region_negocio USING btree (co_division);


--
-- Name: fki_co_division2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division2 ON c002t_informe_forense USING btree (co_division);


--
-- Name: fki_co_division3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division3 ON c003t_acta_acc USING btree (co_division);


--
-- Name: fki_co_divison4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_divison4 ON c004t_acta_aie USING btree (co_division);


--
-- Name: fki_co_divison5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_divison5 ON c005t_acta_anie USING btree (co_division);


--
-- Name: fki_co_elabora; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_elabora ON c003t_acta_acc USING btree (co_elabora);


--
-- Name: fki_co_elabora4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_elabora4 ON c004t_acta_aie USING btree (co_elabora);


--
-- Name: fki_co_elabora5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_elabora5 ON c005t_acta_anie USING btree (co_elabora);


--
-- Name: fki_co_entregado; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_entregado ON c006t_evidencia USING btree (co_entregado_fuera_sti);


--
-- Name: fki_co_estado_acta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_acta ON c003t_acta_acc USING btree (co_estado_acta);


--
-- Name: fki_co_estado_evidencia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_evidencia ON c006t_evidencia USING btree (co_estado_evidencia);


--
-- Name: fki_co_estado_informe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_informe ON c002t_informe_forense USING btree (co_estado_informe);


--
-- Name: fki_co_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense ON c004t_acta_aie USING btree (co_forense);


--
-- Name: fki_co_forense1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense1 ON c002t_informe_forense USING btree (co_forense);


--
-- Name: fki_co_forense10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense10 ON c805t_rel_transaccion_principio USING btree (co_transaccion);


--
-- Name: fki_co_forense5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense5 ON c005t_acta_anie USING btree (co_forense);


--
-- Name: fki_co_gerencia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_gerencia ON j006t_lugar_seguro USING btree (co_gerencia);


--
-- Name: fki_co_gerencia1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_gerencia1 ON j007t_repositorio_digital USING btree (co_gerencia);


--
-- Name: fki_co_impacto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_impacto ON j825t_matriz_riesgo USING btree (co_impacto);


--
-- Name: fki_co_informe_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_informe_forense ON c007t_figuras_forense USING btree (co_informe_forense);


--
-- Name: fki_co_informe_forense200; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_informe_forense200 ON c008t_anexos_forense USING btree (co_informe_forense);


--
-- Name: fki_co_localidad; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_localidad ON j006t_lugar_seguro USING btree (co_localidad);


--
-- Name: fki_co_negocio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio ON j812_persona USING btree (co_negocio);


--
-- Name: fki_co_negocio1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio1 ON c001t_forense USING btree (co_negocio);


--
-- Name: fki_co_negocio10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio10 ON j816t_rel_region_negocio USING btree (co_negocio);


--
-- Name: fki_co_negocio2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio2 ON c002t_informe_forense USING btree (co_negocio);


--
-- Name: fki_co_negocio3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio3 ON c003t_acta_acc USING btree (co_negocio);


--
-- Name: fki_co_negocio4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio4 ON c004t_acta_aie USING btree (co_negocio);


--
-- Name: fki_co_negocio5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio5 ON c005t_acta_anie USING btree (co_negocio);


--
-- Name: fki_co_niega; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_niega ON c005t_acta_anie USING btree (co_niega);


--
-- Name: fki_co_persona; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_persona ON j811t_usuario USING btree (co_persona);


--
-- Name: fki_co_princpio1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_princpio1 ON c805t_rel_transaccion_principio USING btree (co_principio);


--
-- Name: fki_co_producto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_producto ON c801t_transaccion USING btree (co_producto);


--
-- Name: fki_co_producto_padre; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_producto_padre ON j808t_producto USING btree (co_padre);


--
-- Name: fki_co_producto_rol_producto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_producto_rol_producto ON j810t_rol_producto USING btree (co_rol);


--
-- Name: fki_co_recurso; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_recurso ON c004t_acta_aie USING btree (co_recurso);


--
-- Name: fki_co_region; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region ON c001t_forense USING btree (co_region);


--
-- Name: fki_co_region10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region10 ON j816t_rel_region_negocio USING btree (co_region);


--
-- Name: fki_co_region2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region2 ON c002t_informe_forense USING btree (co_region);


--
-- Name: fki_co_region3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region3 ON c003t_acta_acc USING btree (co_region);


--
-- Name: fki_co_region4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region4 ON c004t_acta_aie USING btree (co_region);


--
-- Name: fki_co_region5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region5 ON c005t_acta_anie USING btree (co_region);


--
-- Name: fki_co_registra; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_registra ON c006t_evidencia USING btree (co_registra);


--
-- Name: fki_co_riesgp; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_riesgp ON j825t_matriz_riesgo USING btree (co_riesgo);


--
-- Name: fki_co_rol; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_rol ON j812_persona USING btree (co_rol);


--
-- Name: fki_co_rol_producto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_rol_producto ON j810t_rol_producto USING btree (co_producto);


--
-- Name: fki_co_tipo_evidencia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_evidencia ON c006t_evidencia USING btree (co_tipo_evidencia);


--
-- Name: fki_co_tipo_recurso; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_recurso ON c003t_acta_acc USING btree (co_tipo_recurso);


--
-- Name: fki_co_transaccion; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion ON c001t_forense USING btree (co_transaccion);


--
-- Name: fki_co_transaccion01; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion01 ON j006t_lugar_seguro USING btree (co_transaccion);


--
-- Name: fki_co_transaccion03; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion03 ON j001t_alcance_forense USING btree (co_transaccion);


--
-- Name: fki_co_transaccion04; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion04 ON j002t_tipo_evidencia USING btree (co_transaccion);


--
-- Name: fki_co_transaccion05; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion05 ON j003t_estado_evidencia USING btree (co_transaccion);


--
-- Name: fki_co_transaccion06; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion06 ON j004t_estado_forense USING btree (co_transaccion);


--
-- Name: fki_co_transaccion07; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion07 ON j005t_estado_acta USING btree (co_transaccion);


--
-- Name: fki_co_transaccion08; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion08 ON j802t_clasificacion USING btree (co_transaccion);


--
-- Name: fki_co_transaccion09; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion09 ON j803t_estado_informe USING btree (co_transaccion);


--
-- Name: fki_co_transaccion1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion1 ON c006t_evidencia USING btree (co_transaccion);


--
-- Name: fki_co_transaccion10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion10 ON j804t_gerencia USING btree (co_transaccion);


--
-- Name: fki_co_transaccion11; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion11 ON j805t_tipo_recurso USING btree (co_transaccion);


--
-- Name: fki_co_transaccion14; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion14 ON j807t_localidad USING btree (co_transaccion);


--
-- Name: fki_co_transaccion15; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion15 ON j808t_producto USING btree (co_transaccion);


--
-- Name: fki_co_transaccion2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion2 ON c002t_informe_forense USING btree (co_transaccion);


--
-- Name: fki_co_transaccion3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion3 ON c003t_acta_acc USING btree (co_transaccion);


--
-- Name: fki_co_transaccion4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion4 ON c004t_acta_aie USING btree (co_transaccion);


--
-- Name: fki_co_transaccion5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion5 ON c005t_acta_anie USING btree (co_transaccion);


--
-- Name: fki_co_udared_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_udared_at ON c006t_evidencia USING btree (co_updated_at);


--
-- Name: fki_co_valor_riesgo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_valor_riesgo ON j827t_tipo_riesgo USING btree (co_valor_riesgo);


--
-- Name: fki_estado_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_estado_forense ON c001t_forense USING btree (co_estado_forense);


--
-- Name: fki_fks_co_region; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_fks_co_region ON j812_persona USING btree (co_region);


--
-- Name: fki_fks_co_rol; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_fks_co_rol ON j811t_usuario USING btree (co_rol);


--
-- Name: fki_pk_co_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_pk_co_forense ON c003t_acta_acc USING btree (co_forense);


--
-- Name: actualizar_privilegio; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizar_privilegio AFTER UPDATE ON j810t_rol_producto FOR EACH ROW EXECUTE PROCEDURE actualizar_menu();


--
-- Name: co_ciudad3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT co_ciudad3 FOREIGN KEY (co_ciudad_acta) REFERENCES j806t_ciudad(co_ciudad);


--
-- Name: co_region3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT co_region3 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- Name: fk_co_acc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_acc FOREIGN KEY (co_acc) REFERENCES c003t_acta_acc(co_acc);


--
-- Name: fk_co_aie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_aie FOREIGN KEY (co_aie) REFERENCES c004t_acta_aie(co_aie);


--
-- Name: fk_co_alcance_forense; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_alcance_forense FOREIGN KEY (co_alcance_forense) REFERENCES j001t_alcance_forense(co_alcance_forense);


--
-- Name: fk_co_amenaza; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j825t_matriz_riesgo
    ADD CONSTRAINT fk_co_amenaza FOREIGN KEY (co_amenaza) REFERENCES j824t_nivel_amenaza(co_nivel_amenaza);


--
-- Name: fk_co_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_ciudad FOREIGN KEY (co_ciudad) REFERENCES j806t_ciudad(co_ciudad);


--
-- Name: fk_co_ciudad_acta4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_ciudad_acta4 FOREIGN KEY (co_ciudad_acta) REFERENCES j806t_ciudad(co_ciudad);


--
-- Name: fk_co_clasificacion0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_clasificacion0 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- Name: fk_co_clasificacion01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_clasificacion01 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- Name: fk_co_clasificacion1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_clasificacion1 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- Name: fk_co_clasificacion100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c007t_figuras_forense
    ADD CONSTRAINT fk_co_clasificacion100 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- Name: fk_co_clasificacion2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_clasificacion2 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- Name: fk_co_clasificacion200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c008t_anexos_forense
    ADD CONSTRAINT fk_co_clasificacion200 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- Name: fk_co_clasificacion3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_clasificacion3 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- Name: fk_co_clasificacion4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_clasificacion4 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- Name: fk_co_clasificacion5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_clasificacion5 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- Name: fk_co_colecta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_colecta FOREIGN KEY (co_colecta) REFERENCES j811t_usuario(co_usuario);


--
-- Name: fk_co_created_at; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_created_at FOREIGN KEY (co_created_at) REFERENCES j812_persona(co_persona);


--
-- Name: fk_co_custodio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_custodio FOREIGN KEY (co_custodio) REFERENCES j812_persona(co_persona);


--
-- Name: fk_co_custodio02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_custodio02 FOREIGN KEY (co_custodio) REFERENCES j812_persona(co_persona);


--
-- Name: fk_co_custodio2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j007t_repositorio_digital
    ADD CONSTRAINT fk_co_custodio2 FOREIGN KEY (co_custodio) REFERENCES j812_persona(co_persona);


--
-- Name: fk_co_custodio3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_custodio3 FOREIGN KEY (co_custodio) REFERENCES j812_persona(co_persona);


--
-- Name: fk_co_custodio4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_custodio4 FOREIGN KEY (co_custodio) REFERENCES j812_persona(co_persona);


--
-- Name: fk_co_destruye; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_destruye FOREIGN KEY (co_destruye) REFERENCES j811t_usuario(co_usuario);


--
-- Name: fk_co_division; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j812_persona
    ADD CONSTRAINT fk_co_division FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- Name: fk_co_division1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_division1 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- Name: fk_co_division10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j816t_rel_region_negocio
    ADD CONSTRAINT fk_co_division10 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- Name: fk_co_division2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_division2 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- Name: fk_co_division3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_division3 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- Name: fk_co_divison4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_divison4 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- Name: fk_co_divison5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_divison5 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- Name: fk_co_elabora4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_elabora4 FOREIGN KEY (co_elabora) REFERENCES j811t_usuario(co_usuario);


--
-- Name: fk_co_elabora5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_elabora5 FOREIGN KEY (co_elabora) REFERENCES j811t_usuario(co_usuario);


--
-- Name: fk_co_entregado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_entregado FOREIGN KEY (co_entregado_fuera_sti) REFERENCES j811t_usuario(co_usuario);


--
-- Name: fk_co_estado_acta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_estado_acta FOREIGN KEY (co_estado_acta) REFERENCES j005t_estado_acta(co_estado_acta);


--
-- Name: fk_co_estado_evidencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_estado_evidencia FOREIGN KEY (co_estado_evidencia) REFERENCES j003t_estado_evidencia(co_estado_evidencia);


--
-- Name: fk_co_estado_informe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_estado_informe FOREIGN KEY (co_estado_informe) REFERENCES j803t_estado_informe(co_estado_informe);


--
-- Name: fk_co_forense2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_forense2 FOREIGN KEY (co_forense) REFERENCES c001t_forense(co_forense);


--
-- Name: fk_co_forense4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_forense4 FOREIGN KEY (co_forense) REFERENCES c001t_forense(co_forense);


--
-- Name: fk_co_forense5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_forense5 FOREIGN KEY (co_forense) REFERENCES c001t_forense(co_forense);


--
-- Name: fk_co_gerencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_gerencia FOREIGN KEY (co_gerencia) REFERENCES j804t_gerencia(co_gerencia);


--
-- Name: fk_co_gerencia1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j007t_repositorio_digital
    ADD CONSTRAINT fk_co_gerencia1 FOREIGN KEY (co_gerencia) REFERENCES j804t_gerencia(co_gerencia);


--
-- Name: fk_co_impacto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j825t_matriz_riesgo
    ADD CONSTRAINT fk_co_impacto FOREIGN KEY (co_impacto) REFERENCES j823t_nivel_impacto(co_nivel_impacto);


--
-- Name: fk_co_informe_forense; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c007t_figuras_forense
    ADD CONSTRAINT fk_co_informe_forense FOREIGN KEY (co_informe_forense) REFERENCES c002t_informe_forense(co_informe_forense);


--
-- Name: fk_co_informe_forense200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c008t_anexos_forense
    ADD CONSTRAINT fk_co_informe_forense200 FOREIGN KEY (co_informe_forense) REFERENCES c002t_informe_forense(co_informe_forense);


--
-- Name: fk_co_localidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_localidad FOREIGN KEY (co_localidad) REFERENCES j807t_localidad(co_localidad);


--
-- Name: fk_co_negocio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j812_persona
    ADD CONSTRAINT fk_co_negocio FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- Name: fk_co_negocio1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_negocio1 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- Name: fk_co_negocio10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j816t_rel_region_negocio
    ADD CONSTRAINT fk_co_negocio10 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- Name: fk_co_negocio2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_negocio2 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- Name: fk_co_negocio3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_negocio3 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- Name: fk_co_negocio4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_negocio4 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- Name: fk_co_negocio5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_negocio5 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- Name: fk_co_niega; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_niega FOREIGN KEY (co_niega) REFERENCES j812_persona(co_persona);


--
-- Name: fk_co_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j811t_usuario
    ADD CONSTRAINT fk_co_persona FOREIGN KEY (co_persona) REFERENCES j812_persona(co_persona);


--
-- Name: fk_co_princpio1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c805t_rel_transaccion_principio
    ADD CONSTRAINT fk_co_princpio1 FOREIGN KEY (co_principio) REFERENCES j801t_principio(co_principio);


--
-- Name: fk_co_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c801t_transaccion
    ADD CONSTRAINT fk_co_producto FOREIGN KEY (co_producto) REFERENCES j808t_producto(co_producto);


--
-- Name: fk_co_producto_padre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j808t_producto
    ADD CONSTRAINT fk_co_producto_padre FOREIGN KEY (co_padre) REFERENCES j808t_producto(co_producto);


--
-- Name: fk_co_producto_rol_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j810t_rol_producto
    ADD CONSTRAINT fk_co_producto_rol_producto FOREIGN KEY (co_rol) REFERENCES j809t_rol(co_rol);


--
-- Name: fk_co_recurso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_recurso FOREIGN KEY (co_recurso) REFERENCES j805t_tipo_recurso(co_tipo_recurso);


--
-- Name: fk_co_region1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_region1 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- Name: fk_co_region10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j816t_rel_region_negocio
    ADD CONSTRAINT fk_co_region10 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- Name: fk_co_region2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_region2 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- Name: fk_co_region4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_region4 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- Name: fk_co_region5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_region5 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- Name: fk_co_registra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_registra FOREIGN KEY (co_registra) REFERENCES j811t_usuario(co_usuario);


--
-- Name: fk_co_riesgp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j825t_matriz_riesgo
    ADD CONSTRAINT fk_co_riesgp FOREIGN KEY (co_riesgo) REFERENCES j822t_nivel_riesgo(co_nivel_riesgo);


--
-- Name: fk_co_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j812_persona
    ADD CONSTRAINT fk_co_rol FOREIGN KEY (co_rol) REFERENCES j809t_rol(co_rol);


--
-- Name: fk_co_rol_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j810t_rol_producto
    ADD CONSTRAINT fk_co_rol_producto FOREIGN KEY (co_producto) REFERENCES j808t_producto(co_producto);


--
-- Name: fk_co_tipo_evidencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_tipo_evidencia FOREIGN KEY (co_tipo_evidencia) REFERENCES j002t_tipo_evidencia(co_tipo_evidencia);


--
-- Name: fk_co_tipo_recurso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_tipo_recurso FOREIGN KEY (co_tipo_recurso) REFERENCES j805t_tipo_recurso(co_tipo_recurso);


--
-- Name: fk_co_transaccion01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_transaccion01 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j001t_alcance_forense
    ADD CONSTRAINT fk_co_transaccion03 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion04; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_tipo_evidencia
    ADD CONSTRAINT fk_co_transaccion04 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j003t_estado_evidencia
    ADD CONSTRAINT fk_co_transaccion05 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion06; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j004t_estado_forense
    ADD CONSTRAINT fk_co_transaccion06 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion07; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j005t_estado_acta
    ADD CONSTRAINT fk_co_transaccion07 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion08; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j802t_clasificacion
    ADD CONSTRAINT fk_co_transaccion08 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion09; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j803t_estado_informe
    ADD CONSTRAINT fk_co_transaccion09 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_transaccion1 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_transaccion1 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j804t_gerencia
    ADD CONSTRAINT fk_co_transaccion10 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j805t_tipo_recurso
    ADD CONSTRAINT fk_co_transaccion11 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j807t_localidad
    ADD CONSTRAINT fk_co_transaccion14 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j808t_producto
    ADD CONSTRAINT fk_co_transaccion15 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j817t_proceso_sti
    ADD CONSTRAINT fk_co_transaccion17 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_transaccion2 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_transaccion3 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_transaccion4 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_transaccion5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_transaccion5 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- Name: fk_co_udared_at; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_udared_at FOREIGN KEY (co_updated_at) REFERENCES j812_persona(co_persona);


--
-- Name: fk_co_valor_riesgo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j827t_tipo_riesgo
    ADD CONSTRAINT fk_co_valor_riesgo FOREIGN KEY (co_valor_riesgo) REFERENCES j822t_nivel_riesgo(co_nivel_riesgo);


--
-- Name: fk_estado_forense; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_estado_forense FOREIGN KEY (co_estado_forense) REFERENCES j004t_estado_forense(co_estado_forense);


--
-- Name: fk_informe_forense_principio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c805t_rel_transaccion_principio
    ADD CONSTRAINT fk_informe_forense_principio FOREIGN KEY (co_transaccion) REFERENCES c002t_informe_forense(co_informe_forense);


--
-- Name: fks_co_region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j812_persona
    ADD CONSTRAINT fks_co_region FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- Name: fks_co_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j811t_usuario
    ADD CONSTRAINT fks_co_rol FOREIGN KEY (co_rol) REFERENCES j809t_rol(co_rol);


--
-- Name: pk_co_forense3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT pk_co_forense3 FOREIGN KEY (co_forense) REFERENCES c001t_forense(co_forense);


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

