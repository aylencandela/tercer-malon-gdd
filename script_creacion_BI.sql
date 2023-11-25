USE [GD2C2023]
GO

-- -----------------------------------------------------
-- Schema TERCER_MALON
-- -----------------------------------------------------
CREATE SCHEMA TERCER_MALON
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tiempo
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_tiempo (
  id_tiempo NUMERIC(18,0) IDENTITY(1,1),
  anio NUMERIC(18,0) NOT NULL,
  cuatrimestre NUMERIC(18,0) NOT NULL,
  mes NUMERIC(18,0) NOT NULL,
  CONSTRAINT PK_id_tiempo PRIMARY KEY (id_tiempo));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_ubicacion_localidad
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_ubicacion_localidad (
  id_localidad NUMERIC(18,0) NOT NULL,
  nombre_localidad NVARCHAR(100) NOT NULL,
  nombre_provincia NVARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_localidad PRIMARY KEY (id_localidad));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_sucursal
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_sucursal (
  id_sucursal NUMERIC(18,0) NOT NULL,
  nombre NVARCHAR(100) NOT NULL,
  direccion NVARCHAR(100) NOT NULL,
  telefono NVARCHAR(100) NOT NULL,
  BI_ubicacion_localidad_id_localidad NUMERIC(18,0) NOT NULL,
  CONSTRAINT PK_id_sucursal PRIMARY KEY (id_sucursal),
  CONSTRAINT FK_BI_sucursal_BI_ubicacion_localidad FOREIGN KEY (BI_ubicacion_localidad_id_localidad) REFERENCES TERCER_MALON.BI_ubicacion_localidad (id_localidad));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_rango_etario
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_rango_etario (
  id_rango_etario NUMERIC(18,0) IDENTITY(1,1),
  tipo NVARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_rango_etario PRIMARY KEY (id_rango_etario));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tipo_inmueble
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_tipo_inmueble (
  id_tipo_inmueble NUMERIC(18,0) NOT NULL,
  tipo NVARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_tipo_inmueble PRIMARY KEY (id_tipo_inmueble));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_ambiente
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_ambiente (
  id_ambiente NUMERIC(18,0) NOT NULL,
  tipo NVARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_ambiente PRIMARY KEY (id_ambiente));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_rango_m2
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_rango_m2 (
  id_rango NUMERIC(18,0) IDENTITY(1,1),
  tipo_superficie NUMERIC(18,0) NOT NULL,
  CONSTRAINT PK_id_rango PRIMARY KEY (id_rango));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tipo_operacion
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_tipo_operacion (
  id_operacion NUMERIC(18,0) NOT NULL,
  tipo NVARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_operacion PRIMARY KEY (id_operacion));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tipo_moneda
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_tipo_moneda (
  id_moneda NUMERIC(18,0) NOT NULL,
  nombre NVARCHAR(100) NOT NULL,
  simbolo NVARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_moneda PRIMARY KEY (id_moneda));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_ubicacion_barrio
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_ubicacion_barrio (
  id_barrio NUMERIC(18,0) NOT NULL,
  nombre NVARCHAR(100) NOT NULL,
  BI_ubicacion_localidad_id_localidad NUMERIC(18,0) NOT NULL,
  CONSTRAINT PK_id_barrio PRIMARY KEY (id_barrio),
  CONSTRAINT FK_BI_ubicacion_barrio_BI_ubicacion_localidad1 FOREIGN KEY (BI_ubicacion_localidad_id_localidad) REFERENCES TERCER_MALON.BI_ubicacion_localidad (id_localidad));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_agente
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_agente (
	id_agente numeric(18, 0) NOT NULL,
	nombre nvarchar(100) NOT NULL,
	apellido nvarchar(10) NOT NULL,
	dni numeric(18, 0) NOT NULL,
	fecha_registro datetime NOT NULL,
	fecha_nacimiento datetime NOT NULL,
	id_rango_etario NUMERIC(18,0) NOT NULL,
	id_sucursal numeric(18, 0) NOT NULL,
	CONSTRAINT PK_BI_agente PRIMARY KEY (id_agente),
	CONSTRAINT FK_BI_sucursal_BI_agente FOREIGN KEY(id_sucursal) REFERENCES TERCER_MALON.BI_sucursal (id_sucursal));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_inquilino
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_inquilino (
	id_inquilino numeric(18, 0) NOT NULL,
	nombre nvarchar(100) NOT NULL,
	apellido nvarchar(10) NOT NULL,
	dni numeric(18, 0) NOT NULL,
	fecha_registro datetime NOT NULL,
	fecha_nacimiento datetime NOT NULL,
	id_rango_etario NUMERIC(18,0) NOT NULL,
	CONSTRAINT PK_BI_inquilino PRIMARY KEY (id_inquilino));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_anuncio
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_anuncio (
  duracion_publicacion NUMERIC(18,0) NOT NULL, -- fecha_publicacion - fecha_fin
  id_anuncio NUMERIC(18,0) NOT NULL,
  id_operacion NUMERIC(18,0) NOT NULL,
  id_barrio NUMERIC(18,0) NOT NULL,
  id_ambiente NUMERIC(18,0) NOT NULL,
  id_tiempo NUMERIC(18,0) NOT NULL, -- segun fecha_publicacion
  id_tipo_inmueble NUMERIC(18,0) NOT NULL,
  id_rango NUMERIC(18,0) NOT NULL,
  precio_publicado NUMERIC(18,2) NOT NULL,
  id_moneda NUMERIC(18,0) NOT NULL,
  CONSTRAINT FK_BI_anuncio_BI_tipo_operacion1 FOREIGN KEY (id_operacion) REFERENCES TERCER_MALON.BI_tipo_operacion (id_operacion),
  CONSTRAINT FK_BI_anuncio_BI_ubicacion_barrio1 FOREIGN KEY (id_barrio) REFERENCES TERCER_MALON.BI_ubicacion_barrio (id_barrio),
  CONSTRAINT FK_BI_anuncio_BI_ambiente1 FOREIGN KEY (id_ambiente) REFERENCES TERCER_MALON.BI_ambiente (id_ambiente),
  CONSTRAINT FK_BI_anuncio_BI_tipo_inmueble1 FOREIGN KEY (id_tipo_inmueble) REFERENCES TERCER_MALON.BI_tipo_inmueble (id_tipo_inmueble),
  CONSTRAINT FK_BI_anuncio_BI_rango_m21 FOREIGN KEY (id_rango) REFERENCES TERCER_MALON.BI_rango_m2 (id_rango),
  CONSTRAINT FK_BI_anuncio_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda),
  CONSTRAINT PK_BI_fact_anuncio PRIMARY KEY (id_anuncio,id_operacion,id_barrio,id_ambiente,id_tiempo,id_tipo_inmueble,id_rango,id_moneda));
