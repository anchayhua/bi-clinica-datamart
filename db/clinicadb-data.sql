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
/* Database: clinicadb                                              */
/*==============================================================*/
Use master
go

create database clinicadb
go

use clinicadb
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


	set identity_insert TIPO_CITA off;
	Insert into TIPO_CITA (TIPO_CITA_ID,TIPO_CITA) Values (1,'VIRTUAL'),(2,'PRESENCIAL')
	GO
set identity_insert CANALES off;
Insert into CANALES (CANALES_ID,CANALES) Values (1,'WEB'),(2,'APP'),(3,'WHASSAP'),(4,'CALLCENTER')
GO
set identity_insert SEDES off;
Insert into SEDES(SEDES_ID,SEDES_NOMBRE,SEDES_DISTRITO,SEDES_DIRECCION,SEDES_TELEFONO) Values (1,'LIMA','LIMA',1,1),(2,'SAN BORJA','SAN BORJA',1,1),(3,'SAN ISIDRO','SAN ISIDRO',1,1),(4,'SURCO','SURCO',1,1),(5,'SAN BORJA VIRTUAL','SAN BORJA',1,1),(6,'LIMA VIRTUAL','LIMA',1,1)
GO
set identity_insert ESPECIALIDAD off;
Insert into ESPECIALIDAD (ESPECIALIDAD_ID,ESPECIALIDAD) 
Values 
(1,'ALERGOLOGÍA'),(2,'ANESTESIOLOGÍA'),(3,'CARDIOLOGÍA'),(4,'CARDIOLOGÍA PEDRIATRICA'),(5,'CIRUGÍA DE CABEZA Y CUELLO'),
(6,'CIRUGÍA DE CABEZA Y CUELLO Y MANO'),(7,'CIRUGÍA DE MANO'),(8,'CIRUGÍA GENERAL'),(9,'CIRUGÍA ONCOLÓGICA'),(10,'CIRUGÍA ONCOLÓGICA DE MAMAS'),
(11,'CIRUGÍA PEDIÁTRICA'),(12,'CIRUGÍA PLÁSTICA'),(13,'CIRUGÍA TORÁXICA Y CARDIOVASCULAR'),(14,'DERMATOLOGÍA'),(15,'DERMATOLOGÍA PEDIÁTRICA'),
(16,'ENDOCRINOLOGÍA'),(17,'FERTILIDAD Y REPRODUCCIÓN'),(18,'GASTROENTEROLOGÍA'),(19,'GASTROENTEROLOGÍA PEDIÁTRICA'),(20,'GINECOLOGÍA'),
(21,'GINECOLOGÍA ONCOLOGÍCA'),(22,'GINECOLOGÍA PISO PÉLVICO'),(23,'HEMATOLOGÍA'),(24,'INFECTOLOGÍA'),(25,'MEDICINA FAMILIAR'),
(26,'MEDICINA FISICA Y REHABILITACION'),(27,'MEDICINA INTERNA'),(28,'NEFROLOGÍA'),(29,'NEONATOLOGÍA'),(30,'NEUMOLOGÍA'),
(31,'NEUMOLOGÍA PEDIÁTRICA'),(32,'NEUROCIRUGÍA'),(33,'NEUROCIRUGÍA PEDIÁTRICA'),(34,'NEUROLOGÍA'),(35,'NUTRICIÓN'),
(36,'OFTAMOLOGÍA'),(37,'OFTAMOLOGÍA PEDIÁTRICA'),(38,'OFTAMOLOGÍA MÉDICA'),(39,'OTORINOLARINGOLOGÍA'),(40,'OTORINOLARINGOLOGÍA PEDIÁTRICA'),
(41,'PEDIATRÍA'),(42,'PODOLOGÍA'),(43,'PSIQUIATRÍA'),(44,'REUMATOLOGÍA'),(45,'TERAPIA DEL DOLOR'),
(46,'TRAUMATOLOGÍA'),(47,'UROLOGÍA'),(48,'UROLOGÍA UNIDAD DE PISO PÉLVICO')
GO

set identity_insert ESTADO_CITA off;
Insert into ESTADO_CITA (ESTADO_CITA_ID,ESTADO_CITA_NOMBRE) Values (1,'ATENDIDO'),(2,'RESERVADO'),(3,'ANULADO')
GO
set identity_insert TIPO_SEGURO off;
Insert into TIPO_SEGURO(TIPO_SEGURO_ID,TIPO_SEGURO) Values 
(1,'OTROS SEGUROS/CONVENIOS'),(2,'PACIFICO EPS'),(3,'PACIFICO SEGUROS'),(4,'SANITAS PERU EPS'),
(5,'MAPFRE PERU EPS'),(6,'RIMAC SEGUROS'),(7,'RIMAC EPS'),(8,'PARTICULAR')
GO
set identity_insert MEDICO on;
Insert into MEDICO (MEDICO_ID,ESPECIALIDAD_ID,MEDICO_NOMBRE,MEDICO_TELEFONO,HORARIO_LUNES,HORARIO_MARTES,HORARIO_MIERCOLES,HORARIO_JUEVES,HORARIO_VIERNES,HORARIO_SABADO) 
Values (1,1,'ADVINCULA TERAN NATALY LIZ',963574589,'14:00-20:00','14:00-20:00','14:00-20:00','14:00-20:00','14:00-20:00','14:00-20:00')
GO