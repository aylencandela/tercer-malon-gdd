USE GD2C2023
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tiempo
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_tiempo
(
  id_tiempo    NUMERIC(18,0) IDENTITY(1,1)
  ,anio         NUMERIC(18,0) NOT NULL
  ,cuatrimestre NUMERIC(18,0) NOT NULL
  ,mes          NUMERIC(18,0) NOT NULL
  ,CONSTRAINT PK_BI_tiempo PRIMARY KEY (id_tiempo)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_ubicacion_localidad
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_ubicacion_localidad
(
  id_localidad     NUMERIC(18,0) NOT NULL
  ,nombre_localidad NVARCHAR(100) NOT NULL
  ,nombre_provincia NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_BI_ubicacion_localidad PRIMARY KEY (id_localidad)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_sucursal
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_sucursal
(
  id_sucursal                         NUMERIC(18,0) NOT NULL
  ,nombre                              NVARCHAR(100) NOT NULL
  ,direccion                           NVARCHAR(100) NOT NULL
  ,telefono                            NVARCHAR(100) NOT NULL
  ,id_localidad NUMERIC(18,0) NOT NULL
  ,CONSTRAINT PK_BI_sucursal PRIMARY KEY (id_sucursal)
  ,CONSTRAINT FK_BI_sucursal_BI_ubicacion_localidad FOREIGN KEY (id_localidad) REFERENCES TERCER_MALON.BI_ubicacion_localidad (id_localidad)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_rango_etario
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_rango_etario
(
  id_rango_etario NUMERIC(18,0) IDENTITY(1,1)
  ,tipo            NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_BI_rango_etario PRIMARY KEY (id_rango_etario)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tipo_inmueble
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_tipo_inmueble
(
  id_tipo_inmueble NUMERIC(18,0) NOT NULL
  ,tipo             NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_BI_tipo_inmueble PRIMARY KEY (id_tipo_inmueble)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_ambiente
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_ambiente
(
  id_ambiente NUMERIC(18,0) NOT NULL
  ,tipo        NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_BI_ambiente PRIMARY KEY (id_ambiente)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_rango_m2
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_rango_m2
(
  id_rango_m2        NUMERIC(18,0) IDENTITY(1,1)
  ,tipo_superficie NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_BI_rango_m2 PRIMARY KEY (id_rango_m2)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tipo_operacion
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_tipo_operacion
(
  id_operacion NUMERIC(18,0) NOT NULL
  ,tipo         NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_BI_tipo_operacion PRIMARY KEY (id_operacion)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tipo_moneda
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_tipo_moneda
(
  id_moneda NUMERIC(18,0) NOT NULL
  ,nombre    NVARCHAR(100) NOT NULL
  ,simbolo   NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_BI_tipo_moneda PRIMARY KEY (id_moneda)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_ubicacion_barrio
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_ubicacion_barrio
(
  id_barrio                           NUMERIC(18,0) NOT NULL
  ,nombre                              NVARCHAR(100) NOT NULL
  ,id_localidad NUMERIC(18,0) NOT NULL
  ,CONSTRAINT PK_BI_ubicacion_barrio PRIMARY KEY (id_barrio)
  ,CONSTRAINT FK_BI_ubicacion_barrio_BI_ubicacion_localidad1 FOREIGN KEY (id_localidad) REFERENCES TERCER_MALON.BI_ubicacion_localidad (id_localidad)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_estado_alquiler
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_estado_alquiler
(
  id_estado_alquiler NUMERIC(18,0) NOT NULL
  ,tipo               NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_BI_estado_alquiler PRIMARY KEY (id_estado_alquiler)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_anuncio
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_anuncio
(
  duracion_publicacion NUMERIC(18,0) NOT NULL -- fecha_publicacion - fecha_fin
  ,id_anuncio           NUMERIC(19,0) NOT NULL
  ,id_operacion         NUMERIC(18,0) NOT NULL
  ,id_barrio            NUMERIC(18,0) NOT NULL
  ,id_ambiente          NUMERIC(18,0) NOT NULL
  ,id_tiempo            NUMERIC(18,0) NOT NULL
  -- segun fecha_publicacion
  ,id_tipo_inmueble     NUMERIC(18,0) NOT NULL
  ,id_rango_m2             NUMERIC(18,0) NOT NULL
  ,precio_publicado     NUMERIC(18,2) NOT NULL
  ,id_moneda            NUMERIC(18,0) NOT NULL
  ,CONSTRAINT FK_BI_anuncio_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_anuncio_BI_ubicacion_barrio1 FOREIGN KEY (id_barrio) REFERENCES TERCER_MALON.BI_ubicacion_barrio (id_barrio)
  ,CONSTRAINT FK_BI_anuncio_BI_ambiente1 FOREIGN KEY (id_ambiente) REFERENCES TERCER_MALON.BI_ambiente (id_ambiente)
  ,CONSTRAINT FK_BI_anuncio_BI_tipo_inmueble1 FOREIGN KEY (id_tipo_inmueble) REFERENCES TERCER_MALON.BI_tipo_inmueble (id_tipo_inmueble)
  ,CONSTRAINT FK_BI_anuncio_BI_rango_m21 FOREIGN KEY (id_rango_m2) REFERENCES TERCER_MALON.BI_rango_m2 (id_rango_m2)
  ,CONSTRAINT FK_BI_anuncio_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda)
  ,CONSTRAINT PK_BI_fact_anuncio PRIMARY KEY (id_anuncio,id_operacion,id_barrio,id_ambiente,id_tiempo,id_tipo_inmueble,id_rango_m2,id_moneda)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_alquiler
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_alquiler
(
  id_alquiler          NUMERIC(18,0) NOT NULL
  ,id_barrio           NUMERIC(18,0) NOT NULL
  ,id_tiempo_alta      NUMERIC(18,0) NOT NULL
  -- segun fecha_inicio = alta alquiler
  ,id_rango_etario_inq NUMERIC(18,0) NOT NULL
  ,id_tiempo_pago      NUMERIC(18,0) NOT NULL
  ,id_tiempo_fin_periodo      NUMERIC(18,0) NOT NULL
  ,es_pago_atrasado	   BIT			 NOT NULL
  ,id_estado_alquiler  NUMERIC(18,0) NOT NULL
  ,incremento          NUMERIC(18,0) NOT NULL
  ,id_operacion        NUMERIC(18,0) NOT NULL
  ,id_sucursal         NUMERIC(18,0) NOT NULL
  ,id_moneda           NUMERIC(18,0) NOT NULL
  ,id_rango_etario_empl NUMERIC(18,0) NOT NULL
  ,comision            NUMERIC(18,2) NOT NULL
  ,CONSTRAINT FK_BI_alquiler_BI_ubicacion_barrio1 FOREIGN KEY (id_barrio) REFERENCES TERCER_MALON.BI_ubicacion_barrio (id_barrio)
  ,CONSTRAINT FK_BI_alquiler_BI_tiempo1 FOREIGN KEY (id_tiempo_alta) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_alquiler_BI_rango_etario1 FOREIGN KEY (id_rango_etario_inq) REFERENCES TERCER_MALON.BI_rango_etario (id_rango_etario)
  ,CONSTRAINT FK_BI_alquiler_BI_tiempo2 FOREIGN KEY (id_tiempo_pago) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_alquiler_BI_tiempo3 FOREIGN KEY (id_tiempo_fin_periodo) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_alquiler_BI_estado_alquiler1 FOREIGN KEY (id_estado_alquiler) REFERENCES TERCER_MALON.BI_estado_alquiler (id_estado_alquiler)
  ,CONSTRAINT FK_BI_alquiler_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_alquiler_BI_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES TERCER_MALON.BI_sucursal (id_sucursal)
  ,CONSTRAINT FK_BI_alquiler_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda)
  ,CONSTRAINT FK_BI_alquiler_BI_rango_etario2 FOREIGN KEY (id_rango_etario_empl) REFERENCES TERCER_MALON.BI_rango_etario (id_rango_etario)
  ,CONSTRAINT PK_BI_fact_alquiler PRIMARY KEY (id_alquiler, id_barrio, id_tiempo_alta, id_rango_etario_inq, id_tiempo_pago, id_tiempo_fin_periodo, id_estado_alquiler, id_operacion, id_sucursal, id_moneda, id_rango_etario_empl)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_venta
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_venta
(
  id_venta         NUMERIC(18,0) NOT NULL
  ,id_tipo_inmueble NUMERIC(18,0) NOT NULL
  ,id_localidad     NUMERIC(18,0) NOT NULL
  ,id_tiempo_venta        NUMERIC(18,0) NOT NULL
  -- segun fecha_venta
  ,id_rango_m2         NUMERIC(18,0) NOT NULL
  ,precio_por_m2    NUMERIC(18,2) NOT NULL
  -- precio/m2
  ,id_operacion     NUMERIC(18,0) NOT NULL
  ,id_sucursal      NUMERIC(18,0) NOT NULL
  ,id_moneda        NUMERIC(18,0) NOT NULL
  ,id_rango_etario_empl NUMERIC(18,0) NOT NULL
  ,precio_venta     NUMERIC(18,2) NOT NULL
  ,comision         NUMERIC(18,2) NOT NULL
  ,CONSTRAINT FK_BI_venta_BI_tipo_inmueble1 FOREIGN KEY (id_tipo_inmueble) REFERENCES TERCER_MALON.BI_tipo_inmueble (id_tipo_inmueble)
  ,CONSTRAINT FK_BI_venta_BI_ubicacion_localidad1 FOREIGN KEY (id_localidad) REFERENCES TERCER_MALON.BI_ubicacion_localidad (id_localidad)
  ,CONSTRAINT FK_BI_venta_BI_tiempo1 FOREIGN KEY (id_tiempo_venta) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_venta_BI_rango_m21 FOREIGN KEY (id_rango_m2) REFERENCES TERCER_MALON.BI_rango_m2 (id_rango_m2)
  ,CONSTRAINT FK_BI_venta_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_venta_BI_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES TERCER_MALON.BI_sucursal (id_sucursal)
  ,CONSTRAINT FK_BI_venta_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda)
  ,CONSTRAINT FK_BI_venta_BI_rango_etario2 FOREIGN KEY (id_rango_etario_empl) REFERENCES TERCER_MALON.BI_rango_etario (id_rango_etario)
  ,CONSTRAINT PK_BI_fact_venta PRIMARY KEY (id_venta, id_tipo_inmueble, id_localidad, id_tiempo_venta, id_rango_m2, id_operacion, id_sucursal, id_moneda, id_rango_etario_empl)
);
--entendemos por ventas concretas todas aquellas ventas que estan en la tabla TERCER_MALON.venta
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_operacion
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_operacion
(
  id_sucursal             NUMERIC(18,0) NOT NULL
  ,cod_operacion          NUMERIC(18,0) NOT NULL
  ,id_rango_etario_agente NUMERIC(18,0) NOT NULL
  ,id_tiempo_concretado   NUMERIC(18,0) NOT NULL
  -- segun fecha_venta o fecha_inicio alquiler = concretados
  ,id_operacion           NUMERIC(18,0) NOT NULL
  ,id_moneda              NUMERIC(18,0) NOT NULL
  ,comision               NUMERIC(18,2) NOT NULL
  ,monto_cierre           NUMERIC(18,2) NOT NULL
  --expensa inmueble
  ,CONSTRAINT FK_BI_operacion_BI_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES TERCER_MALON.BI_sucursal (id_sucursal)
  ,CONSTRAINT FK_BI_operacion_BI_rango_etario1 FOREIGN KEY (id_rango_etario_agente) REFERENCES TERCER_MALON.BI_rango_etario (id_rango_etario)
  ,CONSTRAINT FK_BI_operacion_BI_tiempo1 FOREIGN KEY (id_tiempo_concretado) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_operacion_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_operacion_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda)
  ,CONSTRAINT PK_BI_fact_operacion PRIMARY KEY (id_sucursal, cod_operacion, id_rango_etario_agente, id_tiempo_concretado, id_operacion, id_moneda)
);
GO

-- -----------------------------------------------------
-- -----------------------------------------------------
--					FUNCIONES AUXILIARES
-- -----------------------------------------------------
-- -----------------------------------------------------
CREATE FUNCTION TERCER_MALON.FN_id_rango_segun_m2 (@superficie NUMERIC(18,2))
RETURNS NUMERIC(18,0)
AS
BEGIN
	RETURN
		(SELECT id_rango_m2 FROM TERCER_MALON.BI_rango_m2 
		WHERE tipo_superficie =
				CASE 
					WHEN @superficie<35 THEN 'MENOR_35'
					WHEN @superficie>100 THEN 'MAYOR_100'
					WHEN @superficie BETWEEN 35 AND 55 THEN 'ENTRE_35_55'
					WHEN @superficie BETWEEN 55 AND 75 THEN 'ENTRE_55_75'
					WHEN @superficie BETWEEN 75 AND 100 THEN 'ENTRE_75_100'
				END)
END
GO

CREATE FUNCTION TERCER_MALON.FN_id_tiempo_segun_fecha (@fecha datetime)
RETURNS NUMERIC(18,0)
AS
BEGIN
	RETURN (SELECT id_tiempo FROM TERCER_MALON.BI_tiempo 
				WHERE anio=YEAR(@fecha) AND mes=MONTH(@fecha) 
			)
END
GO

CREATE FUNCTION TERCER_MALON.FN_id_etario_segun_nacimiento (@nacimiento datetime)
RETURNS NUMERIC(18,0)
AS
BEGIN
	RETURN (SELECT id_rango_etario FROM TERCER_MALON.BI_rango_etario 
				WHERE tipo = CASE 
							WHEN @nacimiento<25 THEN 'MENOR_25'
							WHEN @nacimiento>50 THEN 'MAYOR_50'
							WHEN @nacimiento BETWEEN 25 AND 35 THEN 'ENTRE_25_35'
							WHEN @nacimiento BETWEEN 35 AND 50 THEN 'ENTRE_35_50'
							END
			)
END
GO
-- -----------------------------------------------------
-- -----------------------------------------------------
--					INSERTS
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tiempo
INSERT INTO TERCER_MALON.BI_tiempo
  --que mierda le pongo aca
  (anio
  ,cuatrimestre
  ,mes)
  SELECT
    year(fecha_publicacion) AS anio
    ,datepart(quarter,fecha_publicacion) AS cuatrimestre
    ,month(fecha_publicacion) AS mes
  FROM
    TERCER_MALON.anuncio
  --inicio publicacion
UNION
  SELECT
    year(fecha_fin)
    ,datepart(quarter,fecha_fin)
    ,month(fecha_fin)
  FROM
    TERCER_MALON.anuncio
--fin publicacion
UNION
  SELECT
    year(fecha_inicio)
    ,datepart(quarter,fecha_inicio)
    ,month(fecha_inicio)
  FROM
    TERCER_MALON.alquiler
--alta alquiler
UNION
  SELECT
    year(fecha)
    ,datepart(quarter,fecha)
    ,month(fecha)
  FROM
    TERCER_MALON.venta
--venta concretada
UNION
  SELECT
    year(fecha)
    ,datepart(quarter,fecha)
    ,month(fecha)
  FROM
    TERCER_MALON.pago_alquiler
--pago
UNION
  SELECT
    year(fecha_fin_periodo)
    ,datepart(quarter,fecha_fin_periodo)
    ,month(fecha_fin_periodo)
  FROM
    TERCER_MALON.pago_alquiler
--fin periodo
ORDER BY 1,2,3
GO

-- Table TERCER_MALON.BI_ubicacion_localidad
INSERT INTO TERCER_MALON.BI_ubicacion_localidad
  (id_localidad
  ,nombre_localidad
  ,nombre_provincia)
SELECT
  id_localidad
		  ,localidad.nombre
		  ,provincia.nombre
FROM
  TERCER_MALON.localidad
  JOIN TERCER_MALON.provincia ON localidad.id_provincia = provincia.id_provincia
GO


-- Table TERCER_MALON.BI_sucursal
INSERT INTO TERCER_MALON.BI_sucursal
  (id_sucursal
  ,nombre
  ,direccion
  ,telefono
  ,id_localidad)
SELECT
  cod_sucursal
			,nombre
			,direccion
			,telefono
			,id_localidad
FROM
  TERCER_MALON.sucursal
GO

-- Table TERCER_MALON.BI_rango_etario
INSERT INTO TERCER_MALON.BI_rango_etario
  (tipo)
VALUES
  ('MENOR_25') ,('ENTRE_25_35') ,('ENTRE_35_50') , ('MAYOR_50')
GO

-- Table TERCER_MALON.BI_tipo_inmueble
INSERT INTO TERCER_MALON.BI_tipo_inmueble
  (id_tipo_inmueble
  ,tipo)
SELECT
  id_tipo_inmueble
		  ,tipo
FROM
  TERCER_MALON.tipo_inmueble
GO

-- Table TERCER_MALON.BI_ambiente
INSERT INTO TERCER_MALON.BI_ambiente
  (id_ambiente
  ,tipo)
SELECT
  id_ambiente
		  ,tipo
FROM
  TERCER_MALON.ambiente

GO

-- Table TERCER_MALON.BI_rango_m2
INSERT INTO TERCER_MALON.BI_rango_m2
  (tipo_superficie)
VALUES
  ('MENOR_35')  ,('ENTRE_35_55') ,('ENTRE_55_75') ,('ENTRE_75_100') ,('MAYOR_100')
GO

-- Table TERCER_MALON.BI_tipo_operacion
INSERT INTO TERCER_MALON.BI_tipo_operacion
  (id_operacion
  ,tipo)
SELECT
  id_operacion
		  ,tipo
FROM
  TERCER_MALON.operacion   
GO

-- Table TERCER_MALON.BI_tipo_moneda
INSERT INTO TERCER_MALON.BI_tipo_moneda
		(id_moneda
		,nombre
		,simbolo)
SELECT
		id_moneda
		,nombre
		,simbolo
FROM
  TERCER_MALON.moneda
GO

-- Table TERCER_MALON.BI_ubicacion_barrio
INSERT INTO TERCER_MALON.BI_ubicacion_barrio
  (id_barrio
  ,nombre
  ,id_localidad)
SELECT
  id_barrio
		  ,nombre
		  ,id_localidad
FROM
  TERCER_MALON.barrio
GO


-- Table TERCER_MALON.BI_estado_alquiler
INSERT INTO TERCER_MALON.BI_estado_alquiler
  (id_estado_alquiler
  ,tipo)
SELECT
  id_estado_alquiler
		  ,tipo
FROM
  TERCER_MALON.estado_alquiler
GO

-- Table TERCER_MALON.BI_fact_anuncio
INSERT INTO TERCER_MALON.BI_fact_anuncio
           (duracion_publicacion
           ,id_anuncio
           ,id_operacion
           ,id_barrio
           ,id_ambiente
           ,id_tiempo
           ,id_tipo_inmueble
           ,id_rango_m2
           ,precio_publicado
           ,id_moneda)
     SELECT 
			DATEDIFF(DAY,A.fecha_publicacion, A.fecha_fin) AS duracion_dias_publicacion,
			A.cod_anuncio, --22397 ANUNCIOS TOTALES
			A.id_operacion,
			I.id_barrio,
			I.id_ambiente,
			(SELECT TERCER_MALON.FN_id_tiempo_segun_fecha(A.fecha_publicacion)) AS fecha_alta,
			I.id_tipo_inmueble,
			(SELECT TERCER_MALON.FN_id_rango_segun_m2(I.superficie_total)) AS id_rango_m2,
			A.precio_publicado,
			A.id_moneda
	 FROM TERCER_MALON.anuncio A
	 JOIN TERCER_MALON.inmueble I ON A.cod_inmueble=I.cod_inmueble
	 ORDER BY A.cod_anuncio, A.id_operacion
GO


-- Table TERCER_MALON.BI_fact_alquiler
INSERT INTO TERCER_MALON.BI_fact_alquiler
           (id_alquiler
           ,id_barrio
           ,id_tiempo_alta
           ,id_rango_etario_inq
		   ,id_tiempo_pago
		   ,id_tiempo_fin_periodo
		   ,es_pago_atrasado
           ,id_estado_alquiler
           ,incremento
           ,id_operacion
           ,id_sucursal
		   ,comision
           ,id_moneda
		   ,id_rango_etario_empl)
    SELECT
		A.cod_alquiler,
		I.id_barrio,
		(SELECT TERCER_MALON.FN_id_tiempo_segun_fecha(A.fecha_inicio)) AS fecha_alta,
		(SELECT TERCER_MALON.FN_id_etario_segun_nacimiento(INQ.fecha_nacimiento)) AS id_rango_etario_inq,
		(SELECT TERCER_MALON.FN_id_tiempo_segun_fecha(PA.fecha)) AS fecha_pago,
		(SELECT TERCER_MALON.FN_id_tiempo_segun_fecha(PA.fecha_fin_periodo)) AS fecha_fin_periodo,
		(CASE WHEN PA.fecha>PA.fecha_fin_periodo THEN 1 ELSE 0 END) AS es_pago_atrasado,
		A.id_estado_alquiler,
		ISNULL((PA.importe - (SELECT importe as importe_mes_anterior FROM TERCER_MALON.pago_alquiler PA2
								WHERE PA2.cod_alquiler=A.cod_alquiler AND DATEDIFF(MONTH,PA2.fecha, PA.fecha)=1))
			/ (SELECT importe as importe_mes_anterior FROM TERCER_MALON.pago_alquiler PA2
			WHERE PA2.cod_alquiler=A.cod_alquiler AND DATEDIFF(MONTH,PA2.fecha, PA.fecha)=1),0) *100 AS incremento_respecto_mes_anterior,
		AN.id_operacion,
		AG.cod_sucursal,
		A.comision,
		AN.id_moneda,
		(SELECT TERCER_MALON.FN_id_etario_segun_nacimiento(AG.fecha_nacimiento)) AS id_rango_etario_empl
	FROM TERCER_MALON.alquiler A
	JOIN TERCER_MALON.inquilino INQ ON A.id_inquilino=INQ.id_inquilino
	JOIN TERCER_MALON.pago_alquiler PA ON A.cod_alquiler=PA.cod_alquiler
	JOIN TERCER_MALON.anuncio AN ON A.cod_anuncio=AN.cod_anuncio
	JOIN TERCER_MALON.agente AG ON AN.id_agente=AG.id_agente
	JOIN TERCER_MALON.inmueble I ON AN.cod_inmueble=I.cod_inmueble
GO
-- ALQUILERES=12842, PAGOS=229004


-- Table TERCER_MALON.BI_fact_venta
INSERT INTO TERCER_MALON.BI_fact_venta
           (id_venta
           ,id_tipo_inmueble
           ,id_localidad
           ,id_tiempo_venta
           ,id_rango_m2
           ,precio_por_m2
           ,id_operacion
           ,id_sucursal
           ,id_moneda
           ,id_rango_etario_empl
           ,precio_venta
		   ,comision)
	SELECT --4058
		V.cod_venta
		,I.id_tipo_inmueble
		,S.id_localidad
		,(SELECT TERCER_MALON.FN_id_tiempo_segun_fecha(V.fecha)) AS fecha_venta
		,(SELECT TERCER_MALON.FN_id_rango_segun_m2(I.superficie_total)) AS id_rango_m2
		,(V.precio/I.superficie_total) AS precio_por_m2
		,AN.id_operacion
		,S.cod_sucursal
		,V.id_moneda
		,(SELECT TERCER_MALON.FN_id_etario_segun_nacimiento(AG.fecha_nacimiento)) AS id_rango_etario_empl
		,V.precio
		,V.comision
	FROM TERCER_MALON.venta V
	JOIN TERCER_MALON.anuncio AN ON V.cod_anuncio=AN.cod_anuncio
	JOIN TERCER_MALON.agente AG ON AN.id_agente=AG.id_agente
	JOIN TERCER_MALON.inmueble I ON AN.cod_inmueble=I.cod_inmueble
	JOIN TERCER_MALON.sucursal S ON AG.cod_sucursal=S.cod_sucursal
GO


-- Table TERCER_MALON.BI_fact_operacion 16900
INSERT INTO TERCER_MALON.BI_fact_operacion
           (id_sucursal
		   ,cod_operacion
           ,id_rango_etario_agente
           ,id_tiempo_concretado
           ,id_operacion
           ,id_moneda
           ,comision
		   ,monto_cierre)
		SELECT DISTINCT
			 id_sucursal
			 ,id_alquiler
			 ,id_rango_etario_empl
			 ,id_tiempo_alta
			 ,id_operacion
			 ,id_moneda
			 ,comision
			 ,(SELECT importe FROM TERCER_MALON.pago_alquiler WHERE cod_alquiler=FA.id_alquiler AND nro_periodo=0) AS cierre
				-- tomamos importe porque para algunos alquileres no hay detalle_pago iniciales cargados
		 FROM TERCER_MALON.BI_fact_alquiler FA
	 UNION
		 SELECT DISTINCT
			 id_sucursal
			 ,id_venta
			 ,id_rango_etario_empl
			 ,id_tiempo_venta
			 ,id_operacion
			 ,id_moneda
			 ,comision
			 ,precio_venta
		 FROM TERCER_MALON.BI_fact_venta
	ORDER BY 2, id_operacion
GO

-- -----------------------------------------------------
-- -----------------------------------------------------
--					VISTAS
-- -----------------------------------------------------
-- -----------------------------------------------------

--1
CREATE VIEW TERCER_MALON.V_Anuncio_Promedio_Publicacion
AS
  SELECT
    anio
	,cuatrimestre
	,B.nombre AS barrio
	,O.tipo AS tipo_operacion
    ,A.tipo AS tipo_ambiente
    ,ROUND(AVG(duracion_publicacion),2) AS prom_duracion_dias
  FROM
    TERCER_MALON.BI_fact_anuncio FA
    JOIN TERCER_MALON.BI_tiempo T ON FA.id_tiempo=T.id_tiempo
	JOIN TERCER_MALON.BI_ubicacion_barrio B ON FA.id_barrio=B.id_barrio
	JOIN TERCER_MALON.BI_tipo_operacion O ON FA.id_operacion=O.id_operacion
	JOIN TERCER_MALON.BI_ambiente A ON FA.id_ambiente=A.id_ambiente
  GROUP BY anio, cuatrimestre, B.nombre, O.tipo, A.tipo
GO

--2
CREATE VIEW TERCER_MALON.V_Anuncio_Promedio_Precio
AS
  SELECT
    anio
	,cuatrimestre
	,O.tipo AS tipo_operacion
    ,I.tipo AS tipo_inmueble
    ,R.tipo_superficie AS tipo_superficie
    ,ROUND(AVG(precio_publicado),2) AS prom_precio 
    ,M.nombre AS tipo_moneda
  FROM
    TERCER_MALON.BI_fact_anuncio FA
    JOIN TERCER_MALON.BI_tiempo T ON FA.id_tiempo=T.id_tiempo
	JOIN TERCER_MALON.BI_tipo_operacion O ON FA.id_operacion=O.id_operacion
	JOIN TERCER_MALON.BI_tipo_inmueble I ON FA.id_tipo_inmueble=I.id_tipo_inmueble
	JOIN TERCER_MALON.BI_rango_m2 R ON FA.id_rango_m2=R.id_rango_m2
	JOIN TERCER_MALON.BI_tipo_moneda M ON FA.id_moneda=M.id_moneda
  GROUP BY anio, cuatrimestre, O.tipo, I.tipo, R.tipo_superficie, M.nombre
GO

--3
CREATE VIEW TERCER_MALON.V_Alquiler_Barrios_Populares
AS
  SELECT
    TOP 5
    anio
    ,cuatrimestre
    ,B.nombre AS barrio
	,R.tipo AS rango_etario
    ,COUNT(DISTINCT id_alquiler) AS cant_alta_alquiler
  FROM
    TERCER_MALON.BI_fact_alquiler FA
    JOIN TERCER_MALON.BI_tiempo T ON FA.id_tiempo_alta=T.id_tiempo
	JOIN TERCER_MALON.BI_ubicacion_barrio B ON FA.id_barrio=B.id_barrio
	JOIN TERCER_MALON.BI_rango_etario R ON FA.id_rango_etario_inq=R.id_rango_etario
  GROUP BY anio, cuatrimestre, B.nombre, R.tipo
GO

--4
CREATE VIEW TERCER_MALON.V_Alquiler_Incumplimiento_Pagos
AS
  --periodo segun fecha fin
  SELECT
	anio
	,mes
    ,(SUM(CONVERT(INT, es_pago_atrasado))* 100/ COUNT(*)) AS porcentaje_impagos
  FROM
    TERCER_MALON.BI_fact_alquiler
	JOIN TERCER_MALON.BI_tiempo ON id_tiempo_fin_periodo=id_tiempo
  GROUP BY anio, mes
GO

/*
select  YEAR(fecha_fin_periodo), MONTH(fecha_fin_periodo),
(select COUNT(*) from TERCER_MALON.pago_alquiler A2 where A2.fecha>A2.fecha_fin_periodo
			AND YEAR(A2.fecha_fin_periodo)=YEAR(fecha_fin_periodo) AND  MONTH(A2.fecha_fin_periodo)=MONTH(fecha_fin_periodo) )
		/ COUNT(*) * 100
from tercer_malon.pago_alquiler
GROUP BY YEAR(fecha_fin_periodo), MONTH(fecha_fin_periodo)
ORDER BY YEAR(fecha_fin_periodo), MONTH(fecha_fin_periodo)
*/

--5
CREATE VIEW TERCER_MALON.V_Alquiler_Promedio_Incremento_Valor
AS
  SELECT
    anio
    ,mes
	,ROUND(AVG(incremento),2) AS prom_incremento
  FROM
    TERCER_MALON.BI_fact_alquiler
	JOIN TERCER_MALON.BI_tiempo ON id_tiempo_pago=id_tiempo
  WHERE
	id_estado_alquiler=(SELECT id_estado_alquiler FROM TERCER_MALON.BI_estado_alquiler WHERE tipo='Activo')
	AND incremento!=0
  GROUP BY anio, mes
GO

--6
CREATE VIEW TERCER_MALON.V_Venta_Promedio_Precio_Por_M2
AS
  SELECT
    anio
    ,mes
    ,I.tipo AS tipo_inmueble
    ,L.nombre_localidad AS localidad
	,L.nombre_provincia AS provincia
    ,ROUND(AVG(precio_por_m2),2) AS prom_precio_por_m2
  FROM
    TERCER_MALON.BI_fact_venta fv
    JOIN TERCER_MALON.BI_tiempo ON id_tiempo_venta=id_tiempo
	JOIN TERCER_MALON.BI_tipo_inmueble I ON FV.id_tipo_inmueble=I.id_tipo_inmueble
	JOIN TERCER_MALON.BI_ubicacion_localidad L ON FV.id_localidad=L.id_localidad
  GROUP BY anio, mes, I.tipo, L.nombre_localidad, L.nombre_provincia
GO

--7
CREATE VIEW TERCER_MALON.V_Operacion_Promedio_Comision
AS
    SELECT
		  anio
		  ,mes
		  ,O.tipo AS tipo_operacion
		  ,S.nombre AS nombre_sucursal
		  ,ROUND(AVG(comision),2) AS prom_comision
    FROM
      TERCER_MALON.BI_fact_operacion FO
      JOIN TERCER_MALON.BI_tiempo ON id_tiempo_concretado=id_tiempo
	  JOIN TERCER_MALON.BI_tipo_operacion O ON FO.id_operacion=O.id_operacion
	  JOIN TERCER_MALON.BI_sucursal S ON FO.id_sucursal=S.id_sucursal
	GROUP BY anio, mes, O.tipo, S.nombre
GO

--8
CREATE VIEW TERCER_MALON.V_Operacion_Porcentaje_Concretados
AS
  SELECT
    anio
    ,S.nombre AS nombre_sucursal
    ,R.tipo AS rango_etario
    ,CAST((COUNT(*) *100 / (SELECT COUNT(DISTINCT id_anuncio) --total anuncios segun anio
				FROM TERCER_MALON.BI_fact_anuncio FA
				JOIN TERCER_MALON.BI_tiempo T ON FA.id_tiempo=T.id_tiempo
				WHERE T.anio = anio )) AS NUMERIC(18,2)) AS porcentaje_concretados_segun_total_anuncios
  FROM
    TERCER_MALON.BI_fact_operacion FO
    JOIN TERCER_MALON.BI_tiempo ON id_tiempo_concretado=id_tiempo
	JOIN TERCER_MALON.BI_sucursal S ON FO.id_sucursal=S.id_sucursal
	JOIN TERCER_MALON.BI_rango_etario R ON FO.id_rango_etario_agente=R.id_rango_etario
  GROUP BY anio, S.nombre, R.tipo
GO

--9
CREATE VIEW TERCER_MALON.V_Operacion_Monto_Total_Cierre
AS
  SELECT
	cuatrimestre
    ,S.nombre AS nombre_sucursal
    ,O.tipo AS tipo_operacion
    ,M.nombre AS tipo_moneda
    ,SUM(monto_cierre) AS monto_total_cierre
  FROM
    TERCER_MALON.BI_fact_operacion FO
    JOIN TERCER_MALON.BI_tiempo ON id_tiempo_concretado=BI_tiempo.id_tiempo
	JOIN TERCER_MALON.BI_sucursal S ON FO.id_sucursal=S.id_sucursal
	JOIN TERCER_MALON.BI_tipo_operacion O ON FO.id_operacion=O.id_operacion
	JOIN TERCER_MALON.BI_tipo_moneda M ON FO.id_moneda=M.id_moneda
  GROUP BY cuatrimestre, S.id_sucursal, O.tipo, M.nombre
GO
