

USE GD2C2023
GO
/* 
 * SCHEMA: TERCER_MALON 
 */

CREATE SCHEMA TERCER_MALON
GO

/* 
 * TABLE: provincia 
 */

CREATE TABLE TERCER_MALON.provincia
(
    id_provincia NUMERIC(18, 0) IDENTITY(1,1)
    ,nombre       NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_provincia PRIMARY KEY NONCLUSTERED (id_provincia)
)

GO


IF OBJECT_ID('TERCER_MALON.provincia') IS NOT NULL
    PRINT '<<< CREATED TABLE provincia >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE provincia >>>'
GO

/* 
 * TABLE: localidad 
 */

CREATE TABLE TERCER_MALON.localidad
(
    id_localidad NUMERIC(18, 0) IDENTITY(1,1)
    ,nombre       NVARCHAR(100)  NULL
    ,id_provincia NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_localidad PRIMARY KEY NONCLUSTERED (id_localidad)
    ,CONSTRAINT FK_provincia_localidad FOREIGN KEY (id_provincia)
    REFERENCES TERCER_MALON.provincia(id_provincia)
)

GO


IF OBJECT_ID('TERCER_MALON.localidad') IS NOT NULL
    PRINT '<<< CREATED TABLE localidad >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE localidad >>>'
GO

/* 
 * TABLE: sucursal 
 */

CREATE TABLE TERCER_MALON.sucursal
(
    cod_sucursal NUMERIC(18, 0) NOT NULL
    ,nombre       NVARCHAR(100)  NOT NULL
    ,direccion    NVARCHAR(100)  NOT NULL
    ,telefono     NVARCHAR(100)  NOT NULL
    ,id_localidad NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_sucursal PRIMARY KEY NONCLUSTERED (cod_sucursal)
    ,CONSTRAINT FK_localidad_sucursal FOREIGN KEY (id_localidad)
    REFERENCES TERCER_MALON.localidad(id_localidad)
)

GO


IF OBJECT_ID('TERCER_MALON.sucursal') IS NOT NULL
    PRINT '<<< CREATED TABLE sucursal >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sucursal >>>'
GO

/* 
 * TABLE: agente 
 */

CREATE TABLE TERCER_MALON.agente
(
    id_agente        NUMERIC(18, 0) IDENTITY(1,1)
    ,nombre           NVARCHAR(100)  NOT NULL
    ,apellido         NVARCHAR(10)   NOT NULL
    ,dni              NUMERIC(18, 0) NOT NULL
    ,fecha_registro   DATETIME       NOT NULL
    ,fecha_nacimiento DATETIME       NOT NULL
    ,telefono         NVARCHAR(100)  NOT NULL
    ,mail             NVARCHAR(100)  NOT NULL
    ,cod_sucursal     NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_agente PRIMARY KEY NONCLUSTERED (id_agente)
    ,CONSTRAINT FK_sucursal_agente FOREIGN KEY (cod_sucursal)
    REFERENCES TERCER_MALON.sucursal(cod_sucursal)
)

GO


IF OBJECT_ID('TERCER_MALON.agente') IS NOT NULL
    PRINT '<<< CREATED TABLE agente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE agente >>>'
GO

/* 
 * TABLE: estado_anuncio 
 */

CREATE TABLE TERCER_MALON.estado_anuncio
(
    id_estado_anuncio NUMERIC(18, 0) IDENTITY(1,1)
    ,tipo              NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_estado_anuncio PRIMARY KEY NONCLUSTERED (id_estado_anuncio)
)

GO


IF OBJECT_ID('TERCER_MALON.estado_anuncio') IS NOT NULL
    PRINT '<<< CREATED TABLE estado_anuncio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE estado_anuncio >>>'
GO

/* 
 * TABLE: ambiente 
 */

CREATE TABLE TERCER_MALON.ambiente
(
    id_ambiente NUMERIC(18, 0) IDENTITY(1,1)
    ,tipo        NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_ambiente PRIMARY KEY NONCLUSTERED (id_ambiente)
)

GO


IF OBJECT_ID('TERCER_MALON.ambiente') IS NOT NULL
    PRINT '<<< CREATED TABLE ambiente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ambiente >>>'
GO

/* 
 * TABLE: barrio 
 */

CREATE TABLE TERCER_MALON.barrio
(
    id_barrio    NUMERIC(18, 0) IDENTITY(1,1)
    ,nombre       NVARCHAR(100)  NOT NULL
    ,id_localidad NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_barrio PRIMARY KEY NONCLUSTERED (id_barrio)
    ,CONSTRAINT FK_localidad_barrio FOREIGN KEY (id_localidad)
    REFERENCES TERCER_MALON.localidad(id_localidad)
)

GO


IF OBJECT_ID('TERCER_MALON.barrio') IS NOT NULL
    PRINT '<<< CREATED TABLE barrio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE barrio >>>'
GO

/* 
 * TABLE: disposicion 
 */

CREATE TABLE TERCER_MALON.disposicion
(
    id_disposicion NUMERIC(18, 0) IDENTITY(1,1)
    ,tipo           NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_disposicion PRIMARY KEY NONCLUSTERED (id_disposicion)
)

GO


IF OBJECT_ID('TERCER_MALON.disposicion') IS NOT NULL
    PRINT '<<< CREATED TABLE disposicion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE disposicion >>>'
GO

/* 
 * TABLE: estado_inmueble 
 */

CREATE TABLE TERCER_MALON.estado_inmueble
(
    id_estado_inm NUMERIC(18, 0) IDENTITY(1,1)
    ,tipo          NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_estado_inmueble PRIMARY KEY NONCLUSTERED (id_estado_inm)
)

GO


