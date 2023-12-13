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
-- Table TERCER_MALON.BI_anuncio
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_anuncio
(
  id_anuncio NUMERIC(19,0) NOT NULL
  ,CONSTRAINT PK_BI_anuncio PRIMARY KEY (id_anuncio)
);
GO
-- -----------------------------------------------------
-- Table TERCER_MALON.BI_cod_operacion
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_cod_operacion
(
  id_cod_operacion NUMERIC(18,0) NOT NULL
  ,CONSTRAINT PK_BI_cod_operacion PRIMARY KEY (id_cod_operacion)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_anuncio
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_anuncio
(
  duracion_publicacion	NUMERIC(18,0) NOT NULL -- fecha_publicacion - fecha_fin
  ,id_operacion         NUMERIC(18,0) NOT NULL
  ,id_barrio            NUMERIC(18,0) NOT NULL
  ,id_ambiente          NUMERIC(18,0) NOT NULL
  ,id_tiempo            NUMERIC(18,0) NOT NULL -- segun fecha_publicacion
  ,id_tipo_inmueble     NUMERIC(18,0) NOT NULL
  ,id_rango_m2          NUMERIC(18,0) NOT NULL
  ,precio_publicado     NUMERIC(18,2) NOT NULL
  ,id_moneda            NUMERIC(18,0) NOT NULL
  ,cant_publicados		NUMERIC(18,0) NOT NULL
  ,CONSTRAINT FK_BI_anuncio_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_anuncio_BI_ubicacion_barrio1 FOREIGN KEY (id_barrio) REFERENCES TERCER_MALON.BI_ubicacion_barrio (id_barrio)
  ,CONSTRAINT FK_BI_anuncio_BI_ambiente1 FOREIGN KEY (id_ambiente) REFERENCES TERCER_MALON.BI_ambiente (id_ambiente)
  ,CONSTRAINT FK_BI_anuncio_BI_tipo_inmueble1 FOREIGN KEY (id_tipo_inmueble) REFERENCES TERCER_MALON.BI_tipo_inmueble (id_tipo_inmueble)
  ,CONSTRAINT FK_BI_anuncio_BI_rango_m21 FOREIGN KEY (id_rango_m2) REFERENCES TERCER_MALON.BI_rango_m2 (id_rango_m2)
  ,CONSTRAINT FK_BI_anuncio_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda)
  ,CONSTRAINT PK_BI_fact_anuncio PRIMARY KEY (id_operacion,id_barrio,id_ambiente,id_tiempo,id_tipo_inmueble,id_rango_m2,id_moneda)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_alquiler
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_alquiler
(
  id_barrio				NUMERIC(18,0) NOT NULL
  ,id_tiempo_alta		NUMERIC(18,0) NOT NULL -- segun fecha_inicio = alta alquiler
  ,id_rango_etario_inq	NUMERIC(18,0) NOT NULL
  ,id_operacion			NUMERIC(18,0) NOT NULL
  ,id_sucursal			NUMERIC(18,0) NOT NULL
  ,id_moneda			NUMERIC(18,0) NOT NULL
  ,id_rango_etario_empl NUMERIC(18,0) NOT NULL
  ,comision				NUMERIC(18,2) NOT NULL
  ,cant_alta			NUMERIC(18,0) NOT NULL
  ,monto_total			NUMERIC(18,2) NOT NULL
  ,CONSTRAINT FK_BI_alquiler_BI_ubicacion_barrio1 FOREIGN KEY (id_barrio) REFERENCES TERCER_MALON.BI_ubicacion_barrio (id_barrio)
  ,CONSTRAINT FK_BI_alquiler_BI_tiempo1 FOREIGN KEY (id_tiempo_alta) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_alquiler_BI_rango_etario1 FOREIGN KEY (id_rango_etario_inq) REFERENCES TERCER_MALON.BI_rango_etario (id_rango_etario)
  ,CONSTRAINT FK_BI_alquiler_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_alquiler_BI_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES TERCER_MALON.BI_sucursal (id_sucursal)
  ,CONSTRAINT FK_BI_alquiler_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda)
  ,CONSTRAINT FK_BI_alquiler_BI_rango_etario2 FOREIGN KEY (id_rango_etario_empl) REFERENCES TERCER_MALON.BI_rango_etario (id_rango_etario)
  ,CONSTRAINT PK_BI_fact_alquiler PRIMARY KEY (id_barrio, id_tiempo_alta, id_rango_etario_inq, id_operacion, id_sucursal, id_moneda, id_rango_etario_empl)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_pago_alquiler
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_pago_alquiler
(
  id_tiempo_periodo			NUMERIC(18,0) NOT NULL
  ,cant_pagos				NUMERIC(18,0) NOT NULL
  ,cant_pagos_atrasados		NUMERIC(18,0) NOT NULL
  ,monto_mes				NUMERIC(18,2) NOT NULL
  ,monto_mes_anterior		NUMERIC(18,2) NOT NULL
  ,id_estado_alquiler		NUMERIC(18,0) NOT NULL
  ,CONSTRAINT FK_BI_fact_pago_alquiler_BI_tiempo1 FOREIGN KEY (id_tiempo_periodo) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_fact_pago_alquiler_BI_estado_alquiler1 FOREIGN KEY (id_estado_alquiler) REFERENCES TERCER_MALON.BI_estado_alquiler (id_estado_alquiler)
  ,CONSTRAINT PK_BI_fact_pago_alquiler PRIMARY KEY (id_tiempo_periodo, id_estado_alquiler)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_venta
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_venta
(
  id_tiempo_venta       NUMERIC(18,0) NOT NULL
  ,id_tipo_inmueble		NUMERIC(18,0) NOT NULL
  ,id_localidad_inm		NUMERIC(18,0) NOT NULL -- segun fecha_venta
  ,id_rango_m2			NUMERIC(18,0) NOT NULL
  ,precio_por_m2		NUMERIC(18,2) NOT NULL -- precio/m2
  ,id_operacion			NUMERIC(18,0) NOT NULL
  ,id_sucursal			NUMERIC(18,0) NOT NULL
  ,id_moneda			NUMERIC(18,0) NOT NULL
  ,id_rango_etario_empl NUMERIC(18,0) NOT NULL
  ,cant_alta		    NUMERIC(18,0) NOT NULL
  ,monto_total			NUMERIC(18,2) NOT NULL
  ,comision				NUMERIC(18,2) NOT NULL
  ,CONSTRAINT FK_BI_venta_BI_tipo_inmueble1 FOREIGN KEY (id_tipo_inmueble) REFERENCES TERCER_MALON.BI_tipo_inmueble (id_tipo_inmueble)
  ,CONSTRAINT FK_BI_venta_BI_tiempo1 FOREIGN KEY (id_tiempo_venta) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_alquiler_BI_ubicacion_localidad1 FOREIGN KEY (id_localidad_inm) REFERENCES TERCER_MALON.BI_ubicacion_localidad (id_localidad)
  ,CONSTRAINT FK_BI_venta_BI_rango_m21 FOREIGN KEY (id_rango_m2) REFERENCES TERCER_MALON.BI_rango_m2 (id_rango_m2)
  ,CONSTRAINT FK_BI_venta_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_venta_BI_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES TERCER_MALON.BI_sucursal (id_sucursal)
  ,CONSTRAINT FK_BI_venta_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda)
  ,CONSTRAINT FK_BI_venta_BI_rango_etario2 FOREIGN KEY (id_rango_etario_empl) REFERENCES TERCER_MALON.BI_rango_etario (id_rango_etario)
  ,CONSTRAINT PK_BI_fact_venta PRIMARY KEY (id_tiempo_venta, id_tipo_inmueble,id_localidad_inm, id_rango_m2, id_operacion, id_sucursal, id_moneda, id_rango_etario_empl)
); --entendemos por ventas concretas todas aquellas ventas que estan en la tabla TERCER_MALON.venta
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_operacion
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_operacion
(
  id_sucursal             NUMERIC(18,0) NOT NULL
  ,id_venta_alq			  NUMERIC(18,0) NOT NULL
  ,id_rango_etario_agente NUMERIC(18,0) NOT NULL
  ,id_tiempo_concretado   NUMERIC(18,0) NOT NULL
  -- segun fecha_venta o fecha_inicio alquiler = concretados
  ,id_operacion           NUMERIC(18,0) NOT NULL
  ,id_moneda              NUMERIC(18,0) NOT NULL
  ,comision               NUMERIC(18,2) NOT NULL
  ,monto_cierre           NUMERIC(18,2) NOT NULL
  --expensa inmueble
  ,CONSTRAINT FK_BI_operacion_BI_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES TERCER_MALON.BI_sucursal (id_sucursal)
  ,CONSTRAINT FK_BI_operacion_BI_cod_operacion1 FOREIGN KEY (id_venta_alq) REFERENCES TERCER_MALON.BI_cod_operacion (id_cod_operacion)
  ,CONSTRAINT FK_BI_operacion_BI_rango_etario1 FOREIGN KEY (id_rango_etario_agente) REFERENCES TERCER_MALON.BI_rango_etario (id_rango_etario)
  ,CONSTRAINT FK_BI_operacion_BI_tiempo1 FOREIGN KEY (id_tiempo_concretado) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_operacion_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_operacion_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda)
  ,CONSTRAINT PK_BI_fact_operacion PRIMARY KEY (id_sucursal, id_venta_alq, id_rango_etario_agente, id_tiempo_concretado, id_operacion, id_moneda)
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
  (anio
  ,cuatrimestre
  ,mes)
  SELECT
    year(fecha_publicacion) AS anio
    ,datepart(quarter,fecha_publicacion) AS cuatrimestre
    ,month(fecha_publicacion) AS mes
  FROM TERCER_MALON.anuncio --inicio publicacion
UNION
  SELECT year(fecha_fin), datepart(quarter,fecha_fin), month(fecha_fin)
  FROM TERCER_MALON.anuncio --fin publicacion
UNION
  SELECT year(fecha_inicio), datepart(quarter,fecha_inicio), month(fecha_inicio)
  FROM TERCER_MALON.alquiler --alta alquiler
UNION
  SELECT year(fecha), datepart(quarter,fecha), month(fecha)
  FROM TERCER_MALON.venta --venta concretada
UNION
  SELECT year(fecha), datepart(quarter,fecha), month(fecha)
  FROM
    TERCER_MALON.pago_alquiler --pago
UNION
  SELECT year(fecha_inicio_periodo), datepart(quarter,fecha_inicio_periodo), month(fecha_inicio_periodo)
  FROM TERCER_MALON.pago_alquiler --inicio periodo
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

-- Table TERCER_MALON.BI_anuncio
INSERT INTO TERCER_MALON.BI_anuncio
	(
	  id_anuncio
	)
	SELECT cod_anuncio FROM TERCER_MALON.anuncio
GO

-- Table TERCER_MALON.BI_cod_operacion
INSERT INTO TERCER_MALON.BI_cod_operacion
(
  id_cod_operacion 
)
	SELECT cod_alquiler FROM TERCER_MALON.alquiler	--cod alquileres concretados
	UNION
	SELECT cod_venta FROM TERCER_MALON.venta		--cod ventas concretados
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
INSERT INTO TERCER_MALON.BI_fact_anuncio --15269 (de 22397 anuncios totales)
           (duracion_publicacion
           ,id_operacion
           ,id_barrio
           ,id_ambiente
           ,id_tiempo
           ,id_tipo_inmueble
           ,id_rango_m2
           ,precio_publicado
           ,id_moneda
		   ,cant_publicados)
     SELECT 
			AVG(DATEDIFF(DAY,A.fecha_publicacion, A.fecha_fin)) AS duracion_dias_publicacion,
			A.id_operacion,
			I.id_barrio,
			I.id_ambiente,
			T.id_tiempo AS fecha_alta,
			I.id_tipo_inmueble,
			R.id_rango_m2,
			AVG(A.precio_publicado) AS prom_precio,
			A.id_moneda,
			COUNT(cod_anuncio) AS cant_publicados
	 FROM TERCER_MALON.anuncio A
	 JOIN TERCER_MALON.inmueble I ON A.cod_inmueble=I.cod_inmueble
	 JOIN TERCER_MALON.BI_tiempo T ON MONTH(A.fecha_publicacion)=T.mes AND YEAR(A.fecha_publicacion)=T.anio
	 JOIN TERCER_MALON.BI_rango_m2 R ON (SELECT TERCER_MALON.FN_id_rango_segun_m2(I.superficie_total))=R.id_rango_m2
	 GROUP BY  T.id_tiempo, A.id_operacion, I.id_barrio, I.id_ambiente, I.id_tipo_inmueble, A.id_moneda, R.id_rango_m2
GO


-- Table TERCER_MALON.BI_fact_alquiler
INSERT INTO TERCER_MALON.BI_fact_alquiler -- 10274 ( de 12842 alquileres totales)
           (id_barrio
           ,id_tiempo_alta
           ,id_rango_etario_inq
           ,id_operacion
           ,id_sucursal
		   ,comision
           ,id_moneda
		   ,id_rango_etario_empl
		   ,cant_alta
		   ,monto_total)
    SELECT
		I.id_barrio,
		T1.id_tiempo AS fecha_alta,
		RE.id_rango_etario AS id_rango_etario_inq,
		AN.id_operacion,
		AG.cod_sucursal,
		AVG(A.comision) AS comision,
		AN.id_moneda,
		RE2.id_rango_etario AS id_rango_etario_empl,
		COUNT(DISTINCT A.cod_alquiler) AS cant_alta,
		SUM(A.deposito) AS monto_total
	FROM TERCER_MALON.alquiler A
	JOIN TERCER_MALON.inquilino INQ ON A.id_inquilino=INQ.id_inquilino
	JOIN TERCER_MALON.anuncio AN ON A.cod_anuncio=AN.cod_anuncio
	JOIN TERCER_MALON.agente AG ON AN.id_agente=AG.id_agente
	JOIN TERCER_MALON.inmueble I ON AN.cod_inmueble=I.cod_inmueble
	JOIN TERCER_MALON.BI_tiempo T1 ON MONTH(A.fecha_inicio)=T1.mes AND YEAR(A.fecha_inicio)=T1.anio
	JOIN TERCER_MALON.BI_rango_etario RE ON (SELECT TERCER_MALON.FN_id_etario_segun_nacimiento(INQ.fecha_nacimiento)) = RE.id_rango_etario
	JOIN TERCER_MALON.BI_rango_etario RE2 ON (SELECT TERCER_MALON.FN_id_etario_segun_nacimiento(AG.fecha_nacimiento)) = RE2.id_rango_etario
	GROUP BY T1.id_tiempo, I.id_barrio, RE.id_rango_etario, AN.id_operacion, AG.cod_sucursal, AN.id_moneda, RE2.id_rango_etario
GO

INSERT INTO [TERCER_MALON].[BI_fact_pago_alquiler] -- 149 de 229004 pagos
           ([id_tiempo_periodo]
           ,[cant_pagos]
           ,[cant_pagos_atrasados]
           ,[monto_mes]
           ,[monto_mes_anterior]
		   ,[id_estado_alquiler])
    SELECT
		T1.id_tiempo AS id_tiempo_periodo,
		COUNT(*) AS cant_pagos,
		SUM(CASE WHEN fecha > fecha_fin_periodo THEN 1 ELSE 0 END) AS cant_pagos_atrasados,
		SUM(importe)/COUNT(*) AS monto_mes,
		ISNULL((SELECT SUM(importe)/COUNT(*) AS monto_mes_anterior FROM TERCER_MALON.pago_alquiler P2 JOIN TERCER_MALON.alquiler A2 ON P2.cod_alquiler=A2.cod_alquiler
			WHERE A2.id_estado_alquiler=A.id_estado_alquiler AND
			((T1.mes=1 and MONTH(P2.fecha_inicio_periodo)=12 AND YEAR(p2.fecha_inicio_periodo)=T1.anio-1)
																	--si el mes actual es enero, busco el monto de diciembre del año anterior
																	OR (MONTH(p2.fecha_inicio_periodo)=T1.mes-1 and YEAR(p2.fecha_inicio_periodo)=T1.anio))),0) AS monto_mes_anterior,
		A.id_estado_alquiler
	FROM TERCER_MALON.pago_alquiler PA
	JOIN TERCER_MALON.alquiler A ON PA.cod_alquiler=A.cod_alquiler
	JOIN TERCER_MALON.BI_tiempo T1 ON MONTH(PA.fecha)=T1.mes AND YEAR(PA.fecha)=T1.anio
	GROUP BY T1.id_tiempo, A.id_estado_alquiler, anio, mes
	ORDER BY anio, mes
GO
--Para calcular el aumento tengo que restar ambos montos luego de dividirlos por la cantidad de pagos de c/u ( (mes actual/t_pagos)	- (mes_ant/t_pagos))

-- Table TERCER_MALON.BI_fact_venta
INSERT INTO TERCER_MALON.BI_fact_venta -- 3964 de 4058 ventas total
           (id_tipo_inmueble
           ,id_tiempo_venta
           ,id_localidad_inm
		   ,id_rango_m2
           ,precio_por_m2
           ,id_operacion
           ,id_sucursal
           ,id_moneda
           ,id_rango_etario_empl
           ,cant_alta
		   ,monto_total
		   ,comision)
	SELECT
		I.id_tipo_inmueble
		,T.id_tiempo AS id_tiempo_venta
		,B.id_localidad
		,R.id_rango_m2 AS id_rango_m2
		,AVG((V.precio/I.superficie_total)) AS precio_por_m2
		,AN.id_operacion
		,AG.cod_sucursal
		,V.id_moneda
		,RE.id_rango_etario AS id_rango_etario_empl
		,COUNT(DISTINCT V.cod_venta) AS cant_alta
		,SUM(V.precio) AS monto_total
		,AVG(V.comision)
	FROM TERCER_MALON.venta V
	JOIN TERCER_MALON.anuncio AN ON V.cod_anuncio=AN.cod_anuncio
	JOIN TERCER_MALON.agente AG ON AN.id_agente=AG.id_agente
	JOIN TERCER_MALON.inmueble I ON AN.cod_inmueble=I.cod_inmueble
	JOIN TERCER_MALON.barrio B ON I.id_barrio=B.id_barrio
	JOIN TERCER_MALON.BI_tiempo T ON MONTH(V.fecha)=T.mes AND YEAR(V.fecha)=T.anio
	JOIN TERCER_MALON.BI_rango_m2 R ON (SELECT TERCER_MALON.FN_id_rango_segun_m2(I.superficie_total))=R.id_rango_m2
	JOIN TERCER_MALON.BI_rango_etario RE ON (SELECT TERCER_MALON.FN_id_etario_segun_nacimiento(AG.fecha_nacimiento)) = RE.id_rango_etario
	GROUP BY T.id_tiempo, I.id_tipo_inmueble, B.id_localidad, R.id_rango_m2,AN.id_operacion,AG.cod_sucursal,V.id_moneda, RE.id_rango_etario
GO


-- Table TERCER_MALON.BI_fact_operacion 16900 -> ALQUILERES=12842 + VENTA=4058
INSERT INTO TERCER_MALON.BI_fact_operacion
           (id_sucursal
		   ,id_venta_alq
           ,id_rango_etario_agente
           ,id_tiempo_concretado
           ,id_operacion
           ,id_moneda
           ,comision
		   ,monto_cierre)
		SELECT
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
		 SELECT
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

--1		1588 pero no estan diferenciados entre barrios
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

--2		74
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
    ,SUM(FA.cant_alta) AS cant_alta_alquiler
  FROM
    TERCER_MALON.BI_fact_alquiler FA
    JOIN TERCER_MALON.BI_tiempo T ON FA.id_tiempo_alta=T.id_tiempo
	JOIN TERCER_MALON.BI_ubicacion_barrio B ON FA.id_barrio=B.id_barrio
	JOIN TERCER_MALON.BI_rango_etario R ON FA.id_rango_etario_inq=R.id_rango_etario
  GROUP BY anio, cuatrimestre, B.nombre, R.tipo
  ORDER BY SUM(FA.cant_alta) DESC
GO


--4		73
CREATE VIEW TERCER_MALON.V_Pago_Alquiler_Incumplimiento
AS
  SELECT
	anio
	,mes
    ,SUM(cant_pagos_atrasados)* 100/ SUM(cant_pagos) AS porcentaje_impagos
  FROM
    TERCER_MALON.BI_fact_pago_alquiler
	JOIN TERCER_MALON.BI_tiempo ON id_tiempo_periodo=id_tiempo
  GROUP BY anio, mes
GO

--5		5
CREATE VIEW TERCER_MALON.V_Pago_Alquiler_Promedio_Incremento
AS
  SELECT
    anio
    ,mes
	,(AVG(monto_mes)-AVG(monto_mes_anterior)) *100 / AVG(monto_mes) AS incremento
  FROM
    TERCER_MALON.BI_fact_pago_alquiler
	JOIN TERCER_MALON.BI_tiempo ON id_tiempo_periodo=id_tiempo
  WHERE
	id_estado_alquiler=(SELECT id_estado_alquiler FROM TERCER_MALON.BI_estado_alquiler WHERE tipo='Activo')
  GROUP BY anio, mes
  HAVING AVG(monto_mes)-AVG(monto_mes_anterior) >0
GO

--6		3755
CREATE VIEW TERCER_MALON.V_Venta_Promedio_Precio_Por_M2
AS
  SELECT
    anio
    ,cuatrimestre
    ,I.tipo AS tipo_inmueble
    ,L.nombre_localidad AS localidad
    ,ROUND(AVG(precio_por_m2),2) AS prom_precio_por_m2
  FROM
    TERCER_MALON.BI_fact_venta FV
    LEFT JOIN TERCER_MALON.BI_tiempo ON id_tiempo_venta=id_tiempo
	LEFT JOIN TERCER_MALON.BI_tipo_inmueble I ON FV.id_tipo_inmueble=I.id_tipo_inmueble
	LEFT JOIN TERCER_MALON.BI_ubicacion_localidad L ON FV.id_localidad_inm=L.id_localidad
  GROUP BY anio, cuatrimestre, I.tipo, L.nombre_localidad, L.nombre_provincia --localidades con mismo nombre pero distintas provincias
GO

--7
CREATE VIEW TERCER_MALON.V_Operacion_Promedio_Comision
AS
    SELECT
		  anio
		  ,cuatrimestre
		  ,O.tipo AS tipo_operacion
		  ,S.nombre AS nombre_sucursal
		  ,ROUND(AVG(comision),2) AS prom_comision
    FROM
      TERCER_MALON.BI_fact_operacion FO
      JOIN TERCER_MALON.BI_tiempo ON id_tiempo_concretado=id_tiempo
	  JOIN TERCER_MALON.BI_tipo_operacion O ON FO.id_operacion=O.id_operacion
	  JOIN TERCER_MALON.BI_sucursal S ON FO.id_sucursal=S.id_sucursal
	GROUP BY anio, cuatrimestre, O.tipo, S.nombre
GO

--8
CREATE VIEW TERCER_MALON.V_Operacion_Porcentaje_Concretados
AS
  SELECT
    T.anio
    ,S.nombre AS nombre_sucursal
    ,R.tipo AS rango_etario
    ,SUM(cant_alta) *100 --total anuncios (operaciones) concretados segun anio
	/ (SELECT SUM(FA.cant_publicados) FROM TERCER_MALON.BI_fact_anuncio FA --total anuncios del anio
		JOIN TERCER_MALON.BI_tiempo T2 ON FA.id_tiempo=T2.id_tiempo WHERE T2.anio=T.anio) 
  FROM
    TERCER_MALON.BI_fact_operacion FO
    JOIN TERCER_MALON.BI_tiempo T ON id_tiempo_concretado=T.id_tiempo
	JOIN TERCER_MALON.BI_sucursal S ON FO.id_sucursal=S.id_sucursal
	JOIN TERCER_MALON.BI_rango_etario R ON FO.id_rango_etario_agente=R.id_rango_etario
  GROUP BY T.anio, S.nombre, R.tipo
GO

select anio, fa.id_operacion, sum(FA.cant_concretados) FROM TERCER_MALON.BI_fact_anuncio FA 
JOIN TERCER_MALON.BI_tiempo T ON FA.id_tiempo=T.id_tiempo
group by anio, fa.id_operacion
/*
2024	12262
2027	4638
*/

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
  GROUP BY cuatrimestre, S.nombre, O.tipo, M.nombre
GO