GO

-- -----------------------------------------------------
-- Table TERCER_MALON.BI_fact_alquiler
-- -----------------------------------------------------
CREATE TABLE TERCER_MALON.BI_fact_alquiler (
  id_alquiler NUMERIC(18,0) NOT NULL,
  id_barrio NUMERIC(18,0) NOT NULL,
  id_tiempo NUMERIC(18,0) NOT NULL, -- segun fecha_inicio
  id_rango_etario_inq NUMERIC(18,0) NOT NULL,

  --CONSTRAINT FK_BI_anuncio_BI_tipo_moneda1 FOREIGN KEY (id_moneda) REFERENCES TERCER_MALON.BI_tipo_moneda (id_moneda),
  --CONSTRAINT PK_BI_fact_anuncio PRIMARY KEY (id_alquiler,)
  );
GO

select * from tercer_malon.pago_alquiler
where fecha>fecha_fin_periodo

select * from tercer_malon.detalle_alquiler
where fecha>fecha_fin_periodo
-- -----------------------------------------------------
-- -----------------------------------------------------
--					INSERTS
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table TERCER_MALON.BI_tiempo
INSERT INTO [TERCER_MALON].[BI_tiempo] --que mierda le pongo aca
           ([id_tiempo]
           ,[anio]
           ,[cuatrimestre]
           ,[mes])
     SELECT year(fecha_publicacion) as anio, datepart(quarter,fecha_publicacion) as cuatrimestre, month(fecha_publicacion) as mes FROM TERCER_MALON.anuncio
	 UNION
	 SELECT year(fecha_fin), datepart(quarter,fecha_fin), month(fecha_fin) FROM TERCER_MALON.anuncio
	 ORDER BY 1,2,3
GO

-- Table TERCER_MALON.BI_ubicacion_localidad
INSERT INTO [TERCER_MALON].[BI_ubicacion_localidad]
           ([id_localidad]
           ,[nombre_localidad]
           ,[nombre_provincia])
	SELECT [id_localidad]
		  ,[localidad].[nombre]
		  ,[provincia].[nombre]
	FROM [TERCER_MALON].[localidad]
	JOIN [TERCER_MALON].[provincia] ON [localidad].id_provincia = [provincia].id_provincia
GO