IF OBJECT_ID('TERCER_MALON.estado_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE estado_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE estado_inmueble >>>'
GO

/* 
 * TABLE: orientacion 
 */

CREATE TABLE TERCER_MALON.orientacion
(
    id_orientacion NUMERIC(18, 0) IDENTITY(1,1)
    ,tipo           NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_orientacion PRIMARY KEY NONCLUSTERED (id_orientacion)
)

GO


IF OBJECT_ID('TERCER_MALON.orientacion') IS NOT NULL
    PRINT '<<< CREATED TABLE orientacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE orientacion >>>'
GO

/* 
 * TABLE: propietario 
 */

CREATE TABLE TERCER_MALON.propietario
(
    id_propietario   NUMERIC(18, 0) IDENTITY(1,1)
    ,nombre           NVARCHAR(100)  NOT NULL
    ,apellido         NVARCHAR(10)   NOT NULL
    ,dni              NUMERIC(18, 0) NOT NULL
    ,fecha_registro   DATETIME       NOT NULL
    ,fecha_nacimiento DATETIME       NOT NULL
    ,telefono         NVARCHAR(100)  NOT NULL
    ,mail             NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_propietario PRIMARY KEY NONCLUSTERED (id_propietario)
)

GO


IF OBJECT_ID('TERCER_MALON.propietario') IS NOT NULL
    PRINT '<<< CREATED TABLE propietario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE propietario >>>'
GO

/* 
 * TABLE: tipo_inmueble 
 */

CREATE TABLE TERCER_MALON.tipo_inmueble
(
    id_tipo_inmueble NUMERIC(18, 0) IDENTITY(1,1)
    ,tipo             NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_tipo_inmueble PRIMARY KEY NONCLUSTERED (id_tipo_inmueble)
)

GO


IF OBJECT_ID('TERCER_MALON.tipo_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE tipo_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tipo_inmueble >>>'
GO

/* 
 * TABLE: inmueble 
 */

CREATE TABLE TERCER_MALON.inmueble
(
    cod_inmueble     NUMERIC(18, 0) NOT NULL
    ,antiguedad       NUMERIC(18, 0) NOT NULL
    ,descripcion      NVARCHAR(100)  NOT NULL
    ,direccion        NVARCHAR(100)  NOT NULL
    ,superficie_total MONEY          NOT NULL
    ,expensa          MONEY          NOT NULL
    ,nombre           NVARCHAR(100)  NOT NULL
    ,id_tipo_inmueble NUMERIC(18, 0) NOT NULL
    ,id_estado_inm    NUMERIC(18, 0) NOT NULL
    ,id_disposicion   NUMERIC(18, 0) NOT NULL
    ,id_ambiente      NUMERIC(18, 0) NOT NULL
    ,id_orientacion   NUMERIC(18, 0) NOT NULL
    ,id_barrio        NUMERIC(18, 0) NOT NULL
    ,id_propietario   NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_inmueble PRIMARY KEY NONCLUSTERED (cod_inmueble)
    ,CONSTRAINT FK_ambiente_inmueble FOREIGN KEY (id_ambiente)
    REFERENCES TERCER_MALON.ambiente(id_ambiente)
    ,CONSTRAINT FK_barrio_inmueble FOREIGN KEY (id_barrio)
    REFERENCES TERCER_MALON.barrio(id_barrio)
    ,CONSTRAINT FK_disposicion_inmueble FOREIGN KEY (id_disposicion)
    REFERENCES TERCER_MALON.disposicion(id_disposicion)
    ,CONSTRAINT FK_estado_inmueble_inmueble FOREIGN KEY (id_estado_inm)
    REFERENCES TERCER_MALON.estado_inmueble(id_estado_inm)
    ,CONSTRAINT FK_orientacion_inmueble FOREIGN KEY (id_orientacion)
    REFERENCES TERCER_MALON.orientacion(id_orientacion)
    ,CONSTRAINT FK_propietario_inmueble FOREIGN KEY (id_propietario)
    REFERENCES TERCER_MALON.propietario(id_propietario)
    ,CONSTRAINT FK_tipo_inmueble_inmueble FOREIGN KEY (id_tipo_inmueble)
    REFERENCES TERCER_MALON.tipo_inmueble(id_tipo_inmueble)
)

GO


IF OBJECT_ID('TERCER_MALON.inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE inmueble >>>'
GO

/* 
 * TABLE: moneda 
 */

CREATE TABLE TERCER_MALON.moneda
(
    id_moneda NUMERIC(18, 0) IDENTITY(1,1)
    ,simbolo   NVARCHAR(100)  NOT NULL
    ,nombre    NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_moneda PRIMARY KEY NONCLUSTERED (id_moneda)
)

GO


IF OBJECT_ID('TERCER_MALON.moneda') IS NOT NULL
    PRINT '<<< CREATED TABLE moneda >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE moneda >>>'
GO

/* 
 * TABLE: operacion 
 */

CREATE TABLE TERCER_MALON.operacion
(
    id_operacion NUMERIC(18, 0) IDENTITY(1,1)
    ,tipo         NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_operacion PRIMARY KEY NONCLUSTERED (id_operacion)
)

GO


IF OBJECT_ID('TERCER_MALON.operacion') IS NOT NULL
    PRINT '<<< CREATED TABLE operacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE operacion >>>'
GO

/* 
 * TABLE: periodo 
 */

CREATE TABLE TERCER_MALON.periodo
(
    id_periodo NUMERIC(18, 0) IDENTITY(1,1)
    ,tipo       NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_periodo PRIMARY KEY NONCLUSTERED (id_periodo)
)

GO


IF OBJECT_ID('TERCER_MALON.periodo') IS NOT NULL
    PRINT '<<< CREATED TABLE periodo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE periodo >>>'
GO

/* 
 * TABLE: anuncio 
 */

CREATE TABLE TERCER_MALON.anuncio
(
    cod_anuncio       NUMERIC(19, 0) NOT NULL
    ,precio_publicado  NUMERIC(18, 2) NULL
    ,fecha_publicacion DATETIME       NOT NULL
    ,fecha_fin         DATETIME       NOT NULL
    ,costo_anuncio     NUMERIC(18, 2) NULL
    ,id_operacion      NUMERIC(18, 0) NOT NULL
    ,id_periodo        NUMERIC(18, 0) NOT NULL
    ,id_estado_anuncio NUMERIC(18, 0) NOT NULL
    ,id_moneda         NUMERIC(18, 0) NOT NULL
    ,cod_inmueble      NUMERIC(18, 0) NOT NULL
    ,id_agente         NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_anuncio PRIMARY KEY NONCLUSTERED (cod_anuncio)
    ,CONSTRAINT FK_agente_anuncio FOREIGN KEY (id_agente)
    REFERENCES TERCER_MALON.agente(id_agente)
    ,CONSTRAINT FK_estado_anuncio_anuncio FOREIGN KEY (id_estado_anuncio)
    REFERENCES TERCER_MALON.estado_anuncio(id_estado_anuncio)
    ,CONSTRAINT FK_inmueble_anuncio FOREIGN KEY (cod_inmueble)
    REFERENCES TERCER_MALON.inmueble(cod_inmueble)
    ,CONSTRAINT FK_moneda_anuncio FOREIGN KEY (id_moneda)
    REFERENCES TERCER_MALON.moneda(id_moneda)
    ,CONSTRAINT FK_operacion_anuncio FOREIGN KEY (id_operacion)
    REFERENCES TERCER_MALON.operacion(id_operacion)
    ,CONSTRAINT FK_periodo_anuncio FOREIGN KEY (id_periodo)
    REFERENCES TERCER_MALON.periodo(id_periodo)
)

GO


IF OBJECT_ID('TERCER_MALON.anuncio') IS NOT NULL
    PRINT '<<< CREATED TABLE anuncio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE anuncio >>>'
GO

/* 
 * TABLE: estado_alquiler 
 */

CREATE TABLE TERCER_MALON.estado_alquiler
(
    id_estado_alquiler NUMERIC(18, 0) IDENTITY(1,1)
    ,tipo               NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_estado_alquiler PRIMARY KEY NONCLUSTERED (id_estado_alquiler)
)

GO


IF OBJECT_ID('TERCER_MALON.estado_alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE estado_alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE estado_alquiler >>>'
GO

/* 
 * TABLE: inquilino 
 */

CREATE TABLE TERCER_MALON.inquilino
(
    id_inquilino     NUMERIC(18, 0) IDENTITY(1,1)
    ,nombre           NVARCHAR(100)  NOT NULL
    ,apellido         NVARCHAR(10)   NOT NULL
    ,dni              NUMERIC(18, 0) NOT NULL
    ,fecha_registro   DATETIME       NOT NULL
    ,fecha_nacimiento DATETIME       NOT NULL
    ,telefono         NVARCHAR(100)  NOT NULL
    ,mail             NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_inquilino PRIMARY KEY NONCLUSTERED (id_inquilino)
)

GO


IF OBJECT_ID('TERCER_MALON.inquilino') IS NOT NULL
    PRINT '<<< CREATED TABLE inquilino >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE inquilino >>>'
GO

/* 
 * TABLE: alquiler 
 */

CREATE TABLE TERCER_MALON.alquiler
(
    cod_alquiler       NUMERIC(18, 0) NOT NULL
    ,fecha_inicio       DATETIME       NOT NULL
    ,fecha_fin          DATETIME       NOT NULL
    ,cant_periodos      NUMERIC(18, 0) NOT NULL
    ,deposito           NUMERIC(18, 2) NOT NULL
    ,comision           NUMERIC(18, 2) NOT NULL
    ,gastos_averig      NUMERIC(18, 2) NOT NULL
    ,cod_anuncio        NUMERIC(19, 0) NOT NULL
    ,id_inquilino       NUMERIC(18, 0) NOT NULL
    ,id_estado_alquiler NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_alquiler PRIMARY KEY NONCLUSTERED (cod_alquiler)
    ,CONSTRAINT FK_anuncio_alquiler FOREIGN KEY (cod_anuncio)
    REFERENCES TERCER_MALON.anuncio(cod_anuncio)
    ,CONSTRAINT FK_estado_alquiler_alquiler FOREIGN KEY (id_estado_alquiler)
    REFERENCES TERCER_MALON.estado_alquiler(id_estado_alquiler)
    ,CONSTRAINT FK_inquilino_alquiler FOREIGN KEY (id_inquilino)
    REFERENCES TERCER_MALON.inquilino(id_inquilino)
)

GO


IF OBJECT_ID('TERCER_MALON.alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE alquiler >>>'
GO

/* 
 * TABLE: caracteristica 
 */

CREATE TABLE TERCER_MALON.caracteristica
(
    id_caracteristica NUMERIC(18, 0) IDENTITY(1,1)
    ,nombre            NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_caracteristica PRIMARY KEY NONCLUSTERED (id_caracteristica)
)

GO


IF OBJECT_ID('TERCER_MALON.caracteristica') IS NOT NULL
    PRINT '<<< CREATED TABLE caracteristica >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE caracteristica >>>'
GO

/* 
 * TABLE: caracteristica_x_inmueble 
 */

CREATE TABLE TERCER_MALON.caracteristica_x_inmueble
(
    id_caracteristica NUMERIC(18, 0) NOT NULL
    ,cod_inmueble      NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_caracteristica_x_inmueble PRIMARY KEY NONCLUSTERED (id_caracteristica, cod_inmueble)
    ,CONSTRAINT FK_caracteristica_caracteristica_x_inmueble FOREIGN KEY (id_caracteristica)
    REFERENCES TERCER_MALON.caracteristica(id_caracteristica)
    ,CONSTRAINT FK_inmueble_caracteristica_x_inmueble FOREIGN KEY (cod_inmueble)
    REFERENCES TERCER_MALON.inmueble(cod_inmueble)
)

GO


IF OBJECT_ID('TERCER_MALON.caracteristica_x_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE caracteristica_x_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE caracteristica_x_inmueble >>>'
GO

/* 
 * TABLE: comprador 
 */

CREATE TABLE TERCER_MALON.comprador
(
    id_comprador     NUMERIC(18, 0) IDENTITY(1,1)
    ,nombre           NVARCHAR(100)  NOT NULL
    ,apellido         NVARCHAR(10)   NOT NULL
    ,dni              NUMERIC(18, 0) NOT NULL
    ,fecha_registro   DATETIME       NOT NULL
    ,fecha_nacimiento DATETIME       NOT NULL
    ,telefono         NVARCHAR(100)  NOT NULL
    ,mail             NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_comprador PRIMARY KEY NONCLUSTERED (id_comprador)
)

GO


IF OBJECT_ID('TERCER_MALON.comprador') IS NOT NULL
    PRINT '<<< CREATED TABLE comprador >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE comprador >>>'
GO

/* 
 * TABLE: detalle_alquiler 
 */

CREATE TABLE TERCER_MALON.detalle_alquiler
(
    cod_detalle_alq NUMERIC(18, 0) IDENTITY(1,1)
    ,periodo_inicio  DATETIME       NOT NULL
    ,periodo_fin     DATETIME       NOT NULL
    ,precio          NUMERIC(18, 2) NOT NULL
    ,cod_alquiler    NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_detalle_alquiler PRIMARY KEY NONCLUSTERED (cod_detalle_alq)
    ,CONSTRAINT FK_alquiler_detalle_alquiler FOREIGN KEY (cod_alquiler)
    REFERENCES TERCER_MALON.alquiler(cod_alquiler)
)

GO


IF OBJECT_ID('TERCER_MALON.detalle_alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE detalle_alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE detalle_alquiler >>>'
GO

/* 
 * TABLE: medio_pago 
 */

CREATE TABLE TERCER_MALON.medio_pago
(
    id_medio_pago NUMERIC(18, 0) IDENTITY(1,1)
    ,nombre        NVARCHAR(100)  NOT NULL
    ,CONSTRAINT PK_medio_pago PRIMARY KEY NONCLUSTERED (id_medio_pago)
)

GO


IF OBJECT_ID('TERCER_MALON.medio_pago') IS NOT NULL
    PRINT '<<< CREATED TABLE medio_pago >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE medio_pago >>>'
GO

/* 
 * TABLE: pago_alquiler 
 */

CREATE TABLE TERCER_MALON.pago_alquiler
(
    cod_pago_alquiler    NUMERIC(18, 0) NOT NULL
    ,fecha                DATETIME       NOT NULL
    ,nro_periodo          NUMERIC(18, 0) NOT NULL
    ,descripcion_periodo  NVARCHAR(100)  NOT NULL
    ,fecha_inicio_periodo DATETIME       NOT NULL
    ,fecha_fin_periodo    DATETIME       NOT NULL
    ,importe              NUMERIC(18, 2) NOT NULL
    ,id_medio_pago        NUMERIC(18, 0) NOT NULL
    ,cod_alquiler         NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_pago_alquiler PRIMARY KEY NONCLUSTERED (cod_pago_alquiler)
    ,CONSTRAINT FK_alquiler_pago_alquiler FOREIGN KEY (cod_alquiler)
    REFERENCES TERCER_MALON.alquiler(cod_alquiler)
    ,CONSTRAINT FK_medio_pago_pago_alquiler FOREIGN KEY (id_medio_pago)
    REFERENCES TERCER_MALON.medio_pago(id_medio_pago)
)

GO


IF OBJECT_ID('TERCER_MALON.pago_alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE pago_alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE pago_alquiler >>>'
GO

/* 
 * TABLE: venta 
 */

CREATE TABLE TERCER_MALON.venta
(
    cod_venta    NUMERIC(18, 0) NOT NULL
    ,fecha        DATETIME       NOT NULL
    ,precio       NUMERIC(18, 2) NOT NULL
    ,comision     NUMERIC(18, 2) NOT NULL
    ,cod_anuncio  NUMERIC(19, 0) NOT NULL
    ,id_comprador NUMERIC(18, 0) NOT NULL
    ,id_moneda    NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_venta PRIMARY KEY NONCLUSTERED (cod_venta)
    ,CONSTRAINT FK_anuncio_venta FOREIGN KEY (cod_anuncio)
    REFERENCES TERCER_MALON.anuncio(cod_anuncio)
    ,CONSTRAINT FK_comprador_venta FOREIGN KEY (id_comprador)
    REFERENCES TERCER_MALON.comprador(id_comprador)
    ,CONSTRAINT FK_moneda_venta FOREIGN KEY (id_moneda)
    REFERENCES TERCER_MALON.moneda(id_moneda)
)

GO


IF OBJECT_ID('TERCER_MALON.venta') IS NOT NULL
    PRINT '<<< CREATED TABLE venta >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE venta >>>'
GO

/* 
 * TABLE: pago_venta 
 */

CREATE TABLE TERCER_MALON.pago_venta
(
    cod_pago_venta    NUMERIC(18, 0) IDENTITY(1,1)
    ,importe           NUMERIC(18, 2) NOT NULL
    ,cotizacion_actual NUMERIC(18, 2) NOT NULL
    ,cod_venta         NUMERIC(18, 0) NOT NULL
    ,id_medio_pago     NUMERIC(18, 0) NOT NULL
    ,id_moneda         NUMERIC(18, 0) NOT NULL
    ,CONSTRAINT PK_pago_venta PRIMARY KEY NONCLUSTERED (cod_pago_venta)
    ,CONSTRAINT FK_medio_pago_pago_venta FOREIGN KEY (id_medio_pago)
    REFERENCES TERCER_MALON.medio_pago(id_medio_pago)
    ,CONSTRAINT FK_moneda_pago_venta FOREIGN KEY (id_moneda)
    REFERENCES TERCER_MALON.moneda(id_moneda)
    ,CONSTRAINT FK_venta_pago_venta FOREIGN KEY (cod_venta)
    REFERENCES TERCER_MALON.venta(cod_venta)
)

GO


IF OBJECT_ID('TERCER_MALON.pago_venta') IS NOT NULL
    PRINT '<<< CREATED TABLE pago_venta >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE pago_venta >>>'
GO

--------------------------------------
------------ PROCEDURES --------------
--------------------------------------

IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarTipoInmueble')
DROP PROCEDURE TERCER_MALON.MigrarTipoInmueble
GO

CREATE PROCEDURE TERCER_MALON.MigrarTipoInmueble
AS
INSERT INTO TERCER_MALON.tipo_inmueble
SELECT
    DISTINCT
    INMUEBLE_TIPO_INMUEBLE
FROM
    gd_esquema.Maestra
WHERE INMUEBLE_TIPO_INMUEBLE IS NOT NULL
ORDER BY 1
GO

-----------------------

IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarMedioPago')
DROP PROCEDURE TERCER_MALON.MigrarMedioPago
GO

CREATE PROCEDURE TERCER_MALON.MigrarMedioPago
AS
INSERT INTO TERCER_MALON.medio_pago
    SELECT
        DISTINCT
        PAGO_ALQUILER_MEDIO_PAGO AS medio_pago
    FROM
        gd_esquema.Maestra
    WHERE PAGO_ALQUILER_MEDIO_PAGO IS NOT NULL
UNION
    SELECT
        DISTINCT
        PAGO_VENTA_MEDIO_PAGO
    FROM
        gd_esquema.Maestra
    WHERE PAGO_VENTA_MEDIO_PAGO IS NOT NULL
ORDER BY 1
GO

-------------------

IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarEstadoAnuncio')
DROP PROCEDURE TERCER_MALON.MigrarEstadoAnuncio
GO

CREATE PROCEDURE TERCER_MALON.MigrarEstadoAnuncio
AS
INSERT INTO TERCER_MALON.estado_anuncio
SELECT
    DISTINCT
    ANUNCIO_ESTADO
FROM
    gd_esquema.Maestra
WHERE ANUNCIO_ESTADO IS NOT NULL
ORDER BY 1
GO

--------------------

IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarEstadoAlquiler')
DROP PROCEDURE TERCER_MALON.MigrarEstadoAlquiler
GO

CREATE PROCEDURE TERCER_MALON.MigrarEstadoAlquiler
AS
INSERT INTO TERCER_MALON.estado_alquiler
SELECT
    DISTINCT
    ALQUILER_ESTADO
FROM
    gd_esquema.Maestra
WHERE ALQUILER_ESTADO IS NOT NULL
ORDER BY 1
GO

------------------------

IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarOperacion')
DROP PROCEDURE TERCER_MALON.MigrarOperacion
GO

CREATE PROCEDURE TERCER_MALON.MigrarOperacion
AS
INSERT INTO TERCER_MALON.operacion
SELECT
    SUBSTRING(ANUNCIO_TIPO_OPERACION, LEN('Tipo Operacion')+2,30)
FROM
    gd_esquema.Maestra
WHERE ANUNCIO_TIPO_OPERACION IS NOT NULL
GROUP BY ANUNCIO_TIPO_OPERACION
ORDER BY 1
GO

-----------------------

IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarAmbiente')
DROP PROCEDURE TERCER_MALON.MigrarAmbiente
GO

CREATE PROCEDURE TERCER_MALON.MigrarAmbiente
AS
INSERT INTO TERCER_MALON.ambiente
SELECT
    DISTINCT
    INMUEBLE_CANT_AMBIENTES
FROM
    gd_esquema.Maestra
WHERE INMUEBLE_CANT_AMBIENTES IS NOT NULL
ORDER BY 1
GO

-------------------------------------------

IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarProvincia')
DROP PROCEDURE TERCER_MALON.MigrarProvincia
GO

CREATE PROCEDURE TERCER_MALON.MigrarProvincia
AS
BEGIN
    INSERT INTO TERCER_MALON.provincia
        (
        nombre
        )
    SELECT
        DISTINCT
        M.INMUEBLE_PROVINCIA
    FROM
        gd_esquema.Maestra M
    WHERE M.INMUEBLE_PROVINCIA IS NOT NULL
    ORDER BY 1
END
GO
-------------------------------------------------------

IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarLocalidad')
DROP PROCEDURE TERCER_MALON.MigrarLocalidad
GO

CREATE PROCEDURE TERCER_MALON.MigrarLocalidad
AS
BEGIN
    INSERT INTO TERCER_MALON.localidad
        (
        nombre,
        id_provincia
        )

            SELECT
            M.INMUEBLE_LOCALIDAD
            ,P.id_provincia
        FROM
            gd_esquema.Maestra M
            JOIN TERCER_MALON.provincia P ON P.nombre = M.INMUEBLE_PROVINCIA
        WHERE
             M.INMUEBLE_LOCALIDAD IS NOT NULL
    UNION
        SELECT
            M.SUCURSAL_LOCALIDAD
            ,P.id_provincia
        FROM
            gd_esquema.Maestra M
            JOIN TERCER_MALON.provincia P ON P.nombre = M.SUCURSAL_PROVINCIA
        WHERE
             M.SUCURSAL_LOCALIDAD IS NOT NULL
    ORDER BY 1
END
GO
-------------------------------------------
IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarBarrio')
DROP PROCEDURE TERCER_MALON.MigrarBarrio
GO

CREATE PROCEDURE TERCER_MALON.MigrarBarrio
AS
BEGIN
    INSERT INTO TERCER_MALON.barrio
        (
        nombre,
        id_localidad
        )
    SELECT
        DISTINCT
        M.INMUEBLE_BARRIO
        ,L.id_localidad
    FROM
        gd_esquema.Maestra M
        JOIN TERCER_MALON.localidad L ON L.nombre = M.INMUEBLE_LOCALIDAD
    WHERE
             M.INMUEBLE_LOCALIDAD IS NOT NULL
END
GO
----------------------------------------------
IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarSucursal')
DROP PROCEDURE TERCER_MALON.MigrarSucursal
GO

CREATE PROCEDURE TERCER_MALON.MigrarSucursal
AS
BEGIN
    INSERT INTO TERCER_MALON.sucursal
        (
        cod_sucursal,
        nombre,
        direccion,
        telefono,
        id_localidad
        )
    SELECT
        DISTINCT
        M.SUCURSAL_CODIGO
        ,M.SUCURSAL_NOMBRE
        ,M.SUCURSAL_DIRECCION
        ,M.SUCURSAL_TELEFONO
        ,L.id_localidad
    FROM
        gd_esquema.Maestra M
        JOIN TERCER_MALON.localidad L ON L.nombre = M.SUCURSAL_LOCALIDAD
END
GO
-------------------------------------------------
IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarMoneda')
DROP PROCEDURE TERCER_MALON.MigrarMoneda
GO

CREATE PROCEDURE TERCER_MALON.MigrarMoneda
AS
BEGIN
    INSERT INTO TERCER_MALON.moneda
        (
        nombre,
        simbolo
        )
                SELECT
            M.ANUNCIO_MONEDA
            ,CASE WHEN M.ANUNCIO_MONEDA = 'Moneda Pesos' THEN '$'
			ELSE 'U$D'
			END
        FROM
            gd_esquema.Maestra M
        WHERE M.ANUNCIO_MONEDA IS NOT NULL
    UNION
        SELECT
            M.PAGO_VENTA_MONEDA
            ,CASE WHEN M.PAGO_VENTA_MONEDA = 'Moneda Pesos' THEN '$'
			ELSE 'U$D'
			END
        FROM
            gd_esquema.Maestra M
        WHERE M.PAGO_VENTA_MONEDA IS NOT NULL
    UNION
        SELECT
            M.VENTA_MONEDA
            ,CASE WHEN M.VENTA_MONEDA = 'Moneda Pesos' THEN '$'
			ELSE 'U$D'
			END
        FROM
            gd_esquema.Maestra M
        WHERE M.VENTA_MONEDA IS NOT NULL
END
GO

---------------------------------------------
IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarAgente')
DROP PROCEDURE TERCER_MALON.MigrarAgente
GO

CREATE PROCEDURE TERCER_MALON.MigrarAgente
AS
BEGIN
    INSERT INTO TERCER_MALON.agente
        (
        nombre,
        apellido,
        dni,
        fecha_registro,
        fecha_nacimiento,
        telefono,
        mail,
        cod_sucursal
        )
    SELECT
        DISTINCT
        M.AGENTE_NOMBRE
        ,M.AGENTE_APELLIDO
        ,M.AGENTE_DNI
        ,M.AGENTE_FECHA_REGISTRO
        ,M.AGENTE_FECHA_NAC
        ,M.AGENTE_TELEFONO
        ,M.AGENTE_MAIL
        ,S.cod_sucursal
    FROM
        gd_esquema.Maestra M
        JOIN TERCER_MALON.sucursal S ON S.cod_sucursal = M.SUCURSAL_CODIGO
END
GO

---------------------------------------------
CREATE PROCEDURE TERCER_MALON.MigrarCaracteristica
AS
BEGIN
    INSERT INTO GD2C2023.TERCER_MALON.caracteristica
        (nombre)
    VALUES
        ('CABLE')
        ,('WIFI')
        ,('GAS')
        ,('CALEFACCION');
END
GO

---------------------------------------------
CREATE PROCEDURE TERCER_MALON.MigrarOrientacion
AS
BEGIN
    INSERT INTO GD2C2023.TERCER_MALON.orientacion
        (tipo)
    SELECT
        DISTINCT
        INMUEBLE_ORIENTACION
    FROM
        GD2C2023.gd_esquema.Maestra
    WHERE INMUEBLE_ORIENTACION IS NOT NULL;
END
GO

CREATE PROCEDURE TERCER_MALON.MigrarDisposicion
AS
BEGIN
    INSERT INTO GD2C2023.TERCER_MALON.disposicion
        (tipo)
    SELECT
        DISTINCT
        INMUEBLE_DISPOSICION
    FROM
        GD2C2023.gd_esquema.Maestra
    WHERE INMUEBLE_DISPOSICION IS NOT NULL;
END
GO

CREATE PROCEDURE TERCER_MALON.MigrarEstadoInmueble
AS
BEGIN
    INSERT INTO GD2C2023.TERCER_MALON.estado_inmueble
        (tipo)
    SELECT
        DISTINCT
        INMUEBLE_ESTADO
    FROM
        GD2C2023.gd_esquema.Maestra
    WHERE INMUEBLE_ESTADO IS NOT NULL;
END
GO

CREATE PROCEDURE TERCER_MALON.MigrarPeriodo
AS
BEGIN
    INSERT INTO TERCER_MALON.periodo
        (tipo)
    SELECT
        DISTINCT
        M.ANUNCIO_TIPO_PERIODO
    FROM
        gd_esquema.Maestra M
    WHERE M.ANUNCIO_TIPO_PERIODO IS NOT NULL;
END
GO

CREATE PROCEDURE TERCER_MALON.MigrarInmueble
AS
BEGIN
    INSERT INTO TERCER_MALON.inmueble
    SELECT
        DISTINCT
        M.INMUEBLE_CODIGO
        ,M.INMUEBLE_ANTIGUEDAD
        ,M.INMUEBLE_DESCRIPCION
        ,M.INMUEBLE_DIRECCION
        ,M.INMUEBLE_SUPERFICIETOTAL
        ,M.INMUEBLE_EXPESAS
        ,M.INMUEBLE_NOMBRE
        ,(SELECT
            id_tipo_inmueble
        FROM
            TERCER_MALON.tipo_inmueble
        WHERE tipo=M.INMUEBLE_TIPO_INMUEBLE) AS tipo_inmueble
        ,(SELECT
            id_estado_inm
        FROM
            TERCER_MALON.estado_inmueble
        WHERE tipo=M.INMUEBLE_ESTADO) AS estado_inmueble
        ,(SELECT
            id_disposicion
        FROM
            TERCER_MALON.disposicion
        WHERE tipo=M.INMUEBLE_DISPOSICION) AS disposicion
        ,(SELECT
            id_ambiente
        FROM
            TERCER_MALON.ambiente
        WHERE tipo=M.INMUEBLE_CANT_AMBIENTES) AS ambiente
        ,(SELECT
            id_orientacion
        FROM
            TERCER_MALON.orientacion
        WHERE tipo=M.INMUEBLE_ORIENTACION) AS orientacion
        ,(SELECT
            id_barrio
        FROM
            TERCER_MALON.barrio
            JOIN TERCER_MALON.localidad ON barrio.id_localidad = localidad.id_localidad
            JOIN TERCER_MALON.provincia ON provincia.id_provincia = localidad.id_provincia
        WHERE barrio.nombre=M.INMUEBLE_BARRIO AND localidad.nombre=M.INMUEBLE_LOCALIDAD AND provincia.nombre=INMUEBLE_PROVINCIA) AS barrio
        ,(SELECT
            id_propietario
        FROM
            TERCER_MALON.propietario
        WHERE nombre=M.PROPIETARIO_NOMBRE AND dni=M.PROPIETARIO_DNI) AS propietario
    FROM
        gd_esquema.Maestra M
    WHERE M.INMUEBLE_CODIGO IS NOT NULL
    ORDER BY 1
END
GO

CREATE PROCEDURE TERCER_MALON.MigrarCaracteristicaXInmueble
AS
BEGIN

    INSERT INTO TERCER_MALON.caracteristica_x_inmueble
        (cod_inmueble
        ,id_caracteristica)
    SELECT
        DISTINCT
        (SELECT
            cod_inmueble
        --PODRIA SIMPLEMENTE PONER EL CODIGO, PERO NO DEBERÍA ESCRBIR UN CODIGO QUE NO EXISTA EN LA BASE DE DATOS A MIGRADA.
        FROM
            TERCER_MALON.inmueble
        WHERE cod_inmueble=INMUEBLE_CODIGO)
        ,(SELECT
            id_caracteristica
        FROM
            TERCER_MALON.caracteristica
        WHERE nombre=SUBSTRING(CARACTERISTICA, LEN('INMUEBLE_CARACTERISTICA_')+1,15))
    FROM
        gd_esquema.Maestra M
	UNPIVOT
	   (Value FOR CARACTERISTICA IN 
		  (INMUEBLE_CARACTERISTICA_CABLE, INMUEBLE_CARACTERISTICA_CALEFACCION, INMUEBLE_CARACTERISTICA_GAS, INMUEBLE_CARACTERISTICA_WIFI)
	)AS unpvt
    WHERE INMUEBLE_CODIGO IS NOT NULL AND Value=1
    ORDER BY 1, 2;
END
GO

CREATE PROCEDURE TERCER_MALON.MigrarAnuncio
AS
BEGIN
    INSERT INTO TERCER_MALON.anuncio
        (cod_anuncio
        ,precio_publicado
        ,fecha_publicacion
        ,fecha_fin
        ,costo_anuncio
        ,id_operacion
        ,id_periodo
        ,id_estado_anuncio
        ,id_moneda
        ,cod_inmueble
        ,id_agente)
    SELECT
        DISTINCT
        M.ANUNCIO_CODIGO
        ,M.ANUNCIO_PRECIO_PUBLICADO
        ,M.ANUNCIO_FECHA_PUBLICACION
        ,M.ANUNCIO_FECHA_FINALIZACION
        ,M.ANUNCIO_COSTO_ANUNCIO
        ,(SELECT
            id_operacion
        FROM
            TERCER_MALON.operacion
        WHERE tipo=SUBSTRING(M.ANUNCIO_TIPO_OPERACION, LEN('Tipo Operacion')+2,30)) AS operacion
        ,(SELECT
            id_periodo
        FROM
            TERCER_MALON.periodo
        WHERE tipo=M.ANUNCIO_TIPO_PERIODO) AS periodo
        ,(SELECT
            id_estado_anuncio
        FROM
            TERCER_MALON.estado_anuncio
        WHERE tipo=M.ANUNCIO_ESTADO) AS estado_anuncio
        ,(SELECT
            id_moneda
        FROM
            TERCER_MALON.moneda
        WHERE nombre=M.ANUNCIO_MONEDA) AS moneda
        ,(SELECT
            cod_inmueble
        FROM
            TERCER_MALON.inmueble
        WHERE cod_inmueble=M.INMUEBLE_CODIGO) AS inmueble
        ,(SELECT
            id_agente
        FROM
            TERCER_MALON.agente
        WHERE nombre=M.AGENTE_NOMBRE AND dni=M.AGENTE_DNI) AS agente
    FROM
        gd_esquema.Maestra M
    WHERE M.ANUNCIO_CODIGO IS NOT NULL AND M.INMUEBLE_CODIGO IS NOT NULL
    ORDER BY 1
END
GO

IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarAlquiler')
DROP PROCEDURE TERCER_MALON.MigrarAlquiler
GO
CREATE PROCEDURE TERCER_MALON.MigrarAlquiler
AS
BEGIN
    INSERT INTO TERCER_MALON.alquiler
        (
        cod_alquiler ,
        fecha_inicio ,
        fecha_fin ,
        deposito ,
        cant_periodos ,
        comision ,
        gastos_averig ,
        id_inquilino ,
        cod_anuncio ,
        id_estado_alquiler
        )
    SELECT
        DISTINCT
        ALQUILER_CODIGO
        ,ALQUILER_FECHA_INICIO
        ,ALQUILER_FECHA_FIN
        ,ALQUILER_DEPOSITO
        ,ALQUILER_CANT_PERIODOS
        ,ALQUILER_COMISION
        ,ALQUILER_GASTOS_AVERIGUA
        ,(
            SELECT
            id_inquilino
        FROM
            TERCER_MALON.inquilino
        WHERE TERCER_MALON.inquilino.nombre = INQUILINO_NOMBRE AND TERCER_MALON.inquilino.dni = INQUILINO_DNI
        )
        ,(   
            SELECT
            cod_anuncio
        --PODRIA SIMPLEMENTE PONER EL CODIGO, PERO NO DEBERÍA ESCRBIR UN CODIGO QUE NO EXISTA EN LA BASE DE DATOS A MIGRADA.
        FROM
            TERCER_MALON.ANUNCIO
        WHERE TERCER_MALON.anuncio.cod_anuncio = GD2C2023.gd_esquema.Maestra.ANUNCIO_CODIGO 
        )
        ,(
            SELECT
            id_estado_alquiler
        FROM
            GD2C2023.TERCER_MALON.estado_alquiler
        WHERE tipo = GD2C2023.gd_esquema.Maestra.ALQUILER_ESTADO
        )
    FROM
        GD2C2023.gd_esquema.Maestra
    WHERE ALQUILER_CODIGO IS NOT NULL;
END
GO

CREATE PROCEDURE TERCER_MALON.MigrarVenta
AS
BEGIN
    INSERT INTO TERCER_MALON.venta
        (cod_venta
        ,fecha
        ,precio
        ,comision
        ,cod_anuncio
        ,id_comprador
        ,id_moneda)
    SELECT
        DISTINCT
        M.VENTA_CODIGO
        ,M.VENTA_FECHA
        ,M.VENTA_PRECIO_VENTA
        ,M.VENTA_COMISION
        ,(   
            SELECT
            cod_anuncio
        --PODRIA SIMPLEMENTE PONER EL CODIGO, PERO NO DEBERÍA ESCRBIR UN CODIGO QUE NO EXISTA EN LA BASE DE DATOS A MIGRADA. t
        FROM
            TERCER_MALON.anuncio
        WHERE cod_anuncio = M.ANUNCIO_CODIGO 
        ) AS cod_anuncio
        ,(
            SELECT
            id_comprador
        FROM
            TERCER_MALON.comprador
        WHERE TERCER_MALON.comprador.nombre = M.COMPRADOR_NOMBRE AND TERCER_MALON.comprador.dni = M.COMPRADOR_DNI
        ) AS id_comprador
        ,(
            SELECT
            id_moneda
        FROM
            TERCER_MALON.moneda
        WHERE TERCER_MALON.moneda.nombre = M.VENTA_MONEDA 
        ) AS id_moneda
    FROM
        gd_esquema.Maestra M
    WHERE VENTA_CODIGO IS NOT NULL
END
GO

---------------------------------------------
IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarPropietario')
DROP PROCEDURE TERCER_MALON.MigrarPropietario
GO

CREATE PROCEDURE TERCER_MALON.MigrarPropietario
AS
BEGIN
    INSERT INTO TERCER_MALON.propietario
        (
        nombre,
        apellido,
        dni,
        fecha_registro,
        fecha_nacimiento,
        telefono,
        mail
        )
    SELECT
        DISTINCT
        M.PROPIETARIO_NOMBRE
        ,M.PROPIETARIO_APELLIDO
        ,M.PROPIETARIO_DNI
        ,M.PROPIETARIO_FECHA_REGISTRO
        ,M.PROPIETARIO_FECHA_NAC
        ,M.PROPIETARIO_TELEFONO
        ,M.PROPIETARIO_MAIL
    FROM
        gd_esquema.Maestra M
    WHERE M.PROPIETARIO_DNI IS NOT NULL
END
GO
---------------------------------------------
IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarInquilino')
DROP PROCEDURE TERCER_MALON.MigrarInquilino
GO

CREATE PROCEDURE TERCER_MALON.MigrarInquilino
AS
BEGIN
    INSERT INTO TERCER_MALON.inquilino
        (
        nombre,
        apellido,
        dni,
        fecha_registro,
        fecha_nacimiento,
        telefono,
        mail
        )
    SELECT
        DISTINCT
        M.INQUILINO_NOMBRE
        ,M.INQUILINO_APELLIDO
        ,M.INQUILINO_DNI
        ,M.INQUILINO_FECHA_REGISTRO
        ,M.INQUILINO_FECHA_NAC
        ,M.INQUILINO_TELEFONO
        ,M.INQUILINO_MAIL
    FROM
        gd_esquema.Maestra M
    WHERE M.INQUILINO_DNI IS NOT NULL
END
GO
---------------------------------------------
IF EXISTS (SELECT
    *
FROM
    sys.objects
WHERE name = 'MigrarComprador')
DROP PROCEDURE TERCER_MALON.MigrarComprador
GO

CREATE PROCEDURE TERCER_MALON.MigrarComprador
AS
BEGIN
    INSERT INTO TERCER_MALON.comprador
        (
        nombre,
        apellido,
        dni,
        fecha_registro,
        fecha_nacimiento,
        telefono,
        mail
        )
    SELECT
        DISTINCT
        M.COMPRADOR_NOMBRE
        ,M.COMPRADOR_APELLIDO
        ,M.COMPRADOR_DNI
        ,M.COMPRADOR_FECHA_REGISTRO
        ,M.COMPRADOR_FECHA_NAC
        ,M.COMPRADOR_TELEFONO
        ,M.COMPRADOR_MAIL
    FROM
        gd_esquema.Maestra M
    WHERE M.COMPRADOR_DNI IS NOT NULL
END
GO

CREATE PROCEDURE TERCER_MALON.MigrarPagoAlquiler
AS
BEGIN
    INSERT INTO TERCER_MALON.pago_alquiler
        (cod_pago_alquiler
        ,fecha
        ,nro_periodo
        ,descripcion_periodo
        ,fecha_inicio_periodo
        ,fecha_fin_periodo
        ,importe
        ,id_medio_pago
        ,cod_alquiler)
    SELECT
        DISTINCT
        M.PAGO_ALQUILER_CODIGO
        ,M.PAGO_ALQUILER_FECHA
        ,M.PAGO_ALQUILER_NRO_PERIODO
        ,M.PAGO_ALQUILER_DESC
        ,M.PAGO_ALQUILER_FEC_INI
        ,M.PAGO_ALQUILER_FEC_FIN
        ,M.PAGO_ALQUILER_IMPORTE
        ,(SELECT
            id_medio_pago
        FROM
            TERCER_MALON.medio_pago
        WHERE nombre=M.PAGO_ALQUILER_MEDIO_PAGO) AS id_medio_pago
        ,(SELECT
            cod_alquiler
        FROM
            TERCER_MALON.alquiler
        WHERE cod_alquiler=M.ALQUILER_CODIGO) AS cod_alquiler
    FROM
        gd_esquema.Maestra M
    WHERE M.PAGO_ALQUILER_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE TERCER_MALON.MigrarDetalleAlquiler
AS
BEGIN

    INSERT INTO TERCER_MALON.detalle_alquiler
        (periodo_inicio
        ,periodo_fin
        ,precio
        ,cod_alquiler)
    SELECT
        DISTINCT
        M.DETALLE_ALQ_NRO_PERIODO_INI
        ,M.DETALLE_ALQ_NRO_PERIODO_FIN
        ,M.DETALLE_ALQ_PRECIO
        ,(SELECT
            cod_alquiler
        FROM
            TERCER_MALON.alquiler
        WHERE cod_alquiler=M.ALQUILER_CODIGO) AS cod_alquiler
    FROM
        gd_esquema.Maestra M
    WHERE M.ALQUILER_CODIGO IS NOT NULL AND M.DETALLE_ALQ_NRO_PERIODO_INI IS NOT NULL
    ORDER BY cod_alquiler
END
GO

CREATE PROCEDURE TERCER_MALON.MigrarPagoVenta
AS
BEGIN
    INSERT INTO TERCER_MALON.pago_venta
        (importe
        ,cotizacion_actual
        ,cod_venta
        ,id_medio_pago
        ,id_moneda)
    SELECT
        DISTINCT
        M.PAGO_VENTA_IMPORTE
        ,M.PAGO_VENTA_COTIZACION
        ,(SELECT
            cod_venta
        FROM
            TERCER_MALON.venta
        WHERE cod_venta=M.VENTA_CODIGO) AS cod_venta
        ,(SELECT
            id_medio_pago
        FROM
            TERCER_MALON.medio_pago
        WHERE nombre=M.PAGO_VENTA_MEDIO_PAGO) AS id_medio_pago
        ,(SELECT
            id_moneda
        FROM
            TERCER_MALON.moneda
        WHERE nombre=M.PAGO_VENTA_MONEDA) AS moneda
    FROM
        gd_esquema.Maestra M
    WHERE M.VENTA_CODIGO IS NOT NULL
    ORDER BY cod_venta
END
GO

--------------------------------------
---------- DATA MIGRATION ------------
--------------------------------------

BEGIN TRANSACTION
EXECUTE TERCER_MALON.MigrarProvincia
EXECUTE TERCER_MALON.MigrarLocalidad
EXECUTE TERCER_MALON.MigrarBarrio
EXECUTE TERCER_MALON.MigrarSucursal
EXECUTE TERCER_MALON.MigrarAgente
EXECUTE TERCER_MALON.MigrarComprador
EXECUTE TERCER_MALON.MigrarInquilino
EXECUTE TERCER_MALON.MigrarPropietario
EXECUTE TERCER_MALON.MigrarAmbiente
EXECUTE TERCER_MALON.MigrarMedioPago
EXECUTE TERCER_MALON.MigrarMoneda
EXECUTE TERCER_MALON.MigrarEstadoAlquiler
EXECUTE TERCER_MALON.MigrarEstadoAnuncio
EXECUTE TERCER_MALON.MigrarOperacion
EXECUTE TERCER_MALON.MigrarPeriodo
EXECUTE TERCER_MALON.MigrarTipoInmueble
EXECUTE TERCER_MALON.MigrarDisposicion
EXECUTE TERCER_MALON.MigrarCaracteristica
EXECUTE TERCER_MALON.MigrarEstadoInmueble
EXECUTE TERCER_MALON.MigrarOrientacion
EXECUTE TERCER_MALON.MigrarInmueble
EXECUTE TERCER_MALON.MigrarAnuncio
EXECUTE TERCER_MALON.MigrarAlquiler
EXECUTE TERCER_MALON.MigrarPagoAlquiler
EXECUTE TERCER_MALON.MigrarVenta
EXECUTE TERCER_MALON.MigrarPagoVenta
EXECUTE TERCER_MALON.MigrarDetalleAlquiler
EXECUTE TERCER_MALON.MigrarCaracteristicaXInmueble
COMMIT TRANSACTION