
/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      tpder-model-bu.DM1
 *
 * Date Created : Monday, October 23, 2023 22:50:43
 * Target DBMS : Microsoft SQL Server 2019
 */

USE GD2C2023
GO
IF OBJECT_ID('alquiler') IS NOT NULL
BEGIN
    DROP TABLE alquiler
    PRINT '<<< DROPPED TABLE alquiler >>>'
END

go
IF OBJECT_ID('anuncio') IS NOT NULL
BEGIN
    DROP TABLE anuncio
    PRINT '<<< DROPPED TABLE anuncio >>>'
END
go
--AYLU
IF OBJECT_ID('agente') IS NOT NULL
BEGIN
    DROP TABLE agente
    PRINT '<<< DROPPED TABLE agente >>>'
END
go
-- FACU
IF OBJECT_ID('caracteristica') IS NOT NULL
BEGIN
    DROP TABLE caracteristica
    PRINT '<<< DROPPED TABLE caracteristica >>>'
END
go
IF OBJECT_ID('caracteristica_x_inmueble') IS NOT NULL
BEGIN
    DROP TABLE caracteristica_x_inmueble
    PRINT '<<< DROPPED TABLE caracteristica_x_inmueble >>>'
END
go
-- JULI
IF OBJECT_ID('comprador') IS NOT NULL
BEGIN
    DROP TABLE comprador
    PRINT '<<< DROPPED TABLE comprador >>>'
END
go
IF OBJECT_ID('detalle_alquiler') IS NOT NULL
BEGIN
    DROP TABLE detalle_alquiler
    PRINT '<<< DROPPED TABLE detalle_alquiler >>>'
END
go
-- JOHA
IF OBJECT_ID('estado_alquiler') IS NOT NULL
BEGIN
    DROP TABLE estado_alquiler
    PRINT '<<< DROPPED TABLE estado_alquiler >>>'
END
go
-- JOHA
IF OBJECT_ID('estado_anuncio') IS NOT NULL
BEGIN
    DROP TABLE estado_anuncio
    PRINT '<<< DROPPED TABLE estado_anuncio >>>'
END
go
IF OBJECT_ID('inmueble') IS NOT NULL
BEGIN
    DROP TABLE inmueble
    PRINT '<<< DROPPED TABLE inmueble >>>'
END
go
-- JULI
IF OBJECT_ID('inquilino') IS NOT NULL
BEGIN
    DROP TABLE inquilino
    PRINT '<<< DROPPED TABLE inquilino >>>'
END
go
-- JOHA
IF OBJECT_ID('medio_pago') IS NOT NULL
BEGIN
    DROP TABLE medio_pago
    PRINT '<<< DROPPED TABLE medio_pago >>>'
END
go
-- AYLU
IF OBJECT_ID('moneda') IS NOT NULL 
BEGIN
    DROP TABLE moneda
    PRINT '<<< DROPPED TABLE moneda >>>'
END
go
-- JOHA
IF OBJECT_ID('operacion') IS NOT NULL
BEGIN
    DROP TABLE operacion
    PRINT '<<< DROPPED TABLE operacion >>>'
END
go
-- FACU
IF OBJECT_ID('orientacion') IS NOT NULL 
BEGIN
    DROP TABLE orientacion
    PRINT '<<< DROPPED TABLE orientacion >>>'
END
go
IF OBJECT_ID('pago_alquiler') IS NOT NULL
BEGIN
    DROP TABLE pago_alquiler
    PRINT '<<< DROPPED TABLE pago_alquiler >>>'
END
go
IF OBJECT_ID('pago_venta') IS NOT NULL
BEGIN
    DROP TABLE pago_venta
    PRINT '<<< DROPPED TABLE pago_venta >>>'
END
go
IF OBJECT_ID('periodo') IS NOT NULL
BEGIN
    DROP TABLE periodo
    PRINT '<<< DROPPED TABLE periodo >>>'
END
go
-- JULI
IF OBJECT_ID('propietario') IS NOT NULL
BEGIN
    DROP TABLE propietario
    PRINT '<<< DROPPED TABLE propietario >>>'
END
go
-- AYLU
IF OBJECT_ID('sucursal') IS NOT NULL
BEGIN
    DROP TABLE sucursal
    PRINT '<<< DROPPED TABLE sucursal >>>'
END
go
-- JOHA
IF OBJECT_ID('tipo_inmueble') IS NOT NULL
BEGIN
    DROP TABLE tipo_inmueble
    PRINT '<<< DROPPED TABLE tipo_inmueble >>>'
END
go
IF OBJECT_ID('venta') IS NOT NULL
BEGIN
    DROP TABLE venta
    PRINT '<<< DROPPED TABLE venta >>>'
END
go
-- JOHA
IF OBJECT_ID('ambiente') IS NOT NULL
BEGIN
    DROP TABLE ambiente
    PRINT '<<< DROPPED TABLE ambiente >>>'
END
go
-- AYLU
IF OBJECT_ID('barrio') IS NOT NULL
BEGIN
    DROP TABLE barrio
    PRINT '<<< DROPPED TABLE barrio >>>'
END
go
-- FACU
IF OBJECT_ID('disposicion') IS NOT NULL
BEGIN
    DROP TABLE disposicion
    PRINT '<<< DROPPED TABLE disposicion >>>'
END
go
-- FACU
IF OBJECT_ID('estado_inmueble') IS NOT NULL
BEGIN
    DROP TABLE estado_inmueble
    PRINT '<<< DROPPED TABLE estado_inmueble >>>'
END

go
-- AYLU
IF OBJECT_ID('localidad') IS NOT NULL
BEGIN
    DROP TABLE localidad
    PRINT '<<< DROPPED TABLE localidad >>>'
END
go
-- AYLU
IF OBJECT_ID('provincia') IS NOT NULL
BEGIN
    DROP TABLE provincia
    PRINT '<<< DROPPED TABLE provincia >>>'
END
go


drop schema TERCER_MALON