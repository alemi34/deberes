if exists (select * from sys.databases 
where name='pruebaBD')
begin 
	drop database pruebaBD1
end
go

if OBJECT_ID('pruebaBD1') is not null
drop database pruebaBD1

create database pruebaBD1
on (name = 'pruebaBD',
filename = 'C:\bdo\pruebaBD1.mdf',
SIZE = 5MB, MAXSIZE = 3000MB, FILEGROWTH=10%)
LOG ON (name='prueabaBD_log',
filename = 'C:\bdo\pruebaBD1.LDF',
size =1, filegrowth = 10%)
COLLATE Modern_Spanish_CI_AI

create table condiciones(
DNI integer primary key,
NOMBRE varchar(20),
Apellido1 varchar(20)
);

use pruebaBD1
--1
alter table condiciones
add IMPORTE tinyint

alter table condiciones
add SEXO char(1)
--2
alter table condiciones
alter column SEXO VARCHAR(12)

alter table condiciones
alter column IMPORTE INT
--3
alter table condiciones
add constraint SEXO
check (SEXO = 'HOMBRE' or SEXO ='MUJER')
--4
alter table condiciones
drop column SEXO

alter table condiciones
drop column IMPORTE

---5
Alter table condiciones drop pk_condiciones_dni
--6
alter table condiciones
add constraint DNI
Primary key
--7

alter table condiciones
add constraint nombre 
unique

alter table condiciones
add codig tinyint foreign key references Provincias(codig);

--8
exec sp_rename 'condiciones','tablanueva'
