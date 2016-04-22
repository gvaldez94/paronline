/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Gabriel
 * Created: 17-abr-2016
 */

/* Archivo destinado al codigo SQL responsable de crear la base de datos */

-- PostgreSQL version: 9.4
-- Model Author: Gabriel---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: paronline | type: DATABASE --
-- -- DROP DATABASE IF EXISTS paronline;
-- CREATE DATABASE paronline
-- ;
-- -- ddl-end --
-- 

-- object: public.producto | type: TABLE --
-- DROP TABLE IF EXISTS public.producto CASCADE;
CREATE TABLE public.producto(
	id serial NOT NULL,
	descripcion character varying(20) NOT NULL,
	precio_unit numeric(14,2) NOT NULL,
	unidad_medida integer NOT NULL,
	categoria_id integer NOT NULL,
	CONSTRAINT pkproducto PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.producto OWNER TO postgres;
-- ddl-end --

-- object: public.categoria | type: TABLE --
-- DROP TABLE IF EXISTS public.categoria CASCADE;
CREATE TABLE public.categoria(
	id serial NOT NULL,
	descripcion character varying(20) NOT NULL,
	CONSTRAINT pkcategoria PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.categoria OWNER TO postgres;
-- ddl-end --

-- object: public.usuarios | type: TABLE --
-- DROP TABLE IF EXISTS public.usuarios CASCADE;
CREATE TABLE public.usuarios(
	id serial NOT NULL,
	nombre character varying NOT NULL,
	apellido character varying NOT NULL,
	login_name character varying(15) NOT NULL,
	passwd character varying(50) NOT NULL,
	tipo_usuario integer NOT NULL,
	CONSTRAINT pkusuarios PRIMARY KEY (id),
	CONSTRAINT unique_login_name UNIQUE (login_name)

);
-- ddl-end --
ALTER TABLE public.usuarios OWNER TO postgres;
-- ddl-end --

-- object: public.transacciones_cab | type: TABLE --
-- DROP TABLE IF EXISTS public.transacciones_cab CASCADE;
CREATE TABLE public.transacciones_cab(
	id serial NOT NULL,
	fecha date NOT NULL,
	total numeric(14,2),
	direccion character varying(50) NOT NULL,
	medio_pago integer NOT NULL,
	nro_tarjeta character varying(40) NOT NULL,
	estado character varying NOT NULL,
	usuario_id integer NOT NULL,
	CONSTRAINT pktransaccionescab PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.transacciones_cab OWNER TO postgres;
-- ddl-end --

-- object: public.transacciones_det | type: TABLE --
-- DROP TABLE IF EXISTS public.transacciones_det CASCADE;
CREATE TABLE public.transacciones_det(
	transacciones_cab_id integer NOT NULL,
	item integer NOT NULL,
	cantidad integer NOT NULL,
	precio numeric(14,2) NOT NULL,
	subtotal numeric(14,2) NOT NULL,
	producto_id integer NOT NULL,
	CONSTRAINT pktransaccionesdet PRIMARY KEY (transacciones_cab_id)

);
-- ddl-end --
ALTER TABLE public.transacciones_det OWNER TO postgres;
-- ddl-end --

-- object: fkcategoria | type: CONSTRAINT --
-- ALTER TABLE public.producto DROP CONSTRAINT IF EXISTS fkcategoria CASCADE;
ALTER TABLE public.producto ADD CONSTRAINT fkcategoria FOREIGN KEY (categoria_id)
REFERENCES public.categoria (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fkusuariotransaccionescab | type: CONSTRAINT --
-- ALTER TABLE public.transacciones_cab DROP CONSTRAINT IF EXISTS fkusuariotransaccionescab CASCADE;
ALTER TABLE public.transacciones_cab ADD CONSTRAINT fkusuariotransaccionescab FOREIGN KEY (usuario_id)
REFERENCES public.usuarios (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fktransaccionesdetid | type: CONSTRAINT --
-- ALTER TABLE public.transacciones_det DROP CONSTRAINT IF EXISTS fktransaccionesdetid CASCADE;
ALTER TABLE public.transacciones_det ADD CONSTRAINT fktransaccionesdetid FOREIGN KEY (transacciones_cab_id)
REFERENCES public.transacciones_cab (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fkproductoid | type: CONSTRAINT --
-- ALTER TABLE public.transacciones_det DROP CONSTRAINT IF EXISTS fkproductoid CASCADE;
ALTER TABLE public.transacciones_det ADD CONSTRAINT fkproductoid FOREIGN KEY (producto_id)
REFERENCES public.producto (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


