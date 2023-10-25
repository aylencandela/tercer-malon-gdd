
/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      tpder-model-bu.DM1
 *
 * Date Created : Monday, October 23, 2023 22:50:43
 * Target DBMS : Microsoft SQL Server 2019
 */

USE GD2C2023
GO
IF OBJECT_ID('TERCER_MALON.alquiler') IS NOT NULL
BEGIN
    drop table TERCER_MALON.alquiler
    PRINT '<<< DROPPED TABLE alquiler >>>'
END

go
IF OBJECT_ID('TERCER_MALON.anuncio') IS NOT NULL
BEGIN
    drop table TERCER_MALON.anuncio
    PRINT '<<< DROPPED TABLE anuncio >>>'
END
go
--AYLU
IF OBJECT_ID('TERCER_MALON.agente') IS NOT NULL
BEGIN
    drop table TERCER_MALON.agente
    PRINT '<<< DROPPED TABLE agente >>>'
END
go
-- FACU
IF OBJECT_ID('TERCER_MALON.caracteristica') IS NOT NULL
BEGIN
    drop table TERCER_MALON.caracteristica
    PRINT '<<< DROPPED TABLE caracteristica >>>'
END
go
IF OBJECT_ID('TERCER_MALON.caracteristica_x_inmueble') IS NOT NULL
BEGIN
    drop table TERCER_MALON.caracteristica_x_inmueble
    PRINT '<<< DROPPED TABLE caracteristica_x_inmueble >>>'
END
go
-- JULI
IF OBJECT_ID('TERCER_MALON.comprador') IS NOT NULL
BEGIN
    drop table TERCER_MALON.comprador
    PRINT '<<< DROPPED TABLE comprador >>>'
END
go
IF OBJECT_ID('TERCER_MALON.detalle_alquiler') IS NOT NULL
BEGIN
    drop table TERCER_MALON.detalle_alquiler
    PRINT '<<< DROPPED TABLE detalle_alquiler >>>'
END
go
-- JOHA
IF OBJECT_ID('TERCER_MALON.estado_alquiler') IS NOT NULL
BEGIN
    drop table TERCER_MALON.estado_alquiler
    PRINT '<<< DROPPED TABLE estado_alquiler >>>'
END
go
-- JOHA
IF OBJECT_ID('TERCER_MALON.estado_anuncio') IS NOT NULL
BEGIN
    drop table TERCER_MALON.estado_anuncio
    PRINT '<<< DROPPED TABLE estado_anuncio >>>'
END
go
IF OBJECT_ID('TERCER_MALON.inmueble') IS NOT NULL
BEGIN
    drop table TERCER_MALON.inmueble
    PRINT '<<< DROPPED TABLE inmueble >>>'
END
go
-- JULI
IF OBJECT_ID('TERCER_MALON.inquilino') IS NOT NULL
BEGIN
    drop table TERCER_MALON.inquilino
    PRINT '<<< DROPPED TABLE inquilino >>>'
END
go
-- JOHA
IF OBJECT_ID('TERCER_MALON.medio_pago') IS NOT NULL
BEGIN
    drop table TERCER_MALON.medio_pago
    PRINT '<<< DROPPED TABLE medio_pago >>>'
END
go
-- AYLU
IF OBJECT_ID('TERCER_MALON.moneda') IS NOT NULL 
BEGIN
    drop table TERCER_MALON.moneda
    PRINT '<<< DROPPED TABLE moneda >>>'
END
go
-- JOHA
IF OBJECT_ID('TERCER_MALON.operacion') IS NOT NULL
BEGIN
    drop table TERCER_MALON.operacion
    PRINT '<<< DROPPED TABLE operacion >>>'
END
go
-- FACU
IF OBJECT_ID('TERCER_MALON.orientacion') IS NOT NULL 
BEGIN
    drop table TERCER_MALON.orientacion
    PRINT '<<< DROPPED TABLE orientacion >>>'
END
go
IF OBJECT_ID('TERCER_MALON.pago_alquiler') IS NOT NULL
BEGIN
    drop table TERCER_MALON.pago_alquiler
    PRINT '<<< DROPPED TABLE pago_alquiler >>>'
END
go
IF OBJECT_ID('TERCER_MALON.pago_venta') IS NOT NULL
BEGIN
    drop table TERCER_MALON.pago_venta
    PRINT '<<< DROPPED TABLE pago_venta >>>'
END
go
IF OBJECT_ID('TERCER_MALON.periodo') IS NOT NULL
BEGIN
    drop table TERCER_MALON.periodo
    PRINT '<<< DROPPED TABLE periodo >>>'
END
go
-- JULI
IF OBJECT_ID('TERCER_MALON.propietario') IS NOT NULL
BEGIN
    drop table TERCER_MALON.propietario
    PRINT '<<< DROPPED TABLE propietario >>>'
END
go
-- AYLU
IF OBJECT_ID('TERCER_MALON.sucursal') IS NOT NULL
BEGIN
    drop table TERCER_MALON.sucursal
    PRINT '<<< DROPPED TABLE sucursal >>>'
END
go
-- JOHA
IF OBJECT_ID('TERCER_MALON.tipo_inmueble') IS NOT NULL
BEGIN
    drop table TERCER_MALON.tipo_inmueble
    PRINT '<<< DROPPED TABLE tipo_inmueble >>>'
END
go
IF OBJECT_ID('TERCER_MALON.venta') IS NOT NULL
BEGIN
    drop table TERCER_MALON.venta
    PRINT '<<< DROPPED TABLE venta >>>'
END
go
-- JOHA
IF OBJECT_ID('TERCER_MALON.ambiente') IS NOT NULL
BEGIN
    drop table TERCER_MALON.ambiente
    PRINT '<<< DROPPED TABLE ambiente >>>'
END
go
-- AYLU
IF OBJECT_ID('TERCER_MALON.barrio') IS NOT NULL
BEGIN
    drop table TERCER_MALON.barrio
    PRINT '<<< DROPPED TABLE barrio >>>'
END
go
-- FACU
IF OBJECT_ID('TERCER_MALON.disposicion') IS NOT NULL
BEGIN
    drop table TERCER_MALON.disposicion
    PRINT '<<< DROPPED TABLE disposicion >>>'
END
go
-- FACU
IF OBJECT_ID('TERCER_MALON.estado_inmueble') IS NOT NULL
BEGIN
    drop table TERCER_MALON.estado_inmueble
    PRINT '<<< DROPPED TABLE estado_inmueble >>>'
END

go
-- AYLU
IF OBJECT_ID('TERCER_MALON.localidad') IS NOT NULL
BEGIN
    drop table TERCER_MALON.localidad
    PRINT '<<< DROPPED TABLE localidad >>>'
END
go
-- AYLU
IF OBJECT_ID('TERCER_MALON.provincia') IS NOT NULL
BEGIN
    drop table TERCER_MALON.provincia
    PRINT '<<< DROPPED TABLE provincia >>>'
END
go


drop schema TERCER_MALON