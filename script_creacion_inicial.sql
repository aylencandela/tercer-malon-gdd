/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      tpder-model-bu.DM1
 *
 * Date Created : Monday, October 23, 2023 23:32:20
 * Target DBMS : Microsoft SQL Server 2019
 */

USE GD2C2023
go
/* 
 * SCHEMA: TERCER_MALON 
 */

CREATE SCHEMA TERCER_MALON
go

/* 
 * TABLE: provincia 
 */

CREATE TABLE TERCER_MALON.provincia(
    id_provincia    numeric(18, 0)    IDENTITY(1,1),
    nombre          nvarchar(100)     NOT NULL,
    CONSTRAINT PK_provincia PRIMARY KEY NONCLUSTERED (id_provincia)
)

go


IF OBJECT_ID('TERCER_MALON.provincia') IS NOT NULL
    PRINT '<<< CREATED TABLE provincia >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE provincia >>>'
go

/* 
 * TABLE: localidad 
 */

CREATE TABLE TERCER_MALON.localidad(
    id_localidad    numeric(18, 0)    IDENTITY(1,1),
    nombre          nvarchar(18)      NULL,
    id_provincia    numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_localidad PRIMARY KEY NONCLUSTERED (id_localidad), 
    CONSTRAINT FK_provincia_localidad FOREIGN KEY (id_provincia)
    REFERENCES TERCER_MALON.provincia(id_provincia)
)

go


IF OBJECT_ID('TERCER_MALON.localidad') IS NOT NULL
    PRINT '<<< CREATED TABLE localidad >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE localidad >>>'
go

/* 
 * TABLE: sucursal 
 */

CREATE TABLE TERCER_MALON.sucursal(
    cod_sucursal    numeric(18, 0)    NOT NULL,
    nombre          nvarchar(100)     NOT NULL,
    direccion       nvarchar(100)     NOT NULL,
    telefono        nvarchar(100)     NOT NULL,
    id_localidad    numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_sucursal PRIMARY KEY NONCLUSTERED (cod_sucursal), 
    CONSTRAINT FK_localidad_sucursal FOREIGN KEY (id_localidad)
    REFERENCES TERCER_MALON.localidad(id_localidad)
)

go


IF OBJECT_ID('TERCER_MALON.sucursal') IS NOT NULL
    PRINT '<<< CREATED TABLE sucursal >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sucursal >>>'
go

/* 
 * TABLE: agente 
 */

CREATE TABLE TERCER_MALON.agente(
    id_persona          numeric(18, 0)    IDENTITY(1,1),
    nombre              nvarchar(100)     NOT NULL,
    apellido            nvarchar(10)      NOT NULL,
    dni                 numeric(18, 0)    NOT NULL,
    fecha_registro      datetime          NOT NULL,
    fecha_nacimiento    datetime          NOT NULL,
    telefono            nvarchar(100)     NOT NULL,
    mail                nvarchar(100)     NOT NULL,
    cod_sucursal        numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_agente PRIMARY KEY NONCLUSTERED (id_persona), 
    CONSTRAINT FK_sucursal_agente FOREIGN KEY (cod_sucursal)
    REFERENCES TERCER_MALON.sucursal(cod_sucursal)
)

go


IF OBJECT_ID('TERCER_MALON.agente') IS NOT NULL
    PRINT '<<< CREATED TABLE agente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE agente >>>'
go

/* 
 * TABLE: estado_anuncio 
 */

CREATE TABLE TERCER_MALON.estado_anuncio(
    id_estado_anuncio    numeric(18, 0)    IDENTITY(1,1),
    tipo                 nvarchar(100)     NOT NULL,
    CONSTRAINT PK_estado_anuncio PRIMARY KEY NONCLUSTERED (id_estado_anuncio)
)

go


IF OBJECT_ID('TERCER_MALON.estado_anuncio') IS NOT NULL
    PRINT '<<< CREATED TABLE estado_anuncio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE estado_anuncio >>>'
go

/* 
 * TABLE: ambiente 
 */

