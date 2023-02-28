create database al08

use al08

CREATE SCHEMA alumno AUTHORIZATION dbo

CREATE SCHEMA nota AUTHORIZATION dbo

create table alumno.alumnos (
carnet int Primary key,
nombres varchar(50),
apellidos varchar(50)
)
go

create table nota.notas(
idnotas int identity,
carnet int foreign key references alumno.alumnos(carnet),
nota1 decimal(10,2),
nota2 decimal(10,2),
nota3 decimal(10,2),
promedio as (nota1+nota2+nota3)/3
)


insert into alumno.alumnos values(111,'Juan Jose','Perez')
insert into alumno.alumnos values(222,'Luisa','Flores')
insert into alumno.alumnos values(333,'Francisco', 'Gavidia')
insert into alumno.alumnos values(444,'Evelyn', 'Rivas')

insert into nota.notas values(111,7.6,10,5.5)
insert into nota.notas values(222,8.5,9,10)
insert into nota.notas values(333,9.3,8.5,5.7)

select * from nota.notas

select * from alumno.alumnos

create login cominicioal08 with password = '12345'
create user cominicioal08 for login cominicioal08


grant select on SCHEMA :: alumno 
to cominicioal08
with grant option

create table materias
(id int,
nombre varchar(50))
go

insert into materias values(101,'Fisica')
insert into materias values(102,'Programacion')
insert into materias values(103,'Diseño Web')
insert into materias values(104,'Algebra')

--queda sobre dbo
grant update on materias to inicioal08
grant select on materias to inicioal08


--la ultima no dio resultados porque no tenia permisos el usuario para actualizar 
grant alter on schema :: alumno to cominicioal08

grant create procedure 
to cominicioal08

grant create table 
to cominicioal08

--no pudo crearlo ya que no puso que el esquema fuera alumno

drop user nombreusuario



