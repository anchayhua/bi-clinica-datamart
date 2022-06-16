/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2016                    */
/* Created on:     16/06/2022 12:43:25                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITA') and o.name = 'FK_CITA_REFERENCE_ESTADO_C')
alter table CITA
   drop constraint FK_CITA_REFERENCE_ESTADO_C
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITA') and o.name = 'FK_CITA_REFERENCE_CANALES')
alter table CITA
   drop constraint FK_CITA_REFERENCE_CANALES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITA') and o.name = 'FK_CITA_REFERENCE_TIPO_CIT')
alter table CITA
   drop constraint FK_CITA_REFERENCE_TIPO_CIT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITA') and o.name = 'FK_CITA_REFERENCE_TIPO_SEG')
alter table CITA
   drop constraint FK_CITA_REFERENCE_TIPO_SEG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITA') and o.name = 'FK_CITA_REFERENCE_ESPECIAL')
alter table CITA
   drop constraint FK_CITA_REFERENCE_ESPECIAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITA') and o.name = 'FK_CITA_REFERENCE_PACIENTE')
alter table CITA
   drop constraint FK_CITA_REFERENCE_PACIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESPECIALIDAD_MEDICO') and o.name = 'FK_ESPECIAL_REFERENCE_SEDES')
alter table ESPECIALIDAD_MEDICO
   drop constraint FK_ESPECIAL_REFERENCE_SEDES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESPECIALIDAD_MEDICO') and o.name = 'FK_ESPECIAL_REFERENCE_ESPECIAL')
alter table ESPECIALIDAD_MEDICO
   drop constraint FK_ESPECIAL_REFERENCE_ESPECIAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESPECIALIDAD_MEDICO') and o.name = 'FK_ESPECIAL_REFERENCE_MEDICO')
alter table ESPECIALIDAD_MEDICO
   drop constraint FK_ESPECIAL_REFERENCE_MEDICO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MEDICO') and o.name = 'FK_MEDICO_REFERENCE_ESPECIAL')
alter table MEDICO
   drop constraint FK_MEDICO_REFERENCE_ESPECIAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CANALES')
            and   type = 'U')
   drop table CANALES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CITA')
            and   type = 'U')
   drop table CITA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESPECIALIDAD')
            and   type = 'U')
   drop table ESPECIALIDAD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESPECIALIDAD_MEDICO')
            and   type = 'U')
   drop table ESPECIALIDAD_MEDICO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESTADO_CITA')
            and   type = 'U')
   drop table ESTADO_CITA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MEDICO')
            and   type = 'U')
   drop table MEDICO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PACIENTES')
            and   type = 'U')
   drop table PACIENTES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SEDES')
            and   type = 'U')
   drop table SEDES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPO_CITA')
            and   type = 'U')
   drop table TIPO_CITA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPO_SEGURO')
            and   type = 'U')
   drop table TIPO_SEGURO
go

/*==============================================================*/
/* Table: CANALES                                               */
/*==============================================================*/
create table CANALES (
   CANALES_ID           int                  identity,
   CANALES              nvarchar(100)        null,
   constraint PK_CANALES primary key (CANALES_ID)
)
go

/*==============================================================*/
/* Table: CITA                                                  */
/*==============================================================*/
create table CITA (
   CITA_ID              int                  identity,
   ESTADO_CITA_ID       int                  null,
   CANALES_ID           int                  null,
   TIPO_CITA_ID         int                  null,
   TIPO_SEGURO_ID       int                  null,
   ESPECIALIDAD_SEDES_ID int                  null,
   PACIENTES_ID         int                  null,
   CITA_FECHA           date                 null,
   CITA_HORARIO         time                 null,
   constraint PK_CITA primary key (CITA_ID)
)
go

/*==============================================================*/
/* Table: ESPECIALIDAD                                          */
/*==============================================================*/
create table ESPECIALIDAD (
   ESPECIALIDAD_ID      int                  identity,
   ESPECIALIDAD         nvarchar(100)        null,
   constraint PK_ESPECIALIDAD primary key (ESPECIALIDAD_ID)
)
go

/*==============================================================*/
/* Table: ESPECIALIDAD_MEDICO                                   */
/*==============================================================*/
create table ESPECIALIDAD_MEDICO (
   ESPECIALIDAD_SEDES_ID int                  identity,
   SEDES_ID             int                  null,
   ESPECIALIDAD_ID      int                  null,
   MEDICO_ID            int                  null,
   constraint PK_ESPECIALIDAD_MEDICO primary key (ESPECIALIDAD_SEDES_ID)
)
go

/*==============================================================*/
/* Table: ESTADO_CITA                                           */
/*==============================================================*/
create table ESTADO_CITA (
   ESTADO_CITA_ID       int                  identity,
   ESTADO_CITA_NOMBRE   nvarchar(100)        null,
   constraint PK_ESTADO_CITA primary key (ESTADO_CITA_ID)
)
go

