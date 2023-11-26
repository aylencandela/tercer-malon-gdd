USE GD2C2023
GO

-- -----------------------------------------------------
-- Schema TERCER_MALON
-- -----------------------------------------------------
CREATE SCHEMA TERCER_MALON
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
  ,CONSTRAINT PK_id_tiempo PRIMARY KEY (id_tiempo)
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
  ,CONSTRAINT PK_id_localidad PRIMARY KEY (id_localidad)
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
  ,BI_ubicacion_localidad_id_localidad NUMERIC(18,0) NOT NULL
  ,CONSTRAINT PK_id_sucursal PRIMARY KEY (id_sucursal)
  ,CONSTRAINT FK_BI_sucursal_BI_ubicacion_localidad FOREIGN KEY (BI_ubicacion_localidad_id_localidad) REFERENCES TERCER_MALON.BI_ubicacion_localidad (id_localidad)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_rango_etario
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_rango_etario
(
  id_rango_etario NUMERIC(18,0) IDENTITY(1,1)
  ,tipo            NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_id_rango_etario PRIMARY KEY (id_rango_etario)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tipo_inmueble
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_tipo_inmueble
(
  id_tipo_inmueble NUMERIC(18,0) NOT NULL
  ,tipo             NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_id_tipo_inmueble PRIMARY KEY (id_tipo_inmueble)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_ambiente
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_ambiente
(
  id_ambiente NUMERIC(18,0) NOT NULL
  ,tipo        NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_id_ambiente PRIMARY KEY (id_ambiente)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_rango_m2
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_rango_m2
(
  id_rango        NUMERIC(18,0) IDENTITY(1,1)
  ,tipo_superficie NUMERIC(18,0) NOT NULL
  ,CONSTRAINT PK_id_rango PRIMARY KEY (id_rango)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tipo_operacion
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_tipo_operacion
(
  id_operacion NUMERIC(18,0) NOT NULL
  ,tipo         NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_id_operacion PRIMARY KEY (id_operacion)
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
  ,CONSTRAINT PK_id_moneda PRIMARY KEY (id_moneda)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_ubicacion_barrio
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_ubicacion_barrio
(
  id_barrio                           NUMERIC(18,0) NOT NULL
  ,nombre                              NVARCHAR(100) NOT NULL
  ,BI_ubicacion_localidad_id_localidad NUMERIC(18,0) NOT NULL
  ,CONSTRAINT PK_id_barrio PRIMARY KEY (id_barrio)
  ,CONSTRAINT FK_BI_ubicacion_barrio_BI_ubicacion_localidad1 FOREIGN KEY (BI_ubicacion_localidad_id_localidad) REFERENCES TERCER_MALON.BI_ubicacion_localidad (id_localidad)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_ubicacion_barrio
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_estado_alquiler
(
  id_estado_alquiler NUMERIC(18,0) NOT NULL
  ,tipo               NVARCHAR(100) NOT NULL
  ,CONSTRAINT PK_id_estado_alquiler PRIMARY KEY (id_estado_alquiler)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_anuncio
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_anuncio
(
  duracion_publicacion NUMERIC(18,0) NOT NULL
  -- fecha_publicacion - fecha_fin
  ,id_anuncio           NUMERIC(18,0) NOT NULL
  ,id_operacion         NUMERIC(18,0) NOT NULL
  ,id_barrio            NUMERIC(18,0) NOT NULL
  ,id_ambiente          NUMERIC(18,0) NOT NULL
  ,id_tiempo            NUMERIC(18,0) NOT NULL
  -- segun fecha_publicacion
  ,id_tipo_inmueble     NUMERIC(18,0) NOT NULL
  ,id_rango             NUMERIC(18,0) NOT NULL
  ,precio_publicado     NUMERIC(18,2) NOT NULL
  ,id_moneda            NUMERIC(18,0) NOT NULL
  ,CONSTRAINT FK_BI_anuncio_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_anuncio_BI_ubicacion_barrio1 FOREIGN KEY (id_barrio) REFERENCES TERCER_MALON.BI_ubicacion_barrio (id_barrio)
  ,CONSTRAINT FK_BI_anuncio_BI_ambiente1 FOREIGN KEY (id_ambiente) REFERENCES TERCER_MALON.BI_ambiente (id_ambiente)
  ,CONSTRAINT FK_BI_anuncio_BI_tipo_inmueble1 FOREIGN KEY (id_tipo_inmueble) REFERENCES TERCER_MALON.BI_tipo_inmueble (id_tipo_inmueble)
  ,CONSTRAINT FK_BI_anuncio_BI_rango_m21 FOREIGN KEY (id_rango) REFERENCES TERCER_MALON.BI_rango_m2 (id_rango)
  ,CONSTRAINT FK_BI_anuncio_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda)
  ,CONSTRAINT PK_BI_fact_anuncio PRIMARY KEY (id_anuncio,id_operacion,id_barrio,id_ambiente,id_tiempo,id_tipo_inmueble,id_rango,id_moneda)
);
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_alquiler
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_alquiler
(
  id_alquiler         NUMERIC(18,0) NOT NULL
  ,id_barrio           NUMERIC(18,0) NOT NULL
  ,id_tiempo           NUMERIC(18,0) NOT NULL
  -- segun fecha_inicio = alta alquiler
  ,id_rango_etario_inq NUMERIC(18,0) NOT NULL
  ,fecha_pago          DATETIME      NOT NULL
  ,fecha_fin_periodo   DATETIME      NOT NULL
  ,id_estado_alquiler  NUMERIC(18,0) NOT NULL
  ,incremento          NUMERIC(18,0) NOT NULL
  ,id_operacion        NUMERIC(18,0) NOT NULL
  ,id_sucursal         NUMERIC(18,0) NOT NULL
  ,comision            NUMERIC(18,2) NOT NULL
  ,CONSTRAINT FK_BI_alquiler_BI_ubicacion_barrio1 FOREIGN KEY (id_barrio) REFERENCES TERCER_MALON.BI_ubicacion_barrio (id_barrio)
  ,CONSTRAINT FK_BI_alquiler_BI_tiempo1 FOREIGN KEY (id_tiempo) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_alquiler_BI_rango_etario1 FOREIGN KEY (id_rango_etario_inq) REFERENCES TERCER_MALON.BI_rango_etario (id_rango_etario)
  ,CONSTRAINT FK_BI_alquiler_BI_estado_alquiler1 FOREIGN KEY (id_estado_alquiler) REFERENCES TERCER_MALON.BI_estado_alquiler (id_estado_alquiler)
  ,CONSTRAINT FK_BI_alquiler_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_alquiler_BI_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES TERCER_MALON.BI_sucursal (id_sucursal)
  ,CONSTRAINT PK_BI_fact_alquiler PRIMARY KEY (id_alquiler, id_barrio, id_tiempo, id_rango_etario_inq, id_estado_alquiler,id_operacion,id_sucursal)
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
  ,id_tiempo        NUMERIC(18,0) NOT NULL
  -- segun fecha_venta
  ,id_rango         NUMERIC(18,0) NOT NULL
  ,precio_por_m2    NUMERIC(18,2) NOT NULL
  -- precio/m2
  ,id_operacion     NUMERIC(18,0) NOT NULL
  ,id_sucursal      NUMERIC(18,0) NOT NULL
  ,comision         NUMERIC(18,2) NOT NULL
  ,CONSTRAINT FK_BI_venta_BI_tipo_inmueble1 FOREIGN KEY (id_tipo_inmueble) REFERENCES TERCER_MALON.BI_tipo_inmueble (id_tipo_inmueble)
  ,CONSTRAINT FK_BI_venta_BI_ubicacion_localidad1 FOREIGN KEY (id_localidad) REFERENCES TERCER_MALON.BI_ubicacion_localidad (id_localidad)
  ,CONSTRAINT FK_BI_venta_BI_tiempo1 FOREIGN KEY (id_tiempo) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_venta_BI_rango_m21 FOREIGN KEY (id_rango) REFERENCES TERCER_MALON.BI_rango_m2 (id_rango)
  ,CONSTRAINT FK_BI_venta_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_venta_BI_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES TERCER_MALON.BI_sucursal (id_sucursal)
  ,CONSTRAINT PK_BI_fact_venta PRIMARY KEY (id_venta, id_tipo_inmueble, id_localidad,id_tiempo,id_rango,id_operacion,id_sucursal)
);
--entendemos por ventas concretas todas aquellas ventas que estan en la tabla TERCER_MALON.venta
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_operacion
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_operacion
(
  id_sucursal            NUMERIC(18,0) NOT NULL
  ,id_rango_etario_agente NUMERIC(18,0) NOT NULL
  ,id_tiempo              NUMERIC(18,0) NOT NULL
  -- segun fecha_venta o fecha_inicio alquiler = concretados
  ,total_concretados      NUMERIC(18,0) NOT NULL
  ,id_operacion           NUMERIC(18,0) NOT NULL
  ,id_moneda              NUMERIC(18,0) NOT NULL
  ,monto_cierre           NUMERIC(18,2) NOT NULL
  --expensa inmueble
  ,CONSTRAINT FK_BI_operacion_BI_sucursal1 FOREIGN KEY (id_sucursal) REFERENCES TERCER_MALON.BI_sucursal (id_sucursal)
  ,CONSTRAINT FK_BI_operacion_BI_rango_etario1 FOREIGN KEY (id_rango_etario_agente) REFERENCES TERCER_MALON.BI_rango_etario (id_rango_etario)
  ,CONSTRAINT FK_BI_operacion_BI_tiempo1 FOREIGN KEY (id_tiempo) REFERENCES TERCER_MALON.BI_tiempo (id_tiempo)
  ,CONSTRAINT FK_BI_operacion_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion)
  ,CONSTRAINT FK_BI_operacion_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda)
  ,CONSTRAINT PK_BI_fact_operacion PRIMARY KEY (id_sucursal, id_rango_etario_agente, id_tiempo, id_operacion, id_moneda)
);
GO

-- -----------------------------------------------------
-- -----------------------------------------------------
--					INSERTS
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tiempo
INSERT INTO TERCER_MALON.BI_tiempo
  --que mierda le pongo aca
  (id_tiempo
  ,anio
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
  ,BI_ubicacion_localidad_id_localidad)
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
  ('MENOR_25' ,'ENTRE_25_35' ,'ENTRE_35_50' ,'MAYOR_50')
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
  (id_rango
  ,tipo_superficie)
VALUES
  ('MENOR_35' ,'ENTRE_35_55' ,'ENTRE_55_75' ,'ENTRE_75_100' ,'MAYOR_100')
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
		  ,simbolo
		  ,nombre
FROM
  TERCER_MALON.moneda
GO

-- Table TERCER_MALON.BI_ubicacion_barrio
INSERT INTO TERCER_MALON.BI_ubicacion_barrio
  (id_barrio
  ,nombre
  ,BI_ubicacion_localidad_id_localidad)
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

/*
-- Table TERCER_MALON.BI_fact_anuncio
INSERT INTO TERCER_MALON.BI_fact_anuncio
           (duracion_publicacion
           ,id_anuncio
           ,id_operacion
           ,id_barrio
           ,id_ambiente
           ,id_tiempo
           ,id_tipo_inmueble
           ,id_rango
           ,precio_publicado
           ,id_moneda)
     VALUES
           ()
GO

-- Table TERCER_MALON.BI_fact_alquiler
INSERT INTO TERCER_MALON.BI_fact_alquiler
           (id_alquiler
           ,id_barrio
           ,id_tiempo
           ,id_rango_etario_inq
           ,fecha_pago
           ,fecha_fin_periodo
           ,id_estado_alquiler
           ,incremento
           ,id_operacion
           ,id_sucursal
           ,comision)
     VALUES
           ()
GO

-- Table TERCER_MALON.BI_fact_venta
INSERT INTO TERCER_MALON.BI_fact_venta
           (id_venta
           ,id_tipo_inmueble
           ,id_localidad
           ,id_tiempo
           ,id_rango
           ,precio_por_m2
           ,id_operacion
           ,id_sucursal
           ,comision)
     VALUES
           ()
GO

-- Table TERCER_MALON.BI_fact_operacion
INSERT INTO TERCER_MALON.BI_fact_operacion
           (id_sucursal
           ,id_rango_etario_agente
           ,id_tiempo
           ,total_concretados
           ,id_operacion
           ,id_moneda
           ,monto_cierre)
     VALUES
           ()
GO

*/




-- -----------------------------------------------------
-- -----------------------------------------------------
--					VISTAS
-- -----------------------------------------------------
-- -----------------------------------------------------
/*
TODO: CAMBIAR IDS POR NOMBRE/TIPO CON JOINS
*/

--1
CREATE VIEW TERCER_MALON.V_Anuncio_Promedio_Publicacion
AS
  SELECT
    id_operacion
    ,id_barrio
    ,id_ambiente
    ,cuatrimestre
    ,anio
    ,AVG(duracion_publicacion) AS prom_duracion
  FROM
    TERCER_MALON.BI_fact_anuncio
    JOIN TERCER_MALON.BI_tiempo ON BI_fact_anuncio.id_tiempo=BI_tiempo.id_tiempo
  --join
  GROUP BY id_operacion, id_barrio, id_ambiente, cuatrimestre, anio
GO

--2
CREATE VIEW TERCER_MALON.V_Anuncio_Promedio_Precio
AS
  SELECT
    id_operacion
    ,id_tipo_inmueble
    ,id_rango
    ,cuatrimestre
    ,anio
    ,AVG(precio_publicado) AS prom_precio 
    ,id_moneda
  FROM
    TERCER_MALON.BI_fact_anuncio
    JOIN TERCER_MALON.BI_tiempo ON BI_fact_anuncio.id_tiempo=BI_tiempo.id_tiempo
  --hacer joins
  GROUP BY id_operacion, id_tipo_inmueble, id_rango, cuatrimestre, anio, id_moneda
GO

--3
CREATE VIEW TERCER_MALON.V_Alquiler_Barrios_Populares
AS
  SELECT
    TOP 5
    anio
    ,cuatrimestre
    ,id_rango_etario_inq
    ,id_barrio
    ,COUNT(DISTINCT id_alquiler) AS cant_alquileres_dados_de_alta
  FROM
    TERCER_MALON.BI_fact_alquiler
    JOIN TERCER_MALON.BI_tiempo ON BI_fact_alquiler.id_tiempo=BI_tiempo.id_tiempo
  --hacer joins
  GROUP BY anio, cuatrimestre, id_rango_etario_inq, id_barrio
  ORDER BY COUNT(DISTINCT id_alquiler) DESC
GO

CREATE VIEW TERCER_MALON.V_Alquiler_Incumplimiento_Pagos
AS
  --periodo segun fecha fin
  SELECT
    YEAR(fecha_fin_periodo) AS anio 
    ,MONTH(fecha_fin_periodo) AS mes
    ,((SELECT
      COUNT(*)
    FROM
      TERCER_MALON.BI_fact_alquiler A2
    WHERE A2.fecha_pago>A2.fecha_fin_periodo
      AND YEAR(A2.fecha_fin_periodo)=YEAR(fecha_fin_periodo) AND MONTH(A2.fecha_fin_periodo)=MONTH(fecha_fin_periodo) )
		/ COUNT(*) * 100) AS porcentaje_impagos
  FROM
    TERCER_MALON.BI_fact_alquiler
  GROUP BY YEAR(fecha_fin_periodo), MONTH(fecha_fin_periodo)
  ORDER BY YEAR(fecha_fin_periodo), MONTH(fecha_fin_periodo)
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
  --por fecha_pago???
  SELECT
    YEAR(fecha_pago) AS anio
    ,MONTH(fecha_pago) AS mes
    ,AVG(incremento) AS prom_incremento
  FROM
    TERCER_MALON.BI_fact_alquiler
  WHERE id_estado_alquiler=1
  --ACTIVOS (chequear que sea mismo valor)
  GROUP BY YEAR(fecha_pago), MONTH(fecha_pago)
  ORDER BY YEAR(fecha_pago), MONTH(fecha_pago)
GO

--6
CREATE VIEW TERCER_MALON.V_Venta_Promedio_Precio_Por_M2
AS
  SELECT
    anio
    ,mes
    ,id_tipo_inmueble
    ,id_localidad
    ,AVG(precio_por_m2) AS prom_precio_por_m2
  FROM
    TERCER_MALON.BI_fact_venta
    JOIN TERCER_MALON.BI_tiempo ON BI_fact_venta.id_tiempo=BI_tiempo.id_tiempo
  --joins
  GROUP BY anio, mes, id_tipo_inmueble, id_localidad
  ORDER BY anio, mes, id_tipo_inmueble, id_localidad
GO

--7
CREATE VIEW TERCER_MALON.V_Venta_Promedio_Comision
AS
  --VENTAS
      SELECT
      anio
      ,mes
      ,id_operacion
      ,id_sucursal
      ,AVG(comision) AS prom_comision
    FROM
      TERCER_MALON.BI_fact_venta
      JOIN TERCER_MALON.BI_tiempo ON BI_fact_venta.id_tiempo=BI_tiempo.id_tiempo
    --JOINS
  UNION
    --ALQUILERES
    SELECT
      anio
      ,mes
      ,id_operacion
      ,id_sucursal
      ,AVG(comision) AS prom_comision
    FROM
      TERCER_MALON.BI_fact_alquiler
      JOIN TERCER_MALON.BI_tiempo ON BI_fact_alquiler.id_tiempo=BI_tiempo.id_tiempo
    --JOINS
    GROUP BY anio, mes, id_operacion, id_sucursal
    ORDER BY anio, mes, id_operacion, id_sucursal
GO

--8
CREATE VIEW TERCER_MALON.V_Operacion_Porcentaje_Concretados
AS
  SELECT
    anio
    ,id_sucursal
    ,id_rango_etario_agente
    ,( total_concretados/ (SELECT
      COUNT(DISTINCT id_anuncio)
    FROM
      TERCER_MALON.BI_fact_anuncio
      JOIN TERCER_MALON.BI_tiempo t ON BI_fact_anuncio.id_tiempo=BI_tiempo.id_tiempo
    WHERE t.anio = anio )) * 100 AS porcentaje_concretados_segun_total_anuncios
  FROM
    TERCER_MALON.BI_fact_operacion
    JOIN TERCER_MALON.BI_tiempo ON BI_fact_operacion.id_tiempo=BI_tiempo.id_tiempo
  --joins
  GROUP BY anio, id_sucursal, id_rango_etario_agente
  ORDER BY anio, id_sucursal, id_rango_etario_agente
GO

--9
CREATE VIEW TERCER_MALON.V_Operacion_Monto_Total_Cierre
AS
  SELECT
    anio
    ,cuatrimestre
    ,id_sucursal
    ,id_operacion
    ,id_moneda
    ,SUM(monto_cierre) AS monto_total_cierre
  FROM
    TERCER_MALON.BI_fact_operacion
    JOIN TERCER_MALON.BI_tiempo ON BI_fact_operacion.id_tiempo=BI_tiempo.id_tiempo
  --joins
  GROUP BY anio, cuatrimestre, id_sucursal, id_operacion, id_moneda
  ORDER BY anio, cuatrimestre, id_sucursal, id_operacion, id_moneda
GO