CREATE TABLE TERCER_MALON.ambiente(
    id_ambiente    numeric(18, 0)    IDENTITY(1,1),
    tipo           nvarchar(100)     NOT NULL,
    CONSTRAINT PK_ambiente PRIMARY KEY NONCLUSTERED (id_ambiente)
)

go


IF OBJECT_ID('TERCER_MALON.ambiente') IS NOT NULL
    PRINT '<<< CREATED TABLE ambiente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ambiente >>>'
go

/* 
 * TABLE: barrio 
 */

CREATE TABLE TERCER_MALON.barrio(
    id_barrio       numeric(18, 0)    IDENTITY(1,1),
    nombre          nvarchar(100)     NOT NULL,
    id_localidad    numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_barrio PRIMARY KEY NONCLUSTERED (id_barrio), 
    CONSTRAINT FK_localidad_barrio FOREIGN KEY (id_localidad)
    REFERENCES TERCER_MALON.localidad(id_localidad)
)

go


IF OBJECT_ID('TERCER_MALON.barrio') IS NOT NULL
    PRINT '<<< CREATED TABLE barrio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE barrio >>>'
go

/* 
 * TABLE: disposicion 
 */

CREATE TABLE TERCER_MALON.disposicion(
    id_disposicion    numeric(18, 0)    IDENTITY(1,1),
    tipo              nvarchar(100)     NOT NULL,
    CONSTRAINT PK_disposicion PRIMARY KEY NONCLUSTERED (id_disposicion)
)

go


IF OBJECT_ID('TERCER_MALON.disposicion') IS NOT NULL
    PRINT '<<< CREATED TABLE disposicion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE disposicion >>>'
go

/* 
 * TABLE: estado_inmueble 
 */

CREATE TABLE TERCER_MALON.estado_inmueble(
    id_estado_inm    numeric(18, 0)    IDENTITY(1,1),
    tipo             nvarchar(100)     NOT NULL,
    CONSTRAINT PK_estado_inmueble PRIMARY KEY NONCLUSTERED (id_estado_inm)
)

go