/*==============================================================*/
/* Table: MEDICO                                                */
/*==============================================================*/
create table MEDICO (
   MEDICO_ID            int                  identity,
   ESPECIALIDAD_ID      int                  null,
   MEDICO_NOMBRE        nvarchar(100)        null,
   MEDICO_TELEFONO      nvarchar(100)        null,
   HORARIO_LUNES        time                 null,
   HORARIO_MARTES       time                 null,
   HORARIO_MIERCOLES    time                 null,
   HORARIO_JUEVES       time                 null,
   HORARIO_VIERNES      time                 null,
   HORARIO_SABADO       time                 null,
   constraint PK_MEDICO primary key (MEDICO_ID)
)
go

/*==============================================================*/
/* Table: PACIENTES                                             */
/*==============================================================*/
create table PACIENTES (
   PACIENTES_ID         int                  identity,
   PACIENTES_NOMBRE     nvarchar(100)        null,
   PACIENTES_APELLIDO_PATERNO nvarchar(100)        null,
   PACIENTES_APELLIDO_MATERNO nvarchar(100)        null,
   PACIENTES_GENERO     nvarchar(100)        null,
   PACIENTES_EDAD       int                  null,
   PACIENTES_DNI        nvarchar(20)         null,
   PACIENTES_FECHA_EMISION date                 null,
   PACIENTES_CORREO     nvarchar(100)        null,
   PACIENTES_CELULAR    nvarchar(100)        null,
   PACIENTES_PASSWORD   nvarchar(100)        null,
   constraint PK_PACIENTES primary key (PACIENTES_ID)
)
go

/*==============================================================*/
/* Table: SEDES                                                 */
/*==============================================================*/
create table SEDES (
   SEDES_ID             int                  identity,
   SEDES_NOMBRE         nvarchar(100)        null,
   SEDES_DISTRITO       nvarchar(100)        null,
   SEDES_DIRECCION      nvarchar(100)        null,
   SEDES_TELEFONO       nvarchar(100)        null,
   constraint PK_SEDES primary key (SEDES_ID)
)
go

/*==============================================================*/
/* Table: TIPO_CITA                                             */
/*==============================================================*/
create table TIPO_CITA (
   TIPO_CITA_ID         int                  identity,
   TIPO_CITA            nvarchar(100)        null,
   constraint PK_TIPO_CITA primary key (TIPO_CITA_ID)
)
go

/*==============================================================*/
/* Table: TIPO_SEGURO                                           */
/*==============================================================*/
create table TIPO_SEGURO (
   TIPO_SEGURO_ID       int                  identity,
   TIPO_SEGURO          nvarchar(100)        null,
   constraint PK_TIPO_SEGURO primary key (TIPO_SEGURO_ID)
)
go

alter table CITA
   add constraint FK_CITA_REFERENCE_ESTADO_C foreign key (ESTADO_CITA_ID)
      references ESTADO_CITA (ESTADO_CITA_ID)
go

alter table CITA
   add constraint FK_CITA_REFERENCE_CANALES foreign key (CANALES_ID)
      references CANALES (CANALES_ID)
go

alter table CITA
   add constraint FK_CITA_REFERENCE_TIPO_CIT foreign key (TIPO_CITA_ID)
      references TIPO_CITA (TIPO_CITA_ID)
go

alter table CITA
   add constraint FK_CITA_REFERENCE_TIPO_SEG foreign key (TIPO_SEGURO_ID)
      references TIPO_SEGURO (TIPO_SEGURO_ID)
go

alter table CITA
   add constraint FK_CITA_REFERENCE_ESPECIAL foreign key (ESPECIALIDAD_SEDES_ID)
      references ESPECIALIDAD_MEDICO (ESPECIALIDAD_SEDES_ID)
go

alter table CITA
   add constraint FK_CITA_REFERENCE_PACIENTE foreign key (PACIENTES_ID)
      references PACIENTES (PACIENTES_ID)
go

alter table ESPECIALIDAD_MEDICO
   add constraint FK_ESPECIAL_REFERENCE_SEDES foreign key (SEDES_ID)
      references SEDES (SEDES_ID)
go

alter table ESPECIALIDAD_MEDICO
   add constraint FK_ESPECIAL_REFERENCE_ESPECIAL foreign key (ESPECIALIDAD_ID)
      references ESPECIALIDAD (ESPECIALIDAD_ID)
go

alter table ESPECIALIDAD_MEDICO
   add constraint FK_ESPECIAL_REFERENCE_MEDICO foreign key (MEDICO_ID)
      references MEDICO (MEDICO_ID)
go

alter table MEDICO
   add constraint FK_MEDICO_REFERENCE_ESPECIAL foreign key (ESPECIALIDAD_ID)
      references ESPECIALIDAD (ESPECIALIDAD_ID)
go

