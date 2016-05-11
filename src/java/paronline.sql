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

-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.1
-- PostgreSQL version: 9.4
-- Project Site: pgmodeler.com.br
-- Model Author: Gabriel---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database
-- ;
-- -- ddl-end --
-- 

-- object: public.producto | type: TABLE --
-- DROP TABLE IF EXISTS public.producto CASCADE;
CREATE TABLE public.producto(
	id serial NOT NULL,
	descripcion character varying(50) NOT NULL,
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
        email character varying(50) NOT NULL,
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
	nro_tarjeta character varying(40),
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
        id serial NOT NULL,
	transacciones_cab_id integer NOT NULL,
	item integer NOT NULL,
	cantidad integer NOT NULL,
	precio numeric(14,2) NOT NULL,
	subtotal numeric(14,2) NOT NULL,
	producto_id integer NOT NULL,
	CONSTRAINT pktransaccionesdet PRIMARY KEY (id, transacciones_cab_id)

);
-- ddl-end --
ALTER TABLE public.transacciones_det OWNER TO postgres;
-- ddl-end --

-- object: public.stock | type: TABLE --
-- DROP TABLE IF EXISTS public.stock CASCADE;
CREATE TABLE public.stock(
	id serial NOT NULL,
	producto_id integer NOT NULL,
	cantidad integer NOT NULL,
	CONSTRAINT pkstockid PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.stock OWNER TO postgres;
-- ddl-end --

-- object: public.unidad | type: TABLE --
-- DROP TABLE IF EXISTS public.unidad CASCADE;
CREATE TABLE public.unidad(
	id serial NOT NULL,
	descripcion character varying(50) NOT NULL,
	CONSTRAINT pkunidadid PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.unidad OWNER TO postgres;
-- ddl-end --

-- object: fkcategoria | type: CONSTRAINT --
-- ALTER TABLE public.producto DROP CONSTRAINT IF EXISTS fkcategoria CASCADE;
ALTER TABLE public.producto ADD CONSTRAINT fkcategoria FOREIGN KEY (categoria_id)
REFERENCES public.categoria (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fkunidadid | type: CONSTRAINT --
-- ALTER TABLE public.producto DROP CONSTRAINT IF EXISTS fkunidadid CASCADE;
ALTER TABLE public.producto ADD CONSTRAINT fkunidadid FOREIGN KEY (unidad_medida)
REFERENCES public.unidad (id) MATCH FULL
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

-- object: fkproductoid | type: CONSTRAINT --
-- ALTER TABLE public.stock DROP CONSTRAINT IF EXISTS fkproductoid CASCADE;
ALTER TABLE public.stock ADD CONSTRAINT fkproductoid FOREIGN KEY (producto_id)
REFERENCES public.producto (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
