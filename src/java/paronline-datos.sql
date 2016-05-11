--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2016-05-11 17:46:29

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2058 (class 0 OID 24688)
-- Dependencies: 175
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categoria (id, descripcion) VALUES (1, 'Tecnologia');
INSERT INTO categoria (id, descripcion) VALUES (7, 'Utilitarios');


--
-- TOC entry 2084 (class 0 OID 0)
-- Dependencies: 174
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_id_seq', 7, true);



--
-- TOC entry 2066 (class 0 OID 24733)
-- Dependencies: 183
-- Data for Name: unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad (id, descripcion) VALUES (1, 'unidades');
INSERT INTO unidad (id, descripcion) VALUES (3, 'decenas');


--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 182
-- Name: unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_id_seq', 3, true);



--
-- TOC entry 2056 (class 0 OID 24680)
-- Dependencies: 173
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO producto (id, descripcion, precio_unit, unidad_medida, categoria_id) VALUES (1, 'Kingston USB Flash Drive 2GB', 30000.00, 1, 1);
INSERT INTO producto (id, descripcion, precio_unit, unidad_medida, categoria_id) VALUES (3, 'Esponja', 3000.00, 1, 7);
INSERT INTO producto (id, descripcion, precio_unit, unidad_medida, categoria_id) VALUES (4, 'Disco duro externo 500GB', 150000.00, 1, 1);


--
-- TOC entry 2085 (class 0 OID 0)
-- Dependencies: 172
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('producto_id_seq', 4, true);


--
-- TOC entry 2064 (class 0 OID 24725)
-- Dependencies: 181
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO stock (id, producto_id, cantidad) VALUES (3, 3, 42);
INSERT INTO stock (id, producto_id, cantidad) VALUES (4, 1, 196);
INSERT INTO stock (id, producto_id, cantidad) VALUES (2, 4, 192);


--
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 180
-- Name: stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('stock_id_seq', 6, true);


--
-- TOC entry 2062 (class 0 OID 24709)
-- Dependencies: 179
-- Data for Name: transacciones_cab; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO transacciones_cab (id, fecha, total, direccion, medio_pago, nro_tarjeta, estado, usuario_id) VALUES (16, '2016-05-09', 360000.00, 'asdfadf', 1, '1321354654', 'I', 2);
INSERT INTO transacciones_cab (id, fecha, total, direccion, medio_pago, nro_tarjeta, estado, usuario_id) VALUES (17, '2016-05-10', 300000.00, 'asdf', 1, '465464978', 'I', 2);
INSERT INTO transacciones_cab (id, fecha, total, direccion, medio_pago, nro_tarjeta, estado, usuario_id) VALUES (18, '2016-05-11', 666000.00, 'asdf', 1, '5464679797', 'I', 2);
INSERT INTO transacciones_cab (id, fecha, total, direccion, medio_pago, nro_tarjeta, estado, usuario_id) VALUES (19, '2016-05-11', 60000.00, 'asdf', 0, NULL, 'I', 2);
INSERT INTO transacciones_cab (id, fecha, total, direccion, medio_pago, nro_tarjeta, estado, usuario_id) VALUES (20, '2016-05-11', 300000.00, 'asdf', 0, NULL, 'I', 2);
INSERT INTO transacciones_cab (id, fecha, total, direccion, medio_pago, nro_tarjeta, estado, usuario_id) VALUES (21, '2016-05-11', 300000.00, 'asdf', 0, NULL, 'I', 2);
INSERT INTO transacciones_cab (id, fecha, total, direccion, medio_pago, nro_tarjeta, estado, usuario_id) VALUES (22, '2016-05-11', 366000.00, 'asdf', 1, '654649787', 'I', 2);
INSERT INTO transacciones_cab (id, fecha, total, direccion, medio_pago, nro_tarjeta, estado, usuario_id) VALUES (23, '2016-05-11', 600000.00, 'adsf', 1, '65464897', 'I', 2);


--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 178
-- Name: transacciones_cab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transacciones_cab_id_seq', 23, true);


--
-- TOC entry 2068 (class 0 OID 32963)
-- Dependencies: 185
-- Data for Name: transacciones_det; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (1, 16, 1, 2, 150000.00, 300000.00, 4);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (2, 16, 2, 2, 30000.00, 60000.00, 1);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (3, 17, 1, 2, 150000.00, 300000.00, 4);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (4, 18, 1, 4, 150000.00, 600000.00, 4);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (5, 18, 2, 2, 3000.00, 6000.00, 3);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (6, 18, 3, 2, 30000.00, 60000.00, 1);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (7, 19, 1, 2, 30000.00, 60000.00, 1);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (8, 20, 1, 2, 150000.00, 300000.00, 4);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (9, 21, 1, 2, 150000.00, 300000.00, 4);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (10, 22, 1, 2, 150000.00, 300000.00, 4);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (11, 22, 2, 2, 3000.00, 6000.00, 3);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (12, 22, 3, 2, 30000.00, 60000.00, 1);
INSERT INTO transacciones_det (id, transacciones_cab_id, item, cantidad, precio, subtotal, producto_id) VALUES (13, 23, 1, 4, 150000.00, 600000.00, 4);


--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 184
-- Name: transacciones_det_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transacciones_det_id_seq', 13, true);


--
-- TOC entry 2060 (class 0 OID 24696)
-- Dependencies: 177
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuarios (id, nombre, apellido, login_name, passwd, tipo_usuario, email) VALUES (1, 'admin', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 0, 'example@example.com');
INSERT INTO usuarios (id, nombre, apellido, login_name, passwd, tipo_usuario, email) VALUES (2, 'Gabriel', 'Valdez', 'gvaldez', 'd0a4a9d5eae1444b3285be84e98afcf8', 1, 'example@example.com');
INSERT INTO usuarios (id, nombre, apellido, login_name, passwd, tipo_usuario, email) VALUES (7, 'Elias', 'Maciel', 'emaciel', '4d186321c1a7f0f354b297e8914ab240', 1, 'example@example.com');


--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 176
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_seq', 9, true);


-- Completed on 2016-05-11 17:46:30

--
-- PostgreSQL database dump complete
--