-- Table TERCER_MALON.BI_sucursal
INSERT INTO [TERCER_MALON].[BI_sucursal]
           ([id_sucursal]
           ,[nombre]
           ,[direccion]
           ,[telefono]
           ,[BI_ubicacion_localidad_id_localidad])
	SELECT [cod_sucursal]
			,[nombre]
			,[direccion]
			,[telefono]
			,[id_localidad]
	FROM [TERCER_MALON].[sucursal]
GO

-- Table TERCER_MALON.BI_rango_etario
INSERT INTO [TERCER_MALON].[BI_rango_etario]
           ([tipo])
     VALUES
           ('MENOR_25', 'ENTRE_25_35', 'ENTRE_35_50', 'MAYOR_50')
GO

-- Table TERCER_MALON.BI_tipo_inmueble
INSERT INTO [TERCER_MALON].[BI_tipo_inmueble]
           ([id_tipo_inmueble]
           ,[tipo])
	SELECT [id_tipo_inmueble]
		  ,[tipo]
	FROM [TERCER_MALON].[tipo_inmueble]
GO

-- Table TERCER_MALON.BI_ambiente
INSERT INTO [TERCER_MALON].[BI_ambiente]
           ([id_ambiente]
           ,[tipo])
	SELECT [id_ambiente]
		  ,[tipo]
	FROM [TERCER_MALON].[ambiente]

GO

-- Table TERCER_MALON.BI_rango_m2
INSERT INTO [TERCER_MALON].[BI_rango_m2]
           ([id_rango]
           ,[tipo_superficie])
      VALUES
           ('MENOR_35', 'ENTRE_35_55', 'ENTRE_55_75', 'ENTRE_75_100', 'MAYOR_100')
GO

-- Table TERCER_MALON.BI_tipo_operacion
INSERT INTO [TERCER_MALON].[BI_tipo_operacion]
           ([id_operacion]
           ,[tipo])
	SELECT [id_operacion]
		  ,[tipo]
	FROM [TERCER_MALON].[operacion]   
GO

-- Table TERCER_MALON.BI_tipo_moneda
INSERT INTO [TERCER_MALON].[BI_tipo_moneda]
           ([id_moneda]
           ,[nombre]
           ,[simbolo])
	SELECT [id_moneda]
		  ,[simbolo]
		  ,[nombre]
	FROM [TERCER_MALON].[moneda]
GO

-- Table TERCER_MALON.BI_ubicacion_barrio
INSERT INTO [TERCER_MALON].[BI_ubicacion_barrio]
           ([id_barrio]
           ,[nombre]
           ,[BI_ubicacion_localidad_id_localidad])
	SELECT [id_barrio]
		  ,[nombre]
		  ,[id_localidad]
	FROM [TERCER_MALON].[barrio]
GO

-- -----------------------------------------------------
-- -----------------------------------------------------
--					VISTAS
-- -----------------------------------------------------
-- -----------------------------------------------------
CREATE VIEW [TERCER_MALON].[V_Anuncio_Promedio_Publicacion]
AS
	SELECT id_operacion, id_barrio, id_ambiente, cuatrimestre, anio, avg(duracion_publicacion)
	FROM TERCER_MALON.BI_fact_anuncio 
	JOIN TERCER_MALON.BI_tiempo on BI_fact_anuncio.id_tiempo=BI_tiempo.id_tiempo
	--join
	GROUP BY id_operacion, id_barrio, id_ambiente, cuatrimestre, anio
GO

CREATE VIEW [TERCER_MALON].[V_Anuncio_Promedio_Precio]
AS
	SELECT id_operacion, id_tipo_inmueble, id_rango, cuatrimestre, anio, avg(precio_publicado) , id_moneda
	FROM TERCER_MALON.BI_fact_anuncio 
	JOIN TERCER_MALON.BI_tiempo on BI_fact_anuncio.id_tiempo=BI_tiempo.id_tiempo
	--hacer joins
	GROUP BY id_operacion, id_tipo_inmueble, id_rango, cuatrimestre, anio
GO

CREATE VIEW [TERCER_MALON].[V_Alquiler_Barrios_Populares]
AS
	SELECT anio, cuatrimestre, id_rango_etario_inq, --nombrebarrio
		COUNT(id_barrio)
	FROM TERCER_MALON.BI_fact_alquiler
	JOIN TERCER_MALON.BI_tiempo on BI_fact_alquiler.id_tiempo=BI_tiempo.id_tiempo
	--hacer joins
	GROUP BY anio, cuatrimestre, id_rango_etario_inq
GO