IF OBJECT_ID('TERCER_MALON.estado_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE estado_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE estado_inmueble >>>'
go

/* 
 * TABLE: orientacion 
 */

CREATE TABLE TERCER_MALON.orientacion(
    id_orientacion    numeric(18, 0)    IDENTITY(1,1),
    tipo              nvarchar(100)     NOT NULL,
    CONSTRAINT PK_orientacion PRIMARY KEY NONCLUSTERED (id_orientacion)
)

go


IF OBJECT_ID('TERCER_MALON.orientacion') IS NOT NULL
    PRINT '<<< CREATED TABLE orientacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE orientacion >>>'
go

/* 
 * TABLE: propietario 
 */

CREATE TABLE TERCER_MALON.propietario(
    id_propietario      numeric(18, 0)    IDENTITY(1,1),
    nombre              nvarchar(100)     NOT NULL,
    apellido            nvarchar(10)      NOT NULL,
    dni                 numeric(18, 0)    NOT NULL,
    fecha_registro      datetime          NOT NULL,
    fecha_nacimiento    datetime          NOT NULL,
    telefono            nvarchar(100)     NOT NULL,
    mail                nvarchar(100)     NOT NULL,
    CONSTRAINT PK_propietario PRIMARY KEY NONCLUSTERED (id_propietario)
)

go


IF OBJECT_ID('TERCER_MALON.propietario') IS NOT NULL
    PRINT '<<< CREATED TABLE propietario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE propietario >>>'
go

/* 
 * TABLE: tipo_inmueble 
 */

CREATE TABLE TERCER_MALON.tipo_inmueble(
    id_tipo_inmueble    numeric(18, 0)    IDENTITY(1,1),
    tipo                nvarchar(100)     NOT NULL,
    CONSTRAINT PK_tipo_inmueble PRIMARY KEY NONCLUSTERED (id_tipo_inmueble)
)

go


IF OBJECT_ID('TERCER_MALON.tipo_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE tipo_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tipo_inmueble >>>'
go

/* 
 * TABLE: inmueble 
 */

CREATE TABLE TERCER_MALON.inmueble(
    cod_inmueble        numeric(18, 0)    NOT NULL,
    antiguedad          numeric(18, 0)    NOT NULL,
    descripcion         nvarchar(100)     NOT NULL,
    direccion           nvarchar(100)     NOT NULL,
    superficie_total    money             NOT NULL,
    expensa             money             NOT NULL,
    nombre              nvarchar(100)     NOT NULL,
    id_tipo_inmueble    numeric(18, 0)    NOT NULL,
    id_estado_inm       numeric(18, 0)    NOT NULL,
    id_disposicion      numeric(18, 0)    NOT NULL,
    id_ambiente         numeric(18, 0)    NOT NULL,
    id_orientacion      numeric(18, 0)    NOT NULL,
    id_barrio           numeric(18, 0)    NOT NULL,
    id_propietario      numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_inmueble PRIMARY KEY NONCLUSTERED (cod_inmueble), 
    CONSTRAINT FK_ambiente_inmueble FOREIGN KEY (id_ambiente)
    REFERENCES TERCER_MALON.ambiente(id_ambiente),
    CONSTRAINT FK_barrio_inmueble FOREIGN KEY (id_barrio)
    REFERENCES TERCER_MALON.barrio(id_barrio),
    CONSTRAINT FK_disposicion_inmueble FOREIGN KEY (id_disposicion)
    REFERENCES TERCER_MALON.disposicion(id_disposicion),
    CONSTRAINT FK_estado_inmueble_inmueble FOREIGN KEY (id_estado_inm)
    REFERENCES TERCER_MALON.estado_inmueble(id_estado_inm),
    CONSTRAINT FK_orientacion_inmueble FOREIGN KEY (id_orientacion)
    REFERENCES TERCER_MALON.orientacion(id_orientacion),
    CONSTRAINT FK_propietario_inmueble FOREIGN KEY (id_propietario)
    REFERENCES TERCER_MALON.propietario(id_propietario),
    CONSTRAINT FK_tipo_inmueble_inmueble FOREIGN KEY (id_tipo_inmueble)
    REFERENCES TERCER_MALON.tipo_inmueble(id_tipo_inmueble)
)

go


IF OBJECT_ID('TERCER_MALON.inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE inmueble >>>'
go

/* 
 * TABLE: moneda 
 */

CREATE TABLE TERCER_MALON.moneda(
    id_moneda    numeric(18, 0)    IDENTITY(1,1),
    simbolo      nvarchar(100)     NOT NULL,
    nombre       nvarchar(100)     NOT NULL,
    CONSTRAINT PK_moneda PRIMARY KEY NONCLUSTERED (id_moneda)
)

go


IF OBJECT_ID('TERCER_MALON.moneda') IS NOT NULL
    PRINT '<<< CREATED TABLE moneda >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE moneda >>>'
go

/* 
 * TABLE: operacion 
 */

CREATE TABLE TERCER_MALON.operacion(
    id_operacion    numeric(18, 0)    IDENTITY(1,1),
    tipo            nvarchar(100)     NOT NULL,
    CONSTRAINT PK_operacion PRIMARY KEY NONCLUSTERED (id_operacion)
)

go


IF OBJECT_ID('TERCER_MALON.operacion') IS NOT NULL
    PRINT '<<< CREATED TABLE operacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE operacion >>>'
go

/* 
 * TABLE: periodo 
 */

CREATE TABLE TERCER_MALON.periodo(
    id_periodo    numeric(18, 0)    IDENTITY(1,1),
    tipo          nvarchar(100)     NOT NULL,
    CONSTRAINT PK_periodo PRIMARY KEY NONCLUSTERED (id_periodo)
)

go


IF OBJECT_ID('TERCER_MALON.periodo') IS NOT NULL
    PRINT '<<< CREATED TABLE periodo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE periodo >>>'
go

/* 
 * TABLE: anuncio 
 */

CREATE TABLE TERCER_MALON.anuncio(
    cod_anuncio          numeric(19, 0)    NOT NULL,
    precio_publicado     numeric(18, 2)    NULL,
    fecha_publicacion    datetime          NOT NULL,
    fecha_fin            datetime          NOT NULL,
    costo_anuncio        numeric(18, 2)    NULL,
    id_operacion         numeric(18, 0)    NOT NULL,
    id_periodo           numeric(18, 0)    NOT NULL,
    id_estado_anuncio    numeric(18, 0)    NOT NULL,
    id_moneda            numeric(18, 0)    NOT NULL,
    cod_inmueble         numeric(18, 0)    NOT NULL,
    id_persona           numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_anuncio PRIMARY KEY NONCLUSTERED (cod_anuncio), 
    CONSTRAINT FK_agente_anuncio FOREIGN KEY (id_persona)
    REFERENCES TERCER_MALON.agente(id_persona),
    CONSTRAINT FK_estado_anuncio_anuncio FOREIGN KEY (id_estado_anuncio)
    REFERENCES TERCER_MALON.estado_anuncio(id_estado_anuncio),
    CONSTRAINT FK_inmueble_anuncio FOREIGN KEY (cod_inmueble)
    REFERENCES TERCER_MALON.inmueble(cod_inmueble),
    CONSTRAINT FK_moneda_anuncio FOREIGN KEY (id_moneda)
    REFERENCES TERCER_MALON.moneda(id_moneda),
    CONSTRAINT FK_operacion_anuncio FOREIGN KEY (id_operacion)
    REFERENCES TERCER_MALON.operacion(id_operacion),
    CONSTRAINT FK_periodo_anuncio FOREIGN KEY (id_periodo)
    REFERENCES TERCER_MALON.periodo(id_periodo)
)

go


IF OBJECT_ID('TERCER_MALON.anuncio') IS NOT NULL
    PRINT '<<< CREATED TABLE anuncio >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE anuncio >>>'
go

/* 
 * TABLE: estado_alquiler 
 */

CREATE TABLE TERCER_MALON.estado_alquiler(
    id_estado_alquiler    numeric(18, 0)    IDENTITY(1,1),
    tipo                  nvarchar(100)     NOT NULL,
    CONSTRAINT PK_estado_alquiler PRIMARY KEY NONCLUSTERED (id_estado_alquiler)
)

go


IF OBJECT_ID('TERCER_MALON.estado_alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE estado_alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE estado_alquiler >>>'
go

/* 
 * TABLE: inquilino 
 */

CREATE TABLE TERCER_MALON.inquilino(
    id_inquilino        numeric(18, 0)    IDENTITY(1,1),
    nombre              nvarchar(100)     NOT NULL,
    apellido            nvarchar(10)      NOT NULL,
    dni                 numeric(18, 0)    NOT NULL,
    fecha_registro      datetime          NOT NULL,
    fecha_nacimiento    datetime          NOT NULL,
    telefono            nvarchar(100)     NOT NULL,
    mail                nvarchar(100)     NOT NULL,
    CONSTRAINT PK_inquilino PRIMARY KEY NONCLUSTERED (id_inquilino)
)

go


IF OBJECT_ID('TERCER_MALON.inquilino') IS NOT NULL
    PRINT '<<< CREATED TABLE inquilino >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE inquilino >>>'
go

/* 
 * TABLE: alquiler 
 */

CREATE TABLE TERCER_MALON.alquiler(
    cod_alquiler          numeric(18, 0)    NOT NULL,
    fecha_inicio          datetime          NOT NULL,
    fecha_fin             datetime          NOT NULL,
    cant_periodos         numeric(18, 0)    NOT NULL,
    deposito              numeric(18, 2)    NOT NULL,
    comision              numeric(18, 2)    NOT NULL,
    gastos_averig         numeric(18, 2)    NOT NULL,
    cod_anuncio           numeric(19, 0)    NOT NULL,
    id_inquilino          numeric(18, 0)    NOT NULL,
    id_estado_alquiler    numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_alquiler PRIMARY KEY NONCLUSTERED (cod_alquiler), 
    CONSTRAINT FK_anuncio_alquiler FOREIGN KEY (cod_anuncio)
    REFERENCES TERCER_MALON.anuncio(cod_anuncio),
    CONSTRAINT FK_estado_alquiler_alquiler FOREIGN KEY (id_estado_alquiler)
    REFERENCES TERCER_MALON.estado_alquiler(id_estado_alquiler),
    CONSTRAINT FK_inquilino_alquiler FOREIGN KEY (id_inquilino)
    REFERENCES TERCER_MALON.inquilino(id_inquilino)
)

go


IF OBJECT_ID('TERCER_MALON.alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE alquiler >>>'
go

/* 
 * TABLE: caracteristica 
 */

CREATE TABLE TERCER_MALON.caracteristica(
    id_caracteristica    numeric(18, 0)    IDENTITY(1,1),
    nombre               nvarchar(100)     NOT NULL,
    CONSTRAINT PK_caracteristica PRIMARY KEY NONCLUSTERED (id_caracteristica)
)

go


IF OBJECT_ID('TERCER_MALON.caracteristica') IS NOT NULL
    PRINT '<<< CREATED TABLE caracteristica >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE caracteristica >>>'
go

/* 
 * TABLE: caracteristica_x_inmueble 
 */

CREATE TABLE TERCER_MALON.caracteristica_x_inmueble(
    id_caracteristica    numeric(18, 0)    NOT NULL,
    cod_inmueble         numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_caracteristica_x_inmueble PRIMARY KEY NONCLUSTERED (id_caracteristica, cod_inmueble), 
    CONSTRAINT FK_caracteristica_caracteristica_x_inmueble FOREIGN KEY (id_caracteristica)
    REFERENCES TERCER_MALON.caracteristica(id_caracteristica),
    CONSTRAINT FK_inmueble_caracteristica_x_inmueble FOREIGN KEY (cod_inmueble)
    REFERENCES TERCER_MALON.inmueble(cod_inmueble)
)

go


IF OBJECT_ID('TERCER_MALON.caracteristica_x_inmueble') IS NOT NULL
    PRINT '<<< CREATED TABLE caracteristica_x_inmueble >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE caracteristica_x_inmueble >>>'
go

/* 
 * TABLE: comprador 
 */

CREATE TABLE TERCER_MALON.comprador(
    id_comprador        numeric(18, 0)    IDENTITY(1,1),
    nombre              nvarchar(100)     NOT NULL,
    apellido            nvarchar(10)      NOT NULL,
    dni                 numeric(18, 0)    NOT NULL,
    fecha_registro      datetime          NOT NULL,
    fecha_nacimiento    datetime          NOT NULL,
    telefono            nvarchar(100)     NOT NULL,
    mail                nvarchar(100)     NOT NULL,
    CONSTRAINT PK_comprador PRIMARY KEY NONCLUSTERED (id_comprador)
)

go


IF OBJECT_ID('TERCER_MALON.comprador') IS NOT NULL
    PRINT '<<< CREATED TABLE comprador >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE comprador >>>'
go

/* 
 * TABLE: detalle_alquiler 
 */

CREATE TABLE TERCER_MALON.detalle_alquiler(
    cod_detalle_alq    numeric(18, 0)    IDENTITY(1,1),
    periodo_inicio     datetime          NOT NULL,
    periodo_fin        datetime          NOT NULL,
    precio             numeric(18, 2)    NOT NULL,
    cod_alquiler       numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_detalle_alquiler PRIMARY KEY NONCLUSTERED (cod_detalle_alq), 
    CONSTRAINT FK_alquiler_detalle_alquiler FOREIGN KEY (cod_alquiler)
    REFERENCES TERCER_MALON.alquiler(cod_alquiler)
)

go


IF OBJECT_ID('TERCER_MALON.detalle_alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE detalle_alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE detalle_alquiler >>>'
go

/* 
 * TABLE: medio_pago 
 */

CREATE TABLE TERCER_MALON.medio_pago(
    id_medio_pago    numeric(18, 0)    IDENTITY(1,1),
    nombre           nvarchar(100)     NOT NULL,
    CONSTRAINT PK_medio_pago PRIMARY KEY NONCLUSTERED (id_medio_pago)
)

go


IF OBJECT_ID('TERCER_MALON.medio_pago') IS NOT NULL
    PRINT '<<< CREATED TABLE medio_pago >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE medio_pago >>>'
go

/* 
 * TABLE: pago_alquiler 
 */

CREATE TABLE TERCER_MALON.pago_alquiler(
    cod_pago_alquiler       numeric(18, 0)    NOT NULL,
    fecha                   datetime          NOT NULL,
    nro_periodo             numeric(18, 0)    NOT NULL,
    descripcion_periodo     nvarchar(100)     NOT NULL,
    fecha_inicio_periodo    datetime          NOT NULL,
    fecha_fin_periodo       datetime          NOT NULL,
    importe                 numeric(18, 2)    NOT NULL,
    id_medio_pago           numeric(18, 0)    NOT NULL,
    cod_alquiler            numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_pago_alquiler PRIMARY KEY NONCLUSTERED (cod_pago_alquiler), 
    CONSTRAINT FK_alquiler_pago_alquiler FOREIGN KEY (cod_alquiler)
    REFERENCES TERCER_MALON.alquiler(cod_alquiler),
    CONSTRAINT FK_medio_pago_pago_alquiler FOREIGN KEY (id_medio_pago)
    REFERENCES TERCER_MALON.medio_pago(id_medio_pago)
)

go


IF OBJECT_ID('TERCER_MALON.pago_alquiler') IS NOT NULL
    PRINT '<<< CREATED TABLE pago_alquiler >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE pago_alquiler >>>'
go

/* 
 * TABLE: venta 
 */

CREATE TABLE TERCER_MALON.venta(
    cod_venta       numeric(18, 0)    NOT NULL,
    fecha           datetime          NOT NULL,
    precio          numeric(18, 2)    NOT NULL,
    comision        numeric(18, 2)    NOT NULL,
    cod_anuncio     numeric(19, 0)    NOT NULL,
    id_comprador    numeric(18, 0)    NOT NULL,
    id_moneda       numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_venta PRIMARY KEY NONCLUSTERED (cod_venta), 
    CONSTRAINT FK_anuncio_venta FOREIGN KEY (cod_anuncio)
    REFERENCES TERCER_MALON.anuncio(cod_anuncio),
    CONSTRAINT FK_comprador_venta FOREIGN KEY (id_comprador)
    REFERENCES TERCER_MALON.comprador(id_comprador),
    CONSTRAINT FK_moneda_venta FOREIGN KEY (id_moneda)
    REFERENCES TERCER_MALON.moneda(id_moneda)
)

go


IF OBJECT_ID('TERCER_MALON.venta') IS NOT NULL
    PRINT '<<< CREATED TABLE venta >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE venta >>>'
go

/* 
 * TABLE: pago_venta 
 */

CREATE TABLE TERCER_MALON.pago_venta(
    cod_pago_venta       numeric(18, 0)    IDENTITY(1,1),
    importe              numeric(18, 2)    NOT NULL,
    cotizacion_actual    numeric(18, 2)    NOT NULL,
    cod_venta            numeric(18, 0)    NOT NULL,
    id_medio_pago        numeric(18, 0)    NOT NULL,
    id_moneda            numeric(18, 0)    NOT NULL,
    CONSTRAINT PK_pago_venta PRIMARY KEY NONCLUSTERED (cod_pago_venta), 
    CONSTRAINT FK_medio_pago_pago_venta FOREIGN KEY (id_medio_pago)
    REFERENCES TERCER_MALON.medio_pago(id_medio_pago),
    CONSTRAINT FK_moneda_pago_venta FOREIGN KEY (id_moneda)
    REFERENCES TERCER_MALON.moneda(id_moneda),
    CONSTRAINT FK_venta_pago_venta FOREIGN KEY (cod_venta)
    REFERENCES TERCER_MALON.venta(cod_venta)
)

go


IF OBJECT_ID('TERCER_MALON.pago_venta') IS NOT NULL
    PRINT '<<< CREATED TABLE pago_venta >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE pago_venta >>>'
go

